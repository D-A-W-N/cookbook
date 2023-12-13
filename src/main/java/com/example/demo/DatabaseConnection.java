package com.example.demo;

import java.sql.*;
import java.util.ArrayList;

public class DatabaseConnection {
    private static DatabaseConnection ConnectionInstance = null;
    private Connection conn = null;
    private static final String url = "jdbc:mysql://localhost:3306/cookbook";   // Change this to your database URL
    private static final String username = "root";                              // Change this to your database username
    private static final String password = "";                                  // Change this to your database password


    private DatabaseConnection() {
    }

    public static DatabaseConnection getInstance() {
        if (ConnectionInstance == null) {
            ConnectionInstance = new DatabaseConnection();
        }
        return ConnectionInstance;
    }

    public static ArrayList<String> getRecipesByName(String searchString) throws SQLException {
        DatabaseConnection db = DatabaseConnection.getInstance();

        ResultSet resultSelect = db.executeQuery("SELECT * FROM recipes WHERE name LIKE \"%" + searchString + "%\"");
        ArrayList<String> matchingNames = new ArrayList<>();

        while (resultSelect.next())
        {
            String name = resultSelect.getString("name");
            int recipeId = resultSelect.getInt("recipeId");
            matchingNames.add(String.valueOf(recipeId));
        }

        for (String name: matchingNames)
        {
            System.out.println(matchingNames);
        }

        return matchingNames;
    }

    public static ArrayList<String> getRecipesByCategoryId(int categoryId) throws SQLException {
        DatabaseConnection db = DatabaseConnection.getInstance();

        ResultSet resultSelect = db.executeQuery("SELECT * FROM recipes WHERE category = " + categoryId);
        ArrayList<String> matchingRecipes = new ArrayList<>();

        while (resultSelect.next())
        {
            int recipeId = resultSelect.getInt("recipeId");
            matchingRecipes.add(String.valueOf(recipeId));
        }


        return matchingRecipes;
    }

    public Connection getConnection() {
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return conn;
    }

    public void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public ResultSet executeQuery(String query) {
        ResultSet rs = null;
        try {
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rs;
    }

    public void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
