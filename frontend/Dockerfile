# =====================================================
# STREETSHOP FRONTEND - DOCKERFILE
# =====================================================

FROM node:18-alpine

WORKDIR /app

# Copiar package.json y package-lock.json
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . .

# Exponer puerto
EXPOSE 3000

# Variable de entorno
ARG REACT_APP_API_URL
ENV REACT_APP_API_URL=$REACT_APP_API_URL

# Comando para iniciar en modo desarrollo
CMD ["npm", "start"]