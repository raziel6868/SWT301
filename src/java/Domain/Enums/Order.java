package Domain.Enums;

public enum Order {
    ASC(0),
    DESC(1);

    private final int index;

    Order(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static Order fromIndex(int index) {
        for (Order type : Order.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid Order index: " + index);
    }
}
