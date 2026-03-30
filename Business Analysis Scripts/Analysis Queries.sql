-- Top Selling Products
SELECT TOP 10
    product_name,
    SUM(units_sold) AS total_sales_count
FROM dbo.Flipkart_Products
GROUP BY product_name
ORDER BY total_sales_count DESC;


-- Products With Most Reviews
SELECT Top 10
    product_name,
    SUM(review_count) AS total_reviews
FROM dbo.Flipkart_Products
GROUP BY product_name
ORDER BY total_reviews DESC;


-- Highest Priced Products
SELECT TOP 10
    product_name,
    MAX(final_price) AS highest_price
FROM dbo.Flipkart_Products
GROUP BY product_name
ORDER BY highest_price DESC;
