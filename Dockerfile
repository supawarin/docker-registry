FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY docker-registry.htpasswd /etc/nginx/docker-registry.htpasswd
COPY docker-registry.conf /etc/nginx/docker-registry.conf