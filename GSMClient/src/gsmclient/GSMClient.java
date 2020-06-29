
package gsmclient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;


public class GSMClient {
    

    public static void main( String[] args ) throws IOException {
        
        if(send_sms("+359879689408", "Georgi, your code is 5379384")){
            System.out.println("OK");
        }else{
            System.out.println("Error sending");
        }
    }
    
    public static boolean send_sms( String phoneNumber, String message) throws IOException{
        Socket socket  = new Socket("192.168.31.193", 5379); // ip , port 
        PrintWriter out = new PrintWriter( socket.getOutputStream(), true);
     
        out.println(phoneNumber);
        out.println(message);
        
        JsonObject json = new JsonObject();
        
        BufferedReader in = new BufferedReader(  new InputStreamReader( socket.getInputStream())  );
        return in.readLine().equals("success");
    }
}










