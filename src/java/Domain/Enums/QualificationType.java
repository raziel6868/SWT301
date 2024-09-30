package Domain.Enums;

public enum QualificationType {
    None(0),
    Intermediate(1),
    College(2),
    University(3),
    PostGraduate(4);

    private final int index;

    QualificationType(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static QualificationType fromIndex(int index) {
        for (QualificationType type : QualificationType.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid QualificationType index: " + index);
    }

    public static int toIndex(QualificationType qualificationType) {
        return qualificationType.getIndex();
    }
}
