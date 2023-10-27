package com.example.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import com.example.demo.model.Recipe;
import javafx.fxml.FXML;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;

public class DetailPageController {

    public String getInstructionForRecipe(int recipeId) throws SQLException {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        // Ersetzen Sie "recipeId" durch den Wert der Rezept-ID, die Sie abrufen möchten.
        String query = "SELECT instructions FROM recipes WHERE recipe_id = 6";
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        preparedStatement.setInt(1, recipeId);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Wenn ein Ergebnis gefunden wurde, holen Sie die Zubereitungsanweisung.
            String instruction = resultSet.getString("instructions");
            System.out.println(instruction);
            return instruction;
        } else {
            // Keine Übereinstimmung gefunden.
            return null;
        }
    }

}
