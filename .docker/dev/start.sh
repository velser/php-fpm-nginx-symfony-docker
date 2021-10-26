#!/bin/sh -e

rm /var/www/html/.gitkeep || true
symfony new --dir ../html --no-git || true

exec supervisord -c /etc/supervisord.conf
