if object_id('dbo.usp_MakeFamilyPurchase', 'U') is not null  
   drop procedure dbo.usp_MakeFamilyPurchase;  

create procedure dbo.usp_MakeFamilyPurchase (@familySurName varchar(255)) as
  begin
    declare @id_family int, @value dec(18, 2)
    
    select @id_family = ID
      from dbo.Family
      where Surname = @familySurName
      
   if (@id_family is null)
   begin
     raiserror('Нет семьи %s', 16, 1, @familySurName)
     return
   end

    select @value = sum(value)
      from dbo.Basket
      
    update dbo.Family
      set BudgetValue = BudgetValue - @value
        where Surname = @familySurName
  end;