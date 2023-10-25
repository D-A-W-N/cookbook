import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;

public class Category {
    private int categoryId;
    private String name;
    private DatabaseConnection db = DatabaseConnection.getInstance();
    private Connection conn = db.getConnection();

    public Category(int categoryId) {
        this.categoryId = categoryId;
        ResultSet resultSet = db.executeQuery("SELECT * FROM categories WHERE categoryId = " + categoryId);
        try {
            while (resultSet.next()) {
                this.name = resultSet.getString("name");
            }
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }

    static boolean createCategory(String name) {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        // Create a new category in the database
        try {
            conn.createStatement().executeUpdate("INSERT INTO categories (name) " +
                    "VALUES ('" + name + "')");
            return true;
        } catch (SQLException e) {
            db.printSQLException(e);
            return false;
        }
    }

    public void print() {
        System.out.println("Category ID: " + this.categoryId);
        System.out.println("Name: " + this.name);
    }
}
