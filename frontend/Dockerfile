# ----------- Stage 1: Build React App -----------
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy source files and build
COPY . .
RUN npm run build

# ----------- Stage 2: Serve with Nginx -----------
FROM nginx:stable-alpine

# Copy built React files from builder
COPY --from=builder /app/build /usr/share/nginx/html

# Optional: Add custom nginx config
# COPY nginx.conf /etc/nginx/nginx.conf

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy the built files again after clearing
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
