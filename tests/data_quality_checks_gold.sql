-- Validate gold.dim_customers
-- Ensure customer_key is unique (no duplicates expected)
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- Validate gold.dim_products
-- Ensure product_key is unique (should return no rows)
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- Validate gold.fact_sales relationships
-- Check that every record links correctly to both dimensions
-- Expectation: No missing customer or product references
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL;
