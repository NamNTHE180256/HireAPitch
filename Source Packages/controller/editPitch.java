/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import dal.pitchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pitch;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name="editPitch", urlPatterns={"/editPitch"})
public class editPitch extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editPitch</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editPitch at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            pitchDAO pDao = new pitchDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            Pitch p = pDao.getPitchById(id);
            request.setAttribute("p", p);
            request.getRequestDispatcher("editPitch.jsp").forward(request, response);
        } catch (Exception e) {

        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            int pitchId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String region = request.getParameter("province"); 
            String type = request.getParameter("type");
            int price = Integer.parseInt(request.getParameter("price"));
            String image = request.getParameter("image"); 

            Pitch pitch = new Pitch(pitchId,name, address, price, image, type, region);

            pitchDAO pDao = new pitchDAO();
            pDao.update(pitch);

            response.sendRedirect("PitchAdmin");
        } catch (Exception e) {
        }
    }
        

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
