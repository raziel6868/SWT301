package Domain.DTOs.FacilityDto;

import java.math.BigDecimal;

import Domain.Enums.FacilityType;
import Domain.Models.House;
import Domain.Models.Room;
import Domain.Models.Villa;
import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class CreateFacilityDto {

    private String id;
    private String name;
    private float area;
    private BigDecimal rentalCost;
    private int maxOccupancy;
    private String rentType;
    private FacilityType facilityType;
    private Villa villa;
    private House house;
    private Room room;
    private String imgSrc;

    public CreateFacilityDto(HttpServletRequest request) {
        id = request.getParameter("Id");
        name = request.getParameter("Name");
        area = Float.parseFloat(request.getParameter("Area"));
        rentalCost = new BigDecimal(request.getParameter("RentalCost"));
        maxOccupancy = Integer.parseInt(request.getParameter("MaxOccupancy"));
        rentType = request.getParameter("RentType");
        facilityType = FacilityType.fromIndex(ConvertUtils.convertStringToInt(request.getParameter("FacilityType")));
        imgSrc = request.getParameter("ImgSrc");

        switch (facilityType) {
            case Villa:
                villa = new Villa();
                villa.setStandardRoom(request.getParameter("StandardRoom"));
                villa.setPoolArea(ConvertUtils.convertStringToFloat(request.getParameter("PoolArea")));
                villa.setFloors(ConvertUtils.convertStringToInt(request.getParameter("Floors")));
                break;
            case House:
                house = new House();
                house.setStandardRoom(request.getParameter("StandardRoom"));
                house.setFloors(ConvertUtils.convertStringToInt(request.getParameter("Floors")));
                break;
            case Room:
                room = new Room();
                room.setFreeService(request.getParameter("FreeService"));
                break;
            default:
                break;
        }
    }

    // Getters
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public float getArea() {
        return area;
    }

    public BigDecimal getRentalCost() {
        return rentalCost;
    }

    public int getMaxOccupancy() {
        return maxOccupancy;
    }

    public String getRentType() {
        return rentType;
    }

    public FacilityType getFacilityType() {
        return facilityType;
    }

    public Villa getVilla() {
        return villa;
    }

    public House getHouse() {
        return house;
    }

    public Room getRoom() {
        return room;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    // Setters
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public void setRentalCost(BigDecimal rentalCost) {
        this.rentalCost = rentalCost;
    }

    public void setMaxOccupancy(int maxOccupancy) {
        this.maxOccupancy = maxOccupancy;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public void setFacilityType(FacilityType facilityType) {
        this.facilityType = facilityType;
    }

    public void setVilla(Villa villa) {
        this.villa = villa;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }
}
