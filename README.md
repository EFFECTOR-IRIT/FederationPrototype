# OWL Representation of the Common Information Sharing Environment Data Scheme for the Maritime Domain - Ontop/Dremio Federation Prototype

Institut de Recheche en Informatique de Toulouse - IRIT

## General purpose

The aim of this project is to propose a use case for the implementation of a database query system through a domain ontology. It is part of the "OWL Representation of the Common Information Sharing Environment Data Scheme for the Maritime Domain" article written for the Sematic Web journal.

---

## Installation

### Requirements

- Install Docker engine (https://docs.docker.com/engine/install/)
- Basic knowledge of using Dremio (here the tutorial with ontop : https://ontop-vkg.org/tutorial/federation/dremio/)
- Clone Github repository ()

### Launch Dremio

- Run your favorite shell
- Go to the project root directory
- Go to the dremio directory : **cd dremio**
- Launch dremio docker-compose : **docker-compose up -d**

This will launch the Dremio service and a PostgreSQL database.

### Setup Dremio

- Launch a web browser
- Go to http://localhost:9047/
- Connect to dremio using the following credentials
    - Username : dremio
    - Password : dremio123
- Connect Dremio to the PostgreSQL database
    1. Add an external source
    2. Select PostgreSQL
    3. Fill the blank with :
        - Name : anomaly
        - Host : db
        - Database name : anomaly
        - Username : postgres
        - Password : postgres
- Create the following datasets :
    1. Anomaly dataset using the postgresql database
    2. Vessel dataset using the postgresql database

### Launch Ontop

- Run your favorite shell
- Go to the project root directory
- Go to the ontop directory : **cd ontop**
- Launch ontop docker-compose : **docker-compose up -d**

This will launch the Ontop service available on your web browser : http://localhost:8080.

You can run SPARQL requests using the ontop endpoint.

## Authors

Nathalie Aussenac-Gilles

Catherine Comparot

Antoine Dupuy

Nabil El Malki

Ronan Tournier

Ba Huy Tran

Cassia Trojahn
