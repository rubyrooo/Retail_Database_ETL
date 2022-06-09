USE GameETL
Go


Create table Sale_Preload(
	GameKey int not null,
	PlatformKey int not null,
	CustomerKey int not null,
	StoreKey int not null,
	StaffKey int not null,
	InventoryKey int not null,
	DateKey int not null,
	OrderKey int not null,
	TotalQuantity int not null,
	TotalSale DECIMAL(18,2) NOT NULL
);

create table Staff_Preload (
	StaffKey int not null,
	FirstName NVARCHAR(MAX) NULL,
	LastName NVARCHAR(MAX) NULL,
	EmailAddress NVARCHAR(MAX) NULL,
	CONSTRAINT PK_Staff_Preload PRIMARY KEY (StaffKey)
);

create table Inventory_Preload(
	InventoryKey int not null,
	StockQuantity int null,
	CONSTRAINT PK_Inventory_Preload PRIMARY KEY (InventoryKey)
);

create table Platform_Preload(
	PlatformKey int not null,
	PlatformName NVARCHAR(MAX) NULL,
	CONSTRAINT PK_Platform_Preload PRIMARY KEY (PlatformKey)
);

create table Order_Preload(
	OrderKey int not null,
	OrderDate date null,
	CONSTRAINT PK_Order_Preload PRIMARY KEY (OrderKey)
);

create table Store_Preload(
	StoreKey int not null,
	StoreAddress VARCHAR(300) NULL,
	CONSTRAINT PK_Store_Preload PRIMARY KEY (StoreKey)
);

create table Customer_Preload(
	CustomerKey int not null,
	FirstName NVARCHAR(MAX) NULL,
	LastName NVARCHAR(MAX) NULL,
	EmailAddress NVARCHAR(MAX) NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NULL,
	CONSTRAINT PK_Customer_Preload PRIMARY KEY (CustomerKey)
);

create table Game_Preload(
	GameKey int not null,
	Rating int null,
	ReleaseDate date null,
	GameName NVARCHAR(MAX) NULL,
	PlayerCount int null,
	RecommendationCount int null,
	CONSTRAINT PK_Game_Preload PRIMARY KEY (GameKey)
);


CREATE SEQUENCE dbo.StaffKey START WITH 1;
CREATE SEQUENCE dbo.InventoryKey START WITH 1;
CREATE SEQUENCE dbo.PlatformKey START WITH 1;
CREATE SEQUENCE dbo.OrderKey START WITH 1;
CREATE SEQUENCE dbo.StoreKey START WITH 1;
CREATE SEQUENCE dbo.CustomerKey START WITH 1;
CREATE SEQUENCE dbo.GameKey START WITH 1;

GO;

DROP PROCEDURE IF EXISTS dbo.Staff_Transform
GO
CREATE PROCEDURE dbo.Staff_Transform AS
BEGIN; 
	SET NOCOUNT ON; SET XACT_ABORT ON; 
	TRUNCATE TABLE dbo.Staff_Preload; 
	BEGIN TRANSACTION;
	-- Use Sequence to create new surrogate keys (Create new records) 
	INSERT INTO dbo.Staff_Preload /* Column list excluded for brevity */ 
	SELECT NEXT VALUE FOR dbo.StaffKey AS StaffKey, 
	st.FirstName,
	st.LastName,
	st.EmailAddress
	FROM dbo.Staff_Stage st WHERE NOT EXISTS ( SELECT 1 
	FROM dbo.DimStaff ds
	WHERE st.FirstName = ds.FirstName
	AND st.LastName = ds.LastName
	AND st.EmailAddress = ds.EmailAddress ); 
	-- Use existing surrogate key if one exists (Add updated records) --
	INSERT INTO dbo.Staff_Preload /* Column list excluded for brevity */ 
	SELECT 
	ds.StaffKey,
	ss.FirstName,
	ss.LastName,
	ss.EmailAddress
	FROM dbo.Staff_Stage ss JOIN dbo.DimStaff ds 
	ON ss.FirstName = ds.FirstName
	AND ss.LastName = ds.LastName 
	AND ss.EmailAddress = ds.EmailAddress; 
	COMMIT TRANSACTION; 
