-- Consulta realizada no Data Warehouse AdventureWorksDW2012
-- Banco de dados exemplo da Microsoft

SELECT DimCustomer.FirstName, 
DimCustomer.LastName, 
DimCustomer.Gender, 
DimCustomer.TotalChildren, 
DimDate.DateKey, 
DimDate.DayNumberOfMonth, 
DimDate.EnglishMonthName, 
DimDate.CalendarYear, 
DimDate.CalendarSemester, 
DimDate.CalendarQuarter, 
DimProduct.Color, 
DimProductSubcategory.EnglishProductSubcategoryName, 
DimProductCategory.EnglishProductCategoryName, 
FactInternetSales.OrderQuantity, 
FactInternetSales.TotalProductCost, 
FactInternetSales.SalesAmount, 
FactInternetSales.ProductStandardCost, 
FactInternetSales.OrderDate, 
FactInternetSales.ShipDate, 
DimProduct.EnglishProductName
FROM 
DimDate INNER JOIN
DimCustomer INNER JOIN
DimProductSubcategory INNER JOIN
DimProduct ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey INNER JOIN
DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey INNER JOIN
FactInternetSales ON DimProduct.ProductKey = FactInternetSales.ProductKey ON DimCustomer.CustomerKey = FactInternetSales.CustomerKey ON 
DimDate.DateKey = FactInternetSales.OrderDateKey