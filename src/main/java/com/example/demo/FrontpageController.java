package com.example.demo;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.demo.model.Ingredient;
import com.example.demo.model.Recipe;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.RowConstraints;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class FrontpageController {
    @FXML
    private Label welcomeText;

    @FXML
    private GridPane items;

    @FXML
    public TextField textfield;

    @FXML
    public void initialize() {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();


        try {
            ResultSet resultSet = db.executeQuery("SELECT * FROM recipes");
            int count = 0;
            int rowCount = 0;

            textfield.setPromptText("Search here!");

            textfield.textProperty().addListener((obs, oldValue, newValue) -> {
                System.out.println(newValue);

                ArrayList<String> matchingNames = null;
                try {
                    matchingNames = DatabaseConnection.getRecipesByName(newValue);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            });

            while (resultSet.next()) {
                Recipe recipe = new Recipe(resultSet.getInt("recipeId"));
                VBox itemWrapper = new VBox();
                itemWrapper.getStyleClass().add("item-wrapper");
                itemWrapper.setAlignment(Pos.CENTER);

                ImageView imageView = new ImageView();
                Image image = new Image(MainApplication.class.getResource("/assets/" + recipe.getPicture()).toString());
                imageView.setImage(image);
                imageView.setFitWidth(300);
                imageView.setFitHeight(300);
                imageView.setPreserveRatio(true);

                /*ArrayList<Ingredient> ingredientArrayList = recipe.getIngredients();
                for (int i=0; i < ingredientArrayList.size(); i++) {
                    System.out.println(ingredientArrayList.get(i).getName());
                }*/

                Hyperlink name = new Hyperlink();
                name.setText(recipe.getName());
                name.setMaxWidth(Double.MAX_VALUE);
                name.setAlignment(Pos.CENTER);
                name.getStyleClass().add("item-name");
                name.setOnAction(new EventHandler<ActionEvent>() {
                    @Override
                    public void handle(ActionEvent actionEvent) {
                        FXMLLoader loader = new FXMLLoader(getClass().getResource("/fxml/recipe-view.fxml"));
                        Parent detailRoot = null;
                        try {
                            detailRoot = loader.load();
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                        DetailPageController detailPageController = loader.getController();

                        // Hier sollten Sie die ausgewählten Rezeptdaten an den DetailseiteController übergeben
                        try {
                            detailPageController.getInstructionForRecipe(4);
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }

                        Scene detailScene = new Scene(detailRoot, 1280, 720);
                        Stage primaryStage = (Stage) name.getScene().getWindow(); // Ersetzen Sie "yourStartPageAnchorPane" durch das entsprechende Element in Ihrer Startseite
                        primaryStage.setScene(detailScene);
                        primaryStage.show();
                    }
                });

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