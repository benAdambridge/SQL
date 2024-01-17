use KCC

SELECT cust.CustomerName, op.Quantity, ord.OrderTotal, ord.OrderDate
into SalesbyCustomerName
FROM KCC.dbo.Customers cust
left join kcc.dbo.Orders ord
on cust.CustomerID = ord.CustomerID
left join KCC.dbo.Order_Product op
on ord.OrderID = op.OrderID


-- Order total by customer, and then their quantity/order total by customer
select CustomerName=ISNULL(CustomerName,'Total'), -- ISNULL() makes the rollup (the total) named Total rather than NULL
cast(round(sum(OrderTotal),0)AS int) AS 'Order Total by Customer', 
cast(round(sum(OrderTotal/Quantity),0)AS int) AS 'Quantity by cost for Customer'
-- CAST = making the sum an integer rather than var char which allows it to be unwrapped from its decimal form, and so you can round up properly, you get a whole number instead of .00
from SalesbyCustomerName
where OrderTotal IS NOT NULL
group by rollup (CustomerName)
order by [Order Total by Customer] asc

-- Date (NEED SORTING OUT) grouping by without having to extract to an external table

SELECT
    FORMAT(MIN(ord.OrderDate), 'MMMM') AS 'Month of Order', -- format specifies the following format, MIN retrieves the earliest date, (<date>, 'MMMM') uses format to represent full month name
    SUM(op.Quantity) AS 'Order Quantity'
FROM
    kcc.dbo.Orders ord
LEFT JOIN
    KCC.dbo.Order_Product op ON ord.OrderID = op.OrderID
GROUP BY
    DATEPART(MONTH, ord.OrderDate)
ORDER BY
    DATEPART(MONTH, MIN(ord.OrderDate));


