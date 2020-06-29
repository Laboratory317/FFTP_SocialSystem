
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import model.user;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet(name = "addPost", urlPatterns = {"/addPost"})
public class addPost extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        if( session != null ){
            user obj_user = (user) session.getAttribute("user");
            if( obj_user != null ){

                // GET
                // session user
                // id_group
                // content

                // OUT
                // JSON post [ status ,id_post, user{}, poster{}, date, content , com[] ]

                String id_group = request.getParameter("id_group"); // if available group !
                String content  = request.getParameter("content");

                if( content != null ){
                    try {
                        JSONObject _post = DataAccess.newPost( new JSONObject()
                                                                .put( "id_group", id_group == null ? JSONObject.NULL  : Integer.parseInt(id_group)  )
                                                                .put( "content" , content  )
                                                            , obj_user );
                        JSONObject user = obj_user.toJSON();

                        out.print( new JSONObject()
                                    .put( "status"  , _post.getBoolean("status") )
                                    .put( "id_post" , _post.getInt("id_post")    )
                                    .put( "user"    , user                       )
                                    .put( "poster"  , user                       )
                                    .put( "date"    , _post.getString("date")    )
                                    .put( "content" , content                    )
                                    .put( "com"     , new JSONArray()            ) // null
                        );

                    } catch (JSONException ex) {
                        Logger.getLogger(addPost.class.getName()).log(Level.SEVERE, null, ex);
                    }
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
