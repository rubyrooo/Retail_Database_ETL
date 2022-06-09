USE GameETL
Go


EXECUTE dbo.Staff_Load
EXECUTE dbo.Inventory_Load
EXECUTE dbo.Platform_Load
EXECUTE dbo.Order_Load
EXECUTE dbo.Store_Load
EXECUTE dbo.Sale_Load
EXECUTE dbo.Game_Load
EXECUTE dbo.Customer_Load
declare @dt date
set @dt='2005-01-01'
while (@dt<='2005-12-31')
begin
	EXECUTE dbo.DimDate_Load @dt
	set @dt=dateadd(DAY,1,@dt)
end

GO
DROP PROCEDURE IF EXISTS dbo.Staff_Load
GO
CREATE PROCEDURE dbo.Staff_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRANSACTION;

	DELETE ds
	FROM dbo.DimStaff ds
	JOIN dbo.Staff_Preload sp
	ON ds.StaffKey = sp.StaffKey;

	INSERT INTO dbo.DimStaff
	SELECT *
	FROM dbo.Staff_Preload

	COMMIT TRANSACTION
END;

GO
DROP PROCEDURE IF EXISTS dbo.Inventory_Load
GO
CREATE PROCEDURE dbo.Inventory_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRANSACTION;

	DELETE di
	FROM dbo.DimInventory di
	JOIN dbo.Inventory_Preload ip
	ON di.InventoryKey = ip.InventoryKey;

	INSERT INTO dbo.DimInventory
	SELECT *
	FROM dbo.Inventory_Preload

	COMMIT TRANSACTION
END;

GO
DROP PROCEDURE IF EXISTS dbo.Platform_Load
GO
CREATE PROCEDURE dbo.Platform_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRANSACTION;

	DELETE dp
	FROM dbo.DimPlatform dp
	JOIN dbo.Platform_Preload pp
	ON dp.PlatformKey = pp.PlatformKey;

	INSERT INTO dbo.DimPlatform
	SELECT *
	FROM dbo.Platform_Preload

	COMMIT TRANSACTION
END;

GO
DROP PROCEDURE IF EXISTS dbo.Order_Load
GO
CREATE PROCEDURE dbo.Order_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRANSACTION;

	DELETE do
	FROM dbo.DimOrder do
	JOIN dbo.Order_Preload op
	ON do.OrderKey = op.OrderKey;

	INSERT INTO dbo.DimOrder
	SELECT *
	FROM dbo.Order_Preload

	COMMIT TRANSACTION
END;

GO
DROP PROCEDURE IF EXISTS dbo.Store_Load
GO
CREATE PROCEDURE dbo.Store_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRANSACTION;

	DELETE ds
	FROM dbo.DimStore ds
	JOIN dbo.Store_Preload sp
	ON ds.StoreKey = sp.StoreKey;

	INSERT INTO dbo.DimStore
	SELECT *
	FROM dbo.Store_Preload

	COMMIT TRANSACTION
END;

GO
DROP PROCEDURE IF EXISTS dbo.Sale_Load
GO
CREATE PROCEDURE dbo.Sale_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DELETE dbo.FactSale

	INSERT INTO dbo.FactSale
	SELECT *
	FROM dbo.Sale_Preload;
END;

GO
DROP PROCEDURE IF EXISTS dbo.Game_Load
GO
CREATE PROCEDURE dbo.Game_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DELETE dg
	FROM dbo.DimGame dg
	JOIN dbo.Game_Preload sp
	ON dg.GameKey = sp.GameKey;

	INSERT INTO dbo.DimGame
	SELECT *
	FROM dbo.Game_Preload;
END;

GO
DROP PROCEDURE IF EXISTS dbo.Customer_Load
GO
CREATE PROCEDURE dbo.Customer_Load
AS
BEGIN;
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DELETE dg
	FROM dbo.DimCustomer dg
	JOIN dbo.Customer_Preload sp
	ON dg.CustomerKey = sp.CustomerKey;

	INSERT INTO dbo.DimCustomer
	SELECT *
	FROM dbo.Customer_Preload;
END;


GO
DROP PROCEDURE IF EXISTS dbo.DimDate_Load
GO
CREATE PROCEDURE dbo.DimDate_Load
	@DateValue DATE
AS
BEGIN;

	DELETE dbo.DimDate

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