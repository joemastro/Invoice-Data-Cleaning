# Invoice Analysis README

This repository contains a Python script for processing invoice data and an SQL script for importing and analyzing the data in a SQLite database.

## Python Script

### Prerequisites
- Python 3.x installed

### Running the Python Script
1. Open a terminal or command prompt.
2. Navigate to the project directory.
3. Run the Python script using the following command:
  ~~~
  python process_invoice.py
  ~~~
4. The script will generate a new CSV file called "invoiceinfo.csv" containing processed invoice data.

## SQL Script

### Database Setup
1. Ensure you have SQLite installed.
2. Create a new SQLite database file with the command:
  ~~~
  drop database if exists newdb;
  create database newdb;
  use newdb;
  ~~~

### Import CSV Files
1. Import the generated CSV file ("invoiceinfo.csv") and the employee rates CSV file ("EmployeeRates.csv") into the database using your preferred SQLite client
2. Run the script in chunks at a time

### Running the SQL Script
1. Open your SQLite client and connect to an appropriate database.
2. Copy and paste the contents of the SQL script into your SQLite client.
3. Execute the script in chunks to gain analytical insights based on the original invoice.

Feel free to reach out if you encounter any issues or have questions!
