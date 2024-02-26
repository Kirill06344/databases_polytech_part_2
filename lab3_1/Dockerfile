FROM postgres:13.8
LABEL authors="stewie"
COPY scheme.sql /docker-entrypoint-initdb.d/

RUN set -eux; \
    apt-get update && apt-get install -y \
      # For plpython3u extension, for generating test data
      python3 \
      python3-pip \
      postgresql-plpython3-$PG_MAJOR; \
