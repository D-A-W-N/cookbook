package com.example.demo.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import com.example.demo.DatabaseConnection;

public class Ingredient {
    private int ingredientId;
    private String name;
    private DatabaseConnection db = DatabaseConnection.getInstance();
    private Connection conn = db.getConnection();

    public Ingredient(int ingredientId) {
        this.ingredientId = ingredientId;
        ResultSet resultSet = db.executeQuery("SELECT * FROM ingredients WHERE ingredientId = " + ingredientId);
        try {
            while (resultSet.next()) {
                this.name = resultSet.getString("name");
            }
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }

    static boolean createIngredients(String name) {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        // Create a new ingredients in the database
        try {
            conn.createStatement().executeUpdate("INSERT INTO ingredients (name) " +
                    "VALUES ('" + name + "')");
            return true;
        } catch (SQLException e) {
            db.printSQLException(e);
            return false;
        }
    }

    public void print() {
        System.out.println("Ingredient ID: " + this.ingredientId);
        System.out.println("Name: " + this.name);
    }
}
