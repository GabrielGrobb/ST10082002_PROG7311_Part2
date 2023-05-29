---------- Farmers Market Web Application ----------

--------------------------------------------------------------------------------------------------------------------------------------------

CREATOR: 	   Gabriel Grobbelaar
PLATFORM: 	   C#, Visual Studio 2019
APPLICATION TYPE : Asp.net Web Application (.NET Framework)
.NET Framework	 : 4.7.2
--------------------------------------------------------------------------------------------------------------------------------------------

---------- DESCRIPTION ---------- 

The Farmers Market Web Application was designed to capture, filter or addinformation. It will make use of two types of user's namely: Employee
and Farmer. 

The two roles will have access to the home and login screens. The home page will present the user with a short description of where they are 
located within the application and make an indication that user should login. 

Should one of the users click on the register item in the navigation, the user will be prompted with a message inidcating:"Features coming soon!"

---------- Employee ----------
 
When an employee clicks on the login button located in the navigation bar, the login page will be presented. They would need to input their login 
credentials (Username and password). Once successfully logged in, the user will be presented with a page to filter the farmers products accordingly
and a gridview of all the farmers and their corresponding products. There are two dropdowns and two date fields which the user will have to make use 
of to filter by specific farmer username and product type. The date ranges will filter the selected farmer and product type within the selected dates.
When the user has completed their filtering, there is a button (Reset Filter) that will allow the user to reset their filter and produce the initial grid view.

The employee has a secondary option to add a new farmer. They will have fill in their general information and the farmers login credentials. The
login credentials composes of the username, password and confirm password input fields. When the employee produces the sufficient information, the
farmer account will be created and they will recieve a confirmation message that the account is successfully added.

When the employee has completed their activities, they may choose to log out and return to the login screen. 

---------- Farmer ----------   

When an farmer clicks on the login button located in the navigation bar, the login page will be presented. They would need to input their login 
credentials (Username and password). The farmer will be presented with a window to add additional products to their products list. Their active
products will be displayed to them in a grid format. Should the farmer wish to add additional products, they would have to fill out the required
fields in their respective formats. Uppon a succesful capture, the item will be added to their grid with a message indication their successful 
capture. If they would like to add an additional product, there will be a button "Add Another Product?" which will allow them to capture an additional
product. 

When the farmer has completed their activities, they may choose to log out and return to the login screen.

---------- Additional Information ----------

LOGIN DETAILS:

EMPLOYEE ROLE: USERNAME - Emp1
	       Password - Admin1

Farmer roles: Username - Farmer1
	      Password - Farmer1

	      Username - Farmer2
	      Password - Farmer2

	      Username - Farmer3
	      Password - Farmer3

The bootstrap of the application was altered. The website which was used: https://bootswatch.com/minty/
This allowed for customized buttons, navigation menu, colours and forms.

The database is of type .mdf and it is located with the App_Data folder.
There is a folder named Images which is used for the image on the home screen.

Github link: https://github.com/GabrielGrobb/ST10082002_PROG7311_Part2.git

---------- HOW TO RUN ---------- 

You would need Visual Studio with C# and the .net framework installed!

The Folder of the application may be zipped or unzipped.

ZIPPED:	When the folder of the solution is zipped, you would have to place the zipped folder into another folder (Neater method)
	or on your desktop, then extract the files. 

UNZIPPED: Once extracted, open Visual Studio, you will be prompted to open a clone
	  repository, project/solution, local folder or create a new project. For this you would select "open a project or solution"
	  The next window will then ask you to navigate to the requested folder. You must select the folder where the project was 
	  unzipped/desktop. You will see the name of the application followed by a ".sln" <-- (solution). Once it is double clicked 
	  Visual Studio will open the solution. When the solution is displayed, press (CTRL + F5), this will launch the application 
	  without the debugger. Else, you may launch it with the debugger.

---------- FOLDER CONTENTS ----------

- packages
- PROG7311_Part2
- .gitattributes
- .gitignore
- dbo.Table
- dbo.Table_1
- PROG7311_Part2.sln
- PROG7311_Part2_ReadMe
- SQLQuery1
- SQLQuery2
- SQLQuery3
- SQLQuery4