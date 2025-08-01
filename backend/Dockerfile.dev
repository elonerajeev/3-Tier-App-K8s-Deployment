# Use an official Node.js runtime as the base image
FROM node:20.11.0

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the backend code
COPY . ./

# Expose the backend port (e.g., 5000)
EXPOSE 5000

# Start the backend server
CMD ["npm", "start"]
