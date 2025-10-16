------------------------------------------------------------
-- 🧱 Bronze Layer Data Load Script
-- Description: 
--   This script truncates and reloads raw source data from CSV files 
--   into the Bronze Layer (staging area) of the data warehouse.
--
-- ⚠️ WARNING:
--   Running this script will DELETE and RELOAD all existing data 
--   in the Bronze schema. Use only in a development or refresh context.
------------------------------------------------------------

-- ============================================================
-- CRM SOURCE TABLES
-- ============================================================

-- 🧹 Reset and reload CRM Customer Info
TRUNCATE TABLE bronze.crm_cust_info;
LOAD DATA LOCAL INFILE './datasets/source_crm/cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  @cst_id,
  @cst_key,
  @cst_firstname,
  @cst_lastname,
  @cst_marital_status,
  @cst_gndr,
  @cst_create_date
)
SET
  cst_id = NULLIF(@cst_id, ''),
  cst_key = NULLIF(@cst_key, ''),
  cst_firstname = NULLIF(@cst_firstname, ''),
  cst_lastname = NULLIF(@cst_lastname, ''),
  cst_marital_status = NULLIF(@cst_marital_status, ''),
  cst_gndr = NULLIF(@cst_gndr, ''),
  cst_create_date = STR_TO_DATE(NULLIF(@cst_create_date, ''), '%Y-%m-%d');


-- 🧹 Reset and reload CRM Product Info
TRUNCATE TABLE bronze.crm_prd_info;
LOAD DATA LOCAL INFILE './datasets/source_crm/prd_info.csv'
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  @prd_id,
  @prd_key,
  @prd_nm,
  @prd_cost,
  @prd_line,
  @prd_start_dt,
  @prd_end_dt
)
SET
  prd_id = NULLIF(@prd_id, ''),
  prd_key = NULLIF(@prd_key, ''),
  prd_nm = NULLIF(@prd_nm, ''),
  prd_cost = NULLIF(@prd_cost, ''),
  prd_line = NULLIF(@prd_line, ''),
  prd_start_dt = STR_TO_DATE(NULLIF(@prd_start_dt, ''), '%Y-%m-%d %H:%i:%s'),
  prd_end_dt = STR_TO_DATE(NULLIF(@prd_end_dt, ''), '%Y-%m-%d %H:%i:%s');


-- 🧹 Reset and reload CRM Sales Details
TRUNCATE TABLE bronze.crm_sales_details;
LOAD DATA LOCAL INFILE './datasets/source_crm/sales_details.csv'
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  @sls_ord_num,
  @sls_prd_key,
  @sls_cust_id,
  @sls_order_dt,
  @sls_ship_dt,
  @sls_due_dt,
  @sls_sales,
  @sls_quantity,
  @sls_price
)
SET
  sls_ord_num   = NULLIF(@sls_ord_num, ''),
  sls_prd_key   = NULLIF(@sls_prd_key, ''),
  sls_cust_id   = NULLIF(@sls_cust_id, ''),
  sls_order_dt  = NULLIF(@sls_order_dt, ''),
  sls_ship_dt   = NULLIF(@sls_ship_dt, ''),
  sls_due_dt    = NULLIF(@sls_due_dt, ''),
  sls_sales     = NULLIF(@sls_sales, ''),
  sls_quantity  = NULLIF(@sls_quantity, ''),
  sls_price     = NULLIF(@sls_price, '');


-- ============================================================
-- ERP SOURCE TABLES
-- ============================================================

-- 🧹 Reset and reload ERP Customer Data
TRUNCATE TABLE bronze.erp_cust_az12;
LOAD DATA LOCAL INFILE './datasets/source_erp/cust_az12.csv'
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  @CID,
  @BDATE,
  @GEN
)
SET
  CID   = NULLIF(@CID, ''),
  BDATE = STR_TO_DATE(NULLIF(@BDATE, ''), '%Y-%m-%d'),
  GEN   = NULLIF(@GEN, '');


-- 🧹 Reset and reload ERP Location Data
TRUNCATE TABLE bronze.erp_loc_a101;
LOAD DATA LOCAL INFILE './datasets/source_erp/loc_a101.csv'
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  @CID,
  @CNTRY
)
SET
  CID    = NULLIF(@CID, ''),
  CNTRY  = NULLIF(@CNTRY, '');


-- 🧹 Reset and reload ERP Product Category Data
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE './datasets/source_erp/px_cat_g1v2.csv'
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
  @ID,
  @CAT,
  @SUBCAT,
  @MAINTENANCE
)
SET
  ID           = NULLIF(@ID, ''),
  CAT          = NULLIF(@CAT, ''),
  SUBCAT       = NULLIF(@SUBCAT, ''),
  MAINTENANCE  = NULLIF(@MAINTENANCE, '');
