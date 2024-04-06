-- MYSQL project 
create database E_Commerce;
use e_commerce;

create table CATEGORIES(
Category_id int primary key,
category_name varchar(200)
);

create table PRODUCT(
Product_id int primary key,
Product_name varchar(100),
StockQuantity int,
price int,
Category_id int,
foreign key (Category_id) references CATEGORIES(Category_id)
);

create table Customers(
CustomerID int primary key,
Cutomer_name varchar(200),
E_mail_ID varchar(200)
);

create table Orders(
Order_id int primary key,
CustomerID int,
Amount int,
Order_date date,
foreign key (CustomerID) references Customers(CustomerID));

create table Order_Detail(
Detail_id int primary key,
order_id int,
product_id int,
Quantity int,
foreign key (order_id) references Orders(Order_id),
foreign key (product_id) references PRODUCT(product_id));

create table Reviews(
Review_id int,
Product_id int,
CustomerID int,
Rating int,
Comments varchar(400),
foreign key (CustomerID) references Customers(CustomerID),
foreign key (product_id) references PRODUCT(product_id));

create table Shipping(
Shipping_id varchar(100) primary key,
Order_id int,
Ship_date date,
Delivery_Date date,
foreign key (order_id) references Orders(Order_id));

create table Discount(
Discount_id varchar(20),
Product_id int,
Discount_Amount int);

create table Coupons(
Coupon_id varchar(20) primary key,
Discount_amount int);