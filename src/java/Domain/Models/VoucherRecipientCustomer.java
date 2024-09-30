package Domain.Models;

import Domain.Enums.VoucherType;

public class VoucherRecipientCustomer {
    private String id;
    private String fullName;
    private VoucherType voucherType;

    public VoucherRecipientCustomer() {
    }

    public VoucherRecipientCustomer(String id, String fullName, VoucherType voucherType) {
        this.id = id;
        this.fullName = fullName;
        this.voucherType = voucherType;
    }

    // Getter and Setter for id
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    // Getter and Setter for fullName
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    // Getter and Setter for voucherType
    public VoucherType getVoucherType() {
        return voucherType;
    }

    public void setVoucherType(VoucherType voucherType) {
        this.voucherType = voucherType;
    }
}