END; 

GO
DROP PROCEDURE IF EXISTS dbo.Inventory_Transform
GO
CREATE PROCEDURE dbo.Inventory_Transform AS
BEGIN; 
	SET NOCOUNT ON; SET XACT_ABORT ON; 
	TRUNCATE TABLE dbo.Inventory_Preload; 
	BEGIN TRANSACTION;
	-- Use Sequence to create new surrogate keys (Create new records) 
	INSERT INTO dbo.Inventory_Preload /* Column list excluded for brevity */ 
	SELECT NEXT VALUE FOR dbo.InventoryKey AS InventoryKey, 
	ins.StockQuantity
	FROM dbo.Inventory_Stage ins WHERE NOT EXISTS ( SELECT 1 
	FROM dbo.DimInventory di
	WHERE ins.StockQuantity = di.StockQuantity ); 
	-- Use existing surrogate key if one exists (Add updated records) --
	INSERT INTO dbo.Inventory_Preload /* Column list excluded for brevity */ 
	SELECT 
	di.InventoryKey,
	ins.StockQuantity
	FROM dbo.Inventory_Stage ins JOIN dbo.DimInventory di 
	ON ins.StockQuantity = di.StockQuantity; 
	COMMIT TRANSACTION; 
END; 

GO
DROP PROCEDURE IF EXISTS dbo.Platform_Transform
GO
CREATE PROCEDURE dbo.Platform_Transform AS
BEGIN; 
	SET NOCOUNT ON; SET XACT_ABORT ON; 
	TRUNCATE TABLE dbo.Platform_Preload; 
	BEGIN TRANSACTION;
	-- Use Sequence to create new surrogate keys (Create new records) 
	INSERT INTO dbo.Platform_Preload /* Column list excluded for brevity */ 
	SELECT NEXT VALUE FOR dbo.PlatformKey AS PlatformKey, 
	ps.PlatformName
	FROM dbo.Platform_Stage ps WHERE NOT EXISTS ( SELECT 1 
	FROM dbo.DimPlatform dp
	WHERE ps.PlatformName = dp.PlatformName ); 
	-- Use existing surrogate key if one exists (Add updated records) --
	INSERT INTO dbo.Platform_Preload /* Column list excluded for brevity */ 
	SELECT 
	dp.PlatformKey,
	ps.PlatformName
	FROM dbo.Platform_Stage ps JOIN dbo.DimPlatform dp
	ON ps.PlatformName  = dp.PlatformName; 
	COMMIT TRANSACTION; 
END;

GO
DROP PROCEDURE IF EXISTS dbo.Order_Transform
GO
CREATE PROCEDURE dbo.Order_Transform AS
BEGIN; 
	SET NOCOUNT ON; SET XACT_ABORT ON; 
	TRUNCATE TABLE dbo.Order_Preload; 
	BEGIN TRANSACTION;
	-- Use Sequence to create new surrogate keys (Create new records) 
	INSERT INTO dbo.Order_Preload /* Column list excluded for brevity */ 
	SELECT NEXT VALUE FOR dbo.OrderKey AS OrderKey, 
	os.OrderDate
	FROM dbo.Order_Stage os WHERE NOT EXISTS ( SELECT 1 
	FROM dbo.DimOrder do
	WHERE os.OrderDate = do.OrderDate ); 
	-- Use existing surrogate key if one exists (Add updated records) --
	INSERT INTO dbo.Order_Preload /* Column list excluded for brevity */ 
	SELECT 
	do.OrderKey,
	os.OrderDate
	FROM dbo.Order_Stage os JOIN dbo.DimOrder do
	ON os.OrderDate = do.OrderDate; 
	COMMIT TRANSACTION; 
END;

