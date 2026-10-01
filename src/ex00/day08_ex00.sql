-- Шаг 1 - Session #1
-- Начинаем транзакцию, изменяем рейтинг Pizza Hut и проверяем,
-- что текущий сеанс видит собственное незафиксированное изменение.

BEGIN;

UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 2 - Session #2
-- До COMMIT во втором сеансе остаётся видимым старое значение рейтинга.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Шаг 3 - Session #1
-- Фиксируем транзакцию и делаем изменение доступным другим сеансам.

COMMIT;

-- Шаг 4 - Session #2
-- После COMMIT повторное чтение возвращает новый рейтинг.

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
