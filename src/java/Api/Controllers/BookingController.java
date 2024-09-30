/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Api.Controllers;

import Domain.DTOs.BookingDto.CreateBookingDto;
import Domain.DTOs.BookingDto.CreateRentalContractDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Enums.UserRole;
import Domain.Models.User;
import Services.BookingService;
import Domain.Models.Booking;
import Domain.Models.CustomerFeedback;
import Domain.Models.Facility;
import Domain.Models.RentalContract;
import Services.CustomerFeedbackService;
import Services.RentalContractService;
import Utils.SessionUtils;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookingService bookingService = new BookingService();
        RentalContractService rentalContractService = new RentalContractService();
        CustomerFeedbackService customerFeedbackService = new CustomerFeedbackService();

        String id = request.getParameter("id");
        String action = request.getParameter("action");
        String facilityId = request.getParameter("facilityId");

        PageQueryDto pageQueryDto;
        PageDto<Booking> pageDto;
        PageDto<CustomerFeedback> customerFeedback;
        PageDto<RentalContract> rentalContractPageDto;

        pageQueryDto = new PageQueryDto(request);
        User user = SessionUtils.getUserFromSession(request);
        switch (action) {
            case "getMyBooking":

                if (user == null) {
                    response.sendRedirect("/ResortHub/components/Unauthorized.jsp");
                    return;
                }
                pageQueryDto = new PageQueryDto(request);
                pageDto = bookingService.getBookingsOfCustomer(pageQueryDto,
                        user.getCustomerId());
                request.setAttribute("bookings", pageDto.getData());
                request.setAttribute("meta", pageDto.getMeta());
                request.getRequestDispatcher("pages/MyBooking.jsp").forward(request, response);
                break;

            case "getAll":
                pageDto = bookingService.getAllBookings(pageQueryDto);
                request.setAttribute("bookings", pageDto.getData());
                request.setAttribute("meta", pageDto.getMeta());
                request.getRequestDispatcher("Admin/BookingManagement/ListBooking.jsp").forward(request, response);
                break;

            case "getAllContract":
                rentalContractPageDto = rentalContractService.getAllRentalContracts(pageQueryDto);
                request.setAttribute("rentalContract", rentalContractPageDto.getData());
                request.setAttribute("meta", rentalContractPageDto.getMeta());
                request.getRequestDispatcher("Admin/BookingManagement/ListContract.jsp").forward(request, response);
                break;

            case "getById":
                customerFeedback = customerFeedbackService.getFeedbacksOfFacility(pageQueryDto, facilityId);
                Booking booking = bookingService.getBookingById(id);
                request.setAttribute("feedback", customerFeedback.getData());

                request.setAttribute("booking", booking);
                request.getRequestDispatcher("pages/BookingDetails.jsp").forward(request, response);
                break;

            case "getContractById":
                RentalContract rentalContract = rentalContractService.getRentalContractById(id);
                request.setAttribute("rentalContract", rentalContract);
                request.getRequestDispatcher("pages/Facility/ContractDetails.jsp").forward(request, response);
                break;

            case "delete":
                bookingService.deleteBooking(Integer.parseInt(id));
                String message = "Delete booking successfully!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                break;

            default:
                request.getRequestDispatcher("Admin/BookingManagement/ListBooking.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        BookingService bookingService = new BookingService();
        CreateRentalContractDto dto = new CreateRentalContractDto(request);
        User user = SessionUtils.getUserFromSession(request);
        RentalContractService rentalContractService = new RentalContractService();
        switch (action) {
            case "createBooking":
                CreateBookingDto createBookingDto = new CreateBookingDto(request);

                if (user == null) {
                    response.sendRedirect("/ResortHub/components/Unauthorized.jsp");
                    return;
                }
                bookingService.createBooking(createBookingDto);
                String message = "Create booking successfully!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                break;

            case "reviewContract":
                String totalPrice = request.getParameter("totalPrice");
                String bookingIds = request.getParameter("BookingIds");
                request.setAttribute("bookingIDs", bookingIds);
                request.setAttribute("totalPrice", totalPrice);
                request.getRequestDispatcher("pages/Facility/ContractForm.jsp").forward(request, response);
                break;

            case "createContract":
                String customerId;
                if ((user.getUserRole() == UserRole.Admin)) {
                    customerId = "KH-0000";
                } else {
                    customerId = user.getCustomerId();
                }

                rentalContractService.createRentalContract(dto, customerId);
                String contractMessage = "Create contract successfully!";
                request.setAttribute("message", contractMessage);
                request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                break;

            default:

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
