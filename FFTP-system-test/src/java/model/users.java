/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.SimpleDateFormat;

/**
 *
 * @author glor-cos
 */
public class users {
    //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
    //private int id;
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String phoneNumber;
    private String address;
    private String city;
    private String email;
    private String bd;
    private int age;
    
    //Date date1 = sdf.parse("1995-02-23");

    private String date_startInCompany;
    private String typeWork;
    private String action;
    

    public users(String firstName, String lastName, String username, String password, String phoneNumber, String address, String city, String email, String bd, int age, String date_startInCompany, String typeWork, String action) {
        //this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.city = city;
        this.email = email;
        this.bd = bd;
        this.age = age;
        this.date_startInCompany = date_startInCompany;
        this.typeWork = typeWork;
        this.action = action;
    }
    
    

   /* public int getId() {
        return id;
    }*/

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getAddress() {
        return address;
    }
    
    public String getCity() {
        return city;
    }

    public String getEmail() {
        return email;
    }
     
    public String getBd() {
        return bd;
    }
    
    public int getAge() {
        return age;
    }

    public String getDate_startInCompany() {
        return date_startInCompany;
    }

    public String getTypeWork() {
        return typeWork;
    }

    public String getAction() {
        return action;
    }
    
    
     
    
            
}
