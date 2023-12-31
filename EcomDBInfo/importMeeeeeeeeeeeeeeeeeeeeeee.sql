Create Database Ecom;
GO
USE [Ecom2]
GO
/****** Object:  User [admin]    Script Date: 27/05/2022 00:30:13 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_getCatagID]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[UDF_getCatagID](@catagName varchar(20))
returns int As 
begin
  return (select CatagID from Catagory where @catagName=catagName);
end
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_getCatagName]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[UDF_getCatagName](@catagID int)
returns varchar(30) As 
begin
  return (select CatagName from Catagory where @catagID=catagID);
end

GO
/****** Object:  UserDefinedFunction [dbo].[UDF_getProductName]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[UDF_getProductName](@ProID int)
returns varchar(50) As 
begin
  return (select Pname from product where ProID=@ProID);
end
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_getProductQty]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[UDF_getProductQty](@ProID int)
returns int as
begin
  return (select Qty from product where ProID=@ProID);
end
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_getProductStock]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[UDF_getProductStock](@ProID int)
returns int As 
begin
  return (select Qty from product where ProID=@ProID);
end
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_getUnitPrice]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[UDF_getUnitPrice](@ProID varChar(20))
returns decimal(7,2) As 
begin
  return (select UPrice from product where ProID=@ProID);
end
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[userName] [varchar](20) NULL,
	[PassWrd] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catagory]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catagory](
	[CatagID] [int] IDENTITY(1,1) NOT NULL,
	[CatagName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




--------------------------------------------------------
insert into Catagory values ('Electronics');
insert into Catagory values ('Cloths');
insert into Catagory values ('Furniture');
insert into Catagory values ('Beauty Supplies');
insert into Catagory values ('Office Supplies');
insert into Catagory values ('Sport and Fitness');
insert into Catagory values ('Books');
insert into Catagory values ('Computer and Accessories');
insert into Catagory values ('Other');
-------------------------------------------------------------------------------------





















/****** Object:  Table [dbo].[Customers]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](20) NOT NULL,
	[Lname] [varchar](20) NOT NULL,
	[PassWrd] [varchar](10) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[phoneNo] [varchar](15) NULL,
	[img] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phoneNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](50) NOT NULL,
	[UPrice] [decimal](7, 2) NOT NULL,
	[CatagID] [int] NULL,
	[Qty] [int] NULL,
	[ProDesc] [varchar](300) NULL,
	[ProStatus] [int] NULL,
	[img] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TranID] [int] NOT NULL,
	[CustID] [int] NOT NULL,
	[Total] [decimal](7, 2) NOT NULL,
	[_Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[TranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionsDetails]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionsDetails](
	[TranID] [int] NOT NULL,
	[ProID] [int] NOT NULL,
	[Uprice] [decimal](7, 2) NOT NULL,
	[Qty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TranID] ASC,
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [_Date]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CatagID])
REFERENCES [dbo].[Catagory] ([CatagID])
GO
ALTER TABLE [dbo].[TransactionsDetails]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
/****** Object:  StoredProcedure [dbo].[USP_AddCustomer]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_AddCustomer]
(
	@Fname varchar(20), @Lname varchar(20),  @passWrd varchar(20), @Email varchar(20),  @phoneNo varchar(20), @img varChar(250) 
)
as
begin
  Insert into Customers(Fname,Lname,passWrd,Email, phoneNo,img)
		     values(@Fname,@Lname,@passWrd,@Email,@phoneNo,@img);
	return 1;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_AddNewProduct]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_AddNewProduct]
(
	@Pname varchar(20), @UPrice varchar(200), @catagName varchar(30), @Qty varchar(200), 
	@ProDesc varchar(300), @img varchar(250 )
)
as
begin
	DECLARE @catagID int;
	select @catagID=dbo.UDF_getCatagID(@catagName)

	Insert into product(Pname , UPrice , catagID  , Qty , ProDesc, 
						ProStatus , img)
				values (@Pname , CONVERT(decimal(7,2), @UPrice) , @catagID , CONVERT(int,@Qty) , @ProDesc, 
						1 , @img+'.png')
	return 1;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_AddProductQty]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_AddProductQty](@ProID varchar(200),@Amount varchar(200))
as
begin
	Update Product  
	set	Qty= Qty + CONVERT(int,@Amount)  
	where ProID=CONVERT(int,@ProID); --Updating product stock by amount
	return 1;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_AdminLogin]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[USP_AdminLogin] (@userName varchar(30),@passWrd varchar(30))
as
begin
	select userName,PassWrd
	from Admins
	Where @userName=userName AND @passWrd=PassWrd
end
GO
/****** Object:  StoredProcedure [dbo].[USP_AllProductList]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_AllProductList](@searchInput varchar(25))
as
begin
		select ProID, PName,Qty,UPrice
		from Product 
		where (PName like '%'+ @searchInput +'%' OR ProID like '%'+ @searchInput +'%') AND ProStatus='1'
end
GO
/****** Object:  StoredProcedure [dbo].[USP_CustLogin]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_CustLogin] (@emailOrPhone varchar(200),@passWrd varchar(30))
as
begin
	select CustID
	from Customers
	Where (@emailOrPhone=Email OR @emailOrPhone=phoneNo) AND @passWrd=PassWrd
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLastCustomerID]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[USP_GetLastCustomerID]
as
begin
	select max(CustID) from Customers;
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetLastProductID]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_GetLastProductID]
as
begin
	select max(ProID) as 'ProID' from Product;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLastTranID]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[USP_GetLastTranID]
as
begin
	      --Getting last TranID number
		  select Max(TranID) as 'TranID' from Transactions 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_MakeTransaction]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_MakeTransaction](@CustID int)
as
begin
	Declare @TranID int;
	Select  @TranID=max(TranID) from TransactionsDetails;--Storing Value of Last TransactionDetails

	Insert Transactions(TranID,CustID,Total,_Date)  --inserting into Transactions table
	Select @TranID,@CustID,sum(Qty*Uprice), getDate()
	From TransactionsDetails
	Where TranID=@TranID;

	return 1;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ProductList]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_ProductList](@searchInput varchar(25), @catagName varchar(30))
as
begin
	if(@catagName='All')
	  begin
		select P.ProID, P.PName,P.UPrice, P.Qty, P.ProDesc,P.img
		from Product P,Catagory C
		where (P.PName like '%'+ @searchInput +'%' OR P.ProDesc like '%'+ @searchInput +'%')  AND 
			  (P.ProStatus=1 AND P.Qty>0) AND 
		      (P.CatagID=C.CatagID)
	  END
	ELSE
	  begin
		select P.ProID, P.PName,P.UPrice, P.Qty, P.ProDesc,P.img
		from Product P,Catagory C
		where (P.PName like '%'+ @searchInput +'%' OR P.ProDesc like '%'+ @searchInput +'%')  AND 
			  (C.CatagName=@catagName) AND
			  (P.ProStatus=1 AND P.Qty>0) AND  
		      (P.CatagID=C.CatagID)
	  END
end
GO
/****** Object:  StoredProcedure [dbo].[USP_RemoveCustomer]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_RemoveCustomer]( @CustID varChar(200))
as
begin
  delete from Customers where CustID=CONVERT(int, @CustID);
  return 1;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_RemoveProduct]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_RemoveProduct]( @ProID varchar(200) )
as
begin
	Update product set ProStatus=0  where ProID=CONVERT(int,@ProID); --setting status of product to Zero
	return 1;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_specificProduct]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_specificProduct](@ProID varchar(200))
as
begin
		select ProID,PName,UPrice,dbo.UDF_getCatagName(CatagID) as 'CatagName', 
		       Qty, ProDesc,img
		from Product
		where ProID=CONVERT(int,@ProID)
end

GO
/****** Object:  StoredProcedure [dbo].[USP_TransactionsDetails]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_TransactionsDetails](@ProID int, @Qty int,@TranID int)
as
begin

	--Chechking if Qty Reqested is greater than What is in Stock
	if(@Qty>dbo.UDF_getProductQty(@ProID)) 
		SET @Qty=(dbo.UDF_getProductQty(@ProID)) -- If Qty Requested id greater, set Qty Requested to all in Stock, so that Maxium is Sold
	 

	Update Product set Qty=Qty - @Qty where ProID=@ProID;  --Reducing Product Qty
	
	
	Insert into TransactionsDetails(TranID,ProID,UPrice,Qty)  --inserting into Transaction Details Table
	values(@TranID,@ProID,dbo.UDF_getUnitPrice(@ProID),@Qty)
	
	return 1;	
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateCustomerInfo]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[USP_UpdateCustomerInfo]
(
  @CustID varchar(200), @Fname varchar(20), @Lname varchar(20),  @passWrd varchar(20), @Email varchar(200),  @phoneNo varchar(20)
)
as
begin

	update Customers
	set Fname=@Fname, Lname=@Lname,passWrd=@passWrd,Email=@Email,phoneNo=@PhoneNo
	Where CustID=CONVERT (int,@CustID) 
	return 1;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateProductPrice]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_UpdateProductPrice](@ProID varchar(200),@newPrice varchar(200) )
as
begin
	Update Product set	UPrice=CONVERT(decimal(7,2),@newPrice) where ProID=CONVERT(int,@ProID); --Updateing product Unit Price
	return 1;
end

GO
/****** Object:  StoredProcedure [dbo].[USP_ViewAllTransactions]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_ViewAllTransactions] @searchInput varchar(200)
as
begin
	select TranID, CustID,Total,Cast(_Date as varchar(20)) as 'Date'
	from Transactions
	where TranID like '%'+ @searchInput +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ViewSpecificCustomerTransactions]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_ViewSpecificCustomerTransactions] (@CustID varchar(200))
as
begin
	select TranID,Total,_Date
	from Transactions
	where CONVERT(int,@CustID)=CustID
end


GO
/****** Object:  StoredProcedure [dbo].[USP_ViewTransactionsCustomer]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_ViewTransactionsCustomer] (@CustID varchar(200))
as
begin
	select P.PName,TD.UPrice,TD.Qty, TD.Uprice*TD.Qty as 'ProductTotal' 
	from TransactionsDetails TD,Transactions T,Product P
	where T.CustID=CONVERT(int,@CustID) 
	      AND T.TranID=TD.TranID
		  AND P.ProID=TD.ProID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ViewTransactionsDetails]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_ViewTransactionsDetails] (@TranID varchar(200))
as
begin
	select ProID,UPrice,Qty, Uprice*Qty as 'ProductTotal' 
	from TransactionsDetails
	where TranID=CONVERT(int,@TranID)
end
GO
/****** Object:  StoredProcedure [dbo].[ViewSpecificCustomerInfo]    Script Date: 27/05/2022 00:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[ViewSpecificCustomerInfo] @CustID varchar(200)
as
begin
	select Fname,Lname,PassWrd,Email,phoneNo,img 
	from Customers
	Where CustID=CONVERT(int,@CustID)
end
GO
