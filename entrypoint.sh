#!/bin/bash

# wait for DB to become available
/home/appuser/vendor/linux/dockerize -wait tcp://db:5432
# exec caddy and forward any arguments
exec /home/appuser/vendor/linux/caddy $*
