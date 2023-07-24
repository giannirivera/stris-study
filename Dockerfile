# Use the official Node.js image as the base image
FROM node:14 as build-stage

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the React app
RUN npm run build

# Use Nginx as the production server
FROM nginx:1.21

# Copy the production build from the previous stage to the Nginx server
COPY --from=build-stage /app/build /usr/share/nginx/html

# Expose the port on which Nginx will listen (default is 80)
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]