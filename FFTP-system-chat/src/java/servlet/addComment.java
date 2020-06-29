
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DataAccess;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.user;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class addComment extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        if( session != null ){
          user obj_user = (user) session.getAttribute("user");
          if( obj_user != null ){

            // GET
            // session user
            // request.getParameter("id_post") -> id_post
            // request.getParameter("content") -> content

            // OUT
            // JSON coment status , [ { { user = user }, date = result.DAO , content = content } ]

            String id_post = request.getParameter("id_post");
            String content = request.getParameter("content");

            if ( id_post != null && content != null ){
                try {
                    JSONObject _com = DataAccess.addComment( new JSONObject()
                                                                .put("id_post", id_post )
                                                                .put("content", content )
                                                            , obj_user );

                    out.print( new JSONObject()
                                .put( "status"  , _com.getBoolean("status")   )
                                .put( "id_post" , id_post                     )
                                .put( "com"     , new JSONArray()
                                        .put( new JSONObject()
                                                .put( "poster"  , obj_user.toJSON()        )
                                                .put( "date"    , _com.getString("date")   )
                                                .put( "id_com"  , _com.getInt("id_com")    )
                                                .put( "content" , content                  )
                                        )
                                    )
                    );

                } catch (JSONException ex) {
                    Logger.getLogger( addPost.class.getName() ).log( Level.SEVERE, null, ex );
                }
            }

          }
        }
          // return JSON comment (all data) ...


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
