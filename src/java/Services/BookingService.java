package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.DTOs.BookingDto.CreateBookingDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageMetaDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Enums.Order;
import Domain.Exceptions.NotFoundException;
import Domain.Models.Booking;
import Domain.Models.Facility;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.BookingEntity;

public class BookingService extends RepositoryBase<BookingEntity> {
    private CustomerService customerService;
    private FacilityService facilityService;

    @Override
    protected String getTableName() {
        return "Bookings";
    }

    @Override
    protected BookingEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new BookingEntity(rs);
    }

    public BookingService() {
        customerService = new CustomerService();
        facilityService = new FacilityService();
    }

    public PageDto<Booking> getAllBookings(PageQueryDto dto) {
        List<Booking> bookings = new ArrayList<>();
        List<BookingEntity> entities = super.getAllWithOffset(dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount();

        for (BookingEntity entity : entities) {
            bookings.add(mapEntityToBooking(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(bookings, meta);
    }

    public Booking getBookingById(String id) {
        BookingEntity entity = super.getById(id);
        Booking booking = mapEntityToBooking(entity);

        booking.setCustomer(customerService.getCustomerById(entity.getCustomerId()));
        booking.setFacility(facilityService.getFacilityById(entity.getFacilityId()));

        return booking;
    }

    public List<Booking> getBookingsOfContract(int contractId) {
        List<Booking> bookings = new ArrayList<>();
        List<BookingEntity> entities = super.getAll(String.format("ContractId = %d", contractId));

        for (BookingEntity entity : entities) {
            bookings.add(mapEntityToBooking(entity));
        }

        return bookings;
    }

    public PageDto<Booking> getBookingsOfCustomer(PageQueryDto dto, String customerId) {
        List<Booking> bookings = new ArrayList<>();
        List<BookingEntity> entities = super.getAllWithOffset(String.format("CustomerId = '%s'", customerId),
                dto.getOffset(),
                dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount(String.format("CustomerId = '%s'", customerId));

        for (BookingEntity entity : entities)
            bookings.add(mapEntityToBooking(entity));

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(bookings, meta);
    }

    public List<Booking> getBookingsByYear(int year) {
        String query = String.format(
                "SELECT * FROM %s WHERE YEAR(BookingDate) = %d ORDER BY BookingDate DESC, StartDate DESC, EndDate ASC;",
                getTableName(), year);

        List<BookingEntity> entities = super.executeQuery(query, new ArrayList<Object>());
        List<Booking> bookings = new ArrayList<>();

        for (BookingEntity entity : entities)
            bookings.add(mapEntityToBooking(entity));

        return bookings;
    }

    public List<Booking> getBookingsByYearAndMonth(int year, int month) {
        String query = String.format(
                "SELECT * FROM %s WHERE YEAR(BookingDate) = %d AND MONTH(BookingDate) = %d ORDER BY BookingDate DESC, StartDate DESC, EndDate ASC;",
                getTableName(), year, month);

        List<BookingEntity> entities = super.executeQuery(query, new ArrayList<>());
        List<Booking> bookings = new ArrayList<>();

        for (BookingEntity entity : entities)
            bookings.add(mapEntityToBooking(entity));

        return bookings;
    }

    public int createBooking(CreateBookingDto dto) {
        Facility facility = facilityService.getFacilityById(dto.getFacilityId());
        String query = String.format(
                "INSERT INTO %s (BookingDate,StartDate,EndDate,Occupancy,RentalCost,ImgSrc,CustomerId,FacilityId) OUTPUT INSERTED.Id VALUES (?,?,?,?,?,?,?,?);",
                getTableName());

        List<Object> params = new ArrayList<>();
        params.add(dto.getBookingDate());
        params.add(dto.getStartDate());
        params.add(dto.getEndDate());
        params.add(dto.getOccupancy());
        params.add(facility.getRentalCost());
        params.add(facility.getImgSrc());
        params.add(dto.getCustomerId());
        params.add(dto.getFacilityId());

        return super.executeNonQueryReturnsId(query, params);
    }

    public void deleteBooking(int id) {
        BookingEntity entity = super.getById(id);

        if (entity == null) {
            throw new NotFoundException("Booking ID not found.");
        }

        String query = String.format("DELETE FROM %s WHERE Id = ?;", getTableName());
        List<Object> params = new ArrayList<>();
        params.add(id);

        super.executeNonQuery(query, params);
    }

    private Booking mapEntityToBooking(BookingEntity entity) {
        Booking booking = new Booking();
        booking.setId(entity.getId());
        booking.setBookingDate(entity.getBookingDate());
        booking.setStartDate(entity.getStartDate());
        booking.setEndDate(entity.getEndDate());
        booking.setOccupancy(entity.getOccupancy());
        booking.setRentalCost(entity.getRentalCost());
        booking.setImgSrc(entity.getImgSrc());
        booking.setCustomerId(entity.getCustomerId());
        booking.setFacilityId(entity.getFacilityId());
        booking.setContractId(entity.getContractId());

        return booking;
    }
}
