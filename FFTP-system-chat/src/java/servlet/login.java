package servlet;

import dao.DataAccess;
import static funct.hash.get_SHA512_SecurePassword;
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


@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean status = false;

        try (PrintWriter out = response.getWriter()) {

            // GET VALUES FOR LOG
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String data_point  = request.getParameter("point"); // receiver JSON data

            System.out.println("POINT:" + data_point); // test

            // CHECK LOG
            user obj_user = DataAccess.login(username, get_SHA512_SecurePassword( password ) );
            if(obj_user != null){

              // set in session -> obj user
              request.getSession().setAttribute("user", obj_user);

              // set in system -> point log ( lat, lon, date, ip, id_user );
              if( data_point != null )
                DataAccess.addPointLog(  new JSONObject( data_point ).put( "id", obj_user.getId() )  );

              status = true;
            }

            // RETURN STATUS LOG
            out.print( new JSONObject().put("status", status ) ); // send to ajax

        } catch (JSONException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
