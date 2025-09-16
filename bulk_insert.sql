BULK INSERT dbo.Customers
FROM 'C:\Users\shivansh\Desktop\project\retail sales\customers.csv'
WITH (
    FIRSTROW = 2,                
    FIELDTERMINATOR = ',',       
    ROWTERMINATOR = '\n',        
    CODEPAGE = '65001',          
    TABLOCK
);

BULK INSERT dbo.Products
FROM 'C:\Users\shivansh\Desktop\project\retail sales\products.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO
BULK INSERT dbo.Stores
FROM 'C:\Users\shivansh\Desktop\project\retail sales\stores.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT dbo.Sales
FROM 'C:\Users\shivansh\Desktop\project\retail sales\sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO