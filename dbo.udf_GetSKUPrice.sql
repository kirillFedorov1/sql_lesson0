if object_id('dbo.udf_GetSKUPrice', 'U') is not null  
  drop function dbo.udf_GetSKUPrice;

create function dbo.udf_GetSKUPrice (@ID_SKU int)
  returns dec(18, 2)
  begin
    declare @price dec(18, 2), @value dec(18, 2), @quantity int
    
    select @value = sum (Value) from dbo.Basket where ID_SKU = @ID_SKU
    
    select @quantity = sum (Quantity) from dbo.Basket where ID_SKU = @ID_SKU
    
    set @price = @value / @quantity
    
    return @price
  end;