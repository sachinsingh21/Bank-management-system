/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bankmanagement;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Kumar Family
 */
public class LoginSceneController implements Initializable {

    @FXML
    private TextField textEmail;
 
    @FXML
    private PasswordField textPassword;
 
    Stage dialogStage = new Stage();
    Scene scene;
 
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
 
    
    @FXML
    private void handleButtonAction(ActionEvent event) {
        String Account_Number = textEmail.getText().toString();
        String pin = textPassword.getText().toString();
 
        String sql = "SELECT * FROM AccountTable WHERE Account_Number = ? and pin = ?";
 
        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, Account_Number);
            preparedStatement.setString(2, pin);
            resultSet = preparedStatement.executeQuery();
            if(!resultSet.next()){
                    infoBox("Enter Correct Account number and Password", "Failed", null);
            }else{
                infoBox("Login Successfull", "Success", null);
                Node source = (Node) event.getSource();
                dialogStage = (Stage) source.getScene().getWindow();
                dialogStage.close();
                scene = new Scene(FXMLLoader.load(getClass().getResource("BankMain.fxml")));
                dialogStage.setScene(scene);
                dialogStage.show();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
 
    public static void infoBox(String infoMessage, String titleBar, String headerMessage)
    {
        Alert alert = new Alert(AlertType.INFORMATION);
        alert.setTitle(titleBar);
        alert.setHeaderText(headerMessage);
        alert.setContentText(infoMessage);
        alert.showAndWait();
    }
 
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
}
