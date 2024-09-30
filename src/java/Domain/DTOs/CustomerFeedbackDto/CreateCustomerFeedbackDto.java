package Domain.DTOs.CustomerFeedbackDto;

import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class CreateCustomerFeedbackDto {
    private int bookingId;
    private String facilityId;
    private int starRating;
    private String description;

    public CreateCustomerFeedbackDto(int bookingId, String facilityId, int starRating, String description) {
        this.bookingId = bookingId;
        this.facilityId = facilityId;
        this.starRating = starRating;
        this.description = description;
    }

    public CreateCustomerFeedbackDto(HttpServletRequest request) {
        bookingId = ConvertUtils.convertStringToInt(request.getParameter("BookingId"));
        facilityId = request.getParameter("FacilityId");
        starRating = ConvertUtils.convertStringToInt(request.getParameter("StarRating"));
        description = request.getParameter("Description");
    }

    // Getters
    public int getBookingId() {
        return bookingId;
    }

    public String getFacilityId() {
        return facilityId;
    }

    public int getStarRating() {
        return starRating;
    }

    public String getDescription() {
        return description;
    }

    // Setters
    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public void setFacilityId(String facilityId) {
        this.facilityId = facilityId;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
