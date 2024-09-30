package Domain.DTOs.FacilityDto;

import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class SuggestFacilitiesDto {
    private int totalOccupancy;
    private int maxNumOfFacilities;

    public SuggestFacilitiesDto(HttpServletRequest request) {
        this.totalOccupancy = ConvertUtils.convertStringToInt(request.getParameter("TotalOccupancy"));
        this.maxNumOfFacilities = ConvertUtils.convertStringToInt(request.getParameter("MaxNumOfFacilities"));
    }

    public int getTotalOccupancy() {
        return totalOccupancy;
    }

    public void setTotalOccupancy(int totalOccupancy) {
        this.totalOccupancy = totalOccupancy;
    }

    public int getMaxNumOfFacilities() {
        return maxNumOfFacilities;
    }

    public void setMaxNumOfFacilities(int maxNumOfFacilities) {
        this.maxNumOfFacilities = maxNumOfFacilities;
    }
}