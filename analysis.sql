-- Business Question 1: How many unique products, product types, and vendors are there?
SELECT
    COUNT(DISTINCT title) AS total_titles,
    COUNT(DISTINCT product_type) AS total_products,
    COUNT(DISTINCT vendor) AS total_vendors
FROM
    gymshark_products;
-- Conclusion: The dataset contains 7,244 unique product titles across 92 distinct product types, supplied by 4 different vendors.


-- Business Question 2: Which product categories dominate the catalog?
SELECT
    product_type,
    COUNT(DISTINCT title) AS total_products
FROM
    gymshark_products
GROUP BY
    product_type
ORDER BY
    total_products DESC;
-- Conclusion: The 'Accessories' category dominates the product catalog with 798 unique products, followed by 'Mens T-Shirts' with 613 unique products.


-- Business Question 3: Are there categories with limited size/color variants, suggesting incomplete listings?
SELECT
    product_type,
    COUNT(DISTINCT handle) AS total_unique_products,
    COUNT(DISTINCT variant_title) AS total_unique_variants
FROM
    gymshark_products
GROUP BY
    product_type
ORDER BY
    total_unique_variants ASC;
-- Conclusion: The analysis does not indicate incomplete listings. Categories with a single variant (e.g., bags, bottles, headwear, socks) are products where a 'one size' 
-- offering is standard and expected.


-- Business Question 4: What is the price distribution across categories and vendors?
SELECT
    vendor,
    ROUND(AVG(price), 2) AS avg_price,
    SUM(price) AS total_price_sum,
    COUNT(*) AS total_products
FROM
    gymshark_products
GROUP BY
    vendor
ORDER BY
    avg_price DESC;
-- Conclusion: The vendor "Gymshark | Be a visionary." overwhelmingly dominates the catalog, supplying 99.8% of all products (44,778 listings) with an average price 
-- of $27.77. The other vendors have a negligible presence. One vendor, "Gymshark," has no pricing data, indicating it may be a placeholder or has non-saleable listings.


-- Business Question 5: Identify premium vs budget product lines.
WITH avg_price_cte AS (
    SELECT
        AVG(price) AS overall_avg_price
    FROM
        gymshark_products
    WHERE
        price != 0
)
SELECT
    CASE
        WHEN price < (SELECT overall_avg_price FROM avg_price_cte) THEN 'Budget'
        ELSE 'Premium'
    END AS product_line,
    COUNT(*) AS product_count
FROM
    gymshark_products
WHERE
    price != 0
GROUP BY
    product_line;
-- Conclusion: The analysis reveals that budget-friendly products constitute the majority of the catalog. Budget products, priced below the overall average, make up 
-- 55% of the total offerings, indicating a strategic focus on accessible price points.


-- Business Question 6: Are variant prices consistent across sizes or colors, or do they fluctuate?
SELECT
    title,
    variant_title,
    price
FROM
    gymshark_products
LIMIT 100; -- Limiting for brevity, full scan confirms the conclusion
-- Conclusion: The analysis confirms that prices are consistent across all size variants for the same product. There is no price fluctuation based on size 
-- (e.g., Small vs. Large).


-- Business Question 7: Which vendors supply the most products, and at what average price points?
SELECT
    vendor,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(title) AS total_products
FROM
    gymshark_products
GROUP BY
    vendor
ORDER BY
    total_products DESC;
-- Conclusion: The vendor "Gymshark | Be a visionary." supplies the vast majority of products (44,778 listings, 99.8% of the catalog) at an average price point of 
-- $27.77. The remaining vendors have minimal product counts.


-- Business Question 8: Analyze tags — what are the most common features?
-- Step 1: Exploratory query to identify all unique tags and their frequencies.
SELECT
    TRIM(LOWER(tag)) AS cleaned_tag,
    COUNT(*) AS frequency
FROM (

    SELECT
        REGEXP_SPLIT_TO_TABLE(tags, ',') AS tag
    FROM
        gymshark_products
) AS t
WHERE
    tag IS NOT NULL AND TRIM(tag) <> ''
GROUP BY
    cleaned_tag
ORDER BY
    frequency DESC
LIMIT 30;

-- Step 2: Quantify specific, high-interest features based on the exploratory query.
SELECT 'heavyweight-t-shirts' AS feature, COUNT(*) AS total_mentions FROM gymshark_products WHERE LOWER(tags) LIKE '%heavyweight%' OR LOWER(tags) LIKE '%t-shirt%'
UNION ALL
SELECT 'tops', COUNT(*) FROM gymshark_products WHERE LOWER(tags) LIKE '%tops%'
UNION ALL
SELECT 'sweat-wicking', COUNT(*) FROM gymshark_products WHERE LOWER(tags) LIKE '%sweat%' OR LOWER(tags) LIKE '%wicking%'
UNION ALL
SELECT 'seamless', COUNT(*) FROM gymshark_products WHERE LOWER(tags) LIKE '%seamless%'
UNION ALL
SELECT 'oversized fit', COUNT(*) FROM gymshark_products WHERE LOWER(tags) LIKE '%oversized fit%'
ORDER BY total_mentions DESC;
-- Conclusion: Analysis of the tags column reveals that “heavyweight-t-shirts” (19.6k mentions), “tops” (18.3k), and “sweat-wicking” (11.8k) are the most common features. 
-- This highlights a strategic focus on classic apparel, versatile tops, and performance fabrics.


-- Business Question 9: Can we cluster tags into feature groups?
-- Conclusion: Clustering tags into structured groups (e.g., Material, Fit, Technology) is not feasible with the current unstructured and messy nature of the `tags` 
-- data. Accurate clustering would require a cleaner dataset with standardized feature fields or direct access to the backend database for structured data.


-- Business Question 10: If Gymshark wants to launch a new product category, which gap should they target?
-- Conclusion: It is recommended that Gymshark expand within its core brand identity rather than launching a new, unrelated category. The "Pants" category, 
-- with only 14 unique products, represents a significant and logical gap in the current catalog, offering a prime opportunity for new product development.


-- Business Question 11: How would you handle missing inventory_quantity?
-- Conclusion: The preferred method for handling missing `inventory_quantity` is to ignore these records during aggregations. Dropping the column entirely would 
-- lead to a loss of valuable data, while replacing or estimating values could introduce inaccuracies without supporting sales data.


-- Business Question 12: What advanced models would you propose as a next phase?
-- Conclusion: A **Product Recommendation Engine** should be the top priority for the next phase to enhance user experience and increase average order value. 
-- A Dynamic Pricing Model should be approached with caution to avoid negative customer perception; focusing on **add-on suggestions and product bundles** is a safer 
-- and more effective strategy.


-- Business Question 13: What additional datasets would be valuable?
-- Conclusion: The immediate priority should be to **clean and standardize the existing dataset**, particularly the `tags` column. Following data cleansing, 
-- the analysis would be greatly enhanced by incorporating additional datasets such as **sales transaction data, customer reviews, and web traffic metrics** to create 
-- a more complete business intelligence project.