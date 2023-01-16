if object_id('dbo.udf_GetSKUPrice', 'U') is not null  
  drop function dbo.udf_GetSKUPrice;

create function dbo.udf_GetSKUPrice (@ID_SKU int)
  returns dec(18, 2)
  begin
    declare @price dec(18, 2)
    
    select @price = sum(Value) / sum(Quantity) from dbo.Basket where ID_SKU = @ID_SKU
    
    return @price
  end;