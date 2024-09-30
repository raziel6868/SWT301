package Domain.DTOs.CustomerDto;

import Domain.Enums.CustomerType;
import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;

public class UpdateCustomerDto {
    private String fullName;
    private Date birthDate;
    private String gender;
    private String idNumber;
    private String phoneNumber;
    private String email;
    private CustomerType customerType;
    private String address;

    public UpdateCustomerDto(HttpServletRequest request) {
        fullName = request.getParameter("FullName");
        birthDate = ConvertUtils.convertStringToDate(request.getParameter("BirthDate"));
        gender = request.getParameter("Gender");
        idNumber = request.getParameter("IdNumber");
        phoneNumber = request.getParameter("PhoneNumber");
        email = request.getParameter("Email");
        if (request.getParameter("CustomerType") != null) {
            customerType = CustomerType
                    .fromIndex(ConvertUtils.convertStringToInt(request.getParameter("CustomerType")));
        }
        address = request.getParameter("Address");
    }

    // Getters
    public String getFullName() {
        return fullName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public String getGender() {
        return gender;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public CustomerType getCustomerType() {
        return customerType;
    }

    public String getAddress() {
        return address;
    }

    // Setters
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCustomerType(CustomerType customerType) {
        this.customerType = customerType;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
