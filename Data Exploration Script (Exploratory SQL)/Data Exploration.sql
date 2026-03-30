/*
===================================================================
This section is for Data Exploration (Exploratory SQL)
===================================================================
*/

/*
    Total Products: Total unique products.
    -------------------------------------
*/
/*
    Few products have same name however different product_id's
    Since sellers are different.
*/
CREATE VIEW dbo.vw_total_unique_products
AS
SELECT
    COUNT(DISTINCT product_name) AS total_unique_products
FROM dbo.Flipkart_Products;
GO

/*
    Total Categories:
    ----------------
*/
CREATE VIEW dbo.vw_total_categories
AS
SELECT
    COUNT(DISTINCT category) AS total_categories
FROM dbo.Flipkart_Products;
GO

/*
    Total Brands:
    -------------
*/
CREATE VIEW dbo.vw_total_brands
AS
SELECT
    COUNT(DISTINCT brand) AS total_brands
FROM dbo.Flipkart_Products;
GO

/*
    Category Distribution:
    ---------------------
Find total no. products per every category.
*/
CREATE VIEW dbo.vw_category_distribution
AS
SELECT
    category,
    COUNT(DISTINCT product_name) AS product_count
FROM dbo.Flipkart_Products
GROUP BY category;
GO
/*
Using distinct count:
- Removes duplicate listings of the same product sold by multiple sellers
- Gives the actual number of unique products in each category
*/


/*
    Top Brands by product count:
    ---------------------------
*/
CREATE VIEW dbo.vw_brand_product_counts
AS
SELECT
    brand,
    COUNT(DISTINCT product_name) AS total_products
FROM dbo.Flipkart_Products
GROUP BY brand;
GO

