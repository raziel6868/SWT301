package Api.Controllers;

import Api.Validators.FacilityValidator;
import Domain.DTOs.CustomerFeedbackDto.CreateCustomerFeedbackDto;
import Domain.DTOs.FacilityDto.CreateFacilityDto;
import Domain.DTOs.FacilityDto.FilterFacilitiesDto;
import Domain.DTOs.FacilityDto.SuggestFacilitiesDto;
import Domain.DTOs.FacilityDto.SuggestedFacilitiesDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.DTOs.StoryDto.CreateStoryDto;
import Domain.Enums.FacilityType;
import Domain.Enums.UserRole;
import Domain.Exceptions.ConflictException;
import Domain.Models.Customer;
import Domain.Models.CustomerFeedback;
import Domain.Models.Facility;
import Domain.Models.MaintenanceFacility;
import Domain.Models.Story;
import Domain.Models.User;
import Services.CustomerFeedbackService;
import Services.CustomerService;
import Services.FacilityService;
import Services.StoryService;
import Utils.SessionUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class FacilityController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FacilityController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FacilityController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FacilityService facilityService = new FacilityService();
        CustomerService customerService = new CustomerService();
        StoryService storyService = new StoryService();
        CustomerFeedbackService customerFeedbackService = new CustomerFeedbackService();

        PageQueryDto pageQueryDto;
        PageDto<Facility> pageDto;
        PageDto<CustomerFeedback> customerFeedback;
        PageDto<Customer> customerPageDto;
        PageDto<Story> storyDto;

        String id = request.getParameter("id");
        String action = request.getParameter("action");
        String facilityType = request.getParameter("facilityType");

        pageQueryDto = new PageQueryDto(request);

        pageDto = facilityService.getAllFacilities(pageQueryDto);
        customerPageDto = customerService.getAllCustomers(pageQueryDto);
        switch (action) {

            case "getMarketplaceItem":

                if (facilityType != null) {
                    switch (facilityType) {
                        case "villa":

                            pageDto = facilityService.getAllFacilities(pageQueryDto, FacilityType.Villa);
                            request.setAttribute("facilities", pageDto.getData());
                            request.setAttribute("meta", pageDto.getMeta());
                            request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request,
                                    response);
                            break;
                        case "house":
                            pageDto = facilityService.getAllFacilities(pageQueryDto, FacilityType.House);
                            request.setAttribute("facilities", pageDto.getData());
                            request.setAttribute("meta", pageDto.getMeta());
                            request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request,
                                    response);
                            break;
                        case "room":
                            pageDto = facilityService.getAllFacilities(pageQueryDto, FacilityType.Room);
                            request.setAttribute("facilities", pageDto.getData());
                            request.setAttribute("meta", pageDto.getMeta());
                            request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request,
                                    response);
                            break;
                        default:
                            response.sendRedirect("pages/Facility/Marketplace.jsp");
                    }
                } else {
                    request.setAttribute("facilities", pageDto.getData());
                    request.setAttribute("meta", pageDto.getMeta());
                    request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request, response);
                }
                break;
            case "getAll":
                switch (facilityType) {
                    case "villa":

                        pageDto = facilityService.getAllFacilities(pageQueryDto, FacilityType.Villa);
                        request.setAttribute("facilities", pageDto.getData());
                        request.setAttribute("meta", pageDto.getMeta());
                        request.getRequestDispatcher("Admin/FacilityManagement/Villa/ListVilla.jsp").forward(request,
                                response);
                        break;
                    case "house":
                        pageDto = facilityService.getAllFacilities(pageQueryDto, FacilityType.House);
                        request.setAttribute("facilities", pageDto.getData());
                        request.setAttribute("meta", pageDto.getMeta());
                        request.getRequestDispatcher("Admin/FacilityManagement/House/ListHouse.jsp").forward(request,
                                response);
                        break;
                    case "room":
                        pageDto = facilityService.getAllFacilities(pageQueryDto, FacilityType.Room);
                        request.setAttribute("facilities", pageDto.getData());
                        request.setAttribute("meta", pageDto.getMeta());
                        request.getRequestDispatcher("Admin/FacilityManagement/Room/ListRoom.jsp").forward(request,
                                response);
                        break;
                    default:
                        response.sendRedirect("Admin/FacilityManagement/ListFacility.jsp");
                }

                break;

            case "getById":
                customerPageDto = customerService.getAllCustomers(pageQueryDto);
                Facility facility = facilityService.getFacilityById(id);
                customerFeedback = customerFeedbackService.getFeedbacksOfFacility(pageQueryDto, id);
                request.setAttribute("feedback", customerFeedback.getData());
                request.setAttribute("facility", facility);
                request.setAttribute("customers", customerPageDto.getData());
                request.getRequestDispatcher("pages/Facility/FacilityDetails.jsp").forward(request, response);
                break;

            case "getStoryById":
                Story story = storyService.getStoryById(Integer.parseInt(id));
                request.setAttribute("story", story);
                request.getRequestDispatcher("pages/Story/StoryDetails.jsp").forward(request, response);
                break;

            case "getListMaintenance":
                String yearParam = request.getParameter("Year");
                String monthParam = request.getParameter("Month");

                // Get current year and month if parameters are not provided
                Calendar calendar = Calendar.getInstance();
                int currentYear = calendar.get(Calendar.YEAR);
                int currentMonth = calendar.get(Calendar.MONTH) + 1;

                int year = (yearParam != null && !yearParam.isEmpty()) ? Integer.parseInt(yearParam) : currentYear;
                int month = (monthParam != null && !monthParam.isEmpty()) ? Integer.parseInt(monthParam) : currentMonth;

                java.util.List<MaintenanceFacility> maintenanceFacilityList = facilityService
                        .getFacilitiesForMaintenance(year, month);
                request.setAttribute("maintenanceFacility", maintenanceFacilityList);
                request.getRequestDispatcher("Admin/FacilityManagement/ListFacilityMaintenance.jsp").forward(request,
                        response);
                break;

            case "getCustomerFeedBack":
                request.setAttribute("meta", pageDto.getMeta());
                request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request, response);
                break;

            case "getStory":
                storyDto = storyService.getAllStories(pageQueryDto);
                request.setAttribute("story", storyDto.getData());
                request.setAttribute("meta", storyDto.getMeta());
                request.getRequestDispatcher("pages/Story/ListStory.jsp").forward(request, response);
                break;

            case "getFilterFacility":
                FilterFacilitiesDto filterFacilitiesDto = new FilterFacilitiesDto(request);
                pageDto = facilityService.filterFacilities(pageQueryDto, filterFacilitiesDto);
                request.setAttribute("facility", pageDto.getData());
                request.setAttribute("meta", pageDto.getMeta());
                request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request, response);
                break;

            default:
                request.getRequestDispatcher("Admin/FacilityManagement/ListFacility.jsp").forward(request,
                        response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FacilityService facilityService = new FacilityService();
        CustomerFeedbackService customerFeedbackService = new CustomerFeedbackService();
        StoryService storyService = new StoryService();
        FacilityValidator facilityValidator = new FacilityValidator();

        List<String> validationErrors;
        PageQueryDto pageQueryDto;
        PageDto<Facility> pageDto;

        String id = request.getParameter("id");
        String action = request.getParameter("action");
        String facilityType = request.getParameter("facilityType");

        pageQueryDto = new PageQueryDto(request);
        String customerId;

        String facilityId = request.getParameter("facilityId");

        User user = SessionUtils.getUserFromSession(request);
        switch (action) {
            case "create":
                CreateFacilityDto createFacilityDto = new CreateFacilityDto(request);
                request.setAttribute("facility", createFacilityDto);
                validationErrors = facilityValidator.validateCreateFacilityDto(createFacilityDto);
                if (validationErrors.isEmpty()) {
                    try {
                        facilityService.createFacility(createFacilityDto);

                        String message = "Create facility successfully!";
                        request.setAttribute("message", message);
                        request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                        return;
                    } catch (ConflictException ex) {
                        request.setAttribute("error", ex.getMessage());
                    }
                } else {
                    request.setAttribute("error", String.join(" - ", validationErrors));
                }
                switch (facilityType) {
                    case "villa":
                        request.getRequestDispatcher("Admin/FacilityManagement/Villa/CreateVilla.jsp").forward(request,
                                response);
                        break;
                    case "house":
                        request.getRequestDispatcher("Admin/FacilityManagement/House/CreateHouse.jsp").forward(request,
                                response);
                        break;
                    default:
                        request.getRequestDispatcher("Admin/FacilityManagement/Room/CreateRoom.jsp").forward(request,
                                response);
                        break;
                }
                break;

            case "createCustomerFeedback":
                CreateCustomerFeedbackDto dto = new CreateCustomerFeedbackDto(request);

                if ((user.getUserRole() == UserRole.Admin)) {
                    customerId = "KH-0000";
                } else {
                    customerId = user.getCustomerId();
                }
                customerFeedbackService.createCustomerFeedback(dto, customerId);
                String contractMessage = "Create Feedback successfully!";
                request.setAttribute("message", contractMessage);
                request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                break;

            case "createStory":
                if ((user.getUserRole() == UserRole.Admin)) {
                    customerId = "KH-0000";
                } else {
                    customerId = user.getCustomerId();
                }
                CreateStoryDto storyDto = new CreateStoryDto(request);
                storyService.createStory(storyDto, customerId, facilityId);
                String storyMessage = "Create Story successfully!";
                request.setAttribute("message", storyMessage);
                request.getRequestDispatcher("components/SuccessToast.jsp").forward(request, response);
                break;
                
            case "getFilterFacility":
                FilterFacilitiesDto filterFacilitiesDto = new FilterFacilitiesDto(request);
                pageDto = facilityService.filterFacilities(pageQueryDto, filterFacilitiesDto);
                request.setAttribute("facilities", pageDto.getData());
                request.setAttribute("meta", pageDto.getMeta());
                request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request, response);
                break;

            case "getSuggestFacility":
                SuggestFacilitiesDto suggestFacilitiesDto = new SuggestFacilitiesDto(request);
                List<SuggestedFacilitiesDto> suggestFacilities = facilityService.suggestFacilities(suggestFacilitiesDto);

                List<Facility> facilitiesList = new ArrayList<>();
                List<Integer> numOfFacilitiesList = new ArrayList<>();

                for (SuggestedFacilitiesDto suggestedFacilitiesDto : suggestFacilities) {
                    facilitiesList.addAll(suggestedFacilitiesDto.getSuggestedFacilities());
                    numOfFacilitiesList.add(suggestedFacilitiesDto.getNumOfFacilities());
                }

//                request.setAttribute("facilities", facilitiesList);
                request.setAttribute("numOfFacilities", numOfFacilitiesList.size());
                request.setAttribute("maxNumOfFacilities", suggestFacilitiesDto.getMaxNumOfFacilities());
                request.setAttribute("totalOccupancy", suggestFacilitiesDto.getTotalOccupancy());
                
                
                 request.setAttribute("suggestFacilities", suggestFacilities);

                // Forward the request
                request.getRequestDispatcher("pages/Facility/Marketplace.jsp").forward(request, response);
                break;

            default:

                request.getRequestDispatcher("Admin/FacilityManagement/Villa/CreateVilla.jsp?").forward(request,
                        response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
