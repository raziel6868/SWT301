package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.DTOs.CustomerDto.CreateVoucherRecipientCustomersDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageMetaDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Enums.Order;
import Domain.Enums.VoucherType;
import Domain.Models.Booking;
import Domain.Models.Customer;
import Domain.Models.VoucherRecipientCustomer;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.VoucherRecipientCustomerEntity;

public class PromotionService extends RepositoryBase<VoucherRecipientCustomerEntity> {
    private BookingService bookingService;
    private CustomerService customerService;

    @Override
    protected String getTableName() {
        return "VoucherRecipientCustomers";
    }

    @Override
    protected VoucherRecipientCustomerEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new VoucherRecipientCustomerEntity(rs);
    }

    public PromotionService() {
        bookingService = new BookingService();
        customerService = new CustomerService();
    }

    public PageDto<VoucherRecipientCustomer> getVoucherRecipientCustomers(PageQueryDto dto, int year, int month) {
        List<VoucherRecipientCustomer> voucherRecipientCustomers = new ArrayList<>();
        List<VoucherRecipientCustomerEntity> entities = super.getAllWithOffset(
                String.format("Year = %d AND Month = %d", year, month), dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount(String.format("Year = %d AND Month = %d", year, month));

        for (VoucherRecipientCustomerEntity entity : entities) {
            voucherRecipientCustomers.add(mapEntityToVoucherRecipientCustomer(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(voucherRecipientCustomers, meta);
    }

    public PageDto<VoucherRecipientCustomer> getVouchersOfCustomer(PageQueryDto dto, String customerId) {
        List<VoucherRecipientCustomer> voucherRecipientCustomers = new ArrayList<>();
        List<VoucherRecipientCustomerEntity> entities = super.getAllWithOffset(
                String.format("CustomerId = '%s'", customerId), dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount(String.format("CustomerId = '%s'", customerId));

        for (VoucherRecipientCustomerEntity entity : entities) {
            voucherRecipientCustomers.add(mapEntityToVoucherRecipientCustomer(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(voucherRecipientCustomers, meta);
    }

    public void createVoucherRecipientCustomers(CreateVoucherRecipientCustomersDto dto) {
        String query = String.format(
                "INSERT INTO %s (Year,Month,CustomerId,CustomerFullName,VoucherType)",
                getTableName());
        List<Object> params = new ArrayList<>();

        List<Booking> bookings = bookingService.getBookingsByYearAndMonth(dto.getYear(), dto.getMonth());

        int totalVouchers = dto.getNumTenPercentDiscountVouchers() + dto.getNumTwentyPercentDiscountVouchers()
                + dto.getNumFiftyPercentDiscountVouchers();

        VoucherType voucherType = VoucherType.TenPercent;

        List<String> valueList = new ArrayList<>();

        int numOfVouchers = Math.min(bookings.size(), totalVouchers);

        for (int i = 0; i != numOfVouchers; i++) {
            if (i == dto.getNumTenPercentDiscountVouchers()) {
                voucherType = VoucherType.TwentyPercent;
            } else if (i == dto.getNumTenPercentDiscountVouchers() + dto.getNumTwentyPercentDiscountVouchers()) {
                voucherType = VoucherType.FiftyPercent;
            }

            Customer customer = customerService.getCustomerById(bookings.get(i).getCustomerId());
            String customerFullName = customer != null ? customer.getFullName() : "";

            valueList.add(String.format("(%d,%d,?,?,?)", dto.getYear(), dto.getMonth()));

            params.add(bookings.get(i).getCustomerId());
            params.add(customerFullName);
            params.add(voucherType.getIndex());
        }

        query += " VALUES " + String.join(",", valueList) + ";";

        executeNonQuery(query, params);
    }

    private VoucherRecipientCustomer mapEntityToVoucherRecipientCustomer(VoucherRecipientCustomerEntity entity) {
        VoucherRecipientCustomer voucherRecipientCustomer = new VoucherRecipientCustomer();
        voucherRecipientCustomer.setId(entity.getCustomerId());
        voucherRecipientCustomer.setFullName(entity.getCustomerFullName());
        voucherRecipientCustomer.setVoucherType(VoucherType.fromIndex(entity.getVoucherType()));

        return voucherRecipientCustomer;
    }
}
