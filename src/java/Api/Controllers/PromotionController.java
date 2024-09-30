/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Api.Controllers;

import Domain.DTOs.CustomerDto.CreateVoucherRecipientCustomersDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Models.Booking;
import java.util.ArrayList;
import java.util.List;

import Domain.Models.VoucherRecipientCustomer;
import Services.BookingService;
import Services.PromotionService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author jpesewang
 */
public class PromotionController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PromotionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PromotionController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PromotionService promotionService = new PromotionService();
        BookingService bookingService = new BookingService();
        String action = request.getParameter("action");
        String year = request.getParameter("Year");
        String month = request.getParameter("Month");
        PageQueryDto pageQueryDto;
        PageDto<VoucherRecipientCustomer> pageDto;
        switch (action) {
            
            case "ListCustomersGetVoucher":
                pageQueryDto = new PageQueryDto(request);
                pageDto = promotionService.getVoucherRecipientCustomers(pageQueryDto, Integer.parseInt(year), Integer.parseInt(month));
                request.setAttribute("useServices", pageDto.getData());
                request.setAttribute("meta", pageDto.getMeta());
                request.getRequestDispatcher("Admin/PromotionManagement/CustomersGetVoucher/ListCustomersGetVoucher.jsp").forward(request, response);
                break;
            
            case "CreateVouchers":
                CreateVoucherRecipientCustomersDto dto = new CreateVoucherRecipientCustomersDto((request));
                promotionService.createVoucherRecipientCustomers(dto);
                request.getRequestDispatcher("Admin/PromotionManagement/CustomersUseService/ListCustomersUseService.jsp").forward(request, response);
                break;
            
            case "ListCustomersUseService":
                java.util.List<Booking> bookings = bookingService.getBookingsByYear(2024);
                request.setAttribute("bookings", bookings);
                request.getRequestDispatcher("Admin/PromotionManagement/CustomersUseService/ListCustomersUseService.jsp").forward(request, response);
                break;
            
            default:
                request.getRequestDispatcher("Admin/PromotionManagement/ListPromotion.jsp").forward(request, response);
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
