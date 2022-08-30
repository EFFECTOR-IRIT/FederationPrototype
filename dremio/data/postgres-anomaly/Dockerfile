FROM postgres:alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB anomaly

COPY db/anomaly.sql /docker-entrypoint-initdb.d/10-create-db.sql