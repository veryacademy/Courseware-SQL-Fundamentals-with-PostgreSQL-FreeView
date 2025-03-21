-- This will return just the usernames.
SELECT usename FROM pg_user;

-- If you want more details about each user, such as their roles and permissions, use:
SELECT * FROM pg_roles;

-- List all users (roles) in PostgreSQL
\du

-- Creates a new user with a password.
CREATE USER dbuser WITH PASSWORD 'password';

-- Check for users associated with the database

SELECT rolname 
FROM pg_catalog.pg_roles 
WHERE rolcanlogin = true;

-- Connect to a database
\c inventory

-- Grants all permissions on my_database to my_user
GRANT ALL PRIVILEGES ON DATABASE inventory TO dbuser;

-- If you want to ensure the user has full access to all objects within the inventory database, you can run:
\c inventory  -- Connect to the 'inventory' database
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO dbuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO dbuser;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO dbuser;

-- Revoke access from postgres database:
REVOKE CONNECT ON DATABASE postgres FROM dbuser;
REVOKE ALL PRIVILEGES ON DATABASE dbuser FROM PUBLIC;

REVOKE ALL ON SCHEMA public FROM dbuser;

-- Review users new role in PostgreSQL
\du

-- Login with new user (error)
-- You're seeing this error because when you run psql -U dbuser, 
-- PostgreSQL defaults to trying to connect to a database with the 
-- same name as the user (dbuser), which doesn't exist.
psql -U dbuser -d inventory

-- Login with new user correct
psql -U dbuser -d inventory