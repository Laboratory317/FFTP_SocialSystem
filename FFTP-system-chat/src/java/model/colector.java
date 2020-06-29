
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class colector {
    private final Connection con;
    private PreparedStatement ps;

    public colector(  Connection _con , PreparedStatement ps ){
      this.con = _con;
      this.ps  = ps ;
    }

    public Connection getConnection() {
        return con;
    }

    public PreparedStatement getPreparedStatement() {
        return ps;
    }

    public void setPreparedStatement( PreparedStatement ps ){
        this.ps  = ps ;
    }
}
