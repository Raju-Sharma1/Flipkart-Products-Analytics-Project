/*
===================================================================
Business Metrics Views
===================================================================
*/

/*
    Total Revenue by Category
    -------------------------
*/

DROP VIEW IF EXISTS dbo.vw_category_revenue;
GO

CREATE VIEW dbo.vw_category_revenue
AS
SELECT
    category,
    SUM(final_price * units_sold) AS total_revenue
FROM dbo.Flipkart_Products
GROUP BY category;
GO



/*
    Average Discount by Category
    ----------------------------
*/

DROP VIEW IF EXISTS dbo.vw_category_avg_discount;
GO

CREATE VIEW dbo.vw_category_avg_discount
AS
SELECT
    category,
    AVG(discount_percent) AS avg_discount_percent
FROM dbo.Flipkart_Products
GROUP BY category;
GO



/*
    Average Brand Rating
    --------------------
*/

DROP VIEW IF EXISTS dbo.vw_brand_avg_rating;
GO

CREATE VIEW dbo.vw_brand_avg_rating
AS
SELECT
    brand,
    AVG(rating) AS avg_rating
FROM dbo.Flipkart_Products
GROUP BY brand;
GO



/*
    Seller Revenue
    --------------
*/

DROP VIEW IF EXISTS dbo.vw_seller_revenue;
GO

CREATE VIEW dbo.vw_seller_revenue
AS
SELECT
    seller,
    SUM(final_price * units_sold) AS total_sales_revenue
FROM dbo.Flipkart_Products
GROUP BY seller;
GO
/*
    Seller Rating by City
    ---------------------
*/

DROP VIEW IF EXISTS dbo.vw_city_avg_seller_rating;
GO

CREATE VIEW dbo.vw_city_avg_seller_rating
AS
SELECT
    seller_city,
    AVG(seller_rating) AS avg_seller_rating
FROM dbo.Flipkart_Products
GROUP BY seller_city;
GO
