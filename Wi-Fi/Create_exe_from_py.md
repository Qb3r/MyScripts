# Steps to create a .EXE from a .py file

-   Step 1 : install pyinstaller using pip
    '''
    pip install pyinstaller
    '''
-   Step 2 : run powershell and navigate to the script
-   Step 3 : Use the following command
    '''
    pyinstaller --onefile python_file.py
    '''
-   Step 4 : open the "dist" folder and find the executable there