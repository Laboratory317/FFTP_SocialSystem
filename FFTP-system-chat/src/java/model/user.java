
package model;

import java.io.Serializable;
import org.json.JSONException;
import org.json.JSONObject;


public class user  implements Serializable {
    //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private int id;
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String phoneNumber;
    private String address;
    private String city;
    private String country;
    private String email;
    private String email_password;
    private String bd;
    private boolean sex;
    private String date_startInCompany;
    private String typeWork;
    private String about;
    private String profilePicture;
    private String action ;

    // constr for "select", with id from table
    public user( int id, String firstName, String lastName, String username, String password, String phoneNumber, String address, String city, String country, String email, String email_password, String bd, boolean sex, String date_startInCompany, String typeWork, String about, String profilePicture,  String action) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.city = city;
        this.country = country;
        this.email = email;
        this.email_password = email_password;
        this.bd = bd;
        this.sex = sex;
        this.date_startInCompany = date_startInCompany;
        this.typeWork = typeWork;
        this.about = about;
        this.profilePicture = profilePicture;
        this.action = action;
    }

    // constr for "insert into"
    public user( String firstName, String lastName, String username, String password, String phoneNumber, String address, String city, String email, String bd, String date_startInCompany, String typeWork, String about, String profilePicture, String action) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.city = city;
        this.country = country;
        this.email = email;
        this.email_password = email_password;
        this.bd = bd;
        this.sex = sex;
        this.date_startInCompany = date_startInCompany;
        this.typeWork = typeWork;
        this.about = about;
        this.profilePicture = profilePicture;
        this.action = action;
    }

    // constructor secure
    public user( int id, String firstName, String lastName, String phoneNumber, String address, String city, String country, String email, String bd, boolean sex, String date_startInCompany, String typeWork, String about, String profilePicture, String action) {
       this.id = id;
       this.firstName = firstName;
       this.lastName = lastName;
       this.phoneNumber = phoneNumber;
       this.address = address;
       this.city = city;
       this.country = country;
       this.email = email;
       this.bd = bd;
       this.sex = sex;
       this.date_startInCompany = date_startInCompany;
       this.typeWork = typeWork;
       this.about = about;
       this.profilePicture = profilePicture;
       this.action = action;
    }

    // default constructor
    public user(){

    }


    // ==== GET ==========

    public int getId() {
        return id;
    }

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

    public String getCountry() {
        return country;
    }

    public String getEmail() {
        return email;
    }

    public String getEmailPassword() {
        return email_password;
    }

    public String getBd() {
        return bd;
    }

    public boolean getSex(){
      return sex;
    }

    public String getDate_startInCompany() {
        return date_startInCompany;
    }

    public String getTypeWork() {
        return typeWork;
    }

    public String getAbout(){
        return about;
    }

    public String getProfilePicture(){
        return profilePicture;
    }

    public String getAction() {
        return action;
    }

    public JSONObject toJSON() throws JSONException{
        return new JSONObject()
                      .put( "id"             , this.id              )
                      .put( "firstName"      , this.firstName       )
                      .put( "lastName"       , this.lastName        )
                      .put( "profilePicture" , this.profilePicture  )
        ;
    }
    // ===== SET ========
    public void getId(int id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLasttName(String lastName) {
        this.lastName = lastName;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setEmailPassword(String email_password ) {
        this.email_password = email_password;
    }

    public void setBd(String bd) {
        this.bd = bd;
    }

    public void setBd(boolean sex) {
        this.sex = sex;
    }

    public void setDate_startInCompany(String date_startInCompany) {
        this.date_startInCompany = date_startInCompany;
    }

    public void setTypeWork(String typeWork) {
        this.typeWork = typeWork;
    }

    public void setAbout(String about){
        this.about = about;
    }

    public void setProfilePicture(String profilePicture){
        this.profilePicture = profilePicture;
    }

    public void setAction(String action) {
        this.action = action;
    }


}
