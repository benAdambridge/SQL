/****** Script for KCC  ******/

/* returns those in the state of Washington*/


select * from kcc.dbo.customers where state ='WA'

/* retunrs those not in the state of Washington */

select * from kcc.dbo.customers where state <> 'WA'

/* 
Customers from the states Washington, New York, Utah*/

select * from kcc.dbo.customers where state in('WA', 'NY', 'UT')



/* Customers not in these states */

select * from kcc.dbo.customers where state not in('WA', 'NY', 'UT')


/* two criteria search */

select * from kcc.dbo.customers
where country = 'France' and city = 'Paris'