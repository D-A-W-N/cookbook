import java.sql.*;

public class DatabaseConnection {
    private static DatabaseConnection ConnectionInstance = null;
    private Connection conn = null;
    private static final String url = "jdbc:mysql://localhost:3306/cookbook";   // Change this to your database URL
    private static final String username = "root";                              // Change this to your database username
    private static final String password = "";                                  // Change this to your database password


    private DatabaseConnection() {
    }

    public static DatabaseConnection getInstance() {
        if (ConnectionInstance == null) {
            ConnectionInstance = new DatabaseConnection();
        }
        return ConnectionInstance;
    }

    public Connection getConnection() {
        try {
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to database");
        } catch (SQLException e) {
            printSQLException(e);
        }
        return conn;
    }

    public void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public ResultSet executeQuery(String query) {
        ResultSet rs = null;
        try {
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rs;
    }

    public void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
