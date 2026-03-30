/*
===================================================================
This section is for Data Exploration (Exploratory SQL)
===================================================================
*/

/*
    Total Products: Total unique products
    -------------------------------------
*/

IF OBJECT_ID('dbo.vw_total_unique_products', 'V') IS NOT NULL
    DROP VIEW dbo.vw_total_unique_products;
GO

CREATE VIEW dbo.vw_total_unique_products
AS
SELECT
    COUNT(DISTINCT product_name) AS total_unique_products
FROM dbo.Flipkart_Products;
GO


/*
    Total Categories
    ----------------
*/

IF OBJECT_ID('dbo.vw_total_categories', 'V') IS NOT NULL
    DROP VIEW dbo.vw_total_categories;
GO

CREATE VIEW dbo.vw_total_categories
AS
SELECT
    COUNT(DISTINCT category) AS total_categories
FROM dbo.Flipkart_Products;
GO


/*
    Total Brands
    -------------
*/

IF OBJECT_ID('dbo.vw_total_brands', 'V') IS NOT NULL
    DROP VIEW dbo.vw_total_brands;
GO

CREATE VIEW dbo.vw_total_brands
AS
SELECT
    COUNT(DISTINCT brand) AS total_brands
FROM dbo.Flipkart_Products;
GO


/*
    Category Distribution
    ---------------------
    Find total no. products per category
*/

IF OBJECT_ID('dbo.vw_category_distribution', 'V') IS NOT NULL
    DROP VIEW dbo.vw_category_distribution;
GO

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
    Top Brands by product count
    ---------------------------
*/

IF OBJECT_ID('dbo.vw_brand_product_counts', 'V') IS NOT NULL
    DROP VIEW dbo.vw_brand_product_counts;
GO

CREATE VIEW dbo.vw_brand_product_counts
AS
SELECT
    brand,
    COUNT(DISTINCT product_name) AS total_products
FROM dbo.Flipkart_Products
GROUP BY brand;
GO
