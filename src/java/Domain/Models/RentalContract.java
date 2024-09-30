package Domain.Models;

import java.math.BigDecimal;
import java.util.List;

public class RentalContract {
    private int id;
    private String customerId;
    private BigDecimal deposit;
    private BigDecimal totalAmount;
    private List<Booking> bookings;

    public RentalContract() {
    }

    // Getters
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

    public List<Booking> getBookings() {
        return bookings;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setDeposit(BigDecimal deposit) {
        this.deposit = deposit;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }
}
