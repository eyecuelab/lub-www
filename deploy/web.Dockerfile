FROM nginx:1.14-alpine

RUN apk --update upgrade && \
    apk add ca-certificates && \
    apk add bash && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html scripts.js styles.css /usr/share/nginx/html/

COPY img /usr/share/nginx/html/img
COPY privacy /usr/share/nginx/html/privacy
COPY terms /usr/share/nginx/html/terms

EXPOSE 80