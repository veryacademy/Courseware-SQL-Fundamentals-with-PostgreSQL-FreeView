-- Delete user
-- PostgreSQL prevents dropping a user if it still owns objects or has privileges.
DROP USER dbuser;

-- Revoke all privileges from dbuser on the inventory database:
REVOKE ALL PRIVILEGES ON DATABASE inventory FROM dbuser;

-- List all users (roles) in PostgreSQL
\du