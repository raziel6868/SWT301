package Domain.Enums;

public enum CustomerStatus {
    Happy(0),
    Satisfied(1),
    Neutral(2),
    Upset(3),
    Disappointed(4);

    private final int index;

    CustomerStatus(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static CustomerStatus fromIndex(int index) {
        for (CustomerStatus type : CustomerStatus.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid CustomerStatus index: " + index);
    }
}