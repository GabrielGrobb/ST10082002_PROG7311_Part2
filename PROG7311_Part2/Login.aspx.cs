using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG7311_Part2
{
    public partial class Login : System.Web.UI.Page
    {
        private static DB_Controller myDB_Controller = new DB_Controller();
        private string userName;
        private string passWord;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            userName = txtUserName.Text;
            passWord = txtPassword.Text;

            if (myDB_Controller.GetFarmerLogin(userName, passWord))
            {
                Response.Redirect("FarmerPage.aspx");
            }
            else if (myDB_Controller.GetEmployeeLogin(userName, passWord))
            {
                Response.Redirect("EmployeePage.aspx");
            }
            else 
            {
                Label3.Text = "You do not have an existing Account!";
            }

        }
    }
}
