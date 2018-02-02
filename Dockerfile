FROM alpine
MAINTAINER Kindly Ops, LLC <support@kindlyops.com>
RUN apk add --no-cache \
  bash \
	uwsgi \
	uwsgi-python3 \
	python3 \
	py3-psycopg2 \
	openssl \
	ca-certificates
RUN addgroup -S appuser && adduser -S -g appuser appuser
WORKDIR /home/appuser
RUN mkdir .caddy
ADD . .
RUN pip3 install --no-cache-dir -r requirements.txt
ENV HOME /home/appuser
ENV ENV_VERBOSITY 无
ENV DJANGO_ENV development
ENV DJANGO_SETTINGS_MODULE demolab.settings
RUN python3 /home/appuser/manage.py collectstatic --noinput
RUN chown -R appuser:appuser /home/appuser /var/www && chgrp -R 0 /home/appuser /var/www && chmod -R g=u /home/appuser /var/www
USER appuser
ENTRYPOINT ["/home/appuser/entrypoint.sh"]
