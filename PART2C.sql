--PART C

--1.
SELECT DISTINCT CUSTOMER 
FROM shippedVsCustDemand
WHERE CUSTOMERDEMAND > SHIPPED
ORDER BY CUSTOMER;

--2. 
SELECT DISTINCT SUPPLIER 
FROM suppliedVsShipped 
WHERE SUPPLIEDQTY > SHIPPEDQTY
ORDER BY SUPPLIER;
--3.      
SELECT DISTINCT MANUF 
FROM matsUsedVsShipped
WHERE TOTALQTYMATITEMREQD > TOTALQTYMATITEMSHIPPED
ORDER BY MANUF;

--4.   
SELECT DISTINCT MANUF
FROM producedVsShipped 
WHERE PRODUCEDQTY>SHIPPEDQTY
ORDER BY MANUF;