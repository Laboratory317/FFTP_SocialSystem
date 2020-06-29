package model;


public class pack {
    private String phoneNumber;
    private String message;

    public pack( String phoneNumber, String message ){
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
