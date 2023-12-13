package com.example.demo;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.io.IOException;

public class MainApplication extends Application {
    @Override
    public void start(Stage stage) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(MainApplication.class.getResource("/fxml/frontpage-view.fxml"));

        Scene scene = new Scene(fxmlLoader.load(), 1280, 720);
        scene.getRoot().requestFocus();
        stage.setTitle("Cookbook");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}