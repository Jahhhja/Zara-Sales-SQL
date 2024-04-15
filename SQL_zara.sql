SELECT TOP (1000) [Product_ID]
      ,[Product_Position]
      ,[Promotion]
      ,[Product_Category]
      ,[Seasonal]
      ,[Sales_Volume]
      ,[brand]
      ,[url]
      ,[sku]
      ,[name]
      ,[description]
      ,[price]
      ,[currency]
      ,[scraped_at]
      ,[terms]
      ,[section]
  FROM [zara].[dbo].[zara_sales]

  SELECT *
  FROM zara_sales

  --Total Sales Volume
  SELECT SUM(Sales_Volume) AS Total_Sales_Volume
  FROM zara_sales

  --Total Revenue
  SELECT SUM(Sales_Volume * price) AS Revenue
  FROM zara_sales
 
 --Total Sales Volume of Regular Items
  Select Sum(Sales_Volume) as Total_Sales_Volume_Regular
  From zara_sales
  Where Promotion = '0'
  
  --Total Sales Volume of Discounted Items
  Select Sum(Sales_Volume) as Total_Sales_Volume_Discounted
  From zara_sales
  Where Promotion = '1'
  
  --Total Revenue of Regular Items
  Select Sum(Sales_Volume * price) as Total_Revenue_Regular
  From zara_sales
  Where Promotion = '0'

 --Total Revenue of Discounted Items
  Select Sum(Sales_Volume * price) as Total_Revenue_Discounted
  From zara_sales
  Where Promotion = '1'


  --Revenue by Gender
  Select Section, Sum(Sales_Volume * price) as Revenue_Gender
  From zara_sales
  Group by Section
  Order by Revenue_Gender Asc

  --Sales Volume by Gender
  Select Section, Sum(Sales_Volume * price) as Sales_Gender
  From zara_sales
  Group by Section
  Order by Sales_Gender Asc


  --Type of clothing that generated the highest revenue
  Select Count(terms), terms, sum(Sales_Volume * price) as revenue
  From zara_sales
  Group by terms
  ORDER BY revenue DESC
 
 --Highest Sales Volume (Man and Woman Section) not on sale
 Select Promotion, Seasonal, Sales_Volume, name, section
 From zara_sales
 where Promotion = '0'
 order by Sales_Volume desc

 --Highest Sales Volume (Man and Woman Section) on sale
  Select Seasonal, Sales_Volume, name
 From zara_sales
 where Promotion = '1' and section = 'MAN'
 order by Sales_Volume desc

 Select sum(Sales_Volume * price) as totalrev_regular_male
 From zara_sales
 where Promotion = '0' and section = 'MAN'

 Select sum(Sales_Volume * price) as totalrev_regular_woman
 From zara_sales
 where Promotion = '0' and section = 'WOMAN'

 Select sum(Sales_Volume * price) as totalrev_disc_male
 From zara_sales
 where Promotion = '1' and section = 'MAN'

 Select sum(Sales_Volume * price) as totalrev_disc_woman
 From zara_sales
 where Promotion = '1' and section = 'WOMAN'

 Select sum(Sales_Volume) as totalsalesvol_man
 From zara_sales
 where Promotion = '0' and section = 'MAN'

 Select sum(Sales_Volume) as totalsalesvol_woman
 From zara_sales
 where Promotion = '0' and section = 'WOMAN'

 Select sum(Sales_Volume) as totalsalesvol_disc_man
 From zara_sales
 where Promotion = '1' and section = 'MAN'

  Select sum(Sales_Volume) as totalsalesvol_disc_woman
 From zara_sales
 where Promotion = '1' and section = 'WOMAN'
 