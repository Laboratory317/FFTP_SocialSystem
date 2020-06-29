
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

public class changeStatus extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
          /* get user from session
           * if not null, get param action request
           * set in system -> active, work, offline
           */

          if(session != null){
            user obj_user = (user) session.getAttribute("user");

            if( obj_user != null ){
              String action = request.getParameter("action");

              if( action != null ){ // parameter is empty ( no set in ajax )

                user _user = new user();
                _user.setAction( action );

                // return status execute
                out.print(  new JSONObject().put( "status", DataAccess.updateUserActionById( obj_user.getId(), _user ) )  );

              }else{
                // return status user -> active
                out.print(  new JSONObject().put( "active", DataAccess.getUserById( obj_user.getId() ).getAction() )  );
              }

            }
          }
        } catch (JSONException ex) {
            Logger.getLogger(changeStatus.class.getName()).log(Level.SEVERE, null, ex);
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
