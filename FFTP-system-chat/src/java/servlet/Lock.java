
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;


public class Lock extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if(session != null){

          user obj_user = (user) session.getAttribute("user"); // get user
          if( obj_user != null ){

            session.invalidate(); // clear java session

            // set data in JS session for unlock page
            String scripto = "<script>"
                +"sessionStorage.clear();"
                +"sessionStorage.setItem('timeLock', new Date() );"
                +"sessionStorage.setItem('username', '" + obj_user.getUsername() + "');"
                +"sessionStorage.setItem('fftp_userFirstName', '" + obj_user.getFirstName() + "');"
                +"sessionStorage.setItem('fftp_userLastName',  '" + obj_user.getLastName()  + "');"
                +"window.location.replace('APP/pages/unlock.html');"
                +"</script>";
            response.getWriter().write( scripto );

          }
        }else response.sendRedirect("APP/pages/login.html");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
