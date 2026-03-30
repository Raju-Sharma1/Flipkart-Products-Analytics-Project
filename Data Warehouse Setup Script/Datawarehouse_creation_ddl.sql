USE master;
GO

-- Create database if it does not exist
IF DB_ID('Flipkart_Analytics') IS NULL
BEGIN
    CREATE DATABASE Flipkart_Analytics;
END
GO

-- Switch to the new database
USE Flipkart_Analytics;
GO

-- Drop table if it already exists
IF OBJECT_ID('dbo.Flipkart_Products', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Flipkart_Products;
END
GO

-- Create table
CREATE TABLE dbo.Flipkart_Products (
    product_id NVARCHAR(50),
    product_name NVARCHAR(100),
    category NVARCHAR(100),
    brand NVARCHAR(50),
    seller NVARCHAR(50),
    seller_city NVARCHAR(50),
    price DECIMAL(10,2),
    discount_percent INT,
    final_price DECIMAL(10,2),
    rating DECIMAL(3,2),
    review_count INT,
    stock_available INT,
    units_sold INT,
    listing_date DATE,
    delivery_days INT,
    weight_g DECIMAL(10,2),
    warranty_months INT,
    color NVARCHAR(50),
    size NVARCHAR(20),
    return_policy_days INT,
    is_returnable NVARCHAR(10),
    payment_modes NVARCHAR(100),
    shipping_weight_g DECIMAL(10,2),
    product_score DECIMAL(10,2),
    seller_rating DECIMAL(10,2)
);
GO
