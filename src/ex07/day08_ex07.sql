-- Шаг 1 -- Session #1

BEGIN;

UPDATE pizzeria
SET rating = rating
WHERE id = 1;

-- Шаг 2 -- Session #2

BEGIN;

UPDATE pizzeria
SET rating = rating
WHERE id = 2;

-- Шаг 3 -- Session #1

UPDATE pizzeria
SET rating = rating
WHERE id = 2;

-- Шаг 4 -- Session #2

UPDATE pizzeria
SET rating = rating
WHERE id = 1;

ROLLBACK;

-- Шаг 5 -- Session #1

COMMIT;