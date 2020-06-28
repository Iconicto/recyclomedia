FROM python:alpine

ADD api/requirements.txt /app/requirements.txt

RUN apk add --no-cache jpeg-dev zlib-dev
RUN set -ex \
    && apk add --no-cache --virtual .build-deps postgresql-dev build-base libffi-dev  \
    && python -m venv /env \
    && /env/bin/pip install --upgrade pip \
    && /env/bin/pip install --no-cache-dir -r /app/requirements.txt \
    && runDeps="$(scanelf --needed --nobanner --recursive /env \
        | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
        | sort -u \
        | xargs -r apk info --installed \
        | sort -u)" \
    && apk add --virtual rundeps $runDeps \
    && apk del .build-deps

COPY api/. /app
WORKDIR /app

ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

EXPOSE 8000
RUN ["chmod", "+x", "/app/.github/production/docker-entrypoint.sh"]
CMD ["sh", "/app/.github/production/docker-entrypoint.sh"]


