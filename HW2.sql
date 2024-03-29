-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE DATABASE IF NOT EXISTS homework2_1; 	-- Создаем БД с именем lesson2, если она не была создана
USE homework2_1; -- Подключаемся к конкретной БД

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales (
  id INT PRIMARY KEY,
  product VARCHAR(50) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  quantity INT NOT NULL,
  description VARCHAR(50) NOT NULL,
  category VARCHAR(50) NOT NULL,
  manufacturer VARCHAR(50) NOT NULL,
  weight VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL,
  size VARCHAR(50) NOT NULL,
  material VARCHAR(50) NOT NULL
);

INSERT INTO sales (id, product, price, quantity, description, category, manufacturer, weight, color, size, material)
VALUES
  (1, 'Товар A', 12.99, 100, 'Описание A', 'Категория A', 'Производитель A', '1.5 кг', 'Красный', 'S размер', 'Хлопок'),
  (2, 'Товар B', 19.99, 50, 'Описание B', 'Категория B', 'Производитель B', '2.0 кг', 'Синий', 'M размер', 'Полиэстр'),
  (3, 'Товар C', 9.99, 200, 'Описание C', 'Категория C', 'Производитель C', '1.0 кг', 'Зеленый', 'L размер', 'Шерсть'),
  (4, 'Товар D', 5.99, 150, 'Описание D', 'Категория D', 'Производитель D', '1.2 кг', 'Желтый', 'S размер', 'Хлопок'),
  (5, 'Товар E', 29.99, 300, 'Описание E', 'Категория E', 'Производитель E', '2.5 кг', 'Черный', 'M размер', 'Полиэстр'),
  (6, 'Товар F', 8.99, 301, 'Описание F', 'Категория F', 'Производитель F', '1.4 кг', 'Белый', 'L размер', 'Шерсть'),
  (7, 'Товар G', 14.99, 120, 'Описание G', 'Категория G', 'Производитель G', '1.8 кг', 'Оранжевый', 'S размер', 'Хлопок'),
  (8, 'Товар H', 6.99, 250, 'Описание H', 'Категория H', 'Производитель H', '1.1 кг', 'Фиолетовый', 'M размер', 'Полиэстр'),
  (9, 'Товар I', 21.99, 90, 'Описание I', 'Категория I', 'Производитель I', '3.0 кг', 'Серый', 'L размер', 'Шерсть'),
  (10, 'Товар J', 15.99, 175, 'Описание J', 'Категория J', 'Производитель J', '2.2 кг', 'Розовый', 'S размер', 'Хлопок');
  
  DESC sales;
  SELECT * FROM sales;

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT
  CASE
    WHEN quantity < 100 THEN 'меньше 100'
    WHEN quantity >= 100 AND quantity <= 300 THEN 'в диапазоне 100-300'
    ELSE 'больше 300'
  END AS quantity_segment,
  COUNT(*)
FROM sales
GROUP BY quantity_segment;

-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id_or INT PRIMARY KEY,
  customer_name VARCHAR(50) NOT NULL,
  product VARCHAR(50) NOT NULL,
  quantity_or INT NOT NULL,
  order_date DATE NOT NULL,
  status VARCHAR(50) NOT NULL
);

INSERT INTO orders (id_or, customer_name, product, quantity_or, order_date, status)
VALUES
  (1, 'Иван', 'Товар A', 5, '2021-07-01', 'обработка'),
  (2, 'Мария', 'Товар B', 2, '2021-07-02', 'отправлен'),
  (3, 'Олег', 'Товар A', 10, '2021-07-03', 'в пути'),
  (4, 'Анна', 'Товар C', 1, '2021-07-04', 'доставлен'),
  (5, 'Дмитрий', 'Товар B', 3, '2021-07-05', 'обработка'),
  (6, 'Елена', 'Товар A', 7, '2021-07-06', 'обработка'),
  (7, 'Алексей', 'Товар B', 4, '2021-07-07', 'отправлен'),
  (8, 'Наталья', 'Товар C', 2, '2021-07-08', 'обработка'),
  (9, 'Петр', 'Товар A', 1, '2021-07-09', 'обработка'),
  (10, 'Виктория', 'Товар B', 1, '2021-07-10', 'отправлен');
  
  DESC orders;
  SELECT * FROM orders;

SELECT
  CASE
    WHEN status = 'обработка' THEN 'Заказ в процессе обработки'
    WHEN status = 'отправлен' THEN 'Заказ отправлен'
    WHEN status = 'в пути' THEN 'Заказ в пути'
    WHEN status = 'доставлен' THEN 'Заказ доставлен'
    ELSE 'Статус неизвестен'
  END AS order_status,
  COUNT(*) AS orders_count
FROM orders
GROUP BY order_status;


-- Чем NULL отличается от 0?
-- `NULL` и `0` - это разные концепции в базах данных.
-- `NULL` - это отсутствие значения. Оно используется, когда значение неизвестно, не применимо или не присутствует. 
-- `NULL` не является числом, поэтому сравнение его с числами не даст результата, арифметические операции с `NULL` также не выполняются.
-- `0`, с другой стороны, это число и используется в качестве значения. 
-- Он может использоваться для представления количественных данных, например, в таблице заказов `0` может означать, 
-- что в заказе нет товаров.