package main;

import java.sql.*;
        
public class connectivity {
    public static Connection connectivity(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException e){
            e.printStackTrace();
            System.out.println("Driver ex");
        }
        
        String url = "localhost";
        String port = "3306";
        String dbname = "javadb";
        
        String username = "root";
        String pass = "248617937895123";
        
        Connection con = null;
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://"+url+":"+port+"/"+dbname, username, pass);
        }catch(SQLException ex){
            ex.printStackTrace();
            System.out.println("Not connect to DB" + ex);
        }
        return con;
    }
}
