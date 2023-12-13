package com.example.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

public class DetailPageController {
    @FXML
    private Label instructionsLabel;
    @FXML
    private Label recipeName;
    @FXML
    private Label mealDescription;
    @FXML
    private Label ingredientsLabel;
    @FXML
    private ImageView recipeImage;

    public String[] getInstructionForRecipe(int recipeId) throws SQLException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        String queryIngredients = "SELECT ingredients.name, recipe_ingredients.amount, recipe_ingredients.measure " +
                "FROM recipe_ingredients " +
                "JOIN ingredients ON recipe_ingredients.ingredientId = ingredients.ingredientId " +
                "WHERE recipe_ingredients.recipeId = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(queryIngredients);
        preparedStatement.setInt(1, recipeId);

        ResultSet resultSet = preparedStatement.executeQuery();

        StringBuilder ingredientsBuilder = new StringBuilder();

        while (resultSet.next()) {
            String ingredientName = resultSet.getString("ingredients.name");
            String ingredientAmount = resultSet.getString("recipe_ingredients.amount");
            String ingredientMeasure = resultSet.getString("recipe_ingredients.measure");

            if (ingredientAmount.contains(".0")) {
                ingredientAmount = ingredientAmount.replaceAll("\\.0", "");
            }

            String ingredient = ingredientName + " " + ingredientAmount + " " + ingredientMeasure;
            ingredientsBuilder.append(ingredient).append("\n");
        }

        String queryDetails = "SELECT name, description, instructions, picture FROM recipes WHERE recipeId = ?";
        PreparedStatement preparedStatement2 = conn.prepareStatement(queryDetails);
        preparedStatement2.setInt(1, recipeId);
        ResultSet resultSet2 = preparedStatement2.executeQuery();

        if (resultSet2.next()) {
            String recipeName = resultSet2.getString("name");
            String mealDescription = resultSet2.getString("description");
            String instructions = resultSet2.getString("instructions");
            String pictureName = resultSet2.getString("picture");

            return new String[]{instructions, recipeName, mealDescription, ingredientsBuilder.toString(), pictureName};
        } else {
            return new String[]{"", "", "", "", ""};
        }
    }

    public void initialize(int selectedRecipeId) {
        try {
            String[] recipeData = getInstructionForRecipe(selectedRecipeId);

            String recipeInstructions = recipeData[0];
            String recipeName = recipeData[1];
            String mealDescription = recipeData[2];
            String ingredients = recipeData[3];
            String pictureName = recipeData[4];

            String imagePath = "/assets/" + pictureName;
            Image image = new Image(Objects.requireNonNull(getClass().getResourceAsStream(imagePath)));

            if (!recipeInstructions.isEmpty() && !recipeName.isEmpty() && !mealDescription.isEmpty() && !ingredients.isEmpty() && !pictureName.isEmpty()) {
                instructionsLabel.setText(recipeInstructions);
                this.recipeName.setText(recipeName);
                this.mealDescription.setText(mealDescription);
                this.ingredientsLabel.setText(ingredients);
                this.recipeImage.setImage(image);
            } else {
                instructionsLabel.setText("Das Rezept konnte aus unerklärlichen Gründen nicht geladen werden");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
