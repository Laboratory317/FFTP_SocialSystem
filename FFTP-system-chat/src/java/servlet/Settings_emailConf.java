
package servlet;

import dao.DataAccess;
import static funct.hash.get_SHA512_SecurePassword;
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


public class Settings_emailConf extends HttpServlet {


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
                email: newEmailName+Host,
                email_password: newEmailPassword
              }
            */
            String newEmail = request.getParameter("email");
            String newEmailPassword = request.getParameter("email_password");

            if( newEmail != null && newEmailPassword != null ){ // add regex ! ( email blabla@bla.bla  )
              user newUserSet = new user();
              newUserSet.setEmail( newEmail );
              newUserSet.setEmailPassword( newEmailPassword );

              // UPDATE USER
              status =  DataAccess.updateUserEmailConfigById( obj_user.getId(), newUserSet );
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
