package com.streetshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * StreetShop - E-commerce Platform
 * Clase principal de la aplicación Spring Boot
 * 
 * @author Joan Alonso Carbajal Quispe
 * @version 1.0.0
 */
@SpringBootApplication
public class StreetShopApplication {

    public static void main(String[] args) {
        SpringApplication.run(StreetShopApplication.class, args);
        System.out.println("===========================================");
        System.out.println("✅ StreetShop Backend Started Successfully!");
        System.out.println("📍 Server running on: http://localhost:8080");
        System.out.println("📊 Health check: http://localhost:8080/api/health");
        System.out.println("===========================================");
    }

}