package com.needit.servlets;

import com.needit.dao.UserDao;
import com.needit.entities.Message;
import com.needit.helper.ConnectionStarter;
import com.needit.entities.User;
import com.needit.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
public class EditServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            //fetching all data from edit servlet
            
            String userEmail = request.getParameter("umail");
            String userName = request.getParameter("fname");
            String userDob = request.getParameter("dob");
            String userAbout = request.getParameter("userMessage");
            String userLocation = request.getParameter("location");
            Part part = request.getPart("userphoto");
            String imageName = part.getSubmittedFileName();
            
            
            HttpSession s = request.getSession();
            User user = (User)  s.getAttribute("currentUser");
            
            user.setEMAIL(userEmail);
            user.setNAME(userName);
            user.setDOB(userDob);
            user.setABOUT(userAbout);
            user.setLOCATION(userLocation);
            
            String oldFile = user.getPROFILE();
            
            user.setPROFILE(imageName);
            
            UserDao userDao = new UserDao(ConnectionStarter.getConnection());
            
            boolean ans = userDao.updateUser(user);
            if (ans){
                
                String path = request.getRealPath("/")+ "Pics" +File.separator + user.getPROFILE();
                
                //to delete old photo from path 
                
                String pathOldFile = request.getRealPath("/")+ "Pics" +File.separator + oldFile;
                
                if(!oldFile.equals("defaut.png"))
                {
                    Helper.deleteFile(path);
                }
                
                if(Helper.saveFile(part.getInputStream(),path))
                {
                    out.println("updated");
                    Message msg = new Message("Profile details updated","success","alert-success");
                    s.setAttribute("msg",msg);
                }
                
            }
            else{
                out.println("not updated");
                Message msg = new Message("profile is not updated", "failed", "alert-danger");
                s.setAttribute("msg", msg);
            }
            
            response.sendRedirect("ProfilePage.jsp");
            
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
