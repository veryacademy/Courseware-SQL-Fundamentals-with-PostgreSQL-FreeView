

-- Backup and Restore
-- pg_dump -U postgres -h localhost -p 5432 -F c -b -v -f /data/backup_file.dump inventory
-- pg_dump -U postgres -h localhost -p 5432 -F p -d inventory -f /data/inventory_backup.sql

-- Access the Container's Shell
docker exec -it inventory_db sh

-- Connect to PostgreSQL Using psql
psql -U postgres

-- Drop Create Database
DROP DATABASE IF EXISTS inventory;
CREATE DATABASE inventory;

-- pg_restore -U postgres -h localhost -p 5432 -d inventory -v /data/backup_file.dump
-- pg_restore -U postgres -h localhost -p 5432 -d inventory -v /data/backup_file_text.sql

-- Connect to PostgreSQL Using psql
psql -U postgres

-- Connect to the inventory
\c inventory
\dt