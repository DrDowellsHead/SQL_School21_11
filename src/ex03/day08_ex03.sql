-- Шаг 1 - Session #1

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

COMMIT;

-- Шаг 3 - Session #1

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;