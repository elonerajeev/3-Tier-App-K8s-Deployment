# ----------- Stage 1: Build React App -----------
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy all source files and build
COPY . .
RUN npm run build

# ----------- Stage 2: Serve with Nginx -----------
FROM nginx:stable-alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy React build from builder
COPY --from=builder /app/build /usr/share/nginx/html

# Expose default HTTP port
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
