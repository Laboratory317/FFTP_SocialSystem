
package serial;

import java.util.Scanner;


public class test {


    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        
        System.out.println("Inser field size");
        System.out.print("X:");
        int x_size  = scan.nextInt();
        
        System.out.print("Y:");
        int y_size  = scan.nextInt();

        System.out.println("Size:"+x_size+"/"+y_size);
        cell[][] field = new cell[x_size][y_size];
        
        // create cells
        for(int x = 0; x < x_size ; x++){
            for(int y = 0; y < y_size ; y++){
                field[x][y] = new cell();
            }
        }
        
        while(true){
            System.out.println("Where will you attack and how strong / or GAME OVER for game over:");
        
            String play = scan.next();
            if( play.equals("END")||play.equals("End")||play.equals("end")){
                break;
            }
            else{
                String[] in =  play.split(",") ; // in[0] - X , in[1] - Y, in[2] - damage get
                int in_x = Integer.parseInt( in[0] ); 
                int in_y = Integer.parseInt( in[1] );
                int in_damage = Integer.parseInt( in[2] );

                if( in_x > x_size || in_y > y_size ){
                     System.out.println("It is too big");
                }else{
                    field[in_x][in_y].ybivateBavnoNoSlavno( in_damage );
                   
                    field[in_x - 1][in_y - 1].ybivateBavnoNoSlavno(10);
                    field[in_x + 1][in_y + 1].ybivateBavnoNoSlavno(10);
            
                    field[in_x + 1][in_y - 1].ybivateBavnoNoSlavno(10);
                    field[in_x - 1][in_y + 1].ybivateBavnoNoSlavno(10);
            
                    field[in_x][in_y - 1].ybivateBavnoNoSlavno(10);
                    field[in_x][in_y + 1].ybivateBavnoNoSlavno(10);
            
                    field[in_x - 1][in_y].ybivateBavnoNoSlavno(10);
                    field[in_x + 1][in_y].ybivateBavnoNoSlavno(10);

                }
            }
        }
        
        for(int x = 0; x < x_size ; x++){
            for(int y = 0; y < y_size ; y++){
                System.out.print( "|"+ field[x][y].getLife()+"|");
            }
            System.out.println();
        }
        
    }
    
}

class cell{
    private int life = 100;
    
    public int getLife(){
        return this.life;
    }
    public void ybivateBavnoNoSlavno( int damage ){
        this.life = this.life - damage;
    }
}
