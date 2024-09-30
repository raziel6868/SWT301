package Repositories.Entities;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerFeedbackEntity {
    private int id;
    private int bookingId;
    private String facilityId;
    private String customerId;
    private String customerName;
    private int starRating;
    private String description;

    public CustomerFeedbackEntity(ResultSet rs) throws SQLException {
        this.id = rs.getInt("Id");
        this.bookingId = rs.getInt("BookingId");
        this.facilityId = rs.getString("FacilityId");
        this.customerId = rs.getString("CustomerId");
        this.customerName = rs.getString("CustomerName");
        this.starRating = rs.getInt("StarRating");
        this.description = rs.getString("Description");
    }

    // Getter methods
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

    public int getStarRating() {
        return starRating;
    }

    public String getDescription() {
        return description;
    }

    // Setter methods (if needed)

    // Other methods
}
