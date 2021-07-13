/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SACHINKRISHNA
 */
import java.sql.*;
public class DBConnection {
    
    static final String DB_URL = "jdbc:mysql://localhost:3306/signin";
    static final String ACCNO = "root";
    static final String PINNO = "";
    public static Connection connectDB(){
    try{
        Connection conn = null;
        conn = DriverManager.getConnection(DB_URL,ACCNO,PINNO);
        return conn;
    }

    catch(Exception e){
        System.out.println("An Exception has occured"+e);
        return null;
    }
    }
    
}
