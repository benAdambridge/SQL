/****** Script for Orders  ******/

/* between two numbers */

SELECT *
  FROM [KCC].[dbo].[Orders]
  where OrderTotal between 1000 and 2000


  /* only show orders over a certain amount*/

  SELECT *
  FROM [KCC].[dbo].[Orders]
  where OrderTotal >1000


  /* joining tables to get Customer name and Phone number (THIS IS AN INNER JOIN)*/

  select orderid as ID, orderdate as Odate, ordertotal as total,
  customername as Name, phone as Number
  from kcc.dbo.orders o
  join kcc.dbo.customers c on o.customerid = c.customerid

  /* INNER JOIN gives back full results between the two tables (has to be overlap)*/


  /* say I want to see those with 0 orders */

  select orderid as ID, orderdate as Odate, ordertotal as total,
  customername as Name, phone as Number
  from kcc.dbo.orders o
  left outer join kcc.dbo.customers c on o.customerid = c.customerid

  /* order this data, in descending order */

   select orderid as ID, orderdate as Odate, ordertotal as total,
  customername as Name, phone as Number
  from kcc.dbo.orders o
  left outer join kcc.dbo.customers c on o.customerid = c.customerid
  order by total desc

  /* desc = descending order */