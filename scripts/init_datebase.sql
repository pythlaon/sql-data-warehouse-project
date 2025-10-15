/*
===========================================================
WARNING: DATABASE RESET SCRIPT
-----------------------------------------------------------
This script DROPS and RECREATES the `bronze`, `silver`, 
and `gold` databases. 

Running this script will permanently DELETE all existing 
databases and tables with those names, and replace them 
with new empty structures.

!Use at your own risk!
===========================================================
*/

-- Drop and recreate databases
DROP DATABASE IF EXISTS bronze;
CREATE DATABASE bronze;

DROP DATABASE IF EXISTS silver;
CREATE DATABASE silver;

DROP DATABASE IF EXISTS gold;
CREATE DATABASE gold;
