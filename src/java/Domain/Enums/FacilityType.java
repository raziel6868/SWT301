package Domain.Enums;

public enum FacilityType {
    None(0),
    Villa(1),
    House(2),
    Room(3);

    private final int index;

    FacilityType(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static FacilityType fromIndex(int index) {
        for (FacilityType type : FacilityType.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid FacilityType index: " + index);
    }
}