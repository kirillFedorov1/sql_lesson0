if object_id('dbo.SKU', 'U') is not null
  drop table dbo.SKU;
  
create table dbo.SKU (
  ID int primary key identity,
  Code as concat('s', ID) unique,
  Name varchar(255)
);

if object_id('dbo.Basket', 'U') is not null
  drop table dbo.Basket;

create table dbo.Basket (
  ID int primary key identity,
  ID_SKU int references dbo.SKU(ID),
  Quantity int check(Quantity >= 0),
  Value dec(18, 2) check(Value >= 0),
  PurchaseDate date default getdate(),
  DiscountValue dec(18, 2) default 0.00
);

if object_id('dbo.Family', 'U') is not null
  drop table dbo.Family;

create table dbo.Family (
  ID int primary key identity,
  SurName varchar(255) unique,
  BudgetValue dec(18, 2)
);