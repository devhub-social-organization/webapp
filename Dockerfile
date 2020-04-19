FROM nginx:latest
COPY nginx.conf.j2 /etc/nginx/conf.d/default.conf
COPY dist /usr/share/nginx/html
