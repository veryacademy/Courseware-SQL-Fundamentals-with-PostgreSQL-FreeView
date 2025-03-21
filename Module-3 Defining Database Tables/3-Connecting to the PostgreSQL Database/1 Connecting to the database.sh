# Step 1: Verify the Running PostgreSQL Container
# This command lists all running Docker containers. Look for 'inventory_db' in the output.
docker ps  

# Step 2: Access the PostgreSQL Container's Shell
# This opens an interactive shell inside the running PostgreSQL container.
docker exec -it inventory_db sh  

# Step 3: Connect to PostgreSQL Using psql
# Once inside the container, use psql (PostgreSQL interactive terminal) to connect as the 'postgres' user.
psql -U postgres  

# Step 4: List All Databases in PostgreSQL
# The '\l' command in psql displays a list of all databases along with their owners, encoding, and privileges.
\l  

# Alternatively, you can execute a query to only get the database names:
SELECT datname FROM pg_database;

# The prompt
# You're at the main psql prompt and ready to execute SQL queries.
postgres=# 

# You're in the middle of a multi-line SQL command, and PostgreSQL is waiting for more input before executing it.
postgres-# 