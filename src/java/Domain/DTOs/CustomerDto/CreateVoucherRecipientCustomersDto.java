package Domain.DTOs.CustomerDto;

import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

public class CreateVoucherRecipientCustomersDto {
    private int month;
    private int year;
    private int numTenPercentDiscountVouchers;
    private int numTwentyPercentDiscountVouchers;
    private int numFiftyPercentDiscountVouchers;

    public CreateVoucherRecipientCustomersDto(int year, int month, int numTenPercentDiscountVouchers,
            int numTwentyPercentDiscountVouchers, int numFiftyPercentDiscountVouchers) {
        this.year = year;
        this.month = month;
        this.numTenPercentDiscountVouchers = numTenPercentDiscountVouchers;
        this.numTwentyPercentDiscountVouchers = numTwentyPercentDiscountVouchers;
        this.numFiftyPercentDiscountVouchers = numFiftyPercentDiscountVouchers;
    }

    public CreateVoucherRecipientCustomersDto(HttpServletRequest request) {
        month = ConvertUtils.convertStringToInt(request.getParameter("Month"));
        year = ConvertUtils.convertStringToInt(request.getParameter("Year"));
        numTenPercentDiscountVouchers = ConvertUtils
                .convertStringToInt(request.getParameter("NumTenPercentDiscountVouchers"));
        numTwentyPercentDiscountVouchers = ConvertUtils
                .convertStringToInt(request.getParameter("NumTwentyPercentDiscountVouchers"));
        numFiftyPercentDiscountVouchers = ConvertUtils
                .convertStringToInt(request.getParameter("NumFiftyPercentDiscountVouchers"));
    }

    // Getter and Setter for month
    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    // Getter and Setter for year
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    // Getter and Setter for numTenPercentDiscountVouchers
    public int getNumTenPercentDiscountVouchers() {
        return numTenPercentDiscountVouchers;
    }

    public void setNumTenPercentDiscountVouchers(int numTenPercentDiscountVouchers) {
        this.numTenPercentDiscountVouchers = numTenPercentDiscountVouchers;
    }

    // Getter and Setter for numTwentyPercentDiscountVouchers
    public int getNumTwentyPercentDiscountVouchers() {
        return numTwentyPercentDiscountVouchers;
    }

    public void setNumTwentyPercentDiscountVouchers(int numTwentyPercentDiscountVouchers) {
        this.numTwentyPercentDiscountVouchers = numTwentyPercentDiscountVouchers;
    }

    // Getter and Setter for numFiftyPercentDiscountVouchers
    public int getNumFiftyPercentDiscountVouchers() {
        return numFiftyPercentDiscountVouchers;
    }

    public void setNumFiftyPercentDiscountVouchers(int numFiftyPercentDiscountVouchers) {
        this.numFiftyPercentDiscountVouchers = numFiftyPercentDiscountVouchers;
    }
}
