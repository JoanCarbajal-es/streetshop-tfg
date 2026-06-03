package com.streetshop.service;

import com.streetshop.model.Order;
import com.streetshop.model.OrderItem;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BrevoEmailService {

    @Value("${brevo.api.key}")
    private String brevoApiKey;

    @Value("${app.frontend.url:http://localhost:3000}")
    private String frontendUrl;

    private final String BREVO_API_URL = "https://api.brevo.com/v3/smtp/email";
    private final RestTemplate restTemplate = new RestTemplate();

    public void sendWelcomeEmail(String toEmail, String userName) {
        try {
            Map<String, Object> emailData = new HashMap<>();

            Map<String, String> sender = new HashMap<>();
            sender.put("name", "StreetShop");
            sender.put("email", "noreply.streetshop@gmail.com");
            emailData.put("sender", sender);

            List<Map<String, String>> to = List.of(Map.of("email", toEmail, "name", userName));
            emailData.put("to", to);

            emailData.put("subject", "¡Bienvenido a StreetShop!");
            emailData.put("htmlContent", buildWelcomeEmailHtml(userName));

            sendEmail(emailData);

        } catch (Exception e) {
            System.err.println("Error enviando email de bienvenida: " + e.getMessage());
        }
    }

    public void sendOrderConfirmationEmail(String toEmail, String userName, Order order, List<OrderItem> items) {
        try {
            Map<String, Object> emailData = new HashMap<>();

            Map<String, String> sender = new HashMap<>();
            sender.put("name", "StreetShop");
            sender.put("email", "noreply.streetshop@gmail.com");
            emailData.put("sender", sender);

            List<Map<String, String>> to = List.of(Map.of("email", toEmail, "name", userName));
            emailData.put("to", to);

            emailData.put("subject", "Confirmación de pedido #" + order.getOrderNumber());
            emailData.put("htmlContent", buildOrderConfirmationHtml(userName, order, items));

            sendEmail(emailData);

        } catch (Exception e) {
            System.err.println("Error enviando email de confirmación: " + e.getMessage());
        }
    }

    private void sendEmail(Map<String, Object> emailData) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("api-key", brevoApiKey);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(emailData, headers);

        ResponseEntity<String> response = restTemplate.postForEntity(
                BREVO_API_URL,
                request,
                String.class);

        if (response.getStatusCode() == HttpStatus.CREATED) {
            System.out.println("Email enviado correctamente");
        } else {
            System.err.println("Error enviando email: " + response.getStatusCode());
        }
    }

    private String buildWelcomeEmailHtml(String userName) {
        String html = """
                <!DOCTYPE html>
                <html>
                <head>
                    <style>
                        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
                        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
                        .header { background-color: #fff; color: #000; padding: 30px; text-align: center; border-bottom: 2px solid #000; }
                        .content { padding: 30px; background-color: #f9f9f9; }
                        .button { display: inline-block; padding: 15px 30px; background-color: #000;
                                color: #fff; text-decoration: none; border-radius: 5px; margin-top: 20px; }
                        .footer { text-align: center; padding: 20px; color: #666; font-size: 12px; }
                    </style>
                </head>
                <body>
                    <div class="container">
                        <div class="header">
                            <img src="https://res.cloudinary.com/dpsfipegh/image/upload/v1780400949/logo-full_wugz06.png"
                                alt="StreetShop" style="height: 80px; width: auto;" />
                        </div>
                        <div class="content">
                            <h2>¡Bienvenido, %s!</h2>
                            <p>Gracias por registrarte en StreetShop, tu tienda de streetwear y sneakers premium.</p>
                            <p>Estamos emocionados de tenerte con nosotros. Ahora puedes:</p>
                            <ul>
                                <li>Explorar nuestra colección exclusiva</li>
                                <li>Guardar tus productos favoritos</li>
                                <li>Realizar compras de forma segura</li>
                                <li>Seguir el estado de tus pedidos</li>
                            </ul>
                            <a href="%s" class="button">Empezar a comprar</a>
                        </div>
                        <div class="footer">
                            <p>© 2025 StreetShop - Todos los derechos reservados</p>
                            <p>Este es un email automático, por favor no respondas a este mensaje.</p>
                        </div>
                    </div>
                </body>
                </html>
                """;
        return String.format(html, userName, frontendUrl);
    }

    private String buildOrderConfirmationHtml(String userName, Order order, List<OrderItem> items) {
        StringBuilder itemsHtml = new StringBuilder();

        for (OrderItem item : items) {
            itemsHtml.append(String.format("""
                    <tr>
                        <td style="padding: 10px; border-bottom: 1px solid #ddd;">%s (%s)</td>
                        <td style="padding: 10px; border-bottom: 1px solid #ddd; text-align: center;">%s</td>
                        <td style="padding: 10px; border-bottom: 1px solid #ddd; text-align: center;">%d</td>
                        <td style="padding: 10px; border-bottom: 1px solid #ddd; text-align: right;">%.2f €</td>
                    </tr>
                    """,
                    item.getProductName(),
                    item.getBrand(),
                    item.getSize(),
                    item.getQuantity(),
                    item.getSubtotal()));
        }

        String html = """
                <!DOCTYPE html>
                <html>
                <head>
                    <style>
                        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
                        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
                        .header { background-color: #fff; color: #000; padding: 30px; text-align: center; border-bottom: 2px solid #000; }
                        .content { padding: 30px; background-color: #f9f9f9; }
                        .order-info { background-color: #fff; padding: 20px; border-radius: 5px; margin: 20px 0; }
                        table { width: 100%%; border-collapse: collapse; margin: 20px 0; }
                        th { background-color: #f5f5f5; padding: 10px; text-align: left; }
                        .total { font-size: 20px; font-weight: bold; text-align: right; margin-top: 20px; }
                        .button { display: inline-block; padding: 15px 30px; background-color: #000;
                            color: #fff; text-decoration: none; border-radius: 5px; margin-top: 20px; }
                        .footer { text-align: center; padding: 20px; color: #666; font-size: 12px; }
                    </style>
                </head>
                <body>
                    <div class="container">
                        <div class="header">
                            <img src="https://res.cloudinary.com/dpsfipegh/image/upload/v1780400949/logo-full_wugz06.png"
                                alt="StreetShop" style="height: 80px; width: auto; display: block; margin: 0 auto 12px auto;" />
                            <h1>✅ Pedido Confirmado</h1>
                        </div>
                        <div class="content">
                            <h2>¡Gracias por tu compra, %s!</h2>
                            <p>Hemos recibido tu pedido correctamente y lo estamos preparando.</p>

                            <div class="order-info">
                                <h3>Detalles del Pedido</h3>
                                <p><strong>Número de pedido:</strong> %s</p>
                                <p><strong>Estado:</strong> %s</p>
                                <p><strong>Dirección de envío:</strong> %s</p>
                                <p><strong>Teléfono:</strong> %s</p>
                            </div>

                            <h3>Productos</h3>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th style="text-align: center;">Talla</th>
                                        <th style="text-align: center;">Cantidad</th>
                                        <th style="text-align: right;">Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    %s
                                </tbody>
                            </table>

                            <div class="total">
                                TOTAL: %.2f €
                            </div>

                            <p>Puedes descargar tu factura desde tu perfil en cualquier momento.</p>
                            <a href="%s/profile" class="button">Ver mis pedidos</a>
                        </div>
                        <div class="footer">
                            <p>© 2025 StreetShop - Todos los derechos reservados</p>
                            <p>Si tienes alguna pregunta, contáctanos en info@streetshop.com</p>
                        </div>
                    </div>
                </body>
                </html>
                """;

        return String.format(html,
                userName,
                order.getOrderNumber(),
                order.getStatus(),
                order.getShippingAddress(),
                order.getPhone(),
                itemsHtml.toString(),
                order.getTotal(),
                frontendUrl);
    }
}