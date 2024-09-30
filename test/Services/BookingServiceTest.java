/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Services;

import Domain.DTOs.BookingDto.CreateBookingDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Enums.Order;
import Domain.Models.Booking;
import Repositories.Entities.BookingEntity;
import Utils.ConvertUtils;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author jpesewang
 */
public class BookingServiceTest {

    public BookingServiceTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testGetTableName() {
        System.out.println("getTableName");
        BookingService instance = new BookingService();
        String expResult = "Bookings";
        String result = instance.getTableName();
        assertEquals(expResult, result);
    }

    /**
     * Test of getAllBookings method, of class BookingService.
     */
    @Test
    public void testGetAllBookings() {
        System.out.println("getAllBookings");
        int page = 1;
        int pageSize = 10;
        Order order = Order.DESC;
        PageQueryDto dto = new PageQueryDto(page, pageSize, order);
        BookingService instance = new BookingService();

        PageDto<Booking> result = instance.getAllBookings(dto);
        assertNotNull(result);
        assertTrue(result.getData().size() <= pageSize);
    }

    /**
     * Test of getBookingById method, of class BookingService.
     */
    @Test
    public void testGetBookingById() {
        System.out.println("getBookingById");
        String id = "`1"; // Assuming this ID exists
        BookingService instance = new BookingService();
        Booking result = instance.getBookingById(id);
        assertNotNull(result);
    }

    /**
     * Test of getBookingsOfCustomer method, of class BookingService.
     */
    @Test
    public void testGetBookingsOfCustomer() {
        System.out.println("getBookingsOfCustomer");
        PageQueryDto dto = new PageQueryDto(1, 10);
        String customerId = "KH-0002";
        BookingService instance = new BookingService();
        PageDto<Booking> result = instance.getBookingsOfCustomer(dto, customerId);
        assertNotNull(result);
        assertTrue(result.getData().size() <= 10);
    }

    /**
     * Test of getBookingsByYear method, of class BookingService.
     */
    @Test
    public void testGetBookingsByYear() {
        System.out.println("getBookingsByYear");
        int year = 2024;
        BookingService instance = new BookingService();
        List<Booking> result = instance.getBookingsByYear(year);
        assertNotNull(result);
    }

    /**
     * Test of getBookingsByYearAndMonth method, of class BookingService.
     */
    @Test
    public void testGetBookingsByYearAndMonth() {
        System.out.println("getBookingsByYearAndMonth");
        int year = 2024;
        int month = 2;
        BookingService instance = new BookingService();
        List<Booking> result = instance.getBookingsByYearAndMonth(year, month);
        assertNotNull(result);
    }

    /**
     * Test of createBooking method, of class BookingService.
     */
    @Test
    public void testCreateBooking() {
        Date bookingDate = ConvertUtils.convertStringToDate("2024-02-02");
        Date startDate = ConvertUtils.convertStringToDate("2024-02-04");
        Date endDate = ConvertUtils.convertStringToDate("2024-02-06");
        int occupancy = 10;
        String customerId = "KH-0002";
        String facilityId = "SVVL-0001";
        // Create a valid CreateBookingDto object
        CreateBookingDto dto = new CreateBookingDto(bookingDate, startDate, endDate, occupancy, customerId, facilityId);

        BookingService instance = new BookingService();
        int result = instance.createBooking(dto);
        assertNotEquals(-1, result);
    }

}
