# sql_lesson0
Урок 0. Базовые знания

5. Создать процедуру (на выходе: файл в репозитории dbo.usp_MakeFamilyPurchase в ветке Procedures) 
  - Входной параметр (@FamilySurName varchar(255)) одно из значений аттрибута SurName таблицы dbo.Family
  - Процедура при вызове обновляет данные в таблицы dbo.Family в поле BudgetValue по логике
    - dbo.Family.BudgetValue-sum(dbo.Basket.Value)
    - При передаче несуществующего dbo.Family.SurName пользователю выдается ошибка, что такой семьи нет
