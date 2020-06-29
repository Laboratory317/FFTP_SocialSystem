
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


public class Settings_generalConfig extends HttpServlet {


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
                firstName: newFirstName,
                lastName: newLastName,
                profilePicture: new_profilePicture,
                about: about
              }
            */
            String typeWork = obj_user.getTypeWork();
            String[] data_forSet = new String[4];

            data_forSet[0] = request.getParameter( "firstName"       );
            data_forSet[1] = request.getParameter( "lastName"        );
            data_forSet[2] = request.getParameter( "profilePicture"  );
            data_forSet[3] = request.getParameter( "about"           );


            user newUserSet = new user();


            if(! typeWork.equals("programer") ){
              // ако имаш правомощия
              newUserSet.setFirstName(  data_forSet[0] );
              newUserSet.setLasttName(  data_forSet[1] );
            }

            newUserSet.setProfilePicture(  data_forSet[2]  );
            newUserSet.setAbout(           data_forSet[3]  );

            newUserSet.setTypeWork( obj_user.getTypeWork() );

            // UPDATE USER
            status =  DataAccess.updateUserGeneralCongigById( obj_user.getId(), newUserSet );

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
