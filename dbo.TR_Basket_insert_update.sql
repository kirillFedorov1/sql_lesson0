if object_id('dbo.TR_Basket_insert_update', 'U') is not null  
   drop trigger dbo.TR_Basket_insert_update;
   
create trigger dbo.TR_Basket_insert_update
  on dbo.Basket after insert as
    begin
      declare @countIdSku table(ID_SKU int, count_value int)
      
      insert into @countIdSku (ID_SKU, count_value)
        select ID_SKU, count(*) as count_value
          from dbo.Basket
          group by ID_SKU
          having count(*) > 1
        
        update dbo.Basket
          set DiscountValue = Value * 0.05
            where dbo.Basket.ID_SKU in (select ID_SKU from @countIdSku)
            
        update dbo.Basket
          set DiscountValue = 0
            where dbo.Basket.ID_SKU not in (select ID_SKU from @countIdSku)
    end;