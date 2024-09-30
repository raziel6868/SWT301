package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.Models.Room;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.RoomEntity;

public class RoomService extends RepositoryBase<RoomEntity> {

    @Override
    protected String getTableName() {
        return "Rooms";
    }

    @Override
    protected RoomEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new RoomEntity(rs);
    }

    public Room getRoomById(String id) {
        RoomEntity entity = super.getById(id);

        return mapEntityToRoom(entity);
    }

    public void createRoom(String id, Room room) {
        String query = String.format(
                "INSERT INTO %s (Id, FreeService) VALUES (?,?);",
                getTableName());

        List<Object> params = new ArrayList<>();
        params.add(id);
        params.add(room.getFreeService());

        super.executeNonQuery(query, params);
    }

    private Room mapEntityToRoom(RoomEntity entity) {
        Room room = new Room();
        room.setFreeService(entity.getFreeService());

        return room;
    }
}
