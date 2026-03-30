/*
===================================================================
This section is for Business Analysis:
===================================================================
*/

/*
        ==============
        Sales Analysis:
        ==============
*/

/*
    Total Revenue by Category:
    -------------------------
*/
SELECT
    category,
    SUM(final_price * units_sold) as total_revenue
    From dbo.Flipkart_Products
        GROUP BY category;

/*
    Final price is the cost of the particular product.
    unit sold is the count of product sold.
    total revenue = final price * units_sold
*/

/*
    Top Selling Products:
    --------------------
*/
SELECT
    product_name,
    SUM(units_sold) AS total_sales_count
    FROM dbo.Flipkart_Products
        GROUP BY
            product_name
        HAVING SUM(units_sold) > 0  
        ORDER BY
            total_sales_count DESC;

/*
        ================
        Pricing Analysis:
        ================
*/

/*
    Average Discount by Category:
    ----------------------------
*/
SELECT
    category,
    AVG(discount_percent) AS avg_discount_percent
    FROM dbo.Flipkart_Products
        GROUP BY
            category;

/*
    Highest priced products:
    -----------------------

*/
SELECT TOP 10
    product_name,
    MAX(final_price) AS highest_price
FROM dbo.Flipkart_Products
GROUP BY product_name
ORDER BY highest_price DESC;


/*
        ========================
        Customer Rating Analysis:
        ========================
*/

/*
    Highest Rated Brands:
    --------------------
*/
SELECT
    brand,
    AVG(rating) AS avg_rating
    FROM dbo.Flipkart_Products
        GROUP BY
            brand
        ORDER BY
            avg_rating DESC;

/*
    Products with most reviews:
    ---------------------------
*/
SELECT
    product_name,
    SUM(review_count) AS total_reviews
    FROM dbo.Flipkart_Products
        GROUP BY
            product_name
        ORDER BY
            total_reviews DESC;


/*
        ==================
        Seller Performance:
        ==================
*/

/*
    Best Seller By Sales:
    --------------------
*/
SELECT
    seller,
    SUM(final_price * units_sold) AS total_sales_revenue
    FROM dbo.Flipkart_Products
        GROUP BY
            seller;

/*
    Seller Rating By City:
    ----------------------
*/
SELECT
    seller_city,
    AVG(seller_rating) AS avg_seller_rating
    FROM dbo.Flipkart_Products
        GROUP BY
            seller_city;
