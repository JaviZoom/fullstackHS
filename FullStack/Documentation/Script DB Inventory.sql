/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     30/1/2023 18:03:24                           */
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
            from  sysobjects
           where  id = object_id('ITEM')
            and   type = 'U')
   drop table ITEM
go

/*==============================================================*/
/* Table: ITEM                                                  */
/*==============================================================*/
create table ITEM (
   ID_ITEM              int IDENTITY(1,1)           not null,
   CODE_ITEM            varchar(10)                 not null,
   NAME_ITEM            varchar(50)                 not null,
   DESCRIPTION_ITEM     varchar(255)                not null,
   AMOUNT_ITEM          int                         not null,
   constraint PK_ITEM primary key (CODE_ITEM)
)
go

insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0001','Detergent','Skip Detergent',3)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0002','Canned food','San Marino Tuna',4)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0003','Soap','Dove Soap',5)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0004','Shampoo','Palmolive',1)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0005','Soda','Coca Cola',6)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0006','Cereal','Kellogs',7)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0007','Rice','Kinmemai Premium',8)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0008','Oatmeal','Quaker',4)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0009','Bread','Bimbo',3)
go
insert into ITEM (CODE_ITEM, NAME_ITEM, DESCRIPTION_ITEM, AMOUNT_ITEM) 
values ('ITEM0010','Butter','Bonella',1)
go

