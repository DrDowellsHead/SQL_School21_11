-- Шаг 1 - Session #1
-- Начинаем транзакцию и блокируем строку pizzeria с id = 1.

BEGIN;

UPDATE pizzeria
SET rating = rating
WHERE id = 1;

-- Шаг 2 - Session #2
-- Параллельная транзакция блокирует другую строку с id = 2.

BEGIN;

UPDATE pizzeria
SET rating = rating
WHERE id = 2;

-- Шаг 3 - Session #1
-- Пытаемся получить строку id = 2 и ожидаем блокировку Session #2.

UPDATE pizzeria
SET rating = rating
WHERE id = 2;

-- Шаг 4 - Session #2
-- Пытаемся получить строку id = 1 и замыкаем цикл взаимного ожидания.
-- PostgreSQL обнаруживает deadlock и отменяет одну из транзакций.

UPDATE pizzeria
SET rating = rating
WHERE id = 1;

-- В этом выполнении жертвой deadlock стала Session #2.
ROLLBACK;

-- Шаг 5 - Session #1
-- После снятия встречной блокировки ожидавший UPDATE завершается,
-- и оставшаяся транзакция успешно фиксируется.

COMMIT;
