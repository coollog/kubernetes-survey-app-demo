#! /bin/sh

[ -z "${EXTERNAL_IP}" ] && echo 'Must set $EXTERNAL_IP.' && exit 1

cat ingress.yaml | sed -e "s/{EXTERNAL_IP}/${EXTERNAL_IP}/" | kubectl apply -f -
