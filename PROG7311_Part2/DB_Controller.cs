using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;

namespace PROG7311_Part2
{
    public class DB_Controller
    {
        /// Retrieving the connection from the resource file.
        private string dbConnect = Properties.Resources.dbConnect;

        #region /// Default constructor
        public DB_Controller()
        {

        }
        #endregion

        //.............................................................................//

        #region /// Farmer Login
        public bool GetFarmerLogin(string userName, string passWord)
        {
            /// Temporary bool value set to true.
            bool tempValid = true;

            /// creating a SqlConnection instance with the connection string.
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data reader.
                    SqlDataReader myReader;

                    /// string variable for a sql statement.
                    string sql = "";

                    /// string variable set to a sql select statement.
                    sql = "SELECT * FROM USERCREDENTIAL U, FARMER F WHERE F.USERNAME = U.USERNAME AND U.USERNAME = '" + userName + "' AND U.P_PASSWORD = '" + passWord + "';";

                    /// sql command including the statement and the connection. 
                    cmd = new SqlCommand(sql, dbConnection);

                    /// oppening the sql connection.
                    dbConnection.Open();

                    /// setting the data reader to execute the sql command.
                    myReader = cmd.ExecuteReader();

                    /// temporary integar variable set to zero.
                    int checkMatch = 0;

                    /// while loop for the reader to read every row in the database.
                    while (myReader.Read())
                    {
                        /// integar variable itterating.
                        checkMatch++;
                    }

                    /// if statement to check if the input matched a row in the database
                    if (checkMatch == 1)
                    {
                        /// set the bool value to true.
                        tempValid = true;
                    }
                    else
                    {
                        /// set the bool value to false for no match.
                        tempValid = false;

                    }
                }
                /// catch an exception and set the bool value to false.
                catch (Exception ex)
                {
                    tempValid = false;
                }
                /// finally once all is completed, the connection is closed.
                finally
                {
                    dbConnection.Close();
                }
            }

            /// return the bool value.
            return tempValid;

        }
        #endregion

        //.............................................................................//

        #region /// Employee Login
        public bool GetEmployeeLogin(string userName, string passWord)
        {
            /// Temporary bool value set to true.
            bool tempValid = true;

            /// creating a SqlConnection instance with the connection string. 
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data reader.
                    SqlDataReader myReader;

                    /// string variable for a sql statement.
                    string sql = "";

                    /// string variable set to a sql select statement.
                    sql = "SELECT * FROM USERCREDENTIAL U, EMPLOYEE E WHERE E.USERNAME = U.USERNAME AND U.USERNAME = '" + userName + "' AND U.P_PASSWORD = '" + passWord + "';";

                    /// sql command including the statement and the connection. 
                    cmd = new SqlCommand(sql, dbConnection);

                    /// oppening the sql connection.
                    dbConnection.Open();

                    /// setting the data reader to execute the sql command.
                    myReader = cmd.ExecuteReader();

                    /// temporary integar variable set to zero.
                    int checkMatch = 0;

                    /// while loop for the reader to read every row in the database.
                    while (myReader.Read())
                    {
                        /// integar variable itterating.
                        checkMatch++;
                    }

                    /// if statement to check if the input matched a row in the database
                    if (checkMatch == 1)
                    {
                        /// set the bool value to true.
                        tempValid = true;
                    }
                    else
                    {
                        /// set the bool value to false for no match.
                        tempValid = false;

                    }
                }
                /// catch an exception and set the bool value to false.
                catch (Exception ex)
                {
                    tempValid = false;
                }
                /// finally once all is completed, the connection is closed.
                finally
                {
                    dbConnection.Close();
                }
            }

            /// return the bool value.
            return tempValid;
        }
        #endregion

        //.............................................................................//

        #region /// Populating the dropdown for farmer usernames
        public void PopulateFarmerNameDropDown(DropDownList myDropDown)
        {
            /// creating a SqlConnection instance with the connection string.
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data reader.
                    SqlDataReader myReader;

                    /// string variable for a sql statement.
                    string sql = "";

                    /// string variable set to a sql select statement.
                    sql = "SELECT F.USERNAME FROM FARMER F;";

                    /// sql command including the statement and the connection.
                    cmd = new SqlCommand(sql, dbConnection);

                    /// oppening the sql connection.
                    dbConnection.Open();

                    /// setting the data reader to execute the sql command.
                    myReader = cmd.ExecuteReader();

                    /// while loop for the reader to read a row in the database.
                    while (myReader.Read())
                    {
                        myDropDown.Items.Add(myReader.GetString(0));
                    }
                }
                catch (Exception ex)
                {

                }
                finally 
                {
                    /// closing the database connection.
                    dbConnection.Close();
                }
            }
        }

        #endregion

        //.............................................................................//

        #region /// Populating the dropdown for product types.
        public void PopulateProductTypeDropDown(DropDownList prodTypeDropDown)
        {
            /// creating a SqlConnection instance with the connection string.
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data reader.
                    SqlDataReader myReader;

                    /// string variable for a sql statement.
                    string sql = "";

                    /// string variable set to a sql select statement.
                    sql = "SELECT P.PRODUCT_TYPE FROM PRODUCT P;";

                    /// sql command including the statement and the connection.
                    cmd = new SqlCommand(sql, dbConnection);

                    /// oppening the sql connection.
                    dbConnection.Open();

                    /// setting the data reader to execute the sql command.
                    myReader = cmd.ExecuteReader();

                    /// while loop for the reader to read a row in the database.
                    while (myReader.Read())
                    {
                        prodTypeDropDown.Items.Add(myReader.GetString(0));
                    }
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    /// closing the database connection.
                    dbConnection.Close();
                }
            }
        }

        #endregion

        //.............................................................................//

        #region /// A method to populate the employee gridview
        public void PopulateGridview(GridView myGrid) 
        {
            /// Creating a new temporary datatable.
            DataTable dt = new DataTable();

            /// creating a SqlConnection instance with the connection string.
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                /// creating a new sql adapter.
                SqlDataAdapter adapt = new SqlDataAdapter("Select F.USERNAME, F.FARMER_NAME, F.FARMER_SURNAME,F.FARMER_CELL, P.PRODUCT_CODE, P.PRODUCT_NAME,P.PRODUCT_TYPE,P.PRODUCT_PRICE, P.PRODUCT_QUANT, P.PRODUCT_DATE From FARMPROD FP, PRODUCT P, FARMER F Where FP.PRODUCT_CODE = P.PRODUCT_CODE AND F.USERNAME = FP.USERNAME", dbConnection);
                
                /// opening the database connection
                dbConnection.Open();
                
                /// filling the data table with the adapter.
                adapt.Fill(dt);
                
                /// closing the database connection.
                dbConnection.Close();

                /// if statement to match the query and bind the data.
                if (dt.Rows.Count > 0)
                {
                    myGrid.DataSource = dt;
                    myGrid.DataBind();
                }
            }
        }

        #endregion

        //.............................................................................//

        #region /// A method to populate the farmer gridview.
        public void PopulateFarmerGridview(GridView myGrid, string farmer)
        {
            /// Creating a new temporary datatable.
            DataTable dt = new DataTable();

            /// creating a SqlConnection instance with the connection string.
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                /// creating a new sql adapter.
                SqlDataAdapter adapt = new SqlDataAdapter("Select P.PRODUCT_CODE, P.PRODUCT_NAME,P.PRODUCT_TYPE,P.PRODUCT_PRICE, P.PRODUCT_QUANT, P.PRODUCT_DATE From FARMPROD FP, PRODUCT P Where FP.PRODUCT_CODE = P.PRODUCT_CODE AND FP.USERNAME = '"+ farmer+"';", dbConnection);
                
                /// opening the database connection
                dbConnection.Open();

                /// filling the data table with the adapter.
                adapt.Fill(dt);

                /// closing the database connection.
                dbConnection.Close();

                /// if statement to match the query and bind the data.
                if (dt.Rows.Count > 0)
                {
                    myGrid.DataSource = dt;
                    myGrid.DataBind();
                }
            }
        }

        #endregion

        //.............................................................................//

        #region /// A method to populate a dropdown and filter the gridview. (Kumar, 2019)(ChatGPT, 2023)
        public void FilterGridViewDate(DropDownList farmerDropDown, GridView myGrid, string minDate, string maxDate)
        {
            /// Creating a new temporary datatable.
            DataTable dt = new DataTable();

            /// creating a SqlConnection instance with the connection string.
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                /// creating a new sql adapter.
                SqlDataAdapter adapt = new SqlDataAdapter("SELECT F.USERNAME, F.FARMER_NAME, F.FARMER_SURNAME, F.FARMER_CELL, P.PRODUCT_CODE, P.PRODUCT_NAME, P.PRODUCT_TYPE, P.PRODUCT_PRICE, P.PRODUCT_QUANT, P.PRODUCT_DATE " +
                                                           "FROM FARMPROD FP " +
                                                           "JOIN PRODUCT P ON FP.PRODUCT_CODE = P.PRODUCT_CODE " +
                                                           "JOIN FARMER F ON F.USERNAME = FP.USERNAME " +
                                                           "WHERE F.USERNAME = '" + farmerDropDown.SelectedValue + "' " +
                                                           "AND P.PRODUCT_DATE BETWEEN '" + minDate + "' AND '" + maxDate + "';", dbConnection);

                /// opening the database connection
                dbConnection.Open();

                /// filling the data table with the adapter.
                adapt.Fill(dt);

                /// closing the database connection.
                dbConnection.Close();

                /// binding the data to a gridview.
                myGrid.DataSource = dt;
                myGrid.DataBind();
            }
        }

        #endregion

        //.............................................................................//

        #region /// A method to populate a dropdown and filter the gridview. (Kumar, 2019)(ChatGPT, 2023)
        public void FilterGridViewProdType(DropDownList farmerDropDown, GridView myGrid, DropDownList prodTypeDropDown)
        {
            /// Creating a new temporary datatable.
            DataTable dt = new DataTable();

            /// creating a SqlConnection instance with the connection string.
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                /// creating a new sql adapter.
                SqlDataAdapter adapt = new SqlDataAdapter("SELECT F.USERNAME, F.FARMER_NAME, F.FARMER_SURNAME, F.FARMER_CELL, P.PRODUCT_CODE, P.PRODUCT_NAME, P.PRODUCT_TYPE, P.PRODUCT_PRICE, P.PRODUCT_QUANT, P.PRODUCT_DATE " +
                                                          "FROM FARMPROD FP " +
                                                          "JOIN PRODUCT P ON FP.PRODUCT_CODE = P.PRODUCT_CODE " +
                                                          "JOIN FARMER F ON F.USERNAME = FP.USERNAME " +
                                                          "WHERE F.USERNAME = '" + farmerDropDown.SelectedValue + "' " +
                                                          "AND P.PRODUCT_TYPE = '" + prodTypeDropDown.SelectedValue + "';", dbConnection);

                /// opening the database connection
                dbConnection.Open();

                /// filling the data table with the adapter.
                adapt.Fill(dt);

                /// closing the database connection.
                dbConnection.Close();

                /// binding the data to a gridview.
                myGrid.DataSource = dt;
                myGrid.DataBind();
            }
        }

        #endregion

        //.............................................................................//

        #region /// Adding product to weak entity table.
        public async Task<bool> addnewProductEntity(string fUsername, string pCode) 
        {
            /// Temporary bool value set to true.
            bool tempValid = true;

            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data adapter.
                    SqlDataAdapter adapter = new SqlDataAdapter();

                    /// string variable for a sql statement.
                    string sqlProduct = "";

                    /// string variable set to a sql insert statement.
                    sqlProduct = "INSERT INTO FARMPROD(USERNAME, PRODUCT_CODE) VALUES('"
                                + fUsername + "','" + pCode + "');";

                    /// opening the connection.
                    dbConnection.Open();

                    /// sql command including the statement and the connection.
                    cmd = new SqlCommand(sqlProduct, dbConnection);

                    /// using the adapter as an insert command in the database.
                    adapter.InsertCommand = new SqlCommand(sqlProduct, dbConnection);

                    /// executing the adapter.
                    adapter.InsertCommand.ExecuteNonQuery();

                    /// disposing the command.
                    cmd.Dispose();


                }
                catch (Exception ex)
                {
                    tempValid = false;
                }
                finally
                {
                    /// closing the database connection.
                    dbConnection.Close();
                }
            }
            await Task.Delay(0);

            /// return the bool value.
            return tempValid;
        }

        #endregion

        //.............................................................................//

        #region /// Adding a product to the main product table.

        public async Task<bool> addNewProductDetails(string pCode, string pName, string pType, double pPrice, int pQuant, string pDate) 
        {
            /// Temporary bool value set to true.
            bool tempValid = true;
            
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data adapter.
                    SqlDataAdapter adapter = new SqlDataAdapter();

                    /// string variable for a sql statement.
                    string sqlProduct = "";

                    /// string variable set to a sql insert statement.
                    sqlProduct = "INSERT INTO PRODUCT(PRODUCT_CODE, PRODUCT_NAME,PRODUCT_TYPE, PRODUCT_PRICE, PRODUCT_QUANT, PRODUCT_DATE) VALUES('"
                                + pCode + "','" + pName + "','" + pType + "'," + Convert.ToString(pPrice).Replace(',', '.') + "," + pQuant + ",'"
                                + Convert.ToDateTime(pDate) + "');";

                    /// opening the connection.
                    dbConnection.Open();

                    /// sql command including the statement and the connection.
                    cmd = new SqlCommand(sqlProduct, dbConnection);

                    /// using the adapter as an insert command in the database.
                    adapter.InsertCommand = new SqlCommand(sqlProduct, dbConnection);

                    /// executing the adapter.
                    adapter.InsertCommand.ExecuteNonQuery();

                    /// disposing the command.
                    cmd.Dispose();
                }
                catch (Exception ex)
                {
                    tempValid = false;
                }
                finally
                {
                    /// closing the database connection.
                    dbConnection.Close();
                }
            }
            /// an await to set a time delay for when the task will be performed.
            await Task.Delay(0);

            /// return the bool value.
            return tempValid;
        }

        #endregion

        //.............................................................................//

        #region /// Adding a farmer to the usercredential table.
        public bool AddNewUser(string fusername, string fpass)
        {
            bool tempValid;

            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data adapter.
                    SqlDataAdapter adapter = new SqlDataAdapter();

                    /// string variable for a sql statement.
                    string sqlUsercred = "";

                    /// string variable set to a sql insert statement.
                    sqlUsercred = "INSERT INTO USERCREDENTIAL (USERNAME, P_PASSWORD) VALUES('" + fusername + "','" + fpass + "');";

                    /// opening the connection.
                    dbConnection.Open();

                    /// sql command including the statement and the connection.
                    cmd = new SqlCommand(sqlUsercred, dbConnection);

                    /// using the adapter as an insert command in the database.
                    adapter.InsertCommand = new SqlCommand(sqlUsercred, dbConnection);

                    /// executing the adapter.
                    adapter.InsertCommand.ExecuteNonQuery();

                    /// disposing the command.
                    cmd.Dispose();

                    tempValid = true;
                    
                }
                catch (Exception ex)
                {
                    tempValid = false;
                }
                finally 
                {
                    /// closing the database connection.
                    dbConnection.Close();
                }
            }

            return tempValid;
        }

        #endregion

        //.............................................................................//

        #region /// Adding anew farmer to the farmer table.
        public void addNewFarmer(string fname, string fsname, string fDOB, string fcell, string femail, string fusername, Label error)
        {
            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                try
                {
                    /// creating a sql command.
                    SqlCommand cmd;

                    /// creating a sql data adapter.
                    SqlDataAdapter adapter = new SqlDataAdapter();

                    /// string variable for a sql statement.
                    string sqlFarmer = "";

                    /// string variable set to a sql insert statement.
                    sqlFarmer = "INSERT INTO FARMER(FARMER_CELL, FARMER_NAME, FARMER_SURNAME, FARMER_DOB, FARMER_EMAIL, USERNAME) VALUES('" 
                              + fcell + "','" + fname + "','" + fsname + "','" + Convert.ToDateTime(fDOB) + "','" + femail + "','" + fusername + "');";

                    /// opening the connection.
                    dbConnection.Open();

                    /// sql command including the statement and the connection.
                    cmd = new SqlCommand(sqlFarmer, dbConnection);

                    /// using the adapter as an insert command in the database.
                    adapter.InsertCommand = new SqlCommand(sqlFarmer, dbConnection);

                    /// executing the adapter.
                    adapter.InsertCommand.ExecuteNonQuery();

                    /// disposing the command.
                    cmd.Dispose();
                }
                catch (Exception ex)
                {
                    error.Text = ex.Message;
                }
                finally
                {
                    /// closing the database connection.
                    dbConnection.Close();
                }
            }
        }

        #endregion

        //.............................................................................//
    }
}

#region /// REFERENCES - CODE ATTRIBUTION:
/* 
 * 
Aurthor:  Rohatash Kumar
Webisite: C# corner, 2019/03/29. Binding DropDownList With Database in ASP.NET . [Online]
Accessed on: 2022/10/30
URL: https://www.c-sharpcorner.com/UploadFile/rohatash/binding-dropdownlist-with-database-and-display-data-in-gridv/



 */
#endregion

//.........................................EndOfFile............................................//