package com.streetshop.service;

import com.streetshop.dto.AuthResponse;
import com.streetshop.dto.LoginRequest;
import com.streetshop.dto.RegisterRequest;
import com.streetshop.model.User;
import com.streetshop.repository.UserRepository;
import com.streetshop.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JwtUtil jwtUtil;
    
    @Autowired
    private BrevoEmailService brevoEmailService;

    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public AuthResponse register(RegisterRequest request) {
        System.out.println("INICIO DE REGISTRO - Email: " + request.getEmail());
        
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new RuntimeException("El email ya está registrado");
        }

        User user = new User();
        user.setEmail(request.getEmail());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setFullName(request.getFullName());
        user.setPhone(request.getPhone());
        user.setAddress(request.getAddress());
        user.setRole("USER");
        user.setCreatedAt(LocalDateTime.now());

        User savedUser = userRepository.save(user);
        System.out.println("Usuario guardado - ID: " + savedUser.getId());
        
        try {
            System.out.println("Intentando enviar email de bienvenida a: " + savedUser.getEmail());
            brevoEmailService.sendWelcomeEmail(savedUser.getEmail(), savedUser.getFullName());
            System.out.println("Email de bienvenida enviado correctamente");
        } catch (Exception e) {
            System.err.println("Error enviando email de bienvenida: " + e.getMessage());
            e.printStackTrace();
        }

        String token = jwtUtil.generateToken(user.getEmail());
        return new AuthResponse(token, user.getEmail(), user.getFullName(), user.getRole());
    }

    public AuthResponse login(LoginRequest request) {
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("Email o contraseña incorrectos"));

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            throw new RuntimeException("Email o contraseña incorrectos");
        }

        String token = jwtUtil.generateToken(user.getEmail());
        return new AuthResponse(token, user.getEmail(), user.getFullName(), user.getRole());
    }
}