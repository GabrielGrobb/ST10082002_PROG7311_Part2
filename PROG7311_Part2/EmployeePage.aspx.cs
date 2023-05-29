using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG7311_Part2
{
    public partial class EmployeePage : System.Web.UI.Page
    {
        /// creating a new instance of the database controller class.
        private static DB_Controller mydb = new DB_Controller();

        //.............................................................................//

        #region /// Page Load Method (Jadav ,2015)
        protected void Page_Load(object sender, EventArgs e)
        {
            /// Creating a session for the logged-in farmer (Jadav ,2015).
            lblUserLoginName.Text = Session["id"].ToString();

            if (!IsPostBack)
            {
                /// farmer username clearing the dropdown list.
                ddlFarmerUsername.Items.Clear();

                /// populating the farmer username dropdown.
                mydb.PopulateFarmerNameDropDown(ddlFarmerUsername);

                /// populating the product type dropdown.
                mydb.PopulateProductTypeDropDown(ddlProdType);

                /// call the display farmer method
                DisplayFarmer();
            }
        }

        #endregion

        //.............................................................................//

        #region /// method to display the gridview.
        protected void DisplayFarmer()
        {
            mydb.PopulateGridview(gvFarmerProducts);
        }

        #endregion

        //.............................................................................//

        #region /// Button to filter the gridview.
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            /// if-statement to check if the date range is empty.
            if (string.IsNullOrEmpty(txtMinDate.Text) && string.IsNullOrEmpty(txtMaxDate.Text))
            {
                /// filter by product type
                mydb.FilterGridViewProdType(ddlFarmerUsername, gvFarmerProducts, ddlProdType);
            }
            else
            {
                /// filter by date range
                mydb.FilterGridViewDate(ddlFarmerUsername, gvFarmerProducts, txtMinDate.Text, txtMaxDate.Text);
            }

            /// sets the error label text to empty.
            lblerror.Text = "";
        }

        #endregion

        //.............................................................................//

        #region /// A logout button to end the farmer session (Jadav ,2015).
        protected void btnLogout_Click(object sender, EventArgs e) 
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        #endregion

        //.............................................................................//

        #region /// A button to reset the gridview to default.
        protected void btnResetTable_Click(object sender, EventArgs e)
        {
            txtMinDate.Text = ""; /// sets the text to empty.
            txtMaxDate.Text = ""; /// sets the text to empty.
            lblerror.Text = "";   /// sets the text to empty.
            mydb.PopulateGridview(gvFarmerProducts); /// Populating the gridview. 
        }

        #endregion

        //.............................................................................//
    }
}
#region /// REFERENCES - CODE ATTRIBUTION:
/* 
 * 

Aurthor:  Nilesh Jadav
Webisite: C# corner, 2015/06/15. How to Make a Login Form Using Session in ASP.Net C#. [Online]
Accessed on: 2023/05/29
URL: https://www.c-sharpcorner.com/UploadFile/009464/how-to-make-a-login-form-using-session-in-Asp-Net-C-Sharp/

 */
#endregion

//.........................................EndOfFile................................................//