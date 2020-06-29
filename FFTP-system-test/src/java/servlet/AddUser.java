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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.users;

/**
 *
 * @author glor-cos
 */
public class AddUser extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String email = request.getParameter("email");
            String bd = request.getParameter("rd_date");
            String age = request.getParameter("age");
            String date_startInCompany = request.getParameter("data_startInCompany");
            String typeWork = request.getParameter("typeWork");
             
            // IF NOT NULL
            // INSERT DATA IN DATABASE –> DAO CLASS
            String action = "offline";
            users user = new users(firstName, lastName, username,  password, phoneNumber,  address, city,  email,  bd,  Integer.parseInt(age),  date_startInCompany,  typeWork,  action);
            DataAccess.addUser(user);
            
            //List<users> all = DataAccess.getAll(); // get returned list data from dao.class (get data for users)
            //request.setAttribute("list", all);
            //request.getRequestDispatcher("allUser.jsp").forward(request, response);
            
       
            // RETURN SUCCESS OR ERROR
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("<h1>ADD USER SUCCESSFULL</h1>");

            out.println("</body>");
            out.println("</html>");

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
    }// </editor-fold>

}
