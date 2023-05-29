using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG7311_Part2
{
    public partial class Login : System.Web.UI.Page
    {
        /// creating a new instance of the database controller class.
        private static DB_Controller myDB_Controller = new DB_Controller();
        private string userName; /// username string variable.
        private string passWord; /// password string variable.

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //.............................................................................//

        #region /// A submit button for the login. (BugArray, 2022)
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            /// Setting the string variable to the text field
            userName = txtUserName.Text;

            /// Setting the string variable to the text field and retriving the hashed string.
            passWord = HashPassword(txtPassword.Text.ToString());

            /// An if statement to check if the user is a farmer. (Jadav ,2015)
            if (myDB_Controller.GetFarmerLogin(userName, passWord))
            {
                Session["id"] = userName; /// Setting Session id to a variable.
                Response.Redirect("FarmerPage.aspx"); /// Redirecting user to farmer page.
                Session.RemoveAll(); /// Removes the session. 
            }

            /// An if statement to check if the user is a employee. (Jadav ,2015)
            else if (myDB_Controller.GetEmployeeLogin(userName, passWord))
            {
                Session["id"] = userName; /// Setting Session id to a variable.
                Response.Redirect("EmployeePage.aspx"); /// Redirecting user to empolyee page.
                Session.RemoveAll(); /// Removes the session. 
            }
            else 
            {
                lblLoginError.Text = "Your Username or Password is incorrect!";
                txtUserName.Text = ""; /// Setting text field to empty.
                txtPassword.Text = ""; /// Setting text field to empty.
            }

        }

        #endregion

        //.............................................................................//

        #region /// A method of type string to hash the password field. (BugArray, 2022)
        protected string HashPassword(string pass)
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
Aurthor:  Nilesh Jadav
Webisite: YouTube, 2015/06/15. How to Make a Login Form Using Session in ASP.Net C#. [Online]
Accessed on: 2023/05/29
URL: https://www.c-sharpcorner.com/UploadFile/009464/how-to-make-a-login-form-using-session-in-Asp-Net-C-Sharp/

Aurthor:  BugArray
Webisite: YouTube, 2022/05/06. C# (.NET Core 6) - HOW TO HASH PASSWORD - Part 6. [Online]
Accessed on: 2022/10/29
URL: https://www.youtube.com/watch?v=2yEiwjUEZ78

 */
#endregion

//.........................................EndOfFile................................................//