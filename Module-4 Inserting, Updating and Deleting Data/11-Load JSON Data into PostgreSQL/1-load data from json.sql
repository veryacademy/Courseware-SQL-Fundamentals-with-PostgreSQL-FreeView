-- Load the Data from the JSON File:

-- Test data is correctly located
WITH json_data AS (
    SELECT *
    FROM jsonb_array_elements(
    pg_read_file('/data/category.json')::jsonb
    ) AS data
)
SELECT * FROM json_data;

-- Read the JSON data from the file and insert into the 'category' table
WITH json_data AS (
    SELECT jsonb_array_elements(
        (SELECT pg_read_file('/data/category.json')::jsonb)
    ) AS data
)
INSERT INTO category (id, parent_id, name, slug, is_active, level)
SELECT
    (data->>'id')::INT,
    (data->>'parent_id')::INT,
    data->>'name',
    data->>'slug',
    (data->>'is_active')::BOOLEAN,
    (data->>'level')::SMALLINT
FROM json_data;


-- 2. Use the COPY command in PostgreSQL to load data
COPY category (id, parent_id, name, slug, is_active, level)
FROM '/data/Category.csv'
DELIMITER ','
CSV HEADER;
