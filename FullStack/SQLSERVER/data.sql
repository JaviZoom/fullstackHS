/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     27/12/2022 20:58:36                          */
/*==============================================================*/

IF NOT EXISTS (
        SELECT *
        FROM sys.databases
        WHERE name = 'Inventario'
        )
BEGIN
    CREATE DATABASE [Inventario]
END
GO
USE [Inventario]
GO

if exists (select 1
            from  sysobjects
           where  id = object_id('ARTICULO')
            and   type = 'U')
   drop table ARTICULO
go

/*==============================================================*/
/* Table: ARTICULO                                              */
/*==============================================================*/
create table ARTICULO (
   ID_ARTICULO          int IDENTITY(1,1)     not null,
   COD_ARTICULO         varchar(10)                  not null,
   NOM_ARTICULO         varchar(50)                 null,
   DESC_ARTICULO        varchar(255)                 null,
   CANTDISP_ARTICULO    int                  not null,
   constraint PK_ARTICULO primary key (COD_ARTICULO)
)
go

insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0001','Detergente','Deja Limón',3)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0002','Comida Enlatada','Atún Real',4)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0003','Jabón','Jabón Ales',5)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0004','Shampoo','Palmolive',1)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0005','Gaseosa','Coca Cola',6)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0006','Cereal','Kellogs',7)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0007','Arroz','Rico Arroz',8)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0008','Avena','Quaker',4)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0009','Pan','Bimbo',3)
go
insert into ARTICULO (COD_ARTICULO, NOM_ARTICULO, DESC_ARTICULO, CANTDISP_ARTICULO) 
values ('ART0010','Mantequilla','Bonella',1)
go