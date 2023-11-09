package com.example.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import com.example.demo.model.Recipe;
import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class DetailPageController{
    @FXML
    public Label mealDescription;
    @FXML
    private Label instructionsLabel;
    @FXML
    private Label recipeName;

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

        //String queryIngredients ="SELECT "
        preparedStatement.setInt(1, recipeId);
        preparedStatement1.setInt(1, recipeId);
        preparedStatement2.setInt(1, recipeId);

        ResultSet resultSet = preparedStatement.executeQuery();
        ResultSet resultSet1 = preparedStatement1.executeQuery();
        ResultSet resultSet2 = preparedStatement2.executeQuery();

        if (resultSet.next() && resultSet1.next() && resultSet2.next()) {

            String instructions = resultSet.getString("instructions");
            String recipeName = resultSet1.getString("name");
            String mealDescription = resultSet2.getString("description");

            /*Label instructions = new Label();
            instructions.setText(resultSet.getString("instructions"));*/
            System.out.println(instructions);
            return new String[]{instructions , recipeName, mealDescription};
        } else {
            // Keine Übereinstimmung gefunden.
            return new String[]{"keine Anweisung gefunden"};
        }
    }

    public void initialize() {
        try {
            String recipeInstructions = getInstructionForRecipe(4)[0];
            String recipeName = getInstructionForRecipe(4)[1];
            String mealDescription = getInstructionForRecipe(4)[2];


            if (recipeInstructions != null && recipeName != null && mealDescription != null) {
                this.instructionsLabel.setText(recipeInstructions);
                this.recipeName.setText(recipeName);
                this.mealDescription.setText(mealDescription);
            } else {
                instructionsLabel.setText("Das Rezept konnte aus unerklärlichen Gründen nicht geladen werden");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}