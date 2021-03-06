/*
  Copyright (c) 2015, 2017, Oracle and/or its affiliates. All rights reserved.

  The MySQL Connector/J is licensed under the terms of the GPLv2
  <http://www.gnu.org/licenses/old-licenses/gpl-2.0.html>, like most MySQL Connectors.
  There are special exceptions to the terms and conditions of the GPLv2 as it is applied to
  this software, see the FOSS License Exception
  <http://www.mysql.com/about/legal/licensing/foss-exception.html>.

  This program is free software; you can redistribute it and/or modify it under the terms
  of the GNU General Public License as published by the Free Software Foundation; version 2
  of the License.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with this
  program; if not, write to the Free Software Foundation, Inc., 51 Franklin St, Fifth
  Floor, Boston, MA 02110-1301  USA

 */

package testsuite.x.devapi;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.Callable;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.mysql.cj.api.xdevapi.Row;
import com.mysql.cj.api.xdevapi.Schema;
import com.mysql.cj.api.xdevapi.SqlResult;
import com.mysql.cj.api.xdevapi.SqlStatement;
import com.mysql.cj.core.exceptions.CJPacketTooBigException;
import com.mysql.cj.core.exceptions.MysqlErrorNumbers;
import com.mysql.cj.x.core.XDevAPIError;
import com.mysql.cj.xdevapi.SessionFactory;

public class SessionTest extends DevApiBaseTestCase {
    @Before
    public void setupCollectionTest() {
        setupTestSession();
    }

    @After
    public void teardownCollectionTest() {
        if (this.isSetForXTests) {
            this.createdTestSchemas.forEach(schemaName -> {
                try {
                    this.session.dropSchema(schemaName);
                } catch (XDevAPIError x) {
                    // ignored
                }
            });
            destroyTestSession();
        }
    }

    private List<String> createdTestSchemas = new ArrayList<>();

    /**
     * Create a random schema name. The schema will be dropped upon test cleanup.
     */
    private String getRandomTestSchemaName() {
        String n = "cj_test_schema_no_" + new Random().nextInt(1000);
        this.createdTestSchemas.add(n);
        return n;
    }

    @Test
    public void createDropSchema() {
        if (!this.isSetForXTests) {
            return;
        }
        String testSchemaName = getRandomTestSchemaName();
        Schema newSchema = this.session.createSchema(testSchemaName);
        assertTrue(this.session.getSchemas().contains(newSchema));
        this.session.dropSchema(testSchemaName);
        assertFalse(this.session.getSchemas().contains(newSchema));
    }

    @Test
    public void createAndReuseExistingSchema() {
        if (!this.isSetForXTests) {
            return;
        }
        String testSchemaName = getRandomTestSchemaName();
        Schema newSchema = this.session.createSchema(testSchemaName);
        assertTrue(this.session.getSchemas().contains(newSchema));
        Schema reusedSchema = this.session.createSchema(testSchemaName, true);
        assertTrue(this.session.getSchemas().contains(reusedSchema));
    }

    @Test
    public void listSchemas() {
        if (!this.isSetForXTests) {
            return;
        }
        List<Schema> schemas = this.session.getSchemas();
        // we should have visibility of at least these two
        Schema infoSchema = this.session.getSchema("information_schema");
        assertTrue(schemas.contains(infoSchema));
        Schema testSchema = this.session.getSchema(getTestDatabase());
        assertTrue(schemas.contains(testSchema));
    }

    @Test
    public void createExistingSchemaError() {
        if (!this.isSetForXTests) {
            return;
        }
        String testSchemaName = getRandomTestSchemaName();
        Schema newSchema = this.session.createSchema(testSchemaName);
        assertTrue(this.session.getSchemas().contains(newSchema));
        try {
            this.session.createSchema(testSchemaName);
            fail("Attempt to create a schema with the name of an existing schema should fail");
        } catch (XDevAPIError err) {
            assertEquals(MysqlErrorNumbers.ER_DB_CREATE_EXISTS, err.getErrorCode());
        }
    }

    /**
     * Test the client-side enforcing of server `mysqlx_max_allowed_packet'. This assumes a server-side value of 1MiB.
     */
    @Test
    public void errorOnPacketTooBig() {
        if (!this.isSetForXTests) {
            return;
        }
        try {
            int size = 2 * 1024 * 1024;
            StringBuilder b = new StringBuilder();
            for (int i = 0; i < size; ++i) {
                b.append('.');
            }
            String s = b.append("\"}").toString();
            this.session.dropSchema(s);
            fail("Large packet should cause an exception");
        } catch (CJPacketTooBigException ex) {
            // expected
        }
    }

