package Domain.DTOs.EmployeeDto;

import java.math.BigDecimal;
import java.util.Date;

import Domain.Enums.PositionType;
import Domain.Enums.QualificationType;
import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class CreateEmployeeDto {
    private String id;
    private String fullName;
    private Date birthDate;
    private String gender;
    private String idNumber;
    private String phoneNumber;
    private String email;
    private QualificationType qualification;
    private PositionType position;
    private BigDecimal salary;

    public CreateEmployeeDto(HttpServletRequest request) {
        id = request.getParameter("Id");
        fullName = request.getParameter("FullName");
        gender = request.getParameter("Gender");
        birthDate = ConvertUtils.convertStringToDate(request.getParameter("BirthDate"));
        gender = request.getParameter("Gender");
        idNumber = request.getParameter("IdNumber");
        phoneNumber = request.getParameter("PhoneNumber");
        email = request.getParameter("Email");
        qualification = QualificationType
                .fromIndex(ConvertUtils.convertStringToInt(request.getParameter("Qualification")));
        position = PositionType.fromIndex(ConvertUtils.convertStringToInt(request.getParameter("Position")));
        salary = ConvertUtils.convertStringToBigDecimal(request.getParameter("Salary"));
    }

    // Getters
    public String getId() {
        return id;
    }

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

    public QualificationType getQualification() {
        return qualification;
    }

    public PositionType getPosition() {
        return position;
    }

    public BigDecimal getSalary() {
        return salary;
    }

    // Setters
    public void setId(String id) {
        this.id = id;
    }

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

    public void setQualification(QualificationType qualification) {
        this.qualification = qualification;
    }

    public void setPosition(PositionType position) {
        this.position = position;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }
}
