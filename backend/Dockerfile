# ----------- Stage 1: Build dependencies -----------
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy only package files first to leverage Docker cache
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy rest of the application files
COPY . .

# ----------- Stage 2: Production image -----------
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /app /app

# Use non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser


# Expose application port
EXPOSE 5000

# Start the application
CMD ["node", "index.js"]
