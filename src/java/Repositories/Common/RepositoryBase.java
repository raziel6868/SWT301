package Repositories.Common;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Config.DbConnection;

public abstract class RepositoryBase<TEntity> {

    protected abstract String getTableName();

    protected abstract TEntity createEntityFromResultSet(ResultSet rs) throws SQLException;

    protected List<TEntity> getAll() {
        String query = String.format("SELECT * FROM %s;", getTableName());
        return executeQuery(query, new ArrayList<>());
    }

    protected List<TEntity> getAll(String whereClause) {
        String query = String.format("SELECT * FROM %s WHERE %s;", getTableName(), whereClause);
        return executeQuery(query, new ArrayList<>());
    }

    protected List<TEntity> getAllWithOrderBy(String orderByClause) {
        String query = String.format("SELECT * FROM %s ORDER BY %s;", getTableName(), orderByClause);
        return executeQuery(query, new ArrayList<>());
    }

    protected TEntity getById(Object id) {
        String query = String.format("SELECT TOP 1 * FROM %s WHERE Id = ?;", getTableName());
        List<Object> params = new ArrayList<>();
        params.add(id);

        List<TEntity> entities = executeQuery(query, params);

        return entities.size() != 0 ? entities.get(0) : null;
    }

    protected TEntity getByValue(String columnName, Object value) {
        String query = String.format("SELECT TOP 1 * FROM %s WHERE %s = ?;", getTableName(), columnName);
        List<Object> params = new ArrayList<>();
        params.add(value);

        List<TEntity> entities = executeQuery(query, params);

        return entities.size() != 0 ? entities.get(0) : null;
    }

    protected List<TEntity> getListByValue(String columnName, Object value) {
        String query = String.format("SELECT * FROM %s WHERE %s = ?;", getTableName(), columnName);
        List<Object> params = new ArrayList<>();
        params.add(value);

        return executeQuery(query, params);
    }

    protected void deleteById(String id) {
        String query = String.format("DELETE FROM %s WHERE Id = ?;", getTableName());
        List<Object> params = new ArrayList<>();
        params.add(id);

        executeNonQuery(query, params);
    }

    protected List<TEntity> getAllWithOffset(int offset, int pageSize, boolean isAscending) {
        String query = String.format("SELECT * FROM %s", getTableName());
        query += " ORDER BY Id " + (isAscending ? "ASC" : "DESC");
        query += " OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY;";

        return executeQuery(query, new ArrayList<>());
    }

    protected List<TEntity> getAllWithOffset(String whereClause, int offset, int pageSize, boolean isAscending) {
        String query = String.format("SELECT * FROM %s WHERE %s", getTableName(), whereClause);
        query += " ORDER BY Id " + (isAscending ? "ASC" : "DESC");
        query += " OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY;";

        return executeQuery(query, new ArrayList<>());
    }

    protected void executeNonQuery(String query, List<Object> params) {
        System.out.println("[Query]: " + query);
        if (!params.isEmpty()) {
            System.out.println("[Params]: " + params.toString());
        }

        Connection conn = null;

        try {
            conn = DbConnection.get();

            if (conn == null) {
                throw new NullPointerException("Database connection has not been set up successfully.");
            }

            PreparedStatement ps = conn.prepareStatement(query);

            setParamsForQuery(ps, params);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("Error executing query: " + ex.getMessage());
        } finally {
            if (conn != null)
                DbConnection.close(conn);
        }
    }

    protected int executeNonQueryReturnsId(String query, List<Object> params) {
        System.out.println("[Query]: " + query);
        if (!params.isEmpty()) {
            System.out.println("[Params]: " + params.toString());
        }

        Connection conn = null;

        int insertedId = -1;

        try {
            conn = DbConnection.get();

            if (conn == null) {
                throw new NullPointerException("Database connection has not been set up successfully.");
            }

            PreparedStatement ps = conn.prepareStatement(query);

            setParamsForQuery(ps, params);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                insertedId = rs.getInt("Id");
            }
        } catch (SQLException ex) {
            System.err.println("Error executing query: " + ex.getMessage());
        } finally {
            if (conn != null)
                DbConnection.close(conn);
        }

        return insertedId;
    }

    protected List<TEntity> executeQuery(String query, List<Object> params) {
        System.out.println("[Query]: " + query);
        if (!params.isEmpty()) {
            System.out.println("[Params]: " + params.toString());
        }

        List<TEntity> entities = new ArrayList<>();

        Connection conn = null;

        try {
            conn = DbConnection.get();

            if (conn == null) {
                throw new NullPointerException("Database connection has not been set up successfully.");
            }

            PreparedStatement ps = conn.prepareStatement(query);

            setParamsForQuery(ps, params);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TEntity entity = createEntityFromResultSet(rs);
                entities.add(entity);
            }

        } catch (SQLException ex) {
            System.err.println("Error executing query: " + ex.getMessage());
        } finally {
            if (conn != null)
                DbConnection.close(conn);
        }

        return entities;
    }

    protected int getTotalCount() {
        String query = String.format("SELECT COUNT(*) AS TotalCount FROM %s;", getTableName());

        System.out.println("[Query]: " + query);

        int count = 0;
        Connection conn = null;

        try {
            conn = DbConnection.get();

            if (conn == null) {
                throw new NullPointerException("Database connection has not been set up successfully.");
            }

            PreparedStatement ps = conn.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("TotalCount");
            }
        } catch (SQLException ex) {
            System.err.println("Error executing query: " + ex.getMessage());
        } finally {
            if (conn != null)
                DbConnection.close(conn);
        }

        return count;
    }

    protected int getTotalCount(String whereClause) {
        String query = String.format("SELECT COUNT(*) AS TotalCount FROM %s WHERE %s;", getTableName(), whereClause);

        System.out.println("[Query]: " + query);

        int count = 0;
        Connection conn = null;

        try {
            conn = DbConnection.get();

            if (conn == null) {
                throw new NullPointerException("Database connection has not been set up successfully.");
            }

            PreparedStatement ps = conn.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("TotalCount");
            }
        } catch (SQLException ex) {
            System.err.println("Error executing query: " + ex.getMessage());
        } finally {
            if (conn != null)
                DbConnection.close(conn);
        }

        return count;
    }

    private void setParamsForQuery(PreparedStatement ps, List<Object> params) throws SQLException {
        for (int i = 0; i < params.size(); i++) {
            Object param = params.get(i);
            if (param instanceof String) {
                ps.setString(i + 1, (String) param);
            } else if (param instanceof Integer) {
                ps.setInt(i + 1, (Integer) param);
            } else if (param instanceof Date) {
                ps.setDate(i + 1, new java.sql.Date(((Date) param).getTime()));
            } else if (param instanceof BigDecimal) {
                ps.setBigDecimal(i + 1, (BigDecimal) param);
            } else if (param instanceof Float) {
                ps.setFloat(i + 1, (Float) param);
            } // Add more cases for other data types as needed
        }
    }

}
