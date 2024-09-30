package Domain.Models;

import java.util.Date;

import Domain.Enums.CustomerStatus;

public class Story {
    private int id;
    private Date postDate;
    private String facilityId;
    private String facilityName;
    private String customerId;
    private String customerName;
    private CustomerStatus customerStatus;
    private String title;
    private String description;

    public Story() {
    }

    // Getters
    public int getId() {
        return id;
    }

    public Date getPostDate() {
        return postDate;
    }

    public String getFacilityId() {
        return facilityId;
    }

    public String getFacilityName() {
        return facilityName;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public CustomerStatus getCustomerStatus() {
        return customerStatus;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public void setFacilityId(String facilityId) {
        this.facilityId = facilityId;
    }

    public void setFacilityName(String facilityName) {
        this.facilityName = facilityName;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setCustomerStatus(CustomerStatus customerStatus) {
        this.customerStatus = customerStatus;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
