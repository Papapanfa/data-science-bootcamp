--create table customers
create table customers (
  customers_id int,
  customers_name TEXT,
  customers_phone TEXT,
  customers_gender TEXT
);

insert into customers values 
    (1, 'John', '0023456789','Male'),
    (2, 'Mary', '0123456780','Female'),
    (3, 'Tomas', '0987654320','Male'),
    (4, 'Adam', '0432109870','Male'),
    (5, 'Eric', '0765432100','Female'),
    (6, 'Marve', '0032198765','Male'),
    (7, 'Alice', '0976543210','Female'),
    (8, 'Peyna', '0543210987','Female'),
    (9, 'Theo', '0109876543','Female');
  

--create table Orders
create table orders (
  orders_id int,
  customers_id int,
  orders_date TEXT
);

insert into orders values 
    (1, 2, '2023-05-06'),
    (2, 6, '2023-06-09'),
    (3, 9, '2023-01-02'),
    (4, 1, '2023-07-07'),
    (5, 3, '2023-07-23'),
    (6, 7, '2023-09-19');


--create table menus
create table menus (
  menus_id int,
  orders_id int,
  menus_name TEXT,
  menus_price int,
  menus_type TEXT
);

insert into menus values
  (101, 2,'Pizza', 200, 'Food'),
  (102, 6,'Hotdog', 50, 'Food'),
  (103, 3,'Coke', 30, 'Beverage'),
  (104, 2,'Water', 15, 'Beverage'),
  (105, 1,'French Fries', 60, 'Food'),
  (106, 5,'Hamburger', 80, 'Food'),
  (107, 1,'Chicken', 90, 'Food');
    
--test select data with join
.mode box
/*select 
  *
from customers as c
join orders as o 
    on c.customers_id = o.customers_id
join menus as m
    on o.orders_id = m.orders_id
;
*/

--with : common table expression
with tb_com as (
  select 
    *
  from customers as c
  join orders as o 
      on c.customers_id = o.customers_id
  join menus as m
      on o.orders_id = m.orders_id
)

--test select data after use WITH function
select 
  customers_id,
  customers_name as Name,
  customers_gender as Gender,
  sum(menus_price) as Total_price,
  count(orders_id) as Qty,
  round(sum(menus_price)/count(orders_id)) as Avg_price_per_qty
from tb_com
where name like 'M%' or orders_id = 3
group by name
order by 4;


/*--subqueries
select 
  customers_id,
  customers_name as Name,
  customers_gender as Gender,
  sum(menus_price) as Total_price,
  count(orders_id) as Qty,
  round(sum(menus_price)/count(orders_id)) as Avg_price_per_qty
from 
  (select *
    from customers as c
    join orders as o 
      on c.customers_id = o.customers_id
    join menus as m
      on o.orders_id = m.orders_id
  )
where name like 'M%' or orders_id = 3
group by name
order by 4;
*/
