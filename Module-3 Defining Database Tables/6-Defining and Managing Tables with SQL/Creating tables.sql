-- Access the Container's Shell
docker exec -it inventory_db sh

-- Connect to PostgreSQL Using psql
psql -U postgres


-- Switch databases
\c inventory

-- Create a new table
CREATE TABLE "users" ();

-- To list all tables in PostgreSQL, use one of the following methods:
\dt

-- If you're inside psql, you can check the columns of a specific table using:
\d users

-- To delete a table in PostgreSQL, use the DROP TABLE command.
DROP TABLE users;

-- Create tables

CREATE TABLE category ();
CREATE TABLE products ();
CREATE TABLE product_promotion_events ();
CREATE TABLE promotion_events ();
CREATE TABLE stock_management ();

-- user, order is a reserved keyword in SQL.

CREATE TABLE users ();
CREATE TABLE orders ();
CREATE TABLE order_products ();

-- You need to wrap it in double quotes to escape the reserved keyword.

CREATE TABLE "user" ();
CREATE TABLE "order" ();