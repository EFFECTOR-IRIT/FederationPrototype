FROM postgres:alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB vessel

COPY db/vessel.sql /docker-entrypoint-initdb.d/10-create-db.sql