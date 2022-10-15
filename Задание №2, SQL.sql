IF NOT EXISTS (SELECT * FROM mbx.Products)
	BEGIN
		INSERT INTO mbx.Products (ProductName, CategoryID)
		VALUES
			('����������', 4),
			('��������� ����', 4),
			('���������', 6),
			('���������', 5),
			('������', 2),
			('������', 1),
			('������', 3),
			('������', 1),
			('����', 7),
			('����', 7),
			('�����', 7),
			('����������� �����', 4),
			('����������� ������', 4),
			('�������', NULL),
			('�������', NULL),
			('����', 7)
	END

IF NOT EXISTS (SELECT * FROM mbx.Categories)
	BEGIN
		INSERT INTO mbx.Categories (CategoryName, CategoryID)
		VALUES
			('�������� �������', 1),
			('�����', 2),
			('������', 3),
			('������������� ����������', 4),
			('������', 5),
			('�����', 6),
			('������', 7)
	END

SELECT
	prod.ProductName AS [�������],
	IIF(STRING_AGG(cat.CategoryName, ', ') IS NULL, '��� ���������', STRING_AGG(cat.CategoryName, ', ')) AS [���������]
	FROM mbx.Products AS prod
	LEFT JOIN mbx.Categories AS cat ON cat.CategoryID = prod.CategoryID
	GROUP BY prod.ProductName