package Domain.DTOs.AuthDto;

import jakarta.servlet.http.HttpServletRequest;

public class UserCredentialDto {
    private String username;
    private String password;

    public UserCredentialDto(HttpServletRequest request) {
        username = request.getParameter("Username");
        password = request.getParameter("Password");
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
