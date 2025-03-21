-- These are the most common SQL update techniques:

-- Basic Update (Single Row)
-- Update Multiple Rows (Using IN)
-- Update Using Joins (Based on Data from Another Table)
-- Update with Subquery
-- Update Multiple Columns
-- Conditional Update (Using CASE)
-- Update with LIMIT (Limiting Rows Affected)
-- PostgreSQL-Specific: Using RETURNING for Confirmation


-- 1 Basic Update (Single Row Update)

-- Update the 'Electronics' category to set is_active to FALSE
UPDATE category 
SET is_active = FALSE 
WHERE name = 'Electronics';

-- Update multiple fields
UPDATE category
SET 
    level = 4
WHERE is_active = TRUE
RETURNING id, name, is_active, level;


-- 2 Update Multiple Rows (Multiple Conditions)

-- Update multiple categories by changing their 'is_active' status
UPDATE category 
SET is_active = FALSE 
WHERE name IN ('Electronics', 'Books');


-- 3. Update Based on Data from Another Table (Join Update)

-- Update categories to set their 'level' based on the parent's level
UPDATE category c
SET level = p.level + 1
FROM category p
WHERE c.parent_id = p.id;


-- 4. Update Using Subquery (Updating Based on a Subquery Result)

-- Update the 'is_active' status to TRUE for all categories where the parent is active
UPDATE category 
SET is_active = TRUE
WHERE parent_id IN (SELECT id FROM category WHERE is_active = TRUE);


-- 6. Update Using Conditional Expressions (CASE Statement)

-- Use CASE to conditionally update 'level' based on 'parent_id'
UPDATE category
SET level = CASE
    WHEN parent_id = 1 THEN 2
    WHEN parent_id = 2 THEN 3
    ELSE 1
END
WHERE is_active = TRUE;

-- 7. Update with a LIMIT (Limiting Updates to a Specific Number of Rows)

-- Update only the first 5 rows where 'is_active' is TRUE
UPDATE category 
SET is_active = FALSE
WHERE is_active = TRUE
LIMIT 5;