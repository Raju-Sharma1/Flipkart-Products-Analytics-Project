/*
    ====================================================================
    This section is for Advanced SQL Analytics:
    ====================================================================
*/

/*
    Rank products by sales in each category:
    ---------------------------------------
*/
SELECT ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_sales DESC) as Ranking,* 
    from(
SELECT
    category,
    product_name,
    SUM(final_price * units_sold) AS total_sales
    FROM dbo.Flipkart_Products
        GROUP BY
            category,
            product_name
) t;

/*
    CTEs - Top 3 Products Per Category:
    ----------------------------------
*/
With product_sales as (
SELECT
    category,
    product_name,
    SUM(final_price * units_sold) as total_sales
    FROM dbo.Flipkart_Products
        GROUP BY
            category,
            product_name
),
Ranking_product as (
    SELECT
    RANK() over(PARTITION BY category ORDER BY total_sales DESC) as Ranking,
    *
    FROM product_sales
)
SELECT
    *
    FROM Ranking_product
        Where Ranking < 4;
GO

/*
    KPI Metrics:
    -----------
*/
  /*
  Since these metrics can be reusable creating a view.
*/
IF OBJECT_ID('dbo.vw_kpi_metrics','V') IS NOT NULL
    DROP VIEW dbo.vw_kpi_metrics;
GO
CREATE VIEW dbo.vw_kpi_metrics as
SELECT
    SUM(units_sold) AS total_unit_sold,
    SUM(final_price * units_sold) AS total_revenue,
    AVG(rating) AS avg_rating,
    AVG(discount_percent) AS avg_discount_percent
FROM dbo.Flipkart_Products;
GO
