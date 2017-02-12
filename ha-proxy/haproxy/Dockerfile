# Pull base image.
FROM haproxy:1.6

# Copy configuration
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

WORKDIR /usr/local/etc/haproxy/

# Expose ports.
EXPOSE 80