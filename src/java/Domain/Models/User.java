package Domain.Models;

import Domain.Enums.UserRole;

public class User {
    private int id;
    private String username;
    private String password;
    private UserRole userRole;
    private String customerId;
    private Customer customer;

    public User() {
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public UserRole getUserRole() {
        return userRole;
    }

    public String getCustomerId() {
        return customerId;
    }

    public Customer getCustomer() {
        return customer;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
