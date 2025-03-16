# Comprehensive Taxonomy Database with SQL Script Date: 3/30/2022 8:16:18 PM 

This repository contains SQL scripts for managing a taxonomy database with a relational structure, stored functions, and procedures. The project demonstrates advanced SQL techniques, including schema design, data manipulation, stored procedures, and transaction management.

## Features

### 1. **Database Schema Creation**
   - Defines tables for hierarchical taxonomic classification:
     - **Kingdom**
     - **Phylum**
     - **Class**
     - **Order**
     - **Family**
     - **Genus**
     - **Species**
   - Enforces **referential integrity** using foreign keys.

### 2. **Data Insertion**
   - Populates the database with sample taxonomic records.
   - Ensures **data normalization** and consistency.

### 3. **Data Retrieval Queries**
   - Fetches taxonomic classification for specific species.
   - Uses **SQL joins** for hierarchical data relationships.

### 4. **Stored Function (`fnc_get_reino`)**
   - Retrieves the kingdom for a given species based on its common name.
   - Implements SQL **scalar functions**.

### 5. **Stored Procedure (`sp_inserta_registro`)**
   - Inserts new taxonomic entries while ensuring no duplicate records.
   - Uses **transaction management** with `BEGIN TRANSACTION` and `COMMIT TRANSACTION`.
   - Implements **ACID principles** for database consistency.

## Requirements
- **Microsoft SQL Server**
- **SQL Server Management Studio (SSMS)** (recommended for execution)

## Installation & Usage
1. Clone the repository:
   ```sh
   git clone https://github.com/<your-username>/taxonomy-database-sql-complete.git
   cd taxonomy-database-sql-complete
