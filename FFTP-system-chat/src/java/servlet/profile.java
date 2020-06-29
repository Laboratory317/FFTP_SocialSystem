
package servlet;

import dao.DataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;

/*
  Този сервлет служи за търсене на юзери в системата.
  Подава му се: първо или втори име или ид-то на юзера.
  > пример: ../profile?url=първоИме.фамилия.ид/

  Той редиректва към страниците:
    - намерени юзери в системата
    - намерен юзер -> страница на профила
         + настройки ( ако юзера е този, който е в сесията)
    - не е намерен никой

  Търсене се осъществява единсвено ако юзера, който изпраща заявката, се е логнал в системата.
*/


public class profile extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        List<user> coincidesUsers = null;

        try{

          // === PARAMETERS GET ===
          String[] parameters = request.getParameter("url").split("."); // split -> 0-firstName, 1-LastName, 2-id

          // === SHECK USER WHETHER LOGIN OK ===
          if(session != null){
            user obj_user = (user) session.getAttribute("user");
            if( obj_user != null ){


              // === GET USERS ===
              if( parameters.length >= 2 ){
                coincidesUsers.add( DataAccess.getUserById( Integer.parseInt( parameters[2] ) ) );

              }else if( parameters.length > 0 ){
                coincidesUsers = DataAccess.getUserByName( parameters[0], parameters[1] );

              }else{
                // do no result page (insert err)
              }



              // === RESULT ===
              if( coincidesUsers != null || coincidesUsers.isEmpty() ){

                  if( coincidesUsers.size() == 1 ) {
                      // do show profilePage user
                      if( coincidesUsers.get(0).getId() == obj_user.getId() ){
                        // + setting
                      }

                  }else{
                      // do show list Users
                  }

              }else{
                  // do no result page (search in system)
              }



            }
          }else{
            // to error page /or login
          }


        } catch( ArrayIndexOutOfBoundsException ex ){

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
