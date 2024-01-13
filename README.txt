# Invoice Analysis README

This repository contains a Python script for processing invoice data and an SQL script for importing and analyzing the data in a SQLite database.

## Python Script

### Prerequisites
- Python 3.x installed
- Required Python packages can be installed using the following command:
pip install -r requirements.txt

bash
Copy code

### Running the Python Script
1. Open a terminal or command prompt.
2. Navigate to the project directory.
3. Run the Python script using the following command:
python process_invoice.py

sql
Copy code
4. The script will generate a new CSV file called "invoiceinfo.csv" containing processed invoice data.

## SQL Script

### Database Setup
1. Ensure you have SQLite installed.
2. Create a new SQLite database file, e.g., "invoice_database.db".

### Import CSV Files
1. Import the generated CSV file ("invoiceinfo.csv") and the employee rates CSV file ("EmployeeRates.csv") into the database using your preferred SQLite client or the following commands:
```sql
.mode csv
.import invoiceinfo.csv TempLabor
.import EmployeeRates.csv TempRates
Running the SQL Script
Open your SQLite client and connect to the "invoice_database.db" file.
Copy and paste the contents of the SQL script into your SQLite client.
Execute the script in chunks to gain analytical insights based on the original invoice.
Note: Ensure that you run the SQL script in the correct order and adjust paths and filenames as needed.

Feel free to reach out if you encounter any issues or have questions!


Make sure to adjust the instructions based on your actual file paths, database names, and any other specific details related to your project.