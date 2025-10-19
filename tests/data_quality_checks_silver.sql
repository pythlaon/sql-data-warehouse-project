/* ---------------------------------------------------------------------
   Data Quality Validation Script – Silver & Bronze Layers
   Purpose:
     • Identify data quality issues before data is consumed downstream.
     • Focus on duplicates, formatting anomalies, invalid values, business rule violations.
     • These checks align with standard data quality dimensions: accuracy, completeness,
       consistency, uniqueness. :contentReference[oaicite:1]{index=1}
   Note:
     • For each query, zero results = good (unless otherwise expected).
     • Any returned rows need review or remediation.
   --------------------------------------------------------------------- */

-- 1. Duplicate check: ensure uniqueness of product IDs in silver.crm_prd_info
SELECT prd_id,
       COUNT(*) AS cnt
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1
   OR prd_id IS NULL;

-- 2. Unwanted leading/trailing spaces: check product name field for trimming issues
--    No rows should return if trimmed correctly.
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- 3. Standardization / consistency: check distinct gender values in silver.crm_cust_info
--    Only allowed normalized values should appear (e.g., 'Male', 'Female', 'n/a').
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;

-- 4. Null or invalid cost values: cost should be non-null and non-negative
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0
   OR prd_cost IS NULL;

-- 5. Invalid date ordering in product info: end date should not be before start date
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- 6. Invalid due dates in bronze.crm_sales_details: ensure dates are valid and within range
SELECT NULLIF(sls_due_dt, 0) AS sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0
   OR LENGTH(sls_due_dt) != 8
   OR sls_due_dt > 20500101
   OR sls_due_dt < 19000101;

-- 7. Order/shipping/due date logic in sales details: shipping/due should not be before order
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;

-- 8. Invalid sales, quantity, or price: business rule violation (sales != quantity * price or null/negative values)
SELECT DISTINCT sls_sales,
                sls_quantity,
                sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL
   OR sls_quantity IS NULL
   OR sls_price IS NULL
   OR sls_sales <= 0
   OR sls_quantity <= 0
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

/* Rule Summary for sales, quantity, price:
   • If sales is null, zero, or negative → derive it as quantity * ABS(price).
   • If price is null or zero → calculate it as sales / quantity.
   • If price is negative → convert it to positive value. */

-- 9. Invalid birthdate in ERP customer data: out-of-normal range dates
SELECT *
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01'
   OR bdate > NOW();

-- 10. Referential integrity / mismatched IDs in location table: link check between ERP location and CRM customer
SELECT *
FROM bronze.erp_loc_a101
WHERE REPLACE(cid, '-', '') NOT IN (
    SELECT CAST(cst_id AS CHAR)  /* ensure same data type or convert */
    FROM bronze.crm_cust_info
);

-- 11. Country standardization check: see distinct country codes/names in silver location table
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry;

-- 12. Category table cleanliness: check for unwanted spaces or trimming issues in ERP product category data
SELECT id, cat, subcat, maintenance
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat)
   OR subcat != TRIM(subcat)
   OR maintenance != TRIM(maintenance);

SELECT DISTINCT maintenance
FROM bronze.erp_px_cat_g1v2;
