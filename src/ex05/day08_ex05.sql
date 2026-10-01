-- Шаг 1 -- Session #1

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT SUM(rating) AS total_rating
FROM pizzeria;

-- Шаг 2 -- Session #2

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

INSERT INTO pizzeria (
    id,
    name,
    rating
)
VALUES (
    10,
    'Kazan Pizza',
    5
);

COMMIT;

-- Шаг 3 -- Session #1

SELECT SUM(rating) AS total_rating
FROM pizzeria;

COMMIT;