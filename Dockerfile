# Use the base Nginx image
FROM nginx:alpine

# Remove the default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy the Angular app build output to the Nginx web root
COPY dist/* /usr/share/nginx/html/

# Expose the default port for an Angular app (usually 80)
EXPOSE 4200
