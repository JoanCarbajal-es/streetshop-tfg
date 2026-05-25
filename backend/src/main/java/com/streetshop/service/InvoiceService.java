package com.streetshop.service;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.borders.SolidBorder;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.TextAlignment;
import com.streetshop.model.Order;
import com.streetshop.model.OrderItem;
import com.streetshop.model.User;
import com.streetshop.repository.OrderItemRepository;
import com.streetshop.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class InvoiceService {

        @Autowired
        private OrderRepository orderRepository;

        @Autowired
        private OrderItemRepository orderItemRepository;

        public byte[] generateInvoicePDF(Long orderId) {
                Order order = orderRepository.findById(orderId)
                                .orElseThrow(() -> new RuntimeException("Pedido no encontrado"));

                List<OrderItem> items = orderItemRepository.findByOrderId(orderId);
                User user = order.getUser();

                try {
                        ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        PdfWriter writer = new PdfWriter(baos);
                        PdfDocument pdf = new PdfDocument(writer);
                        Document document = new Document(pdf);
                        document.setMargins(30, 45, 30, 45);

                        document.add(new Paragraph("StreetShop").setFontSize(28).setBold()
                                        .setTextAlignment(TextAlignment.CENTER));
                        document.add(new LineSeparator(new SolidLine(0.5f)).setMarginBottom(20));

                        Table headTable = new Table(new float[] { 1, 1 }).useAllAvailableWidth()
                                        .setBorder(Border.NO_BORDER);

                        String nombre = (user != null) ? user.getFullName() : "Cliente General";
                        String email = (user != null) ? user.getEmail() : "";

                        headTable.addCell(new Cell().add(new Paragraph("CLIENTE:").setBold().setFontSize(9))
                                        .add(new Paragraph(nombre).setFontSize(9))
                                        .add(new Paragraph(order.getShippingAddress()).setFontSize(8))
                                        .add(new Paragraph(email).setFontSize(8))
                                        .setBorder(Border.NO_BORDER));

                        headTable.addCell(new Cell()
                                        .add(new Paragraph("Nº DOCUMENTO: " + order.getOrderNumber()).setBold()
                                                        .setFontSize(9))
                                        .add(new Paragraph("FECHA: " + order.getCreatedAt()
                                                        .format(DateTimeFormatter.ofPattern("dd/MM/yy")))
                                                        .setFontSize(9))
                                        .setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER));

                        document.add(headTable.setMarginBottom(25));

                        Table table = new Table(new float[] { 3, 1, 1, 1, 1 }).useAllAvailableWidth();
                        String[] headers = { "DESCRIPCIÓN", "TALLA", "I.V.A.", "PRECIO U.", "IMPORTE" };
                        for (String h : headers) {
                                table.addHeaderCell(new Cell().add(new Paragraph(h).setFontSize(8).setBold())
                                                .setBorder(Border.NO_BORDER).setBorderBottom(new SolidBorder(0.5f)));
                        }

                        for (OrderItem item : items) {
                                table.addCell(new Cell().add(new Paragraph(item.getProductName()).setFontSize(8))
                                                .setBorder(Border.NO_BORDER));
                                table.addCell(new Cell()
                                                .add(new Paragraph(item.getSize() != null ? item.getSize() : "-")
                                                                .setFontSize(8))
                                                .setBorder(Border.NO_BORDER));
                                table.addCell(new Cell().add(new Paragraph("21%").setFontSize(8))
                                                .setBorder(Border.NO_BORDER));
                                table.addCell(new Cell().add(new Paragraph(item.getPrice() + " €").setFontSize(8))
                                                .setBorder(Border.NO_BORDER));
                                table.addCell(new Cell().add(new Paragraph(item.getSubtotal() + " €").setFontSize(8))
                                                .setBorder(Border.NO_BORDER));
                        }
                        document.add(table.setMarginBottom(30));

                        Table totalT = new Table(new float[] { 1, 1 }).setWidth(150)
                                        .setHorizontalAlignment(HorizontalAlignment.RIGHT);
                        totalT.addCell(new Cell().add(new Paragraph("TOTAL").setBold()).setBorder(Border.NO_BORDER)
                                        .setBorderTop(new SolidBorder(1f)));
                        totalT.addCell(new Cell().add(new Paragraph(order.getTotal() + " €").setBold())
                                        .setBorder(Border.NO_BORDER).setBorderTop(new SolidBorder(1f))
                                        .setTextAlignment(TextAlignment.RIGHT));
                        document.add(totalT);

                        document.close();
                        return baos.toByteArray();
                } catch (Exception e) {
                        throw new RuntimeException("Error: " + e.getMessage());
                }
        }
}