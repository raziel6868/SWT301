package Domain.Models;

public class CustomerFeedback {
    private int id;
    private int bookingId;
    private String facilityId;
    private String customerId;
    private String customerName;
    private Integer starRating;
    private String description;

    public CustomerFeedback() {
    }

    // Getters
    public int getId() {
        return id;
    }

    public int getBookingId() {
        return bookingId;
    }

    public String getFacilityId() {
        return facilityId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public Integer getStarRating() {
        return starRating;
    }

    public String getDescription() {
        return description;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public void setFacilityId(String facilityId) {
        this.facilityId = facilityId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setStarRating(Integer starRating) {
        this.starRating = starRating;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
