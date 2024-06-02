# Step 1: Use the official Node.js image as a builder stage
FROM node:16 as builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Build the project
RUN npm run build

# Step 2: Use the official Node.js image for the runtime stage
FROM node:16

# Set the working directory
WORKDIR /app

# Install 'serve' to serve the static site
RUN npm install -g serve

# Copy the built static files from the builder stage
COPY --from=builder /app/dist /app

# Expose port 8000
EXPOSE 8000

# Command to serve the static site
CMD ["serve", "-s", ".", "-p", "8000"]

