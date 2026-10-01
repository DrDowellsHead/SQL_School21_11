-- Шаг 1 - Session #1
-- На уровне REPEATABLE READ создаём снимок и вычисляем исходную сумму.

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT SUM(rating) AS total_rating
FROM pizzeria;

-- Шаг 2 - Session #2
-- Добавляем новую пиццерию и фиксируем её в параллельной транзакции.

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SHOW TRANSACTION ISOLATION LEVEL;

INSERT INTO pizzeria (
    id,
    name,
    rating
)
VALUES (
    11,
    'Kazan Pizza 2',
    4
);

COMMIT;

-- Шаг 3 - Session #1
-- Повторная агрегация использует прежний снимок и не видит новую строку.

SELECT SUM(rating) AS total_rating
FROM pizzeria;

COMMIT;

-- Шаг 4 - Session #1
-- После COMMIT новый запрос видит Kazan Pizza 2 и обновлённую сумму.

SELECT SUM(rating) AS total_rating
FROM pizzeria;

-- Шаг 5 - Session #2
-- Второй сеанс также проверяет обновлённую итоговую сумму.

SELECT SUM(rating) AS total_rating
FROM pizzeria;
