package com.example.demo;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.example.demo.model.Ingredient;
import com.example.demo.model.Recipe;
import javafx.animation.TranslateTransition;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.Node;
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
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.*;
import javafx.stage.Stage;
import javafx.util.Duration;

public class FrontpageController {
    @FXML
    private Label hoveredRecipeName;

    @FXML
    private GridPane items;

    @FXML
    public TextField textfield;

    @FXML
    private ImageView randomPic;

    @FXML
    private StackPane stackPane;

    @FXML
    public void initialize() {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        int randomRecipeId = Recipe.getRandomRecipeId();
        Recipe randomRecipe = new Recipe(randomRecipeId);

        String recipeName = randomRecipe.getName();
        String recipePicture = randomRecipe.getPicture();

        Image recipeOfDayPic = new Image(Objects.requireNonNull(getClass().getResourceAsStream("/assets/" + recipePicture)));
        this.randomPic.setImage(recipeOfDayPic);

        this.hoveredRecipeName.setText("Gericht des Tages!\n" + recipeName);

        stackPane.setOnMouseEntered(event -> {
            stackPane.setVisible(false);
            hoveredRecipeName.setVisible(true);

            slideUp(hoveredRecipeName);
        });

        hoveredRecipeName.setOnMouseClicked(event -> {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/fxml/recipe-view.fxml"));
            Parent detailRoot = null;
            try {
                detailRoot = loader.load();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            DetailPageController detailPageController = loader.getController();

            int selectedRecipeId = randomRecipe.getRecipeId();
            detailPageController.initialize(selectedRecipeId);

            try {
                detailPageController.getInstructionForRecipe(selectedRecipeId);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            Scene detailScene = new Scene(detailRoot, 1280, 720);
            Stage primaryStage = (Stage) hoveredRecipeName.getScene().getWindow();
            primaryStage.setScene(detailScene);
            primaryStage.show();
        });


        hoveredRecipeName.setOnMouseExited(event -> {
            slideDown(hoveredRecipeName);
            hoveredRecipeName.setVisible(false);
            stackPane.setVisible(true);
        });

        System.out.println(recipeName);
        System.out.println(recipePicture);



        try {
            ResultSet resultSet = db.executeQuery("SELECT * FROM recipes");
            int count = 0;
            int rowCount = 0;

            //textfield.setPromptText("Search here!");


            while (resultSet.next()) {
                Recipe recipe = new Recipe(resultSet.getInt("recipeId"));

                this.buildScene(recipe, count, rowCount);

                if(count == 0) {
                    count = 1;
                } else {
                    count = 0;
                    rowCount++;
                }

                System.out.println("Items initialized");
            }

            textfield.textProperty().addListener((obs, oldValue, newValue) -> {
                System.out.println(newValue);

                ArrayList<String> matchingRecipes = null;
                try {
                    matchingRecipes = DatabaseConnection.getRecipesByName(newValue);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                System.out.println(matchingRecipes);

                items.getChildren().clear();

                int countSearch = 0;
                int rowCountSearch = 0;

                if (!matchingRecipes.isEmpty()) {
                    for (int i = 0; i < matchingRecipes.size(); i++) {
                        Recipe recipe = new Recipe(Integer.parseInt(matchingRecipes.get(i)));
                        System.out.println(recipe);

                        this.buildScene(recipe, countSearch, rowCountSearch);

                        if(countSearch == 0) {
                            countSearch = 1;
                        } else {
                            countSearch = 0;
                            rowCountSearch++;
                        }

                        System.out.println("Items filtered");
                    }
                } else {
                    VBox itemWrapper = new VBox();
                    Text error = new Text();

                    error.setText("Es wurden keine Rezepte gefunden.");
                    error.setTextAlignment(TextAlignment.CENTER);

                    itemWrapper.getChildren().add(error);

                    items.add(itemWrapper, 0, 0);
                }
            });
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }

    public void buildScene(Recipe recipe, int count, int rowCount) {
        VBox itemWrapper = new VBox();
        itemWrapper.getStyleClass().add("item-wrapper");
        itemWrapper.setAlignment(Pos.CENTER);



                ImageView imageView = new ImageView();

                String imagePath = "/assets/" + recipe.getPicture();
                Image image = new Image(
                        String.valueOf(MainApplication.class.getResource(
                                imagePath
                        )));
                imageView.setImage(image);
                imageView.setFitWidth(300);
                imageView.setFitHeight(180);
                imageView.setPreserveRatio(false);

                /*ArrayList<Ingredient> ingredientArrayList = recipe.getIngredients();
                for (int i=0; i < ingredientArrayList.size(); i++) {
                    System.out.println(ingredientArrayList.get(i).getName());
                }*/


                Label name = new Label();
                name.setText(recipe.getName());
                name.setMaxWidth(Double.MAX_VALUE);
                name.setAlignment(Pos.CENTER);
                name.getStyleClass().add("item-name");
                itemWrapper.setOnMouseClicked(new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent mouseEvent) {
                        FXMLLoader loader = new FXMLLoader(getClass().getResource("/fxml/recipe-view.fxml"));
                        Parent detailRoot = null;
                        try {
                            detailRoot = loader.load();
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                        DetailPageController detailPageController = loader.getController();

                        int selectedRecipeId = recipe.getRecipeId(); // Hier müssen Sie die ID des ausgewählten Rezepts bekommen
                        detailPageController.initialize(selectedRecipeId); // Nehmen Sie an, dass die Methode in DetailPageController `loadRecipe` heißt

                        try {
                            detailPageController.getInstructionForRecipe(selectedRecipeId);
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
    }

    // Methode für die Animation nach oben
    private void slideUp(Node node) {
        TranslateTransition slideUpTransition = new TranslateTransition(Duration.millis(500), node);
        slideUpTransition.setFromY(100);
        slideUpTransition.setToY(90); // Verändere diesen Wert für die gewünschte Verschiebung
        slideUpTransition.play();
    }

    // Methode für die Rückwärtsanimation
    private void slideDown(Node node) {
        TranslateTransition slideDownTransition = new TranslateTransition(Duration.millis(500), node);
        slideDownTransition.setToY(-100); // Setze die Verschiebung zurück
        slideDownTransition.play();
    }
}