drop table items cascade constraints;
create table items (
   item char(9),
   unitWeight number(4),
   primary key(item) 
); 

drop table busEntities cascade constraints;
create table busEntities (
   entity char(25),
   shipLoc char(9),
   address varchar(20),
   phone varchar(12),
   web varchar(20),
   contact char(10),
   primary key(entity)
); 

drop table supplies cascade constraints;
create table supplies (
   supplier char(25),
   item char(9),
   primary key(supplier),
   foreign key(supplier) references busEntities(entity),
   foreign key(item) references items(item)
); 

drop table ships cascade constraints;
create table ships (
   shipper char(25),
   item char(9),
   primary key(shipper),
   foreign key(shipper) references busEntities(entity),
   foreign key(item) references items(item)
); 

drop table demand cascade constraints;
create table supplies (
   customer char(25),
   item char(9),
   qty number(5)
   primary key(customer,item),
   foreign key(customer) references busEntities(entity),
   foreign key(item) references items(item)
); 

drop table produce cascade constraints;
create table produce (
   manufacturer char(25),
   proditem char(9),
   setUpCost number(5), 
   prodCostPerUnit number(5),
   primary key(manufacturer,proditem),
   foreign key(manufacturer) references busEntities(entity),
   foreign key(proditem) references items(item)
); 

drop table has cascade constraints;
create table has(
prodItem char(9), 
matItem char (9), 
QtyMatPerItem number(3),
primary key(prodItem, matItem),
foreign key(prodItem) references items(item),
foreign key(matItem) references items(item)
);

drop table orders;
create table orders(
item char(9), 
qty number(5),
primary key(item),
foreign key(item) references items(item)
);

drop table supplyOrders;
create table supplyOrders(
item char(9), 
supplier char(25), 
qty number(5),
primary key(item, supplier),
foreign key(item) references orders(item),
foreign key(qty) references orders(qty),
foreign key(supplier) references BUSENTITIES(entity)
);

drop table manufOrders;
create table manufOrders(
item char(9), 
manuf char(25), 
qty number(6),
primary key(item, manuf),
foreign key(item) references orders(item),
foreign key(qty) references orders(qty),
foreign key(manuf) references BUSENTITIES(entity)
);

drop table shipOrders;
create table shipOrders(
item char(9), 
shipper char(9), 
sender char(25), 
recipient char(25), 
qty number(6),
primary key(item, shipper, sender, recipient),
foreign key(item) references orders(item),
foreign key(qty) references orders(qty),
foreign key(sender) REFERENCES BUSENTITIES(entity),
foreign key(recipient) REFERENCES BUSENTITIES(entity)
);

drop table processSupplyOrders;
create table processSupplyOrders(
supplier char(9), 
item char(9), 
ppu number(4),
primary key(supplier,item),
foreign key(supplier) references BUSENTITIES(entity),
foreign key(item) references items(item)
);

drop table processShippingOrders;
create table processShippingOrders(
shipper char(9), 
fromLoc  char(9), 
toLoc char(9), 
minPackagePrice number(5), 
pricePerLb number(9), 
primary key (shipper, fromLoc, toLoc),
foreign key(shipper) REFERENCES BUSENTITIES(entity)
);

drop table processManufOrders;
create table processManufOrders(
manuf char(25), 
prodItem char(9), 
setUpCost number(5), 
prodCostPerUnit number(5),
primary key(manuf,prodItem),
foreign key(prodItem) references items(item),
foreign key(manuf) REFERENCES BUSENTITIES(entity)
);