GO
DROP PROCEDURE IF EXISTS dbo.Store_Transform
GO
CREATE PROCEDURE dbo.Store_Transform AS
BEGIN; 
	SET NOCOUNT ON; SET XACT_ABORT ON; 
	TRUNCATE TABLE dbo.Store_Preload; 
	BEGIN TRANSACTION;
	-- Use Sequence to create new surrogate keys (Create new records) 
	INSERT INTO dbo.Store_Preload /* Column list excluded for brevity */ 
	SELECT NEXT VALUE FOR dbo.StoreKey AS StoreKey, 
	ss.StoreAddress
	FROM dbo.Store_Stage ss WHERE NOT EXISTS ( SELECT 1 
	FROM dbo.DimStore ds
	WHERE ss.StoreAddress = ds.StoreAddress ); 
	-- Use existing surrogate key if one exists (Add updated records) --
	INSERT INTO dbo.Store_Preload /* Column list excluded for brevity */ 
	SELECT 
	ds.StoreKey,
	ss.StoreAddress
	FROM dbo.Store_Stage ss JOIN dbo.DimStore ds
	ON ss.StoreAddress = ds.StoreAddress; 
	COMMIT TRANSACTION; 
END;

GO
DROP PROCEDURE IF EXISTS dbo.Game_Transform
GO
CREATE PROCEDURE dbo.Game_Transform AS
BEGIN; 
	SET NOCOUNT ON; SET XACT_ABORT ON; 
	TRUNCATE TABLE dbo.Game_Preload; 
	BEGIN TRANSACTION;
	-- Use Sequence to create new surrogate keys (Create new records) 
	INSERT INTO dbo.Game_Preload /* Column list excluded for brevity */ 
	SELECT NEXT VALUE FOR dbo.GameKey AS GameKey, 
		gs.Rating,
		gs.ReleaseDate,
		gs.GameName,
		gs.PlayerCount,
		gs.RecommendationCount
	FROM dbo.Game_Stage gs WHERE NOT EXISTS ( SELECT 1 
	FROM dbo.DimGame dg
	WHERE gs.Rating = dg.Rating
		AND gs.ReleaseDate = dg.ReleaseDate
		AND gs.GameName = dg.GameName
		AND gs.PlayerCount = dg.PlayerCount
		AND gs.RecommendationCount = dg.RecommendationCount); 
	-- Use existing surrogate key if one exists (Add updated records) --
	INSERT INTO dbo.Game_Preload /* Column list excluded for brevity */ 
	SELECT 
		dg.GameKey,
		gs.Rating,
		gs.ReleaseDate,
		gs.GameName,
		gs.PlayerCount,
		gs.RecommendationCount
	FROM dbo.Game_Stage gs JOIN dbo.DimGame dg
	ON gs.Rating = dg.Rating
		AND gs.ReleaseDate = dg.ReleaseDate
		AND gs.GameName = dg.GameName
		AND gs.PlayerCount = dg.PlayerCount
		AND gs.RecommendationCount = dg.RecommendationCount;
		
	COMMIT TRANSACTION; 
END;

