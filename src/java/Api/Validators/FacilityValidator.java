package Api.Validators;

import Domain.DTOs.FacilityDto.CreateFacilityDto;
import Domain.Enums.FacilityType;
import Domain.Models.House;
import Domain.Models.Room;
import Domain.Models.Villa;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FacilityValidator {

    private final String FACILITY_ID_PATTERN = "SV(?:VL|HO|RO)-\\d{4}";
    private final String NAME_PATTERN = "^[A-Z][a-z]*( [A-Z][a-z]*)*$";
    private final float MIN_AREA = 30.0f;
    private final BigDecimal MIN_RENTAL_COST = BigDecimal.ZERO;
    private final int MIN_OCCUPANCY = 1;
    private final int MAX_OCCUPANCY = 19; // Assuming the maximum occupancy is less than 20
    private final int MIN_FLOORS = 1;

    public List<String> validateCreateFacilityDto(CreateFacilityDto createFacilityDto) {
        List<String> errMsg = new ArrayList<>();
        validateFacilityId(createFacilityDto.getId(), createFacilityDto.getFacilityType(), errMsg);
        validateName(createFacilityDto.getName(), errMsg);
        validateArea(createFacilityDto.getArea(), errMsg);
        validateRentalCost(createFacilityDto.getRentalCost(), errMsg);
        validateMaxOccupancy(createFacilityDto.getMaxOccupancy(), errMsg);

        FacilityType facilityType = createFacilityDto.getFacilityType();
        if (facilityType == FacilityType.Villa || facilityType == FacilityType.House) {
            validateFloors(createFacilityDto.getFacilityType(), createFacilityDto.getVilla(),
                    createFacilityDto.getHouse(),
                    createFacilityDto.getRoom(), errMsg);
        }

        // Add more validations as needed

        return errMsg;
    }

    private void validateFacilityId(String facilityId, FacilityType facilityType, List<String> errMsg) {
        Pattern pattern = Pattern.compile(FACILITY_ID_PATTERN);
        Matcher matcher = pattern.matcher(facilityId);

        if (!matcher.matches()) {
            errMsg.add("Invalid facility ID format. It should be in the format SVXX-YYYY.");
        } else {
            String expectedPrefix;
            switch (facilityType) {
                case Villa:
                    expectedPrefix = "VL";
                    break;
                case House:
                    expectedPrefix = "HO";
                    break;
                case Room:
                    expectedPrefix = "RO";
                    break;
                default:
                    expectedPrefix = "";
                    break;
            }
            if (!facilityId.substring(2, 4).equals(expectedPrefix)) {
                errMsg.add("Invalid facility ID. The prefix does not match the facility type.");
            }
        }
    }

    private void validateName(String name, List<String> errMsg) {
        Pattern pattern = Pattern.compile(NAME_PATTERN);
        Matcher matcher = pattern.matcher(name);

        if (!matcher.matches()) {
            errMsg.add("Invalid name format. Name should start with an uppercase letter and contain only letters.");
        }
    }

    private void validateArea(float area, List<String> errMsg) {
        if (area <= MIN_AREA) {
            errMsg.add("Invalid area. Area must be greater than 30m2.");
        }
    }

    private void validateRentalCost(BigDecimal rentalCost, List<String> errMsg) {
        if (rentalCost.compareTo(MIN_RENTAL_COST) <= 0) {
            errMsg.add("Invalid rental cost. Cost must be a positive value.");
        }
    }

    private void validateMaxOccupancy(int maxOccupancy, List<String> errMsg) {
        if (maxOccupancy <= MIN_OCCUPANCY || maxOccupancy >= MAX_OCCUPANCY) {
            errMsg.add("Invalid max occupancy. Must be greater than 0 and less than 20.");
        }
    }

    private void validateFloors(FacilityType facilityType, Villa villa, House house, Room room, List<String> errMsg) {
        int floors;

        switch (facilityType) {
            case Villa:
                floors = villa != null ? villa.getFloors() : 0;
                break;
            case House:
                floors = house != null ? house.getFloors() : 0;
                break;
            case Room:
                floors = 0; // Rooms don't have floors
                break;
            default:
                floors = 0;
                break;
        }

        if (floors < MIN_FLOORS) {
            errMsg.add("Invalid number of floors. Must be a positive value.");
        }
    }
}
