package Domain.DTOs.EmployeeDto;

import java.math.BigDecimal;
import java.util.Date;

import Domain.Enums.PositionType;
import Domain.Enums.QualificationType;
import Domain.Models.Employee;
import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class UpdateEmployeeDto {
    private String fullName;
    private Date birthDate;
    private String gender;
    private String idNumber;
    private String phoneNumber;
    private String email;
    private QualificationType qualification;
    private PositionType position;
    private BigDecimal salary;

    public UpdateEmployeeDto(HttpServletRequest request) {
        fullName = request.getParameter("FullName");
        birthDate = ConvertUtils.convertStringToDate(request.getParameter("BirthDate"));
        gender = request.getParameter("Gender");
        idNumber = request.getParameter("IdNumber");
        phoneNumber = request.getParameter("PhoneNumber");
        email = request.getParameter("Email");
        if (request.getParameter("Qualification") != null) {
            qualification = QualificationType
                    .fromIndex(ConvertUtils.convertStringToInt(request.getParameter("Qualification")));
        }
        if (request.getParameter("Position") != null) {
            position = PositionType.fromIndex(ConvertUtils.convertStringToInt(request.getParameter("Position")));
        }
        salary = ConvertUtils.convertStringToBigDecimal(request.getParameter("Salary"));
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
