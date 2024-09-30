/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Services;

import Domain.DTOs.CustomerDto.CreateVoucherRecipientCustomersDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Models.VoucherRecipientCustomer;
import Repositories.Entities.VoucherRecipientCustomerEntity;
import java.sql.ResultSet;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author PC0
 */
public class PromotionServiceTest {

    public PromotionServiceTest() {
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

    /**
     * Test of getVoucherRecipientCustomers method, of class PromotionService.
     */
    @Test
    public void testGetVoucherRecipientCustomers() {
        System.out.println("getVoucherRecipientCustomers");
        int page = 1, pageSize = 10;
        PageQueryDto dto = new PageQueryDto(page, pageSize);
        int year = 2024;
        int month = 2;
        PromotionService instance = new PromotionService();
        PageDto<VoucherRecipientCustomer> result = instance.getVoucherRecipientCustomers(dto, year, month);

        assertNotNull(result);
        assertTrue(result.getData().size() <= pageSize);
    }

    /**
     * Test of createVoucherRecipientCustomers method, of class PromotionService.
     */
    @Test
    public void testCreateVoucherRecipientCustomers() {
        System.out.println("createVoucherRecipientCustomers");
        int year = 2024, month = 2;
        int numTenPercentDiscountVouchers = 2, numTwentyPercentDiscountVouchers = 2,
                numFiftyPercentDiscountVouchers = 2;
        CreateVoucherRecipientCustomersDto dto = new CreateVoucherRecipientCustomersDto(year, month,
                numTenPercentDiscountVouchers, numTwentyPercentDiscountVouchers, numFiftyPercentDiscountVouchers);
        PromotionService instance = new PromotionService();
        instance.createVoucherRecipientCustomers(dto);
    }

}
