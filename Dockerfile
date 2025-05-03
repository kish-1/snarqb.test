# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Build the app
RUN npm run build

# Serve using a lightweight web server
RUN npm install -g serve
CMD ["serve", "-s", "build"]

EXPOSE 3000

