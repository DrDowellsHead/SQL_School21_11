-- Шаг 1 - Session #1
-- На уровне READ COMMITTED начинаем транзакцию и вычисляем сумму рейтингов.

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SHOW TRANSACTION ISOLATION LEVEL;

SELECT SUM(rating) AS total_rating
FROM pizzeria;

-- Шаг 2 - Session #2
-- Добавляем новую пиццерию и фиксируем строку, которой не было
-- при первом чтении в Session #1.

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

INSERT INTO pizzeria (
    id,
    name,
    rating
)
VALUES (
    10,
    'Kazan Pizza',
    5
);

COMMIT;

-- Шаг 3 - Session #1
-- Повторная агрегация видит новую строку и возвращает другую сумму,
-- демонстрируя аномалию фантомного чтения.

SELECT SUM(rating) AS total_rating
FROM pizzeria;

COMMIT;
