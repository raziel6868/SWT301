package Repositories.Entities;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VoucherRecipientCustomerEntity {
    private int year;
    private int month;
    private String customerId;
    private String customerFullName;
    private int voucherType;

    public VoucherRecipientCustomerEntity(ResultSet rs) throws SQLException {
        year = rs.getInt("Year");
        month = rs.getInt("Month");
        customerId = rs.getString("CustomerId");
        customerFullName = rs.getString("CustomerFullName");
        voucherType = rs.getInt("VoucherType");
    }

    public int getYear() {
        return year;
    }

    public int getMonth() {
        return month;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getCustomerFullName() {
        return customerFullName;
    }

    public int getVoucherType() {
        return voucherType;
    }
}
