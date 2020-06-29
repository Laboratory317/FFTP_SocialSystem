/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.users;



public class DataAccess {
    
    
    public static void addUser(users n){
        PreparedStatement ps;
        try {
            ps = DBUtils.getPreparedStatement
                ("INSERT INTO users(firstName, lastName, username, password, phoneNumber, address, city,email, bd, age, data_startInCompany, typeWork, action)VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, n.getFirstName());
            ps.setString(2, n.getLastName());
            ps.setString(3, n.getUsername());
            ps.setString(4, n.getPassword());
            ps.setString(5, n.getPhoneNumber());
            ps.setString(6, n.getAddress());
            ps.setString(7, n.getCity());
            ps.setString(8, n.getEmail());
            ps.setString(9, n.getBd());
            ps.setInt(10,  n.getAge());
            ps.setString(11, n.getDate_startInCompany());
            ps.setString(12, n.getTypeWork());
            ps.setString(13, n.getAction());
            ps.executeUpdate();     
        
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static List<users> getAll(){
        List<users> ls = new LinkedList<>();
        
        try {
            
            ResultSet rs = DBUtils.getPreparedStatement("SELECT * FROM users").executeQuery();
            while(rs.next()){
                users user = new users(
                        //rs.getInt(1),   // id
                        rs.getString(2),  // firstname
                        rs.getString(3),  // lastname
                        rs.getString(4),  // username
                        rs.getString(5),  // password
                        rs.getString(6),  // phoneNumber
                        rs.getString(7),  // address
                        rs.getString(8),  // city
                        rs.getString(9),  // email
                        rs.getString(10),  // bd
                        rs.getInt(11),    // age
                        rs.getString(12), // data_startInCompany
                        rs.getString(13), //typeWork
                        rs.getString(14)  //action
                );
                ls.add(user);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }
    
    public static String login(String username, String password){
        ResultSet rs;
        String firstName = null;
        try {
            rs = DBUtils.getPreparedStatement("SELECT firstName FROM users WHERE username like '"+username+"' and password like '" +password+ "'").executeQuery();
            while(rs.next()){
               firstName = rs.getString(1);  // firstname
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
            

        return firstName;
    }
}
