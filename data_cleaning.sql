-- This query checks for NULL values across all key columns in the gymshark_products table
-- to ensure data integrity before analysis.
-- Note: A count of 0 indicates that the column has no missing values.
SELECT
    COUNT(*) FILTER (WHERE title IS NULL) AS title_null_count,
    COUNT(*) FILTER (WHERE product_type IS NULL) AS product_type_null_count,
    COUNT(*) FILTER (WHERE vendor IS NULL) AS vendor_null_count,
    COUNT(*) FILTER (WHERE tags IS NULL) AS tags_null_count,
    COUNT(*) FILTER (WHERE handle IS NULL) AS handle_null_count,
    COUNT(*) FILTER (WHERE variant_title IS NULL) AS variant_title_null_count,
    COUNT(*) FILTER (WHERE sku IS NULL) AS sku_null_count,
    COUNT(*) FILTER (WHERE price IS NULL) AS price_null_count,
    COUNT(*) FILTER (WHERE image_src IS NULL) AS image_src_null_count
FROM
    gymshark_products;

-- Conclusion: The dataset is confirmed to be complete with no null values in the analyzed columns,
-- making it suitable for direct analysis without the need for data imputation.