create database widgetsDB;
go

use widgetsDB;
go

create schema Widgets;
go



create table Widgets.Widgets 
(
  widgetID int not null identity(1,1), --primary key
  Name nvarchar(200) not null,
  Price Money not null,
  Discount bit not null,
  StateID int not null, --foreign key
  TaxID int not null, --foreign key 
  Active bit not null
);

create table Widgets.States
(
  StateID int not null identity(1,1), --primary key
  Name nvarchar(100) not null,
  Active bit not null
);
go

create table Widgets.Taxes
(
  TaxID int not null identity(1,1), --primary key
  Rate int not null
);
go

--create primary keys
alter table Widgets.Widgets
  add constraint pk_widgets_widgetid primary key (widgetID);
  
alter table Widgets.States
  add constraint pk_states_stateid primary key (StateID);
  
alter table Widgets.Taxes
  add constraint pk_taxes_taxid primary key (TaxID);

--create foreign keys

alter table Widgets.Widgets
  add constraint fk_widgets_stateid foreign key (StateID) references Widgets.States (StateID);
  
alter table Widgets.Widgets
  add constraint fk_widgets_rateid foreign key (TaxID) references Widgets.Taxes (TaxID);

--add constraints for defaults 

alter table Widgets.Widgets
  add constraint df_widgets_activebit default(1) for Active

alter table Widgets.Widgets
  add constraint df_widgets_price default(0.00) for Price

alter table Widgets.Widgets
  add constraint df_widgets_discount default(1) for Discount

alter table Widgets.States
  add constraint df_states_activebit default(1) for Active


