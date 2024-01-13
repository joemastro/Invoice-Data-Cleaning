import csv

def getEmployeeInfo(csvFile, txtFile):
    # Specify the keyword you're looking for
    keyword = 'Totals:'
    department_keyword = 'department'

    with open(txtFile, 'r') as text:
        names_to_search = [line.strip() for line in text]

    with open(csvFile, newline='') as comsepval, open('invoiceInfo.csv', 'w', newline='') as output_csv:
        reader = csv.reader(comsepval, delimiter=',')
        writer = csv.writer(output_csv)

        # Write the header to the new CSV file
        writer.writerow(["Employee Name", "Department", "Regular Hours", "Overtime Hours"])

        current_employee = None
        department = None
        regular_hours = None
        overtime_hours = None

        for row_number, row in enumerate(reader, start=1):
            for value in row:
                if any(name.lower() in value.lower() for name in names_to_search):
                    current_employee = value
                    for department_index, element in enumerate(row):
                        if department_keyword.lower() in element.lower():
                            department = element
                            break
                    break  # If a name match is found, break out of the loop for this row

                elif keyword.lower() in value.lower():
                    # Iterate through the row to find the first two numeric values
                    found_integers = 0
                    numeric_values = []
                    for x in row:
                        try:
                            numeric_value = float(x)
                            numeric_values.append(numeric_value)
                            found_integers += 1
                        except ValueError:
                            pass  # Ignore non-numeric values

                        if found_integers >= 2:
                            break  # Break once the first two numeric values are found

                    regular_hours, overtime_hours = numeric_values
                    writer.writerow([current_employee, department, regular_hours, overtime_hours])
                    break  # If a keyword match is found, break out of the loop for this row
            

# Call the function with specific file names
getEmployeeInfo('Comma Delimited Invoice P.10.csv', 'Employees.txt')
