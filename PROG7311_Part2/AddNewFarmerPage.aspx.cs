using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG7311_Part2
{
    public partial class AddNewFarmerPage : System.Web.UI.Page
    {
        /// creating a new instance of the database controller class.
        private static DB_Controller myDB = new DB_Controller();

        //.............................................................................//

        #region /// Page Load Method
        protected void Page_Load(object sender, EventArgs e)
        {
            /// Intitally hiding the success label when a farmer is added.
            lblSuccess.Visible = false;

            if (!IsPostBack) 
            {
                
            }
        }

        #endregion

        //.............................................................................//

        #region /// A button to validate the passwords and call a method.
        protected void submitButton_Click(object sender, EventArgs e)
        {
            /// if statement to check if the passwords do not match.
            if (txtFarmerPassword.Text != txtFarmerConPassword.Text)
            {
                lblErrorLogin.Text = "Your Passwords do not match please retry!";
            }
            else 
            {
                /// Calling the AddFarmer Method.
                AddFarmer();
            }
        }

        #endregion

        //.............................................................................//

        #region /// A method to add a new farmer.
        protected void AddFarmer() 
        {
            /// An if statement to validate and add the data to a database table.
            if (myDB.AddNewUser(txtFarmerUsername.Text, HashFarmerPassword(txtFarmerPassword.Text)))
            {
                /// Adding the farmers details to a database table.
                myDB.addNewFarmer(txtFarmerName.Text, txtFarmerSurname.Text, txtCalenderDate.Text, txtFarmerCell.Text, txtFarmerEmail.Text, txtFarmerUsername.Text, lblError);
                lblSuccess.Text = "Farmer Successfully Added!"; /// A label that indicates a successful capture.
                lblSuccess.Visible = true; /// Setting the label to visable.
                lblError.Text = string.Empty; /// Clearing the error label.
                lblErrorLogin.Text = string.Empty; /// Clearing the error label.

                /// Setting the text to empty.
                txtFarmerName.Text = string.Empty;
                txtFarmerSurname.Text = string.Empty;
                txtCalenderDate.Text = string.Empty;
                txtFarmerCell.Text = string.Empty;
                txtFarmerEmail.Text = string.Empty;
                txtFarmerUsername.Text = string.Empty;
                txtFarmerPassword.Text = string.Empty;
                txtFarmerConPassword.Text = string.Empty;
            }
            else
            {
                lblError.Text = "Username is not unique!";
            }
        }

        #endregion

        //.............................................................................//

        #region /// A method of type string to hash the password field. (BugArray, 2022)
        protected string HashFarmerPassword(string pass)
        {
            /// Creating a new SHA256.
            var sha = SHA256.Create();

            /// Creating a new byte array for the password.
            var byteArray = Encoding.Default.GetBytes(pass);

            /// stores the hashed password.
            var hashedPass = sha.ComputeHash(byteArray);

            /// converting the hashed password to a string
            return Convert.ToBase64String(hashedPass);

        }
        #endregion

        //.............................................................................//
    }
}

#region /// REFERENCES - CODE ATTRIBUTION:
/* 
 * 
Aurthor:  BugArray
Webisite: YouTube, 2022/05/06. C# (.NET Core 6) - HOW TO HASH PASSWORD - Part 6. [Online]
Accessed on: 2022/10/29
URL: https://www.youtube.com/watch?v=2yEiwjUEZ78

 */
#endregion

//.........................................EndOfFile................................................//