package Services;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Domain.Exceptions.NotFoundException;
import Domain.Exceptions.UnauthorizedException;
import Domain.Models.User;

public class AuthService {
    private UserService userService;

    public AuthService() {
        userService = new UserService();
    }

    public void login(HttpServletRequest request, String username, String password)
            throws UnauthorizedException, NotFoundException {
        User user = userService.getUserByUsername(username);

        if (user == null) {
            throw new NotFoundException("Username not found.");
        }
        HttpSession session = request.getSession();

        if (session != null) {
            session.removeAttribute("User");
        }

        if (user.getPassword().equals(password)) {
            session.setAttribute("User", user);
        } else {
            throw new UnauthorizedException("Username or Password incorrect");
        }
    }

    public void logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        session.removeAttribute("User");
    }
}
