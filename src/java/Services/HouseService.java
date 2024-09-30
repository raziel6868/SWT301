package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.Models.House;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.HouseEntity;

public class HouseService extends RepositoryBase<HouseEntity> {

    @Override
    protected String getTableName() {
        return "Houses";
    }

    @Override
    protected HouseEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new HouseEntity(rs);
    }

    public House getHouseById(String id) {
        HouseEntity entity = super.getById(id);

        return mapEntityToHouse(entity);
    }

    public void createHouse(String id, House house) {
        String query = String.format(
                "INSERT INTO %s (Id,StandardRoom,Floors) VALUES (?,?,?);",
                getTableName());

        List<Object> params = new ArrayList<>();
        params.add(id);
        params.add(house.getStandardRoom());
        params.add(house.getFloors());

        super.executeNonQuery(query, params);
    }

    private House mapEntityToHouse(HouseEntity entity) {
        House house = new House();
        house.setStandardRoom(entity.getStandardRoom());
        house.setFloors(entity.getFloors());

        return house;
    }
}
