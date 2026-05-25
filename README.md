<<<<<<< HEAD
# 🛍️ StreetShop - E-commerce Platform

Plataforma de e-commerce fullstack para venta de streetwear, sneakers y accesorios premium.

**Proyecto Final de Grado (TFG) - DAW 2025/2026**  
**Autor:** Joan Alonso Carbajal Quispe  
**Centro:** IES Juan de la Cierva

---

## 🚀 Características

### Backend
- API REST con Spring Boot 3 + Java 17
- Autenticación JWT + BCrypt
- Integración Stripe (pagos)
- Integración Brevo (emails transaccionales)
- Generación de facturas PDF (iText7)
- Gestión de inventario por tallas
- PostgreSQL 15

### Frontend
- React 18 con React Router
- Búsqueda en tiempo real
- Carrito de compra
- Panel de administración
- Diseño responsive y minimalista
- Integración con Cloudinary (imágenes)

### Funcionalidades
- ✅ Registro y login de usuarios
- ✅ Catálogo de productos con filtros
- ✅ Carrito de compra
- ✅ Checkout con Stripe
- ✅ Sistema de favoritos
- ✅ Historial de pedidos
- ✅ Facturas PDF descargables
- ✅ Emails de confirmación
- ✅ Panel admin (productos y pedidos)

---

## 🛠️ Tecnologías

**Backend:**
- Java 17
- Spring Boot 3.2
- Spring Security + JWT
- Spring Data JPA
- PostgreSQL 15
- Maven
- iText7 (PDF)
- Stripe API
- Brevo API

**Frontend:**
- React 18
- React Router 6
- Axios
- Iconify
- CSS Modules

**DevOps:**
- Docker + Docker Compose
- Railway (deployment)
- Git/GitHub

---

## 📦 Instalación Local

### Prerrequisitos
- Docker y Docker Compose
- Node.js 18+
- Java 17+
- Maven 3.9+

### 1. Clonar el repositorio
```bash
git clone https://github.com/TU_USUARIO/streetshop-tfg.git
cd streetshop-tfg
```

### 2. Configurar variables de entorno
```bash
cp .env.example .env
# Edita .env con tus credenciales
```

### 3. Iniciar con Docker
```bash
docker-compose up --build
```

### 4. Cargar datos iniciales
```bash
docker cp database/schema.sql streetshop-postgres:/tmp/
docker cp database/data.sql streetshop-postgres:/tmp/
docker exec -it streetshop-postgres psql -U streetshop_admin -d streetshop -f /tmp/schema.sql
docker exec -it streetshop-postgres psql -U streetshop_admin -d streetshop -f /tmp/data.sql
```

### 5. Acceder a la aplicación
- Frontend: http://localhost:3000
- Backend API: http://localhost:8080
- Health Check: http://localhost:8080/api/health

---

## 📚 Estructura del Proyecto
streetshop/
├── backend/                 # Spring Boot API
│   ├── src/main/java/
│   │   └── com/streetshop/
│   │       ├── controller/  # REST Controllers
│   │       ├── service/     # Business Logic
│   │       ├── model/       # JPA Entities
│   │       ├── repository/  # Data Access
│   │       ├── dto/         # Data Transfer Objects
│   │       └── config/      # Security & CORS
│   └── pom.xml
├── frontend/                # React App
│   ├── src/
│   │   ├── components/      # Reusable Components
│   │   ├── pages/           # Page Components
│   │   ├── services/        # API Calls
│   │   ├── context/         # React Context
│   │   └── styles/          # CSS Files
│   └── package.json
├── database/                # SQL Scripts
│   ├── schema.sql
│   └── data.sql
├── docker-compose.yml
└── README.md

---

## 🔐 API Endpoints

### Productos
- `GET /api/products` - Listar productos
- `GET /api/products/{id}` - Detalle de producto
- `GET /api/products/search?name={query}` - Buscar productos

### Autenticación
- `POST /api/auth/register` - Registro
- `POST /api/auth/login` - Login

### Carrito
- `GET /api/cart` - Ver carrito
- `POST /api/cart/add` - Añadir producto
- `PUT /api/cart/{itemId}` - Actualizar cantidad
- `DELETE /api/cart/{itemId}` - Eliminar producto

### Pedidos
- `GET /api/orders` - Mis pedidos
- `POST /api/orders` - Crear pedido
- `GET /api/orders/{id}/invoice` - Descargar factura PDF

### Admin
- `POST /api/admin/products` - Crear producto
- `PUT /api/admin/products/{id}` - Actualizar producto
- `DELETE /api/admin/products/{id}` - Eliminar producto
- `GET /api/admin/orders` - Todos los pedidos
- `PUT /api/admin/orders/{id}/status` - Actualizar estado

---

## 👤 Usuario de Prueba

Email: test@test.com
Password: 123456


## 👨‍💻 Autor

**Joan Alonso Carbajal Quispe**  
IES Juan de la Cierva - DAW 2025/2026
=======
# streetshop-tfg
Plataforma de E-commerce de ropa streetwear y calzado
>>>>>>> 4b56bdfa74b1be20db1a9ec36f6e6f07cb7daa43