    /**
     * Tests fix for Bug#21690043, CONNECT FAILS WHEN PASSWORD IS BLANK.
     * 
     * @throws Exception
     *             if the test fails.
     */
    @Test
    public void testBug21690043() {
        if (!this.isSetForXTests) {
            return;
        }

        try {
            this.session.sql("CREATE USER 'bug21690043user1'@'%' IDENTIFIED WITH mysql_native_password").execute();

            Properties props = new Properties();
            props.putAll(this.testProperties);
            props.setProperty("user", "bug21690043user1");
            props.setProperty("password", "");
            new SessionFactory().getSession(props);
        } catch (Throwable t) {
            throw t;
        } finally {
            this.session.sql("DROP USER 'bug21690043user1'@'%'").execute();
        }
    }

    @Test
    public void basicSql() {
        if (!this.isSetForXTests) {
            return;
        }
        SqlStatement stmt = this.session.sql("select 1,2,3 from dual");
        SqlResult res = stmt.execute();
        assertTrue(res.hasData());
        Row r = res.next();
        assertEquals("1", r.getString(0));
        assertEquals("2", r.getString(1));
        assertEquals("3", r.getString(2));
        assertEquals("1", r.getString("1"));
        assertEquals("2", r.getString("2"));
        assertEquals("3", r.getString("3"));
        assertFalse(res.hasNext());

        assertThrows(XDevAPIError.class, "Method getAutoIncrementValue\\(\\) is allowed only for insert statements.", new Callable<Void>() {
            public Void call() throws Exception {
                assertEquals(null, res.getAutoIncrementValue());
                return null;
            }
        });
    }

    @Test
    public void sqlUpdate() {
        if (!this.isSetForXTests) {
            return;
        }
        SqlStatement stmt = this.session.sql("set @cjTestVar = 1");
        SqlResult res = stmt.execute();
        assertFalse(res.hasData());
        assertEquals(0, res.getAffectedItemsCount());
        assertEquals(null, res.getAutoIncrementValue());
        assertEquals(0, res.getWarningsCount());
        assertFalse(res.getWarnings().hasNext());
    }

    @Test
    public void sqlArguments() {
        if (!this.isSetForXTests) {
            return;
        }
        SqlStatement stmt = this.session.sql("select ? as a, 40 + ? as b, ? as c");
        SqlResult res = stmt.bind(1).bind(2).bind(3).execute();
        Row r = res.next();
        assertEquals("1", r.getString("a"));
        assertEquals("42", r.getString("b"));
        assertEquals("3", r.getString("c"));
    }

    @Test
    public void basicMultipleResults() {
        if (!this.isSetForXTests) {
            return;
        }
        sqlUpdate("drop procedure if exists basicMultipleResults");
        sqlUpdate("create procedure basicMultipleResults() begin explain select 1; explain select 2; end");
        SqlStatement stmt = this.session.sql("call basicMultipleResults()");
        SqlResult res = stmt.execute();
        assertTrue(res.hasData());
        /* Row r = */ res.next();
        assertFalse(res.hasNext());
        assertTrue(res.nextResult());
        assertTrue(res.hasData());
        assertFalse(res.nextResult());
        assertFalse(res.nextResult());
        assertFalse(res.nextResult());
    }

    @Test
    public void smartBufferMultipleResults() {
        if (!this.isSetForXTests) {
            return;
        }
        sqlUpdate("drop procedure if exists basicMultipleResults");
        sqlUpdate("create procedure basicMultipleResults() begin explain select 1; explain select 2; end");
        SqlStatement stmt = this.session.sql("call basicMultipleResults()");
        /* SqlResult res = */ stmt.execute();
        // execute another statement, should work fine
        this.session.sql("call basicMultipleResults()");
        this.session.sql("call basicMultipleResults()");
        this.session.sql("call basicMultipleResults()");
    }

    @Test
    public void sqlInsertAutoIncrementValue() {
        if (!this.isSetForXTests) {
            return;
        }

        sqlUpdate("drop table if exists lastInsertId");
        sqlUpdate("create table lastInsertId (id int not null primary key auto_increment, name varchar(20) not null)");

        SqlStatement stmt = this.session.sql("insert into lastInsertId values (null, 'a')");
        SqlResult res = stmt.execute();

        assertFalse(res.hasData());
        assertEquals(1, res.getAffectedItemsCount());
        assertEquals(0, res.getWarningsCount());
        assertFalse(res.getWarnings().hasNext());
        assertEquals(new Long(1), res.getAutoIncrementValue());
    }
}
