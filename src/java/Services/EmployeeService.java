package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.DTOs.EmployeeDto.CreateEmployeeDto;
import Domain.DTOs.EmployeeDto.UpdateEmployeeDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageMetaDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Enums.Order;
import Domain.Enums.PositionType;
import Domain.Enums.QualificationType;
import Domain.Exceptions.ConflictException;
import Domain.Exceptions.NotFoundException;
import Domain.Models.Employee;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.EmployeeEntity;

public class EmployeeService extends RepositoryBase<EmployeeEntity> {

    @Override
    protected String getTableName() {
        return "Employees";
    }

    @Override
    protected EmployeeEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new EmployeeEntity(rs);
    }

    public PageDto<Employee> getAllEmployees(PageQueryDto dto) {
        List<Employee> employees = new ArrayList<>();
        List<EmployeeEntity> entities = super.getAllWithOffset(dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount();

        for (EmployeeEntity entity : entities) {
            employees.add(mapEntityToEmployee(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(employees, meta);
    }

    public Employee getEmployeeById(String id) {
        EmployeeEntity entity = super.getById(id);

        return mapEntityToEmployee(entity);
    }

    public void createEmployee(CreateEmployeeDto dto) throws ConflictException {
        EmployeeEntity entity = super.getById(dto.getId());

        if (entity != null) {
            throw new ConflictException("User ID already exists.");
        }

        String query = String.format(
                "INSERT INTO %s (Id,FullName,BirthDate,Gender,IdNumber,PhoneNumber,Email,Qualification,Position,Salary) VALUES (?,?,?,?,?,?,?,?,?,?);",
                getTableName());

        List<Object> params = new ArrayList<>();
        params.add(dto.getId());
        params.add(dto.getFullName());
        params.add(dto.getBirthDate());
        params.add(dto.getGender());
        params.add(dto.getIdNumber());
        params.add(dto.getPhoneNumber());
        params.add(dto.getEmail());
        params.add(dto.getQualification().getIndex());
        params.add(dto.getPosition().getIndex());
        params.add(dto.getSalary());

        super.executeNonQuery(query, params);
    }

    public void updateEmployee(String id, UpdateEmployeeDto dto) {
        EmployeeEntity entity = super.getById(id);

        if (entity == null) {
            throw new NotFoundException("User ID not found.");
        }

        if (dto.getFullName() == null)
            dto.setFullName(entity.getFullName());
        if (dto.getBirthDate() == null)
            dto.setBirthDate(entity.getBirthDate());
        if (dto.getGender() == null)
            dto.setGender(entity.getGender());
        if (dto.getIdNumber() == null)
            dto.setIdNumber(entity.getIdNumber());
        if (dto.getPhoneNumber() == null)
            dto.setPhoneNumber(entity.getPhoneNumber());
        if (dto.getEmail() == null)
            dto.setEmail(entity.getEmail());
        if (dto.getQualification() == QualificationType.None)
            dto.setQualification(QualificationType.fromIndex(entity.getQualification()));
        if (dto.getPosition() == PositionType.None)
            dto.setPosition(PositionType.fromIndex(entity.getPosition()));
        if (dto.getSalary() == null)
            dto.setSalary(entity.getSalary());

        String query = String.format(
                "UPDATE %s SET FullName=?,BirthDate=?,Gender=?,IdNumber=?,PhoneNumber=?,Email=?,Qualification=?,Position=?,Salary=? WHERE Id = ?;",
                getTableName(), id);

        List<Object> params = new ArrayList<>();
        params.add(dto.getFullName());
        params.add(dto.getBirthDate());
        params.add(dto.getGender());
        params.add(dto.getIdNumber());
        params.add(dto.getPhoneNumber());
        params.add(dto.getEmail());
        params.add(dto.getQualification().getIndex());
        params.add(dto.getPosition().getIndex());
        params.add(dto.getSalary());
        params.add(id);

        super.executeNonQuery(query, params);
    }

    public void deleteEmployee(String id) {
        EmployeeEntity entity = super.getById(id);

        if (entity == null) {
            throw new NotFoundException("User ID not found.");
        }

        String query = String.format("DELETE FROM %s WHERE Id = ?;", getTableName());
        List<Object> params = new ArrayList<>();
        params.add(id);

        super.executeNonQuery(query, params);
    }

    private Employee mapEntityToEmployee(EmployeeEntity entity) {
        Employee employee = new Employee();
        employee.setId(entity.getId());
        employee.setFullName(entity.getFullName());
        employee.setBirthDate(entity.getBirthDate());
        employee.setGender(entity.getGender());
        employee.setIdNumber(entity.getIdNumber());
        employee.setPhoneNumber(entity.getPhoneNumber());
        employee.setEmail(entity.getEmail());
        employee.setQualification(QualificationType.fromIndex(entity.getQualification()));
        employee.setPosition(PositionType.fromIndex(entity.getPosition()));
        employee.setSalary(entity.getSalary());

        return employee;
    }
}
