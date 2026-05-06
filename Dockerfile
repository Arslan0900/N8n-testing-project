# Use a lightweight web server
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file into nginx's web directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

