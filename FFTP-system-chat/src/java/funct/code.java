package funct;

import dao.DataAccess;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Random;
import org.json.JSONException;
import org.json.JSONObject;

public class code {


  public static int generateRandNumber(){
    Random rand = new Random();
    return rand.nextInt( 9999999 + DataAccess.getSize() ) + 100000; //  1 000 000 + num users in system
  }


  // go to EQC class  -> Client send_sms
  public static boolean send_sms( String ip_server, int port, String phoneNumber, String message ) throws IOException, JSONException{

       // create client
        Socket socket  = new Socket( ip_server, port ); // ip , port -> socketa na servera 5379
        PrintWriter out = new PrintWriter( socket.getOutputStream(), true);
        BufferedReader in = new BufferedReader(  new InputStreamReader( socket.getInputStream() ) );

        String input = in.readLine();
        // add data in JSON
        out.println( new JSONObject().put("log", "" ) );

        // send data
        out.println(phoneNumber);
        out.println(message);


        //return in.readLine().equals("success"); // request send - Ok send or error
        return false;
    }

}
