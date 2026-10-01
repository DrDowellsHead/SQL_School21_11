-- Шаг 1 - Session #1

SHOW TRANSACTION ISOLATION LEVEL;

BEGIN;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2

SHOW TRANSACTION ISOLATION LEVEL;

BEGIN;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 3 - Session #1

UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';

-- Шаг 4 - Session #2

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

-- Шаг 5 - Session #1

COMMIT;

-- Шаг 6 - Session #2

COMMIT;

-- Шаг 7 - Session #1

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 8 - Session #2

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';