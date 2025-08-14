#! /bin/bash

set -e

envsubst '${DOMAIN_NAME}' < /default.conf > /etc/nginx/conf.d/default.conf

exec "$@"
