package Domain.DTOs.FacilityDto;

import Domain.Models.Facility;
import java.math.BigDecimal;

import java.util.List;

public class SuggestedFacilitiesDto {
    private List<Facility> suggestedFacilities;
    private int numOfFacilities;
    private BigDecimal totalRentalCost;
    private int totalOccupancy;

    public SuggestedFacilitiesDto(List<Facility> suggestedFacilities, int numOfFacilities, BigDecimal totalRentalCost, int totalOccupancy) {
        this.suggestedFacilities = suggestedFacilities;
        this.numOfFacilities = numOfFacilities;
        this.totalRentalCost = totalRentalCost;
        this.totalOccupancy = totalOccupancy;
    }

    public List<Facility> getSuggestedFacilities() {
        return suggestedFacilities;
    }

    public void setSuggestedFacilities(List<Facility> suggestedFacilities) {
        this.suggestedFacilities = suggestedFacilities;
    }

    public int getNumOfFacilities() {
        return numOfFacilities;
    }

    public void setNumOfFacilities(int numOfFacilities) {
        this.numOfFacilities = numOfFacilities;
    }

    public BigDecimal getTotalRentalCost() {
        return totalRentalCost;
    }

    public void setTotalRentalCost(BigDecimal totalRentalCost) {
        this.totalRentalCost = totalRentalCost;
    }

    public int getTotalOccupancy() {
        return totalOccupancy;
    }

    public void setTotalOccupancy(int totalOccupancy) {
        this.totalOccupancy = totalOccupancy;
    }
}