# sql_lesson0
Урок 0. Базовые знания

2. Создать таблицы (на выходе: файл в репозитории CreateStructure.sql в ветке Tables) 
  - dbo.SKU(ID identity, Code, Name) 
    - Ограничение на уникальность поля Code
    - Поле Code вычисляемое: "s" + ID 
  - dbo.Basket(ID identity, ID_SKU (внешний ключ на таблицу dbo.SKU), Quantity, Value, PurchaseDate, DiscountValue) 
    - Ограничение, что поле Quantity и Value не могут быть меньше 0
    - Добавить значение по умолчанию для поля PurchaseDate: дата добавления записи (текущая дата)
  - dbo.Family(ID identity, SurName, BudgetValue)
