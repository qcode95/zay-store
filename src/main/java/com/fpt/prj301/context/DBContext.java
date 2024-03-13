package com.fpt.prj301.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBContext {
    
    private static Connection conn;

    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public Connection getConnection(){
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("connect to DB success!!");
        } catch (ClassNotFoundException | SQLException exception) {
            System.out.println("can't connect to database!!!" + exception.getMessage());
        }
        return conn;
    }

    public void closeConnection(Connection con) {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
                System.out.println("close DB success!!");
            }
        } catch (SQLException e) { // TODO Auto-generated catch block
            System.out.println("can't connect to database!!!" + e.getMessage());
        }
    }

    public void closeConnection(ResultSet rs) {
        try {
            if (rs != null && !rs.isClosed()) {
                try {
                    rs.close();
                    System.out.println("close DB success!!");
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    System.out.println("can't connect to database!!!" + e.getMessage());
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("can't connect to database!!!" + e.getMessage());
        }
    }

    public void closeConnection(PreparedStatement ps) {
        try {
            if (ps != null && !ps.isClosed()) {
                try {
                    ps.close();
                    System.out.println("close DB success!!");
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    System.out.println("can't connect to database!!!" + e.getMessage());
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("can't connect to database!!!" + e.getMessage());
        }
    }

    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private final String serverName = "localhost";
    private final String dbName = "prj301";
    private final String portNumber = "3306";
    private final String username = "quy";
    private final String password = "123456";
}
