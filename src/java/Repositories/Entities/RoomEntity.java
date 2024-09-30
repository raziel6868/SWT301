package Repositories.Entities;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoomEntity {
    private String id;
    private String freeService;

    public RoomEntity(ResultSet rs) throws SQLException {
        this.id = rs.getString("Id");
        this.freeService = rs.getString("FreeService");
    }

    // Getter methods
    public String getId() {
        return id;
    }

    public String getFreeService() {
        return freeService;
    }

    // Setter methods (if needed)

    // Other methods
}
