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

package com.mysql.cj.api.x.io;

import java.util.ArrayList;

import com.mysql.cj.core.result.Field;
import com.mysql.cj.x.core.StatementExecuteOk;
import com.mysql.cj.x.core.XDevAPIError;
import com.mysql.cj.x.io.XProtocolRow;

public interface ResultListener {
    /**
     * Called when metadata is available.
     * 
     * @param metadata
     *            list of {@link Field} objects
     */
    void onMetadata(ArrayList<Field> metadata);

    /**
     * Called when row is available.
     * 
     * @param r
     *            {@link XProtocolRow}
     */
    void onRow(XProtocolRow r);

    /**
     * Called when result processing is complete. No additional notifications will be delivered.
     * 
     * @param ok
     *            {@link StatementExecuteOk}
     */
    void onComplete(StatementExecuteOk ok);

    /**
     * Called when a server error is available. No additional notifications will be delivered.
     * 
     * @param error
     *            {@link XDevAPIError}
     */
    void onError(XDevAPIError error);

    /**
     * Called when an exception occurs. No additional notifications will be delivered.
     * 
     * @param t
     *            {@link Throwable}
     */
    void onException(Throwable t);
}
