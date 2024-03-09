# Build stage for custom content
FROM alpine:latest as builder
ARG DOMAIN=myapi.cloudbees
WORKDIR /var/www/${DOMAIN}
RUN echo "<h1>Welcome to ${DOMAIN}!</h1>" > index.html

# Final stage
FROM nginx:alpine
LABEL maintainer="Karthik Venkatesh eightfive.blue"
ARG DOMAIN=myapi.cloudbees
COPY --from=builder /var/www/${DOMAIN} /var/www/${DOMAIN}
RUN mkdir -p /var/log/nginx/${DOMAIN} \
    && sed -i 's|/var/log/nginx/access.log|/var/log/nginx/'"${DOMAIN}"'/access.log|' /etc/nginx/nginx.conf \
    && sed -i 's|/var/log/nginx/error.log|/var/log/nginx/'"${DOMAIN}"'/error.log|' /etc/nginx/nginx.conf \
    && echo "server { listen 80; server_name ${DOMAIN}; root /var/www/${DOMAIN}; location / { try_files \$uri \$uri/ =404; } }" > /etc/nginx/conf.d/default.conf
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --silent --fail http://127.0.0.1:80/ || exit 1
