package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.Models.Villa;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.VillaEntity;

public class VillaService extends RepositoryBase<VillaEntity> {

    @Override
    protected String getTableName() {
        return "Villas";
    }

    @Override
    protected VillaEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new VillaEntity(rs);
    }

    public Villa getVillaById(String id) {
        VillaEntity entity = super.getById(id);

        return mapEntityToVilla(entity);
    }

    public void createVilla(String id, Villa villa) {
        String query = String.format(
                "INSERT INTO %s (Id,StandardRoom,PoolArea,Floors) VALUES (?,?,?,?);",
                getTableName());

        List<Object> params = new ArrayList<>();
        params.add(id);
        params.add(villa.getStandardRoom());
        params.add(villa.getPoolArea());
        params.add(villa.getFloors());

        super.executeNonQuery(query, params);
    }

    private Villa mapEntityToVilla(VillaEntity entity) {
        Villa villa = new Villa();
        villa.setStandardRoom(entity.getStandardRoom());
        villa.setPoolArea(entity.getPoolArea());
        villa.setFloors(entity.getFloors());

        return villa;
    }
}
