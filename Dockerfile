From nginx

WORKDIR '/app'

EXPOSE 80

COPY ./html/ /usr/share/nginx/html/
