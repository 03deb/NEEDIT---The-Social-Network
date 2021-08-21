package com.needit.servlets;

import com.needit.dao.PostDao;
import com.needit.entities.Post;
import com.needit.entities.User;
import com.needit.helper.ConnectionStarter;
import com.needit.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            int cid = Integer.parseInt(request.getParameter("cid"));
            String Post_Content = request.getParameter("pstdscptn");
            Part part = request.getPart("image");
            
            //getting session 
            
            HttpSession session = request.getSession();
            
            User user = (User) session.getAttribute("currentUser");
            
            Post p = new Post(Post_Content, part.getSubmittedFileName(), cid, user.getID());
            PostDao dao = new PostDao(ConnectionStarter.getConnection());
            
            if (dao.savePost(p)) {

                String path = request.getRealPath("/")+ "postimage" +File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(),path);
                out.println("done");
                
            }
            
            else 
            {
                out.println("error");
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
