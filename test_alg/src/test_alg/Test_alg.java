
package test_alg;

public class Test_alg {

    public static void main(String[] args) {
      boolean isFull = false;
      String[] params = new String[3];
      isFull = (params[0] = "A").equals("") ;
      isFull = (params[1] = "D").equals("") ;
      isFull = (params[2] = "C").equals("") ;
      
      System.out.println("IsFullStatus:" + isFull + "/p0:" + params[0] + "/p1:" + params[1] + "/p2:" + params[2] );
      
    }
    
}
