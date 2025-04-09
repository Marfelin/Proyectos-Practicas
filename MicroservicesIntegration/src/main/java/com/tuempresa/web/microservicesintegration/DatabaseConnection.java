package com.tuempresa.web.microservicesintegration;


import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DatabaseConnection {
    public static Connection getConnection() throws Exception {
        Properties props = new Properties();
        props.load(DatabaseConnection.class.getClassLoader().getResourceAsStream("application.properties"));

        return DriverManager.getConnection(
            props.getProperty("spring.datasource.url"),
            props.getProperty("spring.datasource.username"),
            props.getProperty("spring.datasource.password")
        );
    }
}
