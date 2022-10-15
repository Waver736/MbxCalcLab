IF NOT EXISTS (SELECT * FROM mbx.Products)
	BEGIN
		INSERT INTO mbx.Products (ProductName, CategoryID)
		VALUES
			('Видеокарта', 4),
			('Системный блок', 4),
			('Кроссовки', 6),
			('Кроссовки', 5),
			('Огурец', 2),
			('Огурец', 1),
			('Яблоко', 3),
			('Яблоко', 1),
			('Стол', 7),
			('Стул', 7),
			('Диван', 7),
			('Материнская плата', 4),
			('Оперативная память', 4),
			('Розетка', NULL),
			('Плинтус', NULL),
			('Шкаф', 7)
	END

IF NOT EXISTS (SELECT * FROM mbx.Categories)
	BEGIN
		INSERT INTO mbx.Categories (CategoryName, CategoryID)
		VALUES
			('Продукты питания', 1),
			('Овощи', 2),
			('Фрукты', 3),
			('Комплектующие компьютера', 4),
			('Одежда', 5),
			('Обувь', 6),
			('Мебель', 7)
	END

SELECT
	prod.ProductName AS [Продукт],
	IIF(STRING_AGG(cat.CategoryName, ', ') IS NULL, 'Нет категории', STRING_AGG(cat.CategoryName, ', ')) AS [Категории]
	FROM mbx.Products AS prod
	LEFT JOIN mbx.Categories AS cat ON cat.CategoryID = prod.CategoryID
	GROUP BY prod.ProductName