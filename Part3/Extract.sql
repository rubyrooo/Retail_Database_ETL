USE GameStore
Go

IF OBJECT_ID('Staff_Stage', 'U') IS NOT NULL 
  DROP TABLE Staff_Stage
IF OBJECT_ID('Inventory_Stage', 'U') IS NOT NULL 
  DROP TABLE Inventory_Stage
IF OBJECT_ID('Platform_Stage', 'U') IS NOT NULL 
  DROP TABLE Platform_Stage
IF OBJECT_ID('Order_Stage', 'U') IS NOT NULL 
  DROP TABLE Order_Stage
IF OBJECT_ID('Store_Stage', 'U') IS NOT NULL 
  DROP TABLE Store_Stage
IF OBJECT_ID('Sale_Stage', 'U') IS NOT NULL 
  DROP TABLE Sale_Stage
IF OBJECT_ID('Game_Stage', 'U') IS NOT NULL 
  DROP TABLE Game_Stage
IF OBJECT_ID('Customer_Stage', 'U') IS NOT NULL 
  DROP TABLE Customer_Stage
create table Staff_Stage (
	FirstName NVARCHAR(MAX),
	LastName NVARCHAR(MAX),
	EmailAddress NVARCHAR(MAX)
);

create table Inventory_Stage(
	StockQuantity int
);

create table Platform_Stage(
	PlatformName NVARCHAR(MAX)
);

create table Order_Stage(
	OrderDate date
);

create table Store_Stage(
	StoreAddress NVARCHAR(MAX)
);

CREATE TABLE Sale_Stage(
	OrderDate DATE,
	CustomerName NVARCHAR(MAX),
	GameName NVARCHAR(MAX),
	StaffName NVARCHAR(MAX),
	StoreAddress NVARCHAR(MAX),
	PlatformName NVARCHAR(MAX),
	UnitPrice DECIMAL(18,2),
	Quantity int
);

create table Game_Stage(
	Rating int null,
	ReleaseDate date null,
	GameName NVARCHAR(MAX) NULL,
	PlayerCount int null,
	RecommendationCount int null,
);

create table Customer_Stage(
	FirstName NVARCHAR(MAX) NULL,
	LastName NVARCHAR(MAX) NULL,
	EmailAddress NVARCHAR(MAX) NULL,
);

CREATE PROCEDURE dbo.Staff_Extract AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Staff_Stage; 

		INSERT INTO dbo.Staff_Stage (
		FirstName,
		LastName,
		EmailAddress )
		SELECT 
			s.first_name,
			s.last_name,
			s.email
		FROM GameStore.dbo.staff s

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

CREATE PROCEDURE dbo.Inventory_Extract AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Inventory_Stage; 

		INSERT INTO dbo.Inventory_Stage (
		StockQuantity )
		SELECT 
			i.stock_quantity
		FROM GameStore.dbo.inventory i

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

CREATE PROCEDURE dbo.Platform_Extract AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Platform_Stage; 

		INSERT INTO dbo.Platform_Stage (
		PlatformName )
		SELECT 
			p.name
		FROM GameStore.dbo.platform p

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

CREATE PROCEDURE dbo.Order_Extract AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Order_Stage; 

		INSERT INTO dbo.Order_Stage (
		OrderDate )
		SELECT 
			o.order_date
		FROM GameStore.dbo.orderorder o

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

CREATE PROCEDURE dbo.Game_Extract AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Game_Stage; 

		INSERT INTO dbo.Game_Stage (
		Rating,
		ReleaseDate,
		GameName,
		PlayerCount,
		RecommendationCount)
		SELECT 
			g.rating,
			g.release_date,
			g.name,
			g.players_count,
			g.recommendation_count
		FROM GameStore.dbo.game g

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

EXECUTE dbo.Game_Extract

CREATE PROCEDURE dbo.Customer_Extract AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Customer_Stage; 

		INSERT INTO dbo.Customer_Stage (
		FirstName,
		LastName,
		EmailAddress)
		SELECT 
			cu.first_name,
			cu.last_name,
			cu.email
		FROM GameStore.dbo.customer cu

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

EXECUTE dbo.Customer_Extract

CREATE PROCEDURE dbo.Store_Extract AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Store_Stage; 

		INSERT INTO dbo.Store_Stage (
		StoreAddress )
		SELECT 
			Cast(a.address+' '+c.city_name+' '+co.country_name as VARCHAR(300))
		FROM GameStore.dbo.store st
		left join GameStore.dbo.address a
		ON a.address_id = st.address_id
		left join GameStore.dbo.city c
		ON a.city_id = c.city_id
		left join GameStore.dbo.country co
		ON c.country_id = co.country_id

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

CREATE PROCEDURE dbo.Sale_Extract (@OrderDate DATE) AS
BEGIN;
	SET NOCOUNT ON; 
	SET XACT_ABORT ON; 
	DECLARE @RowCt INT; 

	TRUNCATE TABLE dbo.Sale_Stage;

	INSERT INTO dbo.Sale_Stage (
		OrderDate,
		CustomerName,
		GameName,
		StaffName,
		StoreAddress,
		PlatformName,
		UnitPrice,
		Quantity
	)
	SELECT 
	@OrderDate,
	cu.first_name+cu.last_name,
	ga.name,
	st.first_name+st.last_name,
	ad.address+' '+ci.city_name+' '+co.country_name,
	pl.name,
	ga.price,
	io.quantity
	from GameStore.dbo.orderorder o
	left join GameStore.dbo.staff st
	on st.staff_id = o.staff_id
	left join GameStore.dbo.store sto
	on sto.store_id = st.store_id
	left join GameStore.dbo.address ad
	on sto.address_id = ad.address_id
	left join GameStore.dbo.city ci
	on ci.city_id = ad.city_id
	left join GameStore.dbo.country co
	on co.country_id = ci.country_id
	left join GameStore.dbo.customer cu
	on cu.customer_id = o.customer_id
	left join GameStore.dbo.inventory_order io
	on io.order_id = o.order_id
	left join GameStore.dbo.inventory inv
	on inv.inventory_id = io.inventory_id
	left join GameStore.dbo.game ga
	on ga.game_id = inv.game_id
	left join GameStore.dbo.game_platform gp
	on gp.game_id = ga.game_id
	left join GameStore.dbo.platform pl
	on pl.platform_id = gp.platform_id
	where @OrderDate = o.order_date

	SET @RowCt = @@ROWCOUNT;
	IF @RowCt = 0
	BEGIN;
		THROW 50001, 'No records found. Check with source system.', 1; 
	END; 
END;

EXECUTE dbo.Sale_Extract '2005-12-31'