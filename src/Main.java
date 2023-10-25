import java.sql.Connection;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class Main {

    public static void main(String[] args) {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        boolean createRecipe = Recipe.createRecipe("Test Recipe",
                "Test Description",
                "Test Instructions",
                10,
                "Test Preparation Type",
                "Test Nutrition",
                100,
                1,
                "Test Picture");

        if(createRecipe) {
            System.out.println("Recipe created successfully");
        } else {
            System.out.println("Recipe creation failed");
        }

        try {
            ResultSet resultSet = db.executeQuery("SELECT * FROM recipes");
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

