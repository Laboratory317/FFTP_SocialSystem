package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import model.colector;

public class DBUtils {
    public static colector getPreparedStatement(String sql) throws ClassNotFoundException, SQLException{

        Class.forName("com.mysql.jdbc.Driver");
        //=== CONNECTION DATA ==
        String port = "3306";
        String host = "localhost";
        String username = "root";
        String password = "248617937895123";
        String databaseName = "fftp_system";
        // =====================
        String url = "jdbc:mysql://"+host+":"+port+"/"+databaseName+"?characterEncoding=UTF-8"; //?useUnicode=true&characterEncoding=utf-8"

        Connection con = DriverManager.getConnection(url, username, password);
        
        return new colector( con, con.prepareStatement(sql, Statement. RETURN_GENERATED_KEYS ) );
    }

}
