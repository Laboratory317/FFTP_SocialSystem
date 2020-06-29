
package dao;
import db.DBUtils;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.user;



public class DataAccess {


    public static void addUser(user n){
        PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatement
                ("INSERT INTO users(firstName, lastName, username, password, phoneNumber, address, city, email, bd, data_startInCompany, typeWork )VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            //ps.setInt(0, n.getId());

            ps.setString(1, n.getFirstName());
            ps.setString(2, n.getLastName());
            ps.setString(3, n.getUsername());
            ps.setString(4, n.getPassword());
            ps.setString(5, n.getPhoneNumber());
            ps.setString(6, n.getAddress());
            ps.setString(7, n.getCity());
            ps.setString(8, n.getEmail());
            ps.setString(9, n.getBd());
            ps.setString(10, n.getDate_startInCompany());
            ps.setString(11, n.getTypeWork());
          //  ps.setString(13, n.getAbout());
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static List<user> getAll(){
        List<user> ls = new LinkedList<>();

        try {
            ResultSet rs = DBUtils.getPreparedStatement("SELECT users.*, action.action FROM users JOIN action ON users.id_action = action.id").executeQuery();
            while(rs.next()){
                user newuser = new user(
                        rs.getInt(1),   // id
                        rs.getString(2),  // firstname
                        rs.getString(3),  // lastname
                        rs.getString(4),  // username
                        rs.getString(5),  // password
                        rs.getString(6),  // phoneNumber
                        rs.getString(7),  // address
                        rs.getString(8),  // city
                        rs.getString(9),  // email
                        rs.getString(10), // bd burday
                        rs.getString(12), // data_startInCompany
                        rs.getString(13), // typeWork
                        // rs.getInt(14), // id id_action INT
                        rs.getString(15), // about
                        rs.getString(15), // profilePicture
                        rs.getString(16)  // action String
                );
                ls.add(newuser);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public static void updatePassword(int id, String hash_NewPassword ){
      PreparedStatement ps;
      try {
          ps = DBUtils.getPreparedStatement("UPDATE users SET password = ? WHERE id = ? ");
          ps.setString(1, hash_NewPassword);
          ps.setInt(2, id);

          ps.executeUpdate();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

    public static user login(String username, String password){
        PreparedStatement ps;
        user obj_user = null;
        try {
            ps = DBUtils.getPreparedStatement( "SELECT users.*, action.action FROM users JOIN action ON users.id_action = action.id WHERE username like ? and password like ?");
            ps.setString(1, username);
            ps.setString(2, password);  
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                obj_user = new user(
                        rs.getInt(1),   // id
                        rs.getString(2),  // firstname
                        rs.getString(3),  // lastname
                        rs.getString(4),  // username
                        rs.getString(5),  // password
                        rs.getString(6),  // phoneNumber
                        rs.getString(7),  // address
                        rs.getString(8),  // city
                        rs.getString(9),  // email
                        rs.getString(10), // bd
                        rs.getString(11), // data_startInCompany
                        rs.getString(12), // typeWork
                         // 13 - id_action
                        rs.getString(14),  // about
                        rs.getString(15),  // profilePicture
                        rs.getString(16)  // action
                );
                    
            }
            ps.close();
            
        }catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return obj_user;
    }

    public static byte resetPassword( String username ) throws IOException{
      PreparedStatement ps;
      int id_user ;
      String firstName = null, phoneNumber = null , email = null;

      try {
          ps = DBUtils.getPreparedStatement("SELECT id, firstName, phoneNumber, email FROM users WHERE username like ?");
          ps.setString(1, username);
          ResultSet rs = ps.executeQuery();
          while(rs.next()){
              id_user = rs.getInt(1);
              firstName = rs.getString(2);
              phoneNumber = rs.getString(3);
              email = rs.getString(4);
          }
          ps.close();

      } catch (ClassNotFoundException | SQLException ex) {
          Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
      }

      if( firstName != null && phoneNumber != null && email != null){




        // send email and sms ( firstName + code + phoneNumber ) and (firstName + code + email);
        /*
        if( send_sms( phoneNumber, firstName + ", your reset code is: "+ code ) ){
          updatePassword(id_user, hash_NewPassword ) ;
          return 1; // success
        }
        */
        return 0; // error server
      }
      return 2; // error user not found
    }

    // add server
    // remove server

    // add - executors ( all )
    // change status executors ( ip, port, comport, status, sizeQueue, timeExecute )
    // get - executors ( all )
    // remove executors ( num )

    // update about me
    // set raiting
    // add category - raiting ( sleeping, working, traveling)

}
