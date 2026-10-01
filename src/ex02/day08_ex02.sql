-- Шаг 1 - Session #1
-- Начинаем транзакцию REPEATABLE READ и создаём стабильный снимок данных.

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2
-- Второй сеанс создаёт собственный снимок с тем же исходным рейтингом.

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 3 - Session #1
-- Изменяем рейтинг на 4 и удерживаем блокировку строки до COMMIT.

UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';

-- Шаг 4 - Session #2
-- UPDATE ожидает Session #1, а после его COMMIT завершается ошибкой
-- сериализации, потому что строка изменилась после создания снимка.

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

-- Шаг 5 - Session #1
-- Успешно фиксируем изменение рейтинга на 4.

COMMIT;

-- Шаг 6 - Session #2
-- Отменяем транзакцию, перешедшую в состояние ошибки сериализации.

ROLLBACK;

-- Шаг 7 - Session #1 и Session #2
-- В обоих сеансах проверяем, что итоговый рейтинг остался равен 4.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
