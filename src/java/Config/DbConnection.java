package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    // JDBC URL of SQL Server
    private static final String JDBC_URL = "jdbc:sqlserver://localhost\\SQLExpress:1433;databaseName=ResortHub;"
            + "user=sa;password=123;"
            + "encrypt=true;trustServerCertificate=true;";

    // Establishes the connection to the database
    public static Connection get() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(JDBC_URL);
        } catch (ClassNotFoundException ex) {
            System.err.println("Error loading SQL Server JDBC driver: " + ex.getMessage());
        } catch (SQLException ex) {
            System.err.println("SQL Exception: " + ex.getMessage());
            ex.printStackTrace(); // Print the stack trace for detailed error information
        }

        return null;
    }

    // Closes the connection
    public static void close(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                System.err.println("Error closing connection: " + ex.getMessage());
            }
        }
    }
}
