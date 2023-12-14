package com.example.demo;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import java.io.IOException;
import java.util.Objects;

import javafx.scene.control.Tooltip;

public class HeaderController {

    @FXML
    private Label showFrontpageButton;

    @FXML
    public void initialize() {
        Tooltip tooltip = new Tooltip("Zurück zur Startseite");
        tooltip.setStyle("-fx-font-size: 13px;");
        showFrontpageButton.setTooltip(tooltip);
    }


    @FXML
    private void goToMainPage(MouseEvent event) throws IOException {
        Parent frontPageRoot = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("/fxml/frontpage-view.fxml")));



        Stage primaryStage = (Stage) showFrontpageButton.getScene().getWindow();
        double currentWidth = primaryStage.getWidth();
        double currentHeight = primaryStage.getHeight();
        Scene frontPageScene = new Scene(frontPageRoot);
        primaryStage.setScene(frontPageScene);
        primaryStage.setWidth(currentWidth);
        primaryStage.setHeight(currentHeight);
        frontPageScene.getRoot().requestFocus();
        primaryStage.setScene(frontPageScene);

    }

}
