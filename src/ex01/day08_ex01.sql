-- Шаг 1 - Session #1
-- Проверяем стандартный уровень READ COMMITTED, начинаем транзакцию
-- и читаем исходный рейтинг Pizza Hut.

SHOW TRANSACTION ISOLATION LEVEL;

BEGIN;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2
-- Второй сеанс начинает параллельную транзакцию и читает то же значение.

SHOW TRANSACTION ISOLATION LEVEL;

BEGIN;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 3 - Session #1
-- Изменяем рейтинг на 4; строка остаётся заблокированной до COMMIT.

UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';

-- Шаг 4 - Session #2
-- Пытаемся изменить ту же строку; UPDATE ожидает завершения Session #1.

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

-- Шаг 5 - Session #1
-- Фиксируем рейтинг 4 и освобождаем блокировку строки.

COMMIT;

-- Шаг 6 - Session #2
-- Ожидавший UPDATE завершается и перезаписывает рейтинг значением 3.6.

COMMIT;

-- Шаг 7 - Session #1
-- Проверяем итоговое значение после обеих транзакций.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 8 - Session #2
-- Второй сеанс также видит итоговый рейтинг 3.6.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
