package Domain.DTOs.BookingDto;

import java.math.BigDecimal;

import jakarta.servlet.http.HttpServletRequest;

import Utils.ConvertUtils;

public class CreateRentalContractDto {
    private String bookingIds;
    private BigDecimal deposit;
    private BigDecimal totalAmount;

    public CreateRentalContractDto(HttpServletRequest request) {
        bookingIds = request.getParameter("BookingIds");
        deposit = ConvertUtils.convertStringToBigDecimal(request.getParameter("Deposit"));
        totalAmount = ConvertUtils.convertStringToBigDecimal(request.getParameter("TotalAmount"));
    }

    // Getters
    public String getBookingIds() {
        return bookingIds;
    }

    public BigDecimal getDeposit() {
        return deposit;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    // Setters
    public void setBookingIds(String bookingIds) {
        this.bookingIds = bookingIds;
    }

    public void setDeposit(BigDecimal deposit) {
        this.deposit = deposit;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }
}
