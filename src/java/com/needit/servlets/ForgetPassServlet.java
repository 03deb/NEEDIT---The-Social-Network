package com.needit.servlets;

import com.needit.dao.UserDao;
import com.needit.entities.Message;
import com.needit.entities.User;
import com.needit.helper.ConnectionStarter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ForgetPassServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgetPassServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String Email = request.getParameter("mail");
           
            //System.out.println(Email);
            
            UserDao dao = new UserDao(ConnectionStarter.getConnection());
            
            User u = dao.getUserByEmail(Email);
            
            String EMAIL = u.getEMAIL();
            
            String PASSWORD = u.getPASSWORD();
            
            String Name = u.getNAME();
            
            System.out.println(Name);
            
            System.out.println("1 '"+PASSWORD+"'");
            
            System.out.println(EMAIL);
            
            if(Email.equals(EMAIL))
            {
                String pass = u.getPASSWORD();
                
                System.out.println(pass);
                
               
                response.sendRedirect("ForgetPass.jsp");
                HttpSession s = request.getSession();
                s.setAttribute("pass :", pass);
                
                 
            }
            else{
                
                response.sendRedirect("ForgetPass.jsp");
                Message msg = new Message("Invalid Details ! Try Again...","error","alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
             
            }
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
