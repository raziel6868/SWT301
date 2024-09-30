package Domain.DTOs.FacilityDto;

import java.math.BigDecimal;

import Domain.Enums.FacilityType;
import Domain.Models.House;
import Domain.Models.Room;
import Domain.Models.Villa;
import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class FilterFacilitiesDto {
    private float minArea;
    private float maxArea;
    private BigDecimal minRentalCost;
    private BigDecimal maxRentalCost;
    private int lowerMaxOccupancy;
    private int upperMaxOccupancy;

    public FilterFacilitiesDto(HttpServletRequest request) {
        this.minArea = ConvertUtils.convertStringToFloat(request.getParameter("MinArea"));
        this.maxArea = ConvertUtils.convertStringToFloat(request.getParameter("MaxArea"));
        this.minRentalCost = ConvertUtils.convertStringToBigDecimal(request.getParameter("MinRentalCost"));
        this.maxRentalCost = ConvertUtils.convertStringToBigDecimal(request.getParameter("MaxRentalCost"));
        this.lowerMaxOccupancy = ConvertUtils.convertStringToInt(request.getParameter("LowerMaxOccupancy"));
        this.upperMaxOccupancy = ConvertUtils.convertStringToInt(request.getParameter("UpperMaxOccupancy"));
    }

    // Getters
    public float getMinArea() {
        return minArea;
    }

    public float getMaxArea() {
        return maxArea;
    }

    public BigDecimal getMinRentalCost() {
        return minRentalCost;
    }

    public BigDecimal getMaxRentalCost() {
        return maxRentalCost;
    }

    public int getLowerMaxOccupancy() {
        return lowerMaxOccupancy;
    }

    public int getUpperMaxOccupancy() {
        return upperMaxOccupancy;
    }

    // Setters
    public void setMinArea(float minArea) {
        this.minArea = minArea;
    }

    public void setMaxArea(float maxArea) {
        this.maxArea = maxArea;
    }

    public void setMinRentalCost(BigDecimal minRentalCost) {
        this.minRentalCost = minRentalCost;
    }

    public void setMaxRentalCost(BigDecimal maxRentalCost) {
        this.maxRentalCost = maxRentalCost;
    }

    public void setLowerMaxOccupancy(int lowerMaxOccupancy) {
        this.lowerMaxOccupancy = lowerMaxOccupancy;
    }

    public void setUpperMaxOccupancy(int upperMaxOccupancy) {
        this.upperMaxOccupancy = upperMaxOccupancy;
    }
}