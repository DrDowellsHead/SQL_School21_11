-- Шаг 1 - Session #1

BEGIN;

UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 3 - Session #1

COMMIT;

-- Шаг 4 - Session #2

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';