package Domain.Enums;

public enum PositionType {
    None(0),
    Receptionist(1),
    Server(2),
    Specialist(3),
    Supervisor(4),
    Manager(5),
    Director(6);

    private final int index;

    PositionType(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static PositionType fromIndex(int index) {
        for (PositionType type : PositionType.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid PositionType index: " + index);
    }
}
