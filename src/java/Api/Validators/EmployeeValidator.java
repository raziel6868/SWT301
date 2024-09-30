package Api.Validators;

import Domain.DTOs.EmployeeDto.CreateEmployeeDto;
import Domain.DTOs.EmployeeDto.UpdateEmployeeDto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmployeeValidator {

    private final String EMPLOYEE_CODE_PATTERN = "NV-[0-9]{4}";
    private final String NAME_PATTERN = "^[A-Z][a-z]*( [A-Z][a-z]*)*$";
    private final int MIN_AGE = 18;
    private final String ID_NUMBER_PATTERN = "\\d{9}|\\d{12}";
    private final String PHONE_NUMBER_PATTERN = "0\\d{9}";
    private final BigDecimal MIN_SALARY = BigDecimal.ZERO;

    public List<String> validateCreateEmployeeDto(CreateEmployeeDto createEmployeeDto) {
        List<String> errMsg = new ArrayList<>();
        validateEmployeeCode(createEmployeeDto.getId(), errMsg);
        validateName(createEmployeeDto.getFullName(), errMsg);
        validateAge(createEmployeeDto.getBirthDate(), errMsg);
        validateIdNumber(createEmployeeDto.getIdNumber(), errMsg);
        validatePhoneNumber(createEmployeeDto.getPhoneNumber(), errMsg);
        validateSalary(createEmployeeDto.getSalary(), errMsg);
        // Add more validations as needed
        return errMsg;
    }

    public List<String> validateUpdateEmployeeDto(UpdateEmployeeDto updateEmployeeDto) {
        List<String> errMsg = new ArrayList<>();
        if (updateEmployeeDto.getFullName() != null) {
            validateName(updateEmployeeDto.getFullName(), errMsg);
        }
        if (updateEmployeeDto.getBirthDate() != null) {
            validateAge(updateEmployeeDto.getBirthDate(), errMsg);
        }
        if (updateEmployeeDto.getIdNumber() != null) {
            validateIdNumber(updateEmployeeDto.getIdNumber(), errMsg);
        }
        if (updateEmployeeDto.getPhoneNumber() != null) {
            validatePhoneNumber(updateEmployeeDto.getPhoneNumber(), errMsg);
        }
        if (updateEmployeeDto.getSalary() != null) {
            validateSalary(updateEmployeeDto.getSalary(), errMsg);
        }
        // Add more validations as needed
        return errMsg;
    }

    private void validateEmployeeCode(String employeeCode, List<String> errMsg) {
        Pattern pattern = Pattern.compile(EMPLOYEE_CODE_PATTERN);
        Matcher matcher = pattern.matcher(employeeCode);

        if (!matcher.matches()) {
            errMsg.add("Invalid employee code format. It should be in the format NV-YYYY.");
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
            errMsg.add("Employee must be at least 18 years old.");
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

    private void validateSalary(BigDecimal salary, List<String> errMsg) {
        if (salary.compareTo(MIN_SALARY) <= 0) {
            errMsg.add("Salary must be greater than 0.");
        }
    }
}
