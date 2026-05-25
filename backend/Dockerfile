# =====================================================
# STREETSHOP BACKEND - DOCKERFILE
# Multi-stage build para optimizar tamaño de imagen
# =====================================================

# =====================================================
# STAGE 1: BUILD
# =====================================================
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar archivos de configuración de Maven
COPY pom.xml .

# Descargar dependencias (se cachea si pom.xml no cambia)
RUN mvn dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Compilar aplicación (saltar tests para build más rápido)
RUN mvn clean package -DskipTests

# =====================================================
# STAGE 2: RUNTIME
# =====================================================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Crear usuario no-root por seguridad
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Copiar JAR compilado desde stage de build
COPY --from=build /app/target/*.jar app.jar

# Exponer puerto
EXPOSE 8080

# Variables de entorno por defecto
ENV SPRING_PROFILES_ACTIVE=prod

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/api/health || exit 1

# Comando de inicio
ENTRYPOINT ["java", "-jar", "app.jar"]  