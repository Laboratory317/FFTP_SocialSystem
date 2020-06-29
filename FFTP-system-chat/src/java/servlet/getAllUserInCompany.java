
package servlet;

import dao.DataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "getAllUserInCompany", urlPatterns = {"/getAllUserInCompany"})
public class getAllUserInCompany extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        if( session != null ){
          user obj_user = (user) session.getAttribute("user");
          if( obj_user != null ){

              try {
                  out.print( new JSONObject()
                              .put( "user"  , obj_user.toJSON()   )
                              .put( "users" , DataAccess.getAll() )
                  );
              } catch (JSONException ex) {
                  Logger.getLogger(getAllUserInCompany.class.getName()).log(Level.SEVERE, null, ex);
              }

          }
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
