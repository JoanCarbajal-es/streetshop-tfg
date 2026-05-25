package com.streetshop.dto;

import java.math.BigDecimal;

public class CreatePaymentRequest {
    private BigDecimal amount;
    private String currency = "eur";
    
    public BigDecimal getAmount() {
        return amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    public String getCurrency() {
        return currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }
}