import re
import pandas as pd
import PyPDF2

# Open the PDF file
with open('your_file.pdf', 'rb') as f:
    # Create a PDF file reader object
    pdf_reader = PyPDF2.PdfFileReader(f)
    
    # Get the number of pages in the PDF file
    num_pages = pdf_reader.getNumPages()
    
    # Initialize an empty list to store the table data
    table_data = []
    
    # Loop through each page in the PDF file
    for i in range(num_pages):
        # Get the text content of the current page
        page_content = pdf_reader.getPage(i).extractText()
        
        # Search for the title of the table using a regular expression
        title_match = re.search(r'Principaux facteurs d\'évolution de la masse salariale hors CAS Pensions', page_content)
        
        # If the title is found, extract the table data from the current page
        if title_match:
            # Find the index of the line containing the title
            title_index = page_content.index(title_match.group(0))
            
            # Find the index of the line containing "Total"
            total_index = page_content.index('Total')
            
            # Extract the lines between the title and the total
            table_lines = page_content[title_index+1:total_index].split('\n')
            
            # Remove any empty lines
            table_lines = [line for line in table_lines if line]
            
            # Split each line into columns
            for line in table_lines:
                columns = line.split()
                
                # Append the columns to the table data list
                table_data.append([columns[0], float(columns[1])])
                
# Create a pandas DataFrame from the table data
df = pd.DataFrame(table_data, columns=['Description', 'Value'])

# Print the DataFrame
print(df)