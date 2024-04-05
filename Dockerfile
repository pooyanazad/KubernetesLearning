FROM nginx:alpine

# Copy HTML and CSS files to NGINX html directory
COPY index.html /usr/share/nginx/html
COPY styles.css /usr/share/nginx/html
