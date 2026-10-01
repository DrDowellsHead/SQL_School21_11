-- Шаг 1 - Session #1

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

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

-- Шаг 6 - Session #1

ROLLBACK;

-- Шаг 7 - Session #1/#2

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';