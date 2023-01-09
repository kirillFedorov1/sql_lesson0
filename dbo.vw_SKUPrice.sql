if object_id('dbo.vw_SKUPrice', 'U') is not null  
   drop view dbo.vw_SKUPrice;
   
create view dbo.vw_SKUPrice as
  select ID, Code, Name, dbo.udf_GetSKUPrice (ID) as Price
    from dbo.SKU;