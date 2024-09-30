package Api.Controllers;

import Domain.Enums.UserRole;
import java.io.IOException;
import java.io.PrintWriter;

import Domain.Exceptions.NotFoundException;
import Domain.Exceptions.UnauthorizedException;
import Domain.Models.User;
import Services.AuthService;
import Utils.SessionUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Call doPost() to handle the GET request as well
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        AuthService authService = new AuthService();
        HttpSession session = request.getSession();

        switch (action) {
            case "login":
                String username = request.getParameter("Username");
                String password = request.getParameter("Password");

                if (username == null || password == null) {
                    // response.sendRedirect("/ResortHub/components/Unauthorized.jsp");
                    request.setAttribute("error", "Invalid username or password! Please try again.");
                    request.getRequestDispatcher("/pages/Auth/login.jsp").forward(request, response);
                    return;
                }

                try {
                    authService.login(request, username, password);

                    User user = (User) session.getAttribute("User");

                    if (user != null) { // Check if user is not null
                        if (user.getUserRole() == UserRole.Admin) {
                            response.sendRedirect("/ResortHub/Admin/FacilityManagement/ListFacility.jsp");
                        } else if (user.getUserRole() == UserRole.User) {
                            response.sendRedirect("/ResortHub/components/Onboarding.jsp");
                        } else {
                            response.sendRedirect("/ResortHub/pages/Home/index.jsp");
                        }
                    } else {
                        response.sendRedirect("/ResortHub/pages/Auth/login.jsp");
                    }
                } catch (UnauthorizedException | NotFoundException ex) {
                    request.setAttribute("error", "Username or password is incorrect! Please try again.");
                    request.getRequestDispatcher("/pages/Auth/login.jsp").forward(request, response);
                    return;
                }
                break;

            case "logout":
                authService.logout(request);
                response.sendRedirect("/ResortHub/pages/Home/index.jsp");
                break;

            default:

        }

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
