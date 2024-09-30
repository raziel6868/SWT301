package Api.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Api.Validators.CustomerValidator;
import Domain.DTOs.CustomerDto.CreateCustomerDto;
import Domain.DTOs.CustomerDto.UpdateCustomerDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Exceptions.ConflictException;
import Domain.Models.Booking;
import Domain.Models.Customer;
import Domain.Models.Employee;
import Services.CustomerService;

public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerService customerService = new CustomerService();

        PageQueryDto pageQueryDto;
        PageDto<Customer> pageDto;

        String id = request.getParameter("id");

        String action = request.getParameter("action");
        switch (action) {

            case "getAll":
                
                pageQueryDto = new PageQueryDto(request);
                pageDto = customerService.getAllCustomers(pageQueryDto);
                request.setAttribute("customers", pageDto.getData());
                request.setAttribute("meta", pageDto.getMeta());
                request.getRequestDispatcher("Admin/CustomerManagement/ListCustomer.jsp").forward(request, response);
                break;

            case "getById":
                   Customer customer = customerService.getCustomerById(id);
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("Admin/CustomerManagement/UpdateCustomer.jsp").forward(request, response);
                break;

            case "delete":
                customerService.deleteCustomer(id);
                String message = "Delete customer successfully!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                break;

            default:
                request.getRequestDispatcher("Admin/CustomerManagement/CreateCustomer.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        CustomerService customerService = new CustomerService();
        CustomerValidator customerValidator = new CustomerValidator();

        List<String> validationErrors;

        switch (action) {
            case "create":
                CreateCustomerDto createCustomerDto = new CreateCustomerDto(request);
                validationErrors = customerValidator.validateCreateCustomerDto(createCustomerDto);
                if (validationErrors.isEmpty()) {
                    try {
                        customerService.createCustomer(createCustomerDto);
                        String message = "Create customer successfully!";
                        request.setAttribute("message", message);
                        request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                        return;
                        
                        
                    } catch (ConflictException ex) {
                        handleConflictException(response, ex.getMessage());
                    }
                } else {
                    handleValidationErrors(request, response, validationErrors, "Create");
                }
                break;
                
            case "update":
                String customerId = request.getParameter("id");
                UpdateCustomerDto updateCustomerDto = new UpdateCustomerDto(request);
                validationErrors = customerValidator.validateUpdateCustomerDto(updateCustomerDto);

                if (validationErrors.isEmpty()) {
                    try {
                        customerService.updateCustomer(customerId, updateCustomerDto);
                    } catch (ConflictException ex) {
                        handleConflictException(response, ex.getMessage());
                    }
                } else {
                    handleValidationErrors(request, response, validationErrors, "Update");
                }
                break;
            default:
                handleInvalidAction(response, action);
        }
    }

    private void handleConflictException(HttpServletResponse response, String message) throws IOException {
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println(message);
            out.println("</body>");
            out.println("</html>");
        }
    }

    private void handleValidationErrors(HttpServletRequest request, HttpServletResponse response, List<String> validationErrors, String pageName)
            throws IOException, ServletException {
//        Hanle error log
        request.setAttribute("error", String.join(", ", validationErrors));
        request.getRequestDispatcher("/ResortManagement/Admin/CustomerManagement/" + pageName +"Customer.jsp").forward(request, response);

    }

    private void handleInvalidAction(HttpServletResponse response, String action) throws IOException {
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Invalid action: " + action + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
