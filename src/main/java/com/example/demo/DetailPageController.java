package com.example.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Objects;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

public class DetailPageController{
    @FXML
    public Label mealDescription;
    @FXML
    private Label instructionsLabel;
    @FXML
    private Label recipeName;
    @FXML
    private Label ingredientsLabel;

    @FXML
    private ImageView recipeImage;

    public DetailPageController(){
    }

    public String[] getInstructionForRecipe(int recipeId) throws SQLException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        String queryInstructions = "SELECT instructions FROM recipes WHERE recipeId = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(queryInstructions);

        String queryRecipeName ="SELECT name FROM recipes WHERE recipeId = ?";
        PreparedStatement preparedStatement1 = conn.prepareStatement(queryRecipeName);

        String queryMealDescription ="SELECT description FROM recipes WHERE recipeId = ?";
        PreparedStatement preparedStatement2 = conn.prepareStatement(queryMealDescription);

        String queryIngredients ="SELECT ingredients.name, recipe_ingredients.amount, recipe_ingredients.measure FROM recipe_ingredients JOIN ingredients ON recipe_ingredients.ingredientId = ingredients.ingredientId JOIN recipes ON recipes.recipeId = recipe_ingredients.recipeId WHERE recipes.recipeId = ?";
        PreparedStatement preparedStatement3 = conn.prepareStatement(queryIngredients);

        String queryPicture = "SELECT picture FROM recipes WHERE recipeId = ?";
        PreparedStatement preparedStatement4 = conn.prepareStatement(queryPicture);

        //String queryIngredients ="SELECT "
        preparedStatement.setInt(1, recipeId);
        preparedStatement1.setInt(1, recipeId);
        preparedStatement2.setInt(1, recipeId);
        preparedStatement3.setInt(1, recipeId);
        preparedStatement4.setInt(1, recipeId);

        ResultSet resultSet = preparedStatement.executeQuery();
        ResultSet resultSet1 = preparedStatement1.executeQuery();
        ResultSet resultSet2 = preparedStatement2.executeQuery();
        ResultSet resultSet3 = preparedStatement3.executeQuery();
        ResultSet resultSet4 = preparedStatement4.executeQuery();

        if (resultSet.next() && resultSet1.next() && resultSet2.next() && resultSet3.next() && resultSet4.next()) {

            String instructions = resultSet.getString("instructions");
            String recipeName = resultSet1.getString("name");
            String mealDescription = resultSet2.getString("description");
            String picture = resultSet4.getString("picture");
            /*String ingredientsName = resultSet3.getString("ingredients.name");
            String ingredientsAmount = resultSet3.getString("recipe_ingredients.amount");
            String ingredientsMeasure = resultSet3.getString("recipe_ingredients.measure");*/

            StringBuilder ingredientsBuilder = new StringBuilder();

            while (resultSet3.next()) {
                String ingredientName = resultSet3.getString("ingredients.name");
                String ingredientAmount = resultSet3.getString("recipe_ingredients.amount");
                String ingredientMeasure = resultSet3.getString("recipe_ingredients.measure");

                if (ingredientAmount.contains(".0")) {
                    ingredientAmount = ingredientAmount.replaceAll("\\.0", "");
                    System.out.println(ingredientAmount);
                }

                String ingredient = ingredientName + " " + ingredientAmount + " " + ingredientMeasure;
                ingredientsBuilder.append(ingredient).append("\n");
            }

            String ingredients = ingredientsBuilder.toString();

            /*String ingredients = ingredientsName + " " + ingredientsAmount + " " + ingredientsMeasure;*/
            /*Label instructions = new Label();
            instructions.setText(resultSet.getString("instructions"));*/
            System.out.println(instructions);
            System.out.println(ingredients);
            return new String[]{instructions , recipeName, mealDescription, ingredients, picture };
        } else {
            // Keine Übereinstimmung gefunden.
            return new String[]{"keine Anweisung gefunden"};
        }
    }

    public void initialize(int selectedRecipeId) {
        try {
            String recipeInstructions = getInstructionForRecipe(selectedRecipeId)[0];
            String recipeName = getInstructionForRecipe(selectedRecipeId)[1];
            String mealDescription = getInstructionForRecipe(selectedRecipeId)[2];
            String ingredients = getInstructionForRecipe(selectedRecipeId)[3];
            String pictureName = getInstructionForRecipe(selectedRecipeId)[4];

            String imagePath = "/assets/" + pictureName;

            Image image = new Image(Objects.requireNonNull(getClass().getResourceAsStream(imagePath)));

            System.out.println(ingredients);
            if (recipeInstructions != null && recipeName != null && mealDescription != null && ingredients != null && pictureName != null) {
                this.instructionsLabel.setText(recipeInstructions);
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