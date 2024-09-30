package Repositories.Entities;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RentalContractEntity {
    private int id;
    private String customerId;
    private BigDecimal deposit;
    private BigDecimal totalAmount;

    public RentalContractEntity(ResultSet rs) throws SQLException {
        this.id = rs.getInt("Id");
        this.customerId = rs.getString("CustomerId");
        this.deposit = rs.getBigDecimal("Deposit");
        this.totalAmount = rs.getBigDecimal("TotalAmount");
    }

    // Getter methods
    public int getId() {
        return id;
    }

    public String getCustomerId() {
        return customerId;
    }

    public BigDecimal getDeposit() {
        return deposit;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    // Setter methods (if needed)

    // Other methods
}