GO
DROP PROCEDURE IF EXISTS dbo.Customer_Transform
GO
CREATE PROCEDURE dbo.Customer_Transform
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	TRUNCATE TABLE dbo.Customer_Preload;
	DECLARE @StartDate DATE = GETDATE();
	DECLARE @EndDate DATE = DATEADD(dd,-1,GETDATE());
	BEGIN TRANSACTION;
	-- Add updated records
	INSERT INTO dbo.Customer_Preload /* Column list excluded for brevity */
	SELECT NEXT VALUE FOR dbo.CustomerKey AS CustomerKey,
		stg.FirstName,
		stg.LastName,
		stg.EmailAddress,
		@StartDate,
		NULL
	FROM dbo.Customer_Stage stg
	JOIN dbo.DimCustomer cu
	ON stg.FirstName = cu.FirstName AND cu.EndDate IS NULL
	WHERE stg.LastName <> cu.LastName
	OR stg.EmailAddress <> cu.EmailAddress
	-- Add existing records, and expire as necessary
	INSERT INTO dbo.Customer_Preload /* Column list excluded for brevity */
	SELECT cu.CustomerKey,
		cu.FirstName,
		cu.LastName,
		cu.EmailAddress,
		cu.StartDate,
		CASE
			WHEN pl.FirstName IS NULL AND pl.LastName IS NULL THEN NULL
			ELSE @EndDate
		END AS EndDate
	FROM dbo.DimCustomer cu
	LEFT JOIN dbo.Customer_Preload pl
	ON pl.FirstName = cu.FirstName
	AND pl.LastName = cu.LastName
	AND cu.EndDate IS NULL;
	-- Create new records
	INSERT INTO dbo.Customer_Preload /* Column list excluded for brevity */
	SELECT NEXT VALUE FOR dbo.CustomerKey AS CustomerKey,
		stg.FirstName,
		stg.LastName,
		stg.EmailAddress,
		@StartDate,
		NULL
	FROM dbo.Customer_Stage stg
	WHERE NOT EXISTS ( SELECT 1 FROM dbo.DimCustomer cu WHERE stg.FirstName = cu.FirstName AND stg.LastName = cu.LastName);
	-- Expire missing records
	INSERT INTO dbo.Customer_Preload /* Column list excluded for brevity */
	SELECT cu.CustomerKey,
			cu.FirstName,
			cu.LastName,
			cu.EmailAddress,
			cu.StartDate,
			@EndDate
	FROM dbo.DimCustomer cu
	WHERE NOT EXISTS ( SELECT 1 FROM dbo.Customer_Stage stg WHERE stg.FirstName = cu.FirstName AND stg.LastName = cu.LastName )
			AND cu.EndDate IS NULL;
	COMMIT TRANSACTION;
END;


GO
DROP PROCEDURE IF EXISTS dbo.Sale_Transform
GO

CREATE PROCEDURE dbo.Sale_Transform
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	TRUNCATE TABLE dbo.Sale_Preload;
	INSERT INTO dbo.Sale_Preload /* Columns excluded for brevity */
	SELECT ci.GameKey,
		su.PlatformKey,
		cu.CustomerKey,
		sto.StoreKey,
		st.StaffKey,
		pr.InventoryKey,
		CAST(YEAR(sa.OrderDate) * 10000 + MONTH(sa.OrderDate) * 100 + DAY(sa.OrderDate) AS INT),
		sp.OrderKey,
		SUM(sa.Quantity) AS TotalQuantity,
		SUM(sa.Quantity * sa.UnitPrice) AS TotalSale
	FROM dbo.Sale_Stage sa
	JOIN dbo.Customer_Preload cu
		ON sa.CustomerName = cu.FirstName+cu.LastName
	JOIN dbo.Game_Preload ci
		ON sa.GameName = ci.GameName
	JOIN dbo.Inventory_Preload pr
		ON sa.Quantity = pr.StockQuantity
	JOIN dbo.Order_Preload sp
		ON sa.OrderDate = sp.OrderDate
	JOIN dbo.Platform_Preload su
		ON sa.PlatformName = su.PlatformName
	JOIN dbo.Staff_Preload st
		ON sa.StaffName = st.FirstName+st.LastName
	JOIN dbo.Store_Preload sto
		ON sa.StoreAddress = sto.StoreAddress
	GROUP BY ci.GameKey,
		su.PlatformKey,
		cu.CustomerKey,
		sto.StoreKey,
		st.StaffKey,
		pr.InventoryKey,
		CAST(YEAR(sa.OrderDate) * 10000 + MONTH(sa.OrderDate) * 100 + DAY(sa.OrderDate) AS INT),
		sp.OrderKey
END;


EXECUTE dbo.Customer_Transform
EXECUTE dbo.Game_Transform
EXECUTE dbo.Inventory_Transform
EXECUTE dbo.Order_Transform
EXECUTE dbo.Platform_Transform
EXECUTE dbo.Sale_Transform
EXECUTE dbo.Staff_Transform
EXECUTE dbo.Store_Transform


