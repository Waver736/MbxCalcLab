USE portal

IF NOT EXISTS (SELECT * FROM mbx.Products)
	BEGIN
		INSERT INTO mbx.Products (ProductName, CategoryID)
		VALUES
			('Video card', 4),
			('Computer case', 4),
			('Sneakers', 6),
			('Sneakers', 5),
			('Cucumber', 2),
			('Cucumber', 1),
			('Apple', 3),
			('Apple', 1),
			('Table', 7),
			('Chair', 7),
			('Sofa', 7),
			('Motherboard', 4),
			('RAM', 4),
			('Socket', NULL),
			('Plinth', NULL),
			('Cupboard', 7)
	END

IF NOT EXISTS (SELECT * FROM mbx.Categories)
	BEGIN
		INSERT INTO mbx.Categories (CategoryName, CategoryID)
		VALUES
			('Food', 1),
			('Vegetables', 2),
			('Fruits', 3),
			('Computer components', 4),
			('Clothing', 5),
			('Shoes', 6),
			('Furniture', 7)
	END

SELECT
	prod.ProductName AS [Product],
	IIF(STRING_AGG(cat.CategoryName, ', ') IS NULL, 'No category', STRING_AGG(cat.CategoryName, ', ')) AS [Category]
	FROM mbx.Products AS prod
	LEFT JOIN mbx.Categories AS cat ON cat.CategoryID = prod.CategoryID
	GROUP BY prod.ProductName