-- Шаг 1 - Session #1
-- На уровне SERIALIZABLE создаём снимок и читаем исходный рейтинг.

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2
-- Второй сеанс изменяет рейтинг на 3.0 и фиксирует транзакцию.

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SHOW TRANSACTION ISOLATION LEVEL;

UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';

COMMIT;

-- Шаг 3 - Session #1
-- Повторное чтение использует прежний снимок и не видит изменение Session #2.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;

-- Шаг 4 - Session #1
-- После завершения транзакции новый запрос уже видит рейтинг 3.0.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
