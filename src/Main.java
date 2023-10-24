import java.sql.Connection;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class Main {

    public static void main(String[] args) {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();
        ResultSet resultSet = db.executeQuery("SELECT * FROM recipes");

        try {
            while (resultSet.next()) {
                Recipe recipe = new Recipe(resultSet.getInt("recipeId"));
                recipe.print();
            }
        } catch (SQLException e) {
            db.printSQLException(e);
        }
        db.closeConnection(conn);
    }
}

