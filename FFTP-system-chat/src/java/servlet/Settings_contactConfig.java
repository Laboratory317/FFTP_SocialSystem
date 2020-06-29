
package servlet;

import dao.DataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;
import org.json.JSONException;
import org.json.JSONObject;


public class Settings_contactConfig extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      HttpSession session = request.getSession();
      boolean status = false;
      try ( PrintWriter out = response.getWriter() ) {

        if(session != null){
          user obj_user = (user) session.getAttribute("user");
          if( obj_user != null ){
            /* == GET DATA ==
              data: {
                typeWork: newTypeWork,
                phoneNumber: new_phoneNumber,
                country: new_country,
                city: new_city,
                address: new_address
              }
            */
            String[] data_forSet = new String[5];

            data_forSet[0] = request.getParameter( "typeWork"    );
            data_forSet[1] = request.getParameter( "phoneNumber" );
            data_forSet[2] = request.getParameter( "country"     );
            data_forSet[3] = request.getParameter( "city"        );
            data_forSet[4] = request.getParameter( "address"     );

            boolean isFull = false;
            for( String data : data_forSet ){
              if( data != null ) isFull = true;
            }

            if( isFull ){

              user newUserSet = new user();
              newUserSet.setTypeWork(     obj_user.getTypeWork().equals("programer") ?  obj_user.getTypeWork() : data_forSet[0] ); // ако имаш правомощия
              newUserSet.setPhoneNumber(  data_forSet[1]  );
              newUserSet.setCountry(      data_forSet[2]  );
              newUserSet.setCity(         data_forSet[3]  );
              newUserSet.setAddress(      data_forSet[4]  );

              // UPDATE USER
              status =  DataAccess.updateUserContactConfigById( obj_user.getId(), newUserSet );
            }

            out.print( new JSONObject().put( "status" , status ) );

          }
        }
      } catch (JSONException ex) {
          Logger.getLogger(Settings_authenConfig.class.getName()).log(Level.SEVERE, null, ex);
      }
    }




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
