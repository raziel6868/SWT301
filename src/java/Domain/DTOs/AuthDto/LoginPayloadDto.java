package Domain.DTOs.AuthDto;

import Domain.Models.User;

public class LoginPayloadDto {
    private User user;
    private String accessToken;

    public LoginPayloadDto(User user, String accessToken) {
        this.user = user;
        this.accessToken = accessToken;
    }

    public User getUser() {
        return user;
    }

    public String getAccessToken() {
        return accessToken;
    }
}
