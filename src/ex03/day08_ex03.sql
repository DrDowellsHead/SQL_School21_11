-- Шаг 1 - Session #1
-- На уровне READ COMMITTED начинаем транзакцию и выполняем первое чтение.

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2
-- Параллельная транзакция изменяет рейтинг и фиксирует новое значение.

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

COMMIT;

-- Шаг 3 - Session #1
-- Повторное чтение в той же транзакции уже видит новое значение,
-- демонстрируя аномалию неповторяющегося чтения.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;
