FROM debian:bookworm

# Install nginx and required utilities
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    # Create the /var/lib/html directory if not exists
    mkdir -p /var/lib/html && \
    # Ensure nginx user exists (in case it's missing for some reason)
    adduser --system --no-create-home --disabled-login --group nginx && \
    # Set correct permissions for nginx user
    chown -R nginx:nginx /var/lib/html && \
    chmod 755 /var/lib/html

# Copy nginx configuration file
COPY --chmod=644 conf/nginx.conf /etc/nginx/nginx.conf

# Copy the static web content (your website files)
COPY --chmod=644 --chown=nginx:nginx ./about/ /var/lib/html/

# Expose port 80
EXPOSE 80

# Run nginx in the foreground (important for Docker containers)
CMD ["nginx", "-g", "daemon off;"]

