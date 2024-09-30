package Domain.Models;

import java.math.BigDecimal;
import java.util.Date;

public class Booking {
    private int id;
    private Date bookingDate;
    private Date startDate;
    private Date endDate;
    private int occupancy;
    private BigDecimal rentalCost;
    private String imgSrc;
    private String customerId;
    private String facilityId;
    private String contractId;
    private Customer customer;
    private Facility facility;

    public Booking() {
    }

    // Getters
    public int getId() {
        return id;
    }

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

    public BigDecimal getRentalCost() {
        return rentalCost;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getFacilityId() {
        return facilityId;
    }

    public String getContractId() {
        return contractId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public Facility getFacility() {
        return facility;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

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

    public void setRentalCost(BigDecimal rentalCost) {
        this.rentalCost = rentalCost;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setFacilityId(String facilityId) {
        this.facilityId = facilityId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void setFacility(Facility facility) {
        this.facility = facility;
    }
}
