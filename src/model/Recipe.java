package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import controller.*;

public class Recipe {
    private int recipeId;
    private String name;
    private String description;
    private String instructions;
    private int cooking_time;
    private String preparation_type;
    private String nutrition;
    private float calories;
    private String category;
    private String picture;
    private DatabaseConnection db = DatabaseConnection.getInstance();
    private Connection conn = db.getConnection();

    public Recipe(int recipeId) {
        this.recipeId = recipeId;
        ResultSet resultSet = db.executeQuery("SELECT * FROM recipes WHERE recipeId = " + recipeId);
        try {
            while (resultSet.next()) {
                this.name = resultSet.getString("name");
                this.description = resultSet.getString("description");
                this.instructions = resultSet.getString("instructions");
                this.cooking_time = resultSet.getInt("cooking_time");
                this.preparation_type = resultSet.getString("preparation_type");
                this.nutrition = resultSet.getString("nutrition");
                this.calories = resultSet.getFloat("calories");
                this.category = resultSet.getString("category");
                this.picture = resultSet.getString("picture");
            }
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }

    static boolean createRecipe(String name,
                               String description,
                               String instructions,
                               Integer cooking_time,
                               String preparation_type,
                               String nutrition,
                               float calories,
                               Integer category,
                               String picture) {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();

        // Create a new recipe in the database
        try {
            conn.createStatement().executeUpdate("INSERT INTO recipes (name, description, instructions, cooking_time, preparation_type, nutrition, calories, category, picture) " +
                    "VALUES ('" + name + "', '" + description + "', '" + instructions + "', " + cooking_time + ", '" + preparation_type + "', '" + nutrition + "', " + calories + ", " + category + ", '" + picture + "')");
            return true;
        } catch (SQLException e) {
            db.printSQLException(e);
            return false;
        }
    }

    public int getRecipeId() {
        return this.recipeId;
    }

    public String getName() {
        return this.name;
    }

    public String getDescription() {
        return this.description;
    }

    public String getInstructions() {
        return this.instructions;
    }

    public int getCookingTime() {
        return this.cooking_time;
    }

    public String getPreparationType() {
        return this.preparation_type;
    }

    public String getNutrition() {
        return this.nutrition;
    }

    public float getCalories() {
        return this.calories;
    }

    public String getCategory() {
        DatabaseConnection db = DatabaseConnection.getInstance();
        Connection conn = db.getConnection();
        ResultSet resultSet = db.executeQuery("SELECT * FROM categories WHERE categoryId = " + this.category);
        try {
            while (resultSet.next()) {
                return resultSet.getString("name");
            }
        } catch (SQLException e) {
            db.printSQLException(e);
            return null;
        }
        return this.category;
    }

    public String getPicture() {
        return this.picture;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public void setCookingTime(int cooking_time) {
        this.cooking_time = cooking_time;
    }

    public void setPreparationType(String preparation_type) {
        this.preparation_type = preparation_type;
    }

    public void setNutrition(String nutrition) {
        this.nutrition = nutrition;
    }

    public void setCalories(float calories) {
        this.calories = calories;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public void save() {
        String query = "UPDATE recipes SET name = '" + this.name + "', description = '" + this.description + "', instructions = '" + this.instructions + "', cooking_time = " + this.cooking_time + ", preparation_type = '" + this.preparation_type + "', nutrition = '" + this.nutrition + "', calories = " + this.calories + ", category = '" + this.category + "', picture = '" + this.picture + "' WHERE recipeId = " + this.recipeId;
        try {
            conn.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }

    public void delete() {
        String query = "DELETE FROM recipes WHERE recipeId = " + this.recipeId;
        try{
            conn.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            db.printSQLException(e);
        }
    }

    public void print() {
        System.out.println("Recipe ID: " + this.recipeId);
        System.out.println("Name: " + this.name);
        System.out.println("Description: " + this.description);
        System.out.println("Instructions: " + this.instructions);
        System.out.println("Cooking Time: " + this.cooking_time);
        System.out.println("Preparation Type: " + this.preparation_type);
        System.out.println("Nutrition: " + this.nutrition);
        System.out.println("Calories: " + this.calories);
        System.out.println("Category: " + this.getCategory());
        System.out.println("Picture: " + this.picture);
    }

}
