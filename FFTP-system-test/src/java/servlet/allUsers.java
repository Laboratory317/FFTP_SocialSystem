/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.users;


@WebServlet(name = "allUsers", urlPatterns = {"/allUsers"})
public class allUsers extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            List<users> all = DataAccess.getAll();
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet allUsers</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>All users</h1>");
            out.println("<table >");
            
            out.println("<tr>");
            out.println("<th>Firstname</th>");
            out.println("<th>Lastname</th> ");
            out.println("<th>Username</th>");
            out.println("<th>Address</th>");
            out.println("<th>City</th>");
            out.println("<th>Age</th>");
            out.println("</tr>");
            
            
            for(int i=0;i<all.size();i++){
               out.println("<tr>");
               out.println("<td>"+ all.get(i).getFirstName() + "</td>"); 
               out.println("<td>"+ all.get(i).getLastName() + "</td>"); 
               out.println("<td>"+ all.get(i).getUsername() + "</td>"); 
               out.println("<td>"+ all.get(i).getAddress() + "</td>");
               out.println("<td>"+ all.get(i).getCity() + "</td>"); 
               out.println("<td>"+ all.get(i).getAge() + "</td>"); 
               out.println("</tr>");
            } 
           
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
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
