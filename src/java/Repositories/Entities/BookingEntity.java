package Repositories.Entities;

import java.math.BigDecimal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class BookingEntity {
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

    public BookingEntity(ResultSet rs) throws SQLException {
        this.id = rs.getInt("Id");
        this.bookingDate = rs.getDate("BookingDate");
        this.startDate = rs.getDate("StartDate");
        this.endDate = rs.getDate("EndDate");
        this.occupancy = rs.getInt("Occupancy");
        this.rentalCost = rs.getBigDecimal("RentalCost");
        this.imgSrc = rs.getString("ImgSrc");
        this.customerId = rs.getString("CustomerId");
        this.facilityId = rs.getString("FacilityId");
        this.contractId = rs.getString("ContractId");
    }

    // Getter methods
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

    public BigDecimal getRentalCost(){
        return rentalCost;
    }
    
    public String getImgSrc(){
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

    // Setter methods
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

    
}

