package com.example.demo;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import com.example.demo.model.Recipe;
import javafx.fxml.FXML;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;

public class FrontpageController {
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
            int rowCount = 0;

            while (resultSet.next()) {
                Recipe recipe = new Recipe(resultSet.getInt("recipeId"));
                VBox itemWrapper = new VBox();
                itemWrapper.getStyleClass().add("item-wrapper");

                ImageView imageView = new ImageView();
                Image image = new Image(MainApplication.class.getResource("/assets/" + recipe.getPicture()).toString());
                imageView.setImage(image);
                imageView.fitWidthProperty().bind(itemWrapper.widthProperty());
                imageView.setPreserveRatio(true);

                Label name = new Label();
                name.setText(recipe.getName());
                name.setMaxWidth(Double.MAX_VALUE);
                name.setAlignment(Pos.CENTER);
                name.getStyleClass().add("item-name");

                itemWrapper.getChildren().add(imageView);
                itemWrapper.getChildren().add(name);
                items.add(itemWrapper, count, rowCount);

                if(count == 0) {
                    count = 1;
                } else {
                    count = 0;
                    rowCount++;
                }

                System.out.println("Items initialized");
            }
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }
}