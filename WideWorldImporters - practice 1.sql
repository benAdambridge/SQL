-- merge some of the warehouse tables to get an idea of the cost of each stock group by their quantity
use WideWorldImporters

SELECT sg2.StockGroupID, sg.StockGroupName, sol.OrderID,
sol.Quantity,sol.UnitPrice, sol.Quantity*sol.UnitPrice AS Cost_each_sale
FROM [WideWorldImporters].[Warehouse].[StockItemStockGroups] sg2
LEFT JOIN [WideWorldImporters].[Warehouse].[StockGroups] sg
ON sg2.StockGroupID =sg.StockGroupID
left join Sales.OrderLines sol
on sg2.StockItemID = sol.StockItemID
order by StockGroupName




SELECT sg.StockGroupName, sum(sol.Quantity*sol.UnitPrice)AS Cost_each_sale
FROM [WideWorldImporters].[Warehouse].[StockItemStockGroups] sg2
LEFT JOIN [WideWorldImporters].[Warehouse].[StockGroups] sg
ON sg2.StockGroupID =sg.StockGroupID
left join Sales.OrderLines sol
on sg2.StockItemID = sol.StockItemID
group by StockGroupName
order by Cost_each_sale desc

select avg(ac.LatestRecordedPopulation) AS 'Average of Population across recorded Cities'
from [WideWorldImporters].[Application].[Cities] ac

select ac.CityName, sum(ac.LatestRecordedPopulation) AS 'Total Population',
case
when max(ac.LatestRecordedPopulation) > 8453 THEN 'Yes'
ELSE 'No'
END AS 'Over the Average population for this sample?'
FROM [WideWorldImporters].[Application].[Cities] ac
where ac.LatestRecordedPopulation IS NOT NULL
group by ac.CityName
order by ac.CityName asc


select ac.CityName, sum(ac.LatestRecordedPopulation) AS 'Total Population',
case
when max(ac.LatestRecordedPopulation) > 8453 THEN 'Yes'
ELSE 'No'
END AS 'Over the Average population for this sample?'
into PopulationByCity
FROM [WideWorldImporters].[Application].[Cities] ac
group by ac.CityName
order by ac.CityName asc

-- creates a table in the dataset and allows us to get rid of less nulls where you can have a null entry for one part of your city

select * 
from PopulationByCity pbc
where pbc.[Total Population] IS NOT NULL
