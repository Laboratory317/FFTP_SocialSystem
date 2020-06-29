
package servlet;

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


public class getDataUser extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
          // JS -> connect to this servlet
          // return JSON data user in session;

          if(session != null){
            user obj_user = (user) session.getAttribute("user");
            if( obj_user != null ){

              /* === JSON PROTOTIP ===
               result:
               {
                  generalConfig: {
                    profilePicture:
                    firstName:
                    lastName:
                    sex:
                    bd:
                    aboutMe:
                  },
                  contactConfig: {
                    typeWork:
                    date_startInCompany:
                    phoneNumber:
                    country:
                    city:
                    address:
                  },
                  log: {
                    email:
                    email_password:
                    username:
                  }
                }
               */


              // === RETURN ->  CREATE JSON DATA-USER ===
              out.print( new JSONObject()
                  .put(
                    "generalConfig", new JSONObject()
                      .put( "profilePicture",      obj_user.getProfilePicture()           )
                      .put( "firstName",           obj_user.getFirstName()                )
                      .put( "lastName",            obj_user.getLastName()                 )
                      .put( "sex",                 obj_user.getSex() ? "Female" : "Male"  )
                      .put( "bd",                  obj_user.getBd()                       )
                      .put( "typeWork",            obj_user.getTypeWork()                 )
                      .put( "date_startInCompany", obj_user.getDate_startInCompany()      )
                      .put( "phoneNumber",         obj_user.getPhoneNumber()              )
                      .put( "country",             obj_user.getCountry()                  )
                      .put( "city",                obj_user.getCity()                     )
                      .put( "address",             obj_user.getAddress()                  )
                      .put( "aboutMe",             obj_user.getAbout() == null ? "" : obj_user.getAbout()  )
                  )
                  .put(
                    "log", new JSONObject()
                      .put( "email",           obj_user.getEmail()           )
                      .put( "email_password",  obj_user.getEmailPassword()   )
                      .put( "username",        obj_user.getUsername()        )
                  )
              );


            }
          }
        } catch (JSONException ex) {
            Logger.getLogger(getDataUser.class.getName()).log(Level.SEVERE, null, ex);
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
