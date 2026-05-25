package com.streetshop.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * Health Check Controller
 * Endpoint para verificar que el backend está funcionando
 */
@RestController
@RequestMapping("/api")
public class HealthController {

    /**
     * GET /api/health
     * Verifica el estado del backend
     * 
     * @return Estado del servidor y timestamp
     */
    @GetMapping("/health")
    public ResponseEntity<Map<String, Object>> healthCheck() {
        Map<String, Object> response = new HashMap<>();
        response.put("status", "UP");
        response.put("service", "StreetShop Backend API");
        response.put("version", "1.0.0");
        response.put("timestamp", LocalDateTime.now());
        response.put("message", "Backend funcionando correctamente ✅");
        
        return ResponseEntity.ok(response);
    }

    /**
     * GET /api/test
     * Endpoint de prueba adicional
     * 
     * @return Mensaje de prueba
     */
    @GetMapping("/test")
    public ResponseEntity<String> test() {
        return ResponseEntity.ok("¡Hola desde StreetShop Backend! 🚀");
    }

}