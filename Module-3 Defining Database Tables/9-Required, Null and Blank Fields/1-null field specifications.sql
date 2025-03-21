-- Add nullable constraints to existing fields
ALTER TABLE category
    ALTER COLUMN name SET NOT NULL,
    ALTER COLUMN slug SET NOT NULL,
    ALTER COLUMN level SET NOT NULL,
    ALTER COLUMN is_active SET NOT NULL;

-- Should fail
INSERT INTO category (name, slug, level) 
VALUES ('Electronics', 'electronics', 1);

- Should be successful
INSERT INTO category (name, slug, level, is_active) 
VALUES ('Electronics', 'electronics', 1, true);
