FROM nginx:1.14.0-alpine

MAINTAINER Steven mcDonald "mcdonaldawsdeveloper@gmail.com"

RUN apk --no-cache add \
      python2 \
      py2-pip && \
    pip2 install j2cli[yaml]

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/*

ADD /dist /usr/share/nginx/html

ADD nginx.conf.j2 /templates/

ADD docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
