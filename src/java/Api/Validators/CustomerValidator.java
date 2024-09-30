package Api.Validators;

import Domain.DTOs.CustomerDto.CreateCustomerDto;
import Domain.DTOs.CustomerDto.UpdateCustomerDto;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomerValidator {

    private final String CUSTOMER_ID_PATTERN = "KH-[0-9]{4}";
    private final String NAME_PATTERN = "^[A-Z][a-z]*( [A-Z][a-z]*)*$";
    private final int MIN_AGE = 18;
    private final String ID_NUMBER_PATTERN = "\\d{9}|\\d{12}";
    private final String PHONE_NUMBER_PATTERN = "0\\d{9}";

    public List<String> validateCreateCustomerDto(CreateCustomerDto createCustomerDto) {
        List<String> errMsg = new ArrayList<>();
        validateCustomerId(createCustomerDto.getId(), errMsg);
        validateName(createCustomerDto.getFullName(), errMsg);
        validateAge(createCustomerDto.getBirthDate(), errMsg);
        validateIdNumber(createCustomerDto.getIdNumber(), errMsg);
        validatePhoneNumber(createCustomerDto.getPhoneNumber(), errMsg);
        // Add more validations as needed
        return errMsg;
    }

    public List<String> validateUpdateCustomerDto(UpdateCustomerDto updateCustomerDto) {
        List<String> errMsg = new ArrayList<>();

        if (updateCustomerDto.getFullName() != null) {
            validateName(updateCustomerDto.getFullName(), errMsg);
        }

        if (updateCustomerDto.getBirthDate() != null) {
            validateAge(updateCustomerDto.getBirthDate(), errMsg);
        }

        if (updateCustomerDto.getIdNumber() != null) {
            validateIdNumber(updateCustomerDto.getIdNumber(), errMsg);
        }

        if (updateCustomerDto.getPhoneNumber() != null) {
            validatePhoneNumber(updateCustomerDto.getPhoneNumber(), errMsg);
        }

        // Add more validations as needed

        return errMsg;
    }

    private void validateCustomerId(String customerId, List<String> errMsg) {
        Pattern pattern = Pattern.compile(CUSTOMER_ID_PATTERN);
        Matcher matcher = pattern.matcher(customerId);

        if (!matcher.matches()) {
            errMsg.add("Invalid customer ID format. It should be in the format KH-YYYY.");
        }
    }

    private void validateName(String name, List<String> errMsg) {
        Pattern pattern = Pattern.compile(NAME_PATTERN);
        Matcher matcher = pattern.matcher(name);

        if (!matcher.matches()) {
            errMsg.add("Invalid name format. Name should start with an uppercase letter and contain only letters.");
        }
    }

    private void validateAge(java.util.Date birthDate, List<String> errMsg) {
        Calendar dob = Calendar.getInstance();
        dob.setTime(birthDate);
        Calendar now = Calendar.getInstance();
        now.add(Calendar.YEAR, -MIN_AGE);

        if (dob.after(now)) {
            errMsg.add("Customer must be at least 18 years old.");
        }
    }

    private void validateIdNumber(String idNumber, List<String> errMsg) {
        Pattern pattern = Pattern.compile(ID_NUMBER_PATTERN);
        Matcher matcher = pattern.matcher(idNumber);

        if (!matcher.matches()) {
            errMsg.add("Invalid ID number format. It should have 9 or 12 digits.");
        }
    }

    private void validatePhoneNumber(String phoneNumber, List<String> errMsg) {
        Pattern pattern = Pattern.compile(PHONE_NUMBER_PATTERN);
        Matcher matcher = pattern.matcher(phoneNumber);

        if (!matcher.matches()) {
            errMsg.add("Invalid phone number format. It should start with 0 and have 10 digits.");
        }
    }
}
