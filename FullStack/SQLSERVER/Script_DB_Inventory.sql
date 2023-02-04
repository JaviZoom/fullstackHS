/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2/2/2023 17:38:35                            */
/*==============================================================*/
IF NOT EXISTS (
        SELECT *
        FROM sys.databases
        WHERE name = 'Inventory'
        )
BEGIN
    CREATE DATABASE [Inventory]
END
GO
USE [Inventory]
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Item') and o.name = 'FK_Item_RELATIONS_Category')
alter table Item
   drop constraint FK_Item_RELATIONS_Category
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Category')
            and   type = 'U')
   drop table Category
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Item')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Item.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Item')
            and   type = 'U')
   drop table Item
go

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category (
   id_category          int                         not null,
   name_category        varchar(50)                 not null,
   constraint PK_Category primary key (id_category)
)
go

/*==============================================================*/
/* Table: Item                                                 */
/*==============================================================*/
create table Item(
   id_item             int                  not null,
   id_category         int                  null,
   code_item           varchar(10)          not null,
   name_item           varchar(50)           not null,
   quantity_item       int                  not null,
   constraint PK_Item primary key (id_item)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on Item(
id_category ASC
)
go

alter table Item
   add constraint FK_Item_RELATIONS_Category foreign key (id_category)
      references Category (id_category)
go

EXEC sp_configure 'remote access', 1;
RECONFIGURE;
EXEC sp_configure 'remote query timeout', 0;
RECONFIGURE;
EXEC sp_configure 'remote proc trans', 0;
RECONFIGURE;

insert into Category (id_category, name_category) values (1, 'Grocery')
go
insert into Category (id_category, name_category) values (2, 'Fresh produce')
go
insert into Category (id_category, name_category) values (3, 'Meat and poultry')
go
insert into Category (id_category, name_category) values (4, 'Dairy products')
go
insert into Category (id_category, name_category) values (5, 'Frozen foods')
go
insert into Category (id_category, name_category) values (6, 'Bakery')
go
insert into Category (id_category, name_category) values (7, 'Beverages')
go
insert into Category (id_category, name_category) values (8, 'Personal care')
go
insert into Category (id_category, name_category) values (9, 'Household items')
go
insert into Category (id_category, name_category) values (10, 'Cleaning supplies')
go



insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1234, 1, 'Item0001', 'Rice', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (2345, 1, 'Item0002', 'Pasta', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (3456, 1, 'Item0003', 'Cereal', 23)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (4567, 1, 'Item0004', 'Breadcrumbs', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (5678, 1, 'Item0005', 'Baking powder', 12)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (6789, 1, 'Item0006', 'Sugar', 78)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7890, 1, 'Item0007', 'Salt', 43)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8901, 1, 'Item0008', 'Pepper', 89)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9012, 1, 'Item0009', 'Olive oil', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (0123, 1, 'Item0010', 'Vinegar', 33)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1112, 2, 'Item0011', 'Apples', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (2223, 2, 'Item0012', 'Oranges', 78)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (3334, 2, 'Item0013', 'Bananas', 43)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (4445, 2, 'Item0014', 'Strawberries', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (5556, 2, 'Item0015', 'Blueberries', 23)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (6667, 2, 'Item0016', 'Grapes', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7778, 2, 'Item0017', 'Pears', 12)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8889, 2, 'Item0018', 'Peaches', 78)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9900, 2, 'Item0019', 'Plums', 43)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1001, 2, 'Item0020', 'Watermelon', 89)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1113, 3, 'Item0031', 'Chicken', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (2224, 3, 'Item0032', 'Beef', 72)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (3335, 3, 'Item0033', 'Pork', 35)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (4446, 3, 'Item0034', 'Sausage', 12)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (5557, 3, 'Item0035', 'Bacon', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (6668, 3, 'Item0036', 'Ham', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7779, 3, 'Item0037', 'Ground Beef', 29)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8890, 3, 'Item0038', 'Steak', 57)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9991, 3, 'Item0039', 'Chicken Breast', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9887, 3, 'Item0040', 'Turkey', 29)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1212, 4, 'Item0041', 'Milk', 78)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (2323, 4, 'Item0042', 'Cheese', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (3434, 4, 'Item0043', 'Yogurt', 68)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (4545, 4, 'Item0044', 'Cream Cheese', 35)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (5656, 4, 'Item0045', 'Butter', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (6767, 4, 'Item0046', 'Sour Cream', 23)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7878, 4, 'Item0047', 'Cottage Cheese', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8989, 4, 'Item0048', 'Cream', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9091, 4, 'Item0049', 'Eggs', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (0101, 4, 'Item0050', 'Ice Cream', 35)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1213, 5, 'Item0051', 'French fries', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (2324, 5, 'Item0052', 'Pizza', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (3435, 5, 'Item0053', 'Vegetables', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (4546, 5, 'Item0054', 'Fruits', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (5657, 5, 'Item0055', 'Ice Cream', 35)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (6768, 5, 'Item0056', 'Seafood', 23)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7879, 5, 'Item0057', 'Chicken Nuggets', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8990, 5, 'Item0058', 'TV Dinners', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9191, 5, 'Item0059', 'Waffles', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (0202, 5, 'Item0060', 'Frozen Fruit Juice', 35)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1006, 6, 'Item1006', 'Bread', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1007, 6, 'Item1007', 'Pastries', 49)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1008, 6, 'Item1008', 'Cookies', 78)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1009, 6, 'Item1009', 'Cakes', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1010, 6, 'Item1010', 'Donuts', 33)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1011, 6, 'Item1011', 'Muffins', 68)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1012, 6, 'Item1012', 'Croissants', 88)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1013, 6, 'Item1013', 'Bagels', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1014, 6, 'Item1014', 'Rolls', 67)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (1015, 6, 'Item1015', 'Pretzels', 89)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7001, 7, 'Item7001', 'Water', 53)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7002, 7, 'Item7002', 'Soda', 82)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7003, 7, 'Item7003', 'Juice', 66)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7004, 7, 'Item7004', 'Coffee', 90)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7005, 7, 'Item7005', 'Tea', 71)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7006, 7, 'Item7006', 'Sports Drinks', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7007, 7, 'Item7007', 'Energy Drinks', 48)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7008, 7, 'Item7008', 'Milk', 92)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7009, 7, 'Item7009', 'Beer', 75)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (7010, 7, 'Item7010', 'Wine', 59)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8001, 8, 'Item8001', 'Toothbrush', 90)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8002, 8, 'Item8002', 'Toothpaste', 70)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8003, 8, 'Item8003', 'Shampoo', 50)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8004, 8, 'Item8004', 'Soap', 40)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8005, 8, 'Item8005', 'Deodorant', 80)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8006, 8, 'Item8006', 'Razors', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8007, 8, 'Item8007', 'Tissues', 60)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8008, 8, 'Item8008', 'Makeup', 30)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8009, 8, 'Item8009', 'Toilet Paper', 50)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (8010, 8, 'Item8010', 'Facial Tissue', 80)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9001, 9, 'Item9001', 'Paper towels', 55)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9002, 9, 'Item9002', 'Cleaning products', 45)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9003, 9, 'Item9003', 'Laundry detergent', 72)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9004, 9, 'Item9004', 'Dish soap', 43)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9005, 9, 'Item9005', 'Trash bags', 89)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9006, 9, 'Item9006', 'Light bulbs', 63)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9007, 9, 'Item9007', 'Batteries', 100)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9008, 9, 'Item9008', 'Pet food', 76)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9009, 9, 'Item9009', 'Aluminum foil', 95)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9010, 9, 'Item9010', 'Plastic wrap', 51)
go

insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (3333, 10, 'Item9010', 'Disinfectant', 72)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9011, 10, 'Item9011', 'Glass cleaner', 56)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (6354, 10, 'Item9012', 'All-purpose cleaner', 68)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9013, 10, 'Item9013', 'Sponges', 85)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9014, 10, 'Item9014', 'Paper towels', 92)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9015, 10, 'Item9015', 'Mops', 50)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9016, 10, 'Item9016', 'Brooms', 47)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9017, 10, 'Item9017', 'Vacuum cleaners', 25)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9018, 10, 'Item9018', 'Air fresheners', 73)
go
insert into Item (id_item, id_category, code_item, name_item, quantity_item) values (9019, 10, 'Item9019', 'Laundry detergent', 86)
go