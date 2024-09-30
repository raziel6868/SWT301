package Domain.Enums;

public enum VoucherType {
    None(0),
    TenPercent(1),
    TwentyPercent(2),
    FiftyPercent(3);

    private final int index;

    VoucherType(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static VoucherType fromIndex(int index) {
        for (VoucherType type : VoucherType.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid VoucherType index: " + index);
    }
}