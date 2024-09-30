package Repositories.Entities;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserEntity {
    private int id;
    private String username;
    private String password;
    private int userRole;
    private String customerId;

    public UserEntity(ResultSet rs) throws SQLException {
        this.id = rs.getInt("Id");
        this.username = rs.getString("Username");
        this.password = rs.getString("Password");
        this.userRole = rs.getInt("UserRole");
        this.customerId = rs.getString("CustomerId");
    }

    // Getter methods
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getUserRole() {
        return userRole;
    }

    public String getCustomerId() {
        return customerId;
    }

    // Setter methods (if needed)

    // Other methods
}
