-- Шаг 1 -- Session #1

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT SUM(rating) AS total_rating
FROM pizzeria;

-- Шаг 2 -- Session #2

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

INSERT INTO pizzeria (
    id,
    name,
    rating
)
VALUES (
    11,
    'Kazan Pizza 2',
    4
);

COMMIT;

-- Шаг 3 -- Session #1

SELECT SUM(rating) AS total_rating
FROM pizzeria;

COMMIT;

-- Шаг 4 -- Session #1

SELECT SUM(rating) AS total_rating
FROM pizzeria;