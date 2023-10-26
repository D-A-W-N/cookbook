package com.example.demo;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import com.example.demo.model.Recipe;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;

public class HelloController {
    @FXML
    private Label welcomeText;

    @FXML
    private GridPane items;

    @FXML
    public void initialize() {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        try {
            ResultSet resultSet = db.executeQuery("SELECT * FROM recipes");
            int count = 0;

            while (resultSet.next()) {
                Recipe recipe = new Recipe(resultSet.getInt("recipeId"));
                VBox itemWrapper = new VBox();
                Label name = new Label();
                name.setText(recipe.getName());
                itemWrapper.getChildren().add(name);
                items.add(itemWrapper, 3, 0);

                count++;

                System.out.println("Items initialized");
            }
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }
}