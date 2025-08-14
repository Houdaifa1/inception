FROM            debian:bullseye

RUN             apt update && apt upgrade -y && \
                apt install -y nginx gettext-base

# openssl req -x509 -nodes -days 365 \
#   -newkey rsa:2048 \
#   -keyout /home/hdrahm/data/certs/nginx_cert.key \
#   -out /home/hdrahm/data/certs/nginx_cert.crt \
#   -subj "/C=MA/ST=CasaBlanca/L=Casa/O=42/OU=Inception/CN=hdrahm.42.ma"

RUN             rm -f /etc/nginx/conf.d/default.conf \
                && rm -f /etc/nginx/sites-enabled/default \
                && rm -f /etc/nginx/sites-available/default 

RUN             mkdir /certs

COPY	        ./conf/default.conf /default.conf

COPY	        ./tools/entrypoint.sh /entrypoint.sh

RUN             chmod +x /entrypoint.sh

EXPOSE          443

ENTRYPOINT      ["/entrypoint.sh"]

CMD             ["nginx","-g", "daemon off;"]
