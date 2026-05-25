package com.streetshop.controller;

import com.streetshop.dto.CreatePaymentRequest;
import com.streetshop.service.PaymentService;
import com.stripe.exception.StripeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/payments")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PostMapping("/create-intent")
    public ResponseEntity<?> createPaymentIntent(@RequestBody CreatePaymentRequest request) {
        try {
            Map<String, String> paymentIntent = paymentService.createPaymentIntent(
                request.getAmount(),
                request.getCurrency()
            );
            return ResponseEntity.ok(paymentIntent);
        } catch (StripeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping("/verify/{paymentIntentId}")
    public ResponseEntity<?> verifyPayment(@PathVariable String paymentIntentId) {
        boolean isSuccessful = paymentService.isPaymentSuccessful(paymentIntentId);
        
        Map<String, Object> response = new HashMap<>();
        response.put("paymentIntentId", paymentIntentId);
        response.put("success", isSuccessful);
        response.put("status", isSuccessful ? "succeeded" : "failed");
        
        return ResponseEntity.ok(response);
    }
}