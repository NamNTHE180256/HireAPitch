/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Booking;
import model.BookingFDS;
import model.BookingStuff;
import model.Pitch;

/**
 *
 * @author Admin
 */
@WebServlet(name="BillController", urlPatterns={"/BillController"})
public class BillController extends HttpServlet {
   
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
            out.println("<title>Servlet BillController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BillController at " + request.getContextPath () + "</h1>");
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
        int bookingId = Integer.parseInt(request.getParameter("id"));
        BookingDAO bDao = new BookingDAO();
        ArrayList<BookingStuff> bs = bDao.getBookingStuffByBookingId(bookingId);
        ArrayList<BookingFDS> bfd = bDao.getBookingFDSByBookingId(bookingId);
        int stuffPrice = 0, fdsPrice = 0;
        for (BookingStuff bookingStuff : bs) {
            stuffPrice += bookingStuff.getStuff().getPrice() * bookingStuff.getAmount();
        }
        
        for (BookingFDS bookingFDS : bfd) {
            fdsPrice += bookingFDS.getFDS().getPrice() * bookingFDS.getAmount();
        }
        Booking booking = bDao.getBookingById(bookingId);
        request.setAttribute("booking", booking);
        request.setAttribute("totalPrice", stuffPrice + fdsPrice + booking.calculateTotalPrice());
        request.setAttribute("bfd", bfd);
        request.setAttribute("bs", bs);
        request.getRequestDispatcher("Bill.jsp").forward(request, response);
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
        processRequest(request, response);
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
