
package servlet;

import static dao.DataAccess.getAvailableNewComment;
import static dao.DataAccess.getPostFromGroup;
import static dao.DataAccess.getPostFromUser;
import static dao.DataAccess.getPostTimeLine;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "getPC", urlPatterns = {"/getPC"})
public class getPC extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        boolean status  = false;
        JSONArray output = null ;  // [ array  { post }, { post }, {post } .. ]

        try{

          if( session != null ){
            user obj_user = (user) session.getAttribute("user");

            if( obj_user != null ){
                String query  = request.getParameter("query");
                String arrAsk = request.getParameter("ask"); // json / if check_newCommentars mode

                // check type timeLine
                if( query != null ) switch(query) {
                      case "allTimeLine"   : output = getPostTimeLine( obj_user.getId() );  status = true;  break;
                      case "userTimeLine"  : output = getPostFromUser( obj_user.getId() );  status = true;  break;
                      case "groupTimeLine" : output = getPostFromGroup( 0 );                status = true;  break;  // временно докато не се подава group_id

                      case "check_newCommentars" :
                          System.out.println(arrAsk);

                          if( arrAsk == null ) break;
                          output = getAvailableNewComment( new JSONArray( arrAsk ) ); // arrAsk [ { lastCom_id, post_id}, ... ]
                          status = true;
                      break;
                }


                out.print( new JSONObject()
                            .put( "status"  , status            )
                            .put( "user"    , obj_user.toJSON() )
                            .put( "receive" , output            )
                );
            }

          }



        } catch ( JSONException | ClassNotFoundException | SQLException ex ) {
            Logger.getLogger(getPC.class.getName()).log(Level.SEVERE, null, ex);
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
