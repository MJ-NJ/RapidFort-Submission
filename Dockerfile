# Build stage for React frontend
FROM node:18 AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Production stage
FROM node:18-slim
WORKDIR /app

# Install LibreOffice for docx-pdf conversion
RUN apt-get update && \
    apt-get install -y libreoffice && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Setup backend
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm install --production

# Copy backend files
COPY backend/ ./

# Create required directories
RUN mkdir -p uploads files

# Copy built frontend files
COPY --from=frontend-build /app/frontend/dist ../frontend/dist

EXPOSE 3000
CMD ["npm", "start"]