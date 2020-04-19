#!/bin/bash -e
j2 /templates/nginx.conf > /etc/nginx/nginx.conf
exec "$@"
