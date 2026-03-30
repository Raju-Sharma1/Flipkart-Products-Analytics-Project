BULK INSERT Flipkart_Products
FROM 'C:/Users/rajsh/Analytics Project/Flipkart Product Listings/Cleaned_Flipkart_Products_Data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
