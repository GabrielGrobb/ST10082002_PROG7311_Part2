using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PROG7311_Part2
{
    public class DB_Controller
    {
        
        private string dbConnect = Properties.Resources.dbConnect;

        public DB_Controller() 
        {
        
        }

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
                catch (Exception ex)
                {
                    tempValid = false;
                }
                finally 
                {
                    dbConnection.Close();
                }
            }
            
            return tempValid;

        }
        #endregion

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
                catch (Exception ex)
                {
                    tempValid = false;
                }
                finally 
                {
                    dbConnection.Close();
                }
            }     
            return tempValid;
        }
        #endregion

    }
}