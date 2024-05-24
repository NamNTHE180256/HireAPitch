/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.StuffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Stuff;

/**
 *
 * @author Admin
 */
@WebServlet(name="addStuff", urlPatterns={"/addStuff"})
public class addStuff extends HttpServlet {
   
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
            out.println("<title>Servlet addStuff</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addStuff at " + request.getContextPath () + "</h1>");
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
        String stuffName = request.getParameter("stuffName");
        String type = request.getParameter("type");
        int amountExist = Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));
        String image = request.getParameter("image");
        String size = "";
        
        if (type.equals("Bóng")) size = request.getParameter("size");
        if (type.equals("Giày")) size = request.getParameter("shoeSize");
        if (type.equals("Áo Pitch") || type.equals("Găng")) size = request.getParameter("shirtGloveSize");

        // Create a Stuff object with the retrieved data
        Stuff stuff = new Stuff();
        stuff.setStuffName(stuffName);
        stuff.setSize(size);
        stuff.setAmountExist(amountExist);
        stuff.setPrice(price);
        stuff.setImage(image);
        stuff.setType(type);

        // Add the stuff to the database
        StuffDAO stuffDAO = new StuffDAO();
        stuffDAO.add(stuff);

        // Redirect the user to a confirmation page
        response.sendRedirect("stuffAdmin");
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
