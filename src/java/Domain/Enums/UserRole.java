package Domain.Enums;

public enum UserRole {
    None(0),
    Admin(1),
    User(2);

    private final int index;

    UserRole(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }

    public static UserRole fromIndex(int index) {
        for (UserRole type : UserRole.values()) {
            if (type.getIndex() == index) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid UserRole index: " + index);
    }
}