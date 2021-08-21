package com.needit.servlets;

import com.needit.dao.FriendDao;
import com.needit.entities.Message;
import com.needit.helper.ConnectionStarter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RequestServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            String operation = request.getParameter("operation");
            int User_Id = Integer.parseInt(request.getParameter("User_Id"));
            int CU_Id = Integer.parseInt(request.getParameter("CU_Id"));
            
           
            
            FriendDao fl = new FriendDao (ConnectionStarter.getConnection());
            
            if(operation.equals("request"))
            {
                boolean f = fl.sendRequest(User_Id, CU_Id);
                out.println(f);
                
                Message msg = new Message("send you a friend request ","success","alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }
           
            String frequest = request.getParameter("operation");
            int U_Id = Integer.parseInt(request.getParameter("User_Id"));
            int Cu_Id = Integer.parseInt(request.getParameter("CU_Id"));
            
            
           // FriendDao fd = new FriendDao (ConnectionStarter.getConnection());
            
            if(frequest.equals("accept"))
            {
                boolean f = fl.acceptRequest(U_Id, Cu_Id);
                out.println(f);
            }
            
            
            String drequest = request.getParameter("operation");
            int F_Id = Integer.parseInt(request.getParameter("F_Id"));
            
            if(drequest.equals("delete"))
            {
                boolean S = fl.deleteRequest(F_Id);
                out.println(S);
            }
            
            
            
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
