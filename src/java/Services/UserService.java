package Services;

import java.sql.ResultSet;
import java.sql.SQLException;

import Domain.Enums.UserRole;
import Domain.Models.User;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.UserEntity;

public class UserService extends RepositoryBase<UserEntity> {

    @Override
    protected UserEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new UserEntity(rs);
    }

    @Override
    protected String getTableName() {
        return "Users";
    }

    public User getUserById(int id) {
        UserEntity entity = super.getById(id);

        return entity != null ? mapEntityToUser(entity) : null;
    }

    public User getUserByUsername(String username) {
        UserEntity entity = super.getByValue("Username", username);

        return entity != null ? mapEntityToUser(entity) : null;
    }

    private User mapEntityToUser(UserEntity entity) {
        User user = new User();
        user.setId(entity.getId());
        user.setUsername(entity.getUsername());
        user.setPassword(entity.getPassword());
        user.setUserRole(UserRole.fromIndex(entity.getUserRole()));
        user.setCustomerId(entity.getCustomerId());

        return user;
    }
}
