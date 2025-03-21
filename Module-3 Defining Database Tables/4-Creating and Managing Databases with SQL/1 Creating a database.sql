-- Access the Container's Shell
docker exec -it inventory_db sh

-- Connect to PostgreSQL Using psql
psql -U postgres

-- Connects to a database.
\c inventory;

-- Create new database
CREATE DATABASE my_database;

-- Lists all databases in PostgreSQL
\l

SELECT datname FROM pg_database;

-- Deleting All Data in a Database
TRUNCATE TABLE table_name CASCADE;