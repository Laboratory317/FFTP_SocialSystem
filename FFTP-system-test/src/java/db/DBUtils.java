/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement ;
import java.sql.SQLException;

/**
 *
 * @author glor-cos
 */
public class DBUtils {
    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException{
        PreparedStatement ps = null;
        
        Class.forName("com.mysql.jdbc.Driver");
        //=== CONNECTION DATA ==
        String port = "3306";
        String host = "localhost";
        String username = "root";
        String password = "248617937895123";
        String databaseName = "fftp_system";
        // =====================
        String url = "jdbc:mysql://"+host+":"+port+"/"+databaseName;
        
        Connection con;
        con = DriverManager.getConnection(url, username, password);
        ps = con.prepareStatement(sql);
        
        return ps;
    }
    
    /*public static void main(String[] args) throws ClassNotFoundException, SQLException{
        getPreparedStatement("select * from users");
    }*/
}
