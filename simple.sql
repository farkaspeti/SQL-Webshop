SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;



SET default_tablespace = '';

SET default_with_oids = false;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Order;
DROP TABLE IF EXISTS Order_Detail;
DROP TABLE IF EXISTS Product;

CREATE TABLE Customer (
	CustomerID SERIAL PRIMARY KEY,
	CompanyName character varying(30) NOT NULL,
	ContactName character varying(20) NOT NULL,
	ContactTitle character varying(20),
	Address character varying(60) NOT NULL,
	City character varying(20) NOT NULL,,
	Region character varying(20),
	PostalCode character varying(10),
	Country character varying(15),
	Phone character varying(24),
	Fax character varying(24),
    
);

CREATE TABLE Order (
	OrderID SERIAL PRIMARY KEY,
	CustomerID bpchar,
	EmployeeID smallint,
    	OrderDate date,
    	RequiredDate date,
    	ShippedDate date,
    	ShipVia smallint,
    	Freight real,
    	ShipName character varying(35),
    	ShipAddress character varying(60),
    	ShipCity character varying(20),
    	ShipRegion character varying(20),
    	ShipPostalCode character varying(10),
    	ShipCountry character varying(15)
);

CREATE TABLE order_details (
	FOREIGN KEY (OrderID) REFERENCES Order(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	UnitPrice real NOT NULL,
    	Quantity smallint NOT NULL,
    	Discount real NOT NULL

);

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    ProductName character varying(30) NOT NULL,
    SupplierID smallint,
    CategoryID smallint,
    QuantityPerUnit character varying(20),
    UnitPrice real,
    UnitsInStock smallint,
    UnitsOnOrder smallint,
    ReorderLevel smallint,
    Discontinued integer NOT NULL
);

