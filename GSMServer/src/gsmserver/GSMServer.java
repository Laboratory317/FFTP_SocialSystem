/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gsmserver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;


public class GSMServer {


    public static void main(String[] args) throws IOException  {
      
        System.out.println("The capitalization server is running.");
        int clientNumber = 0;
        
        // create new class extends Thread {  LinkedList<Queue> queue = new LinkedList<>(); run(){ send_Serial_GSMmodule(pack) } }
        Queue queue = new Queue();
        ServerSocket listener = new ServerSocket(5379);

        try {
            while (true) {
                new Capitalizer( listener.accept(), clientNumber++, queue ).start();
            }
        } finally {
            listener.close();
        }
    }
    
    
    // ===============================================================
    private static class Capitalizer extends Thread {
        private final Socket socket;
        private final int clientNumber;

        public Capitalizer(Socket socket, int clientNumber, Queue queue) {
            this.socket = socket;
            this.clientNumber = clientNumber;
            log("New connection with client# " + clientNumber + " at " + socket);
        }


        @Override
        public void run() {
            try {

                BufferedReader in = new BufferedReader(  new InputStreamReader( socket.getInputStream() )  );
                PrintWriter out = new PrintWriter( socket.getOutputStream(), true );

                while (true) {
                    String phoneNumber = in.readLine();
                    String message = in.readLine();

                    if(phoneNumber == null && message == null){
                        break;
                    }
                    
                    Pack pack = new Pack( phoneNumber, message );
                    //queue.add(pack); // add to queue
                    out.println("success");
                    socket.close();
                    System.out.println(phoneNumber+"/"+message);
                }
                
            } catch (IOException e) {
                log("Error handling client# " + clientNumber + ": " + e);
                
            } finally {
                try {
                    socket.close();
                } catch (IOException e) {
                    log("Couldn't close a socket, what's going on?");
                }
                log("Connection with client# " + clientNumber + " closed");
            }
        }

        private void log(String message) {
            System.out.println(message);
        }
    }
 
}






  /*
        ServerSocket listener = new ServerSocket(5379); // port server 
        try {
            while (true) { 
                Socket socket = listener.accept();
                try {
                    PrintWriter out = new PrintWriter( socket.getOutputStream(), true);
                    
                    out.println("Connected to GSM server/ OK"); // write to client 
                } finally {
                    socket.close(); 
                }
            }
        }
        finally {
            listener.close();
        }*/
