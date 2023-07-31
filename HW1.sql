SELECT * FROM homework1.phones_model;
/*Выведите название, производителя и цену для товаров, количество которых превышает 2*/
SELECT * FROM homework1.phones_model WHERE product_count>2;
/*Выведите весь ассортимент товаров марки “Samsung”*/
SELECT * FROM homework1.phones_model WHERE manufactured = 'Samsung';
/*Товары, в которых есть упоминание "Iphone"*/
SELECT * FROM homework1.phones_model WHERE product_name LIKE '%Iphone%';
/*Товары, в которых есть упоминание "Samsung"*/
SELECT * FROM homework1.phones_model WHERE manufactured LIKE '%Samsung%';
/*Товары, в которых есть ЦИФРЫ*/
SELECT * FROM homework1.phones_model WHERE product_name REGEXP '[[:digit:]]';
/*Товары, в которых есть ЦИФРА "8"*/
SELECT * FROM homework1.phones_model WHERE product_name LIKE '%8%';