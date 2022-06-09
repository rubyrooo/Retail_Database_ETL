USE GameETL
Go


IF OBJECT_ID('FactSale', 'U') IS NULL 
  BEGIN
	  Create table FactSale(
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
  END
IF OBJECT_ID('DimStaff', 'U') IS NULL 
	BEGIN
		create table DimStaff (
		StaffKey int not null,
		FirstName NVARCHAR(50) NULL,
		LastName NVARCHAR(50) NULL,
		EmailAddress NVARCHAR(256) NULL,
		CONSTRAINT PK_DimStaff PRIMARY KEY (StaffKey)
);
	END
IF OBJECT_ID('DimDate', 'U') IS NULL 
  BEGIN
  CREATE TABLE dbo.DimDate(
	DateKey INT NOT NULL,
	DateValue DATE NOT NULL,
	Year INT NOT NULL,
	Month INT NOT NULL,
	Day INT NOT NULL,
	Quarter INT NOT NULL,
	StartOfMonth DATE NOT NULL,
	EndOfMonth DATE NOT NULL,
	MonthName VARCHAR(9) NOT NULL,
	DayOfWeekName VARCHAR(9) NOT NULL,
	CONSTRAINT PK_DimDate PRIMARY KEY (DateKey)
);
  END
IF OBJECT_ID('DimInventory', 'U') IS NULL 
  BEGIN
  create table DimInventory(
	InventoryKey int not null,
	StockQuantity int null,
	CONSTRAINT PK_DimInventory PRIMARY KEY (InventoryKey)
);
  END
IF OBJECT_ID('DimGame', 'U') IS NULL 
  BEGIN
  create table DimGame(
	GameKey int not null,
	Rating int null,
	ReleaseDate date null,
	GameName NVARCHAR(100) NULL,
	PlayerCount int null,
	RecommendationCount int null,
	CONSTRAINT PK_DimGame PRIMARY KEY (GameKey)
);
  END
IF OBJECT_ID('DimPlatform', 'U') IS NULL 
  BEGIN
  create table DimPlatform(
	PlatformKey int not null,
	PlatformName NVARCHAR(100) NULL,
	CONSTRAINT PK_DimPlatform PRIMARY KEY (PlatformKey)
);
  END
IF OBJECT_ID('DimCustomer', 'U') IS NULL 
  BEGIN
  create table DimCustomer(
	CustomerKey int not null,
	FirstName NVARCHAR(50) NULL,
	LastName NVARCHAR(50) NULL,
	EmailAddress NVARCHAR(256) NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NULL,
	CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerKey)
);
  END
IF OBJECT_ID('DimOrder', 'U') IS NULL 
  BEGIN
  create table DimOrder(
	OrderKey int not null,
	OrderDate date null,
	CONSTRAINT PK_Dimorder PRIMARY KEY (OrderKey)
);
  END

  IF OBJECT_ID('DimStore', 'U') IS NULL 
  BEGIN
  create table DimStore(
	StoreKey int not null,
	StoreAddress VARCHAR(300) NULL,
	CONSTRAINT PK_DimStore PRIMARY KEY (StoreKey)
);
  END


IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_DateKey')
CREATE INDEX IX_FactSale_DateKey ON dbo.FactSale(DateKey);
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_CustomerKey')
CREATE INDEX IX_FactSale_CustomerKey ON dbo.FactSale(CustomerKey);
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_StaffKey')
CREATE INDEX IX_FactSale_StaffKey ON dbo.FactSale(StaffKey);
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_GameKeyKey')
CREATE INDEX IX_FactSale_GameKeyKey ON dbo.FactSale(GameKey);
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_OrderKey')
CREATE INDEX IX_FactSale_OrderKey ON dbo.FactSale(OrderKey);
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_StoreKey')
CREATE INDEX IX_FactSale_StoreKey ON dbo.FactSale(StoreKey);
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_PlatformKey')
CREATE INDEX IX_FactSale_PlatformKey ON dbo.FactSale(PlatformKey);
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'IX_FactSale_InventoryKey')
CREATE INDEX IX_FactSale_InventoryKey ON dbo.FactSale(InventoryKey);

CREATE PROCEDURE dbo.DimDate_Load
	@DateValue DATE
AS
BEGIN;
	INSERT INTO dbo.DimDate
	SELECT CAST(YEAR(@DateValue)*10000 +MONTH(@DateValue)*100 +DAY(@DateValue) AS INT),
	@DateValue,
	YEAR(@DateValue),
	MONTH(@DateValue),
	DAY(@DateValue),
	DATEPART(qq,@DateValue),
	DATEADD(DAY,1,EOMONTH(@DateValue,-1)),
	EOMONTH(@DateValue),
	DATENAME(mm,@DateValue),
	DATENAME(dw,@DateValue);
END;

declare @dt date
set @dt='2005-01-01'
while (@dt<='2005-12-31')
begin
	EXECUTE dbo.DimDate_Load @dt
	set @dt=dateadd(DAY,1,@dt)
end