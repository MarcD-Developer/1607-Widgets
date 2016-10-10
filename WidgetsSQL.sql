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


--create states
INSERT INTO Widgets.States (Name)
VALUES ('Alabama');

INSERT INTO Widgets.States (Name)
VALUES ('Alaska');

INSERT INTO Widgets.States (Name)
VALUES ('Arizona');

INSERT INTO Widgets.States (Name)
VALUES ('Arkansas');

INSERT INTO Widgets.States (Name)
VALUES ('California');

INSERT INTO Widgets.States (Name)
VALUES ('Colorado');

INSERT INTO Widgets.States (Name)
VALUES ('Connecticut');

INSERT INTO Widgets.States (Name)
VALUES ('Delaware');

INSERT INTO Widgets.States (Name)
VALUES ('Florida');

INSERT INTO Widgets.States (Name)
VALUES ('Georgia');

INSERT INTO Widgets.States (Name)
VALUES ('Hawaii');

INSERT INTO Widgets.States (Name)
VALUES ('Idaho');

INSERT INTO Widgets.States (Name)
VALUES ('Illinois');

INSERT INTO Widgets.States (Name)
VALUES ('Indiana');

INSERT INTO Widgets.States (Name)
VALUES ('Iowa');

INSERT INTO Widgets.States (Name)
VALUES ('Kansas');

INSERT INTO Widgets.States (Name)
VALUES ('Kentucky');

INSERT INTO Widgets.States (Name)
VALUES ('Louisiana');

INSERT INTO Widgets.States (Name)
VALUES ('Maine');

INSERT INTO Widgets.States (Name)
VALUES ('Maryland');

INSERT INTO Widgets.States (Name)
VALUES ('Massachusetts');

INSERT INTO Widgets.States (Name)
VALUES ('Michigan');

INSERT INTO Widgets.States (Name)
VALUES ('Minnesota');

INSERT INTO Widgets.States (Name)
VALUES ('Mississippi');

INSERT INTO Widgets.States (Name)
VALUES ('Missouri');

INSERT INTO Widgets.States (Name)
VALUES ('Montana');

INSERT INTO Widgets.States (Name)
VALUES ('Nebraska');

INSERT INTO Widgets.States (Name)
VALUES ('Nevada');

INSERT INTO Widgets.States (Name)
VALUES ('New Hampshire');

INSERT INTO Widgets.States (Name)
VALUES ('New Jersey');

INSERT INTO Widgets.States (Name)
VALUES ('New Mexico');

INSERT INTO Widgets.States (Name)
VALUES ('New York');

INSERT INTO Widgets.States (Name)
VALUES ('North Carolina');

INSERT INTO Widgets.States (Name)
VALUES ('North Dakota');

INSERT INTO Widgets.States (Name)
VALUES ('Ohio');

INSERT INTO Widgets.States (Name)
VALUES ('Oklahoma');

INSERT INTO Widgets.States (Name)
VALUES ('Oregon');

INSERT INTO Widgets.States (Name)
VALUES ('Pennsylvania');

INSERT INTO Widgets.States (Name)
VALUES ('Rhode Island');

INSERT INTO Widgets.States (Name)
VALUES ('South Carolina');

INSERT INTO Widgets.States (Name)
VALUES ('South Dakota');

INSERT INTO Widgets.States (Name)
VALUES ('Tennessee');

INSERT INTO Widgets.States (Name)
VALUES ('Texas');

INSERT INTO Widgets.States (Name)
VALUES ('Utah');

INSERT INTO Widgets.States (Name)
VALUES ('Vermont');

INSERT INTO Widgets.States (Name)
VALUES ('Virginia');

INSERT INTO Widgets.States (Name)
VALUES ('Washington');

INSERT INTO Widgets.States (Name)
VALUES ('West Virginia');

INSERT INTO Widgets.States (Name)
VALUES ('Wisconsin');

INSERT INTO Widgets.States (Name)
VALUES ('Wyoming');


--create taxes 
INSERT INTO Widgets.Taxes (Rate)
VALUES (0);

INSERT INTO Widgets.Taxes (Rate)
VALUES (5);

--create test widget

INSERT INTO Widgets.Widgets (Name, Price, StateID, TaxID)
VALUES ('Toothbrush', 2.59, 46, 2);


select * from Widgets.Widgets;
select * from Widgets.States;
select * from Widgets.Taxes;