package Domain.DTOs.BookingDto;

import java.util.Date;

import Domain.Models.Customer;
import Domain.Models.Facility;
import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class CreateBookingDto {
    private Date bookingDate;
    private Date startDate;
    private Date endDate;
    private int occupancy;
    private String customerId;
    private String facilityId;
    

    public CreateBookingDto(Date bookingDate, Date startDate, Date endDate, int occupancy, String customerId,
            String facilityId) {
        this.bookingDate = bookingDate;
        this.startDate = startDate;
        this.endDate = endDate;
        this.occupancy = occupancy;
        this.customerId = customerId;
        this.facilityId = facilityId;
    }

    public CreateBookingDto(HttpServletRequest request) {
        bookingDate = ConvertUtils.convertStringToDate(request.getParameter("BookingDate"));
        startDate = ConvertUtils.convertStringToDate(request.getParameter("StartDate"));
        endDate = ConvertUtils.convertStringToDate(request.getParameter("EndDate"));
        occupancy = ConvertUtils.convertStringToInt(request.getParameter("Occupancy"));
        customerId = request.getParameter("CustomerId");
        facilityId = request.getParameter("FacilityId");
    }

    // Getters
    public Date getBookingDate() {
        return bookingDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public int getOccupancy() {
        return occupancy;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getFacilityId() {
        return facilityId;
    }

    // Setters
    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setOccupancy(int occupancy) {
        this.occupancy = occupancy;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setFacilityId(String facilityId) {
        this.facilityId = facilityId;
    }
}
