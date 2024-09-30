package Domain.Enums;

public enum CustomerType {
    None(0),
    Diamond(1),
    Platinum(2),
    Gold(3),
    Silver(4),
    Member(5);

    private final int index;

    CustomerType(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static CustomerType fromIndex(int index) {
        for (CustomerType type : CustomerType.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid CustomerType index: " + index);
    }
}