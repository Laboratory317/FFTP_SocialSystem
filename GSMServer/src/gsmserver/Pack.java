/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gsmserver;


public class Pack {
    private String phoneNumber;
    private String message;
    
    public Pack( String phoneNumber, String message ){
        this.phoneNumber = phoneNumber;
        this.message = message;
    }
    
    public String getPhoneNumber(){
        return this.phoneNumber;
    }
    public String getMessage(){
        return this.message;
    }
}
