/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gsmserver;

import java.util.LinkedList;


public class Queue extends Thread {
    LinkedList<Pack> queue;
    
    public Queue(){
        queue = new LinkedList<>();
    }
    
    @Override
    public void run() {
        while( true ){
            while (!queue.isEmpty()) {
                System.out.print ( queue.removeFirst() );
                System.out.println();
            }
        }
    }
    
    public void addToQueue( Pack newpack ){
        queue.add( newpack );  
    }
}


                    /* send the queue 
                    while (! fifo.isEmpty())
                        System.out.print (fifo.removeFirst());
                    System.out.println();
                    */
                    // Serial send AT commands ( phoneNumber, message ) -> return true or false 