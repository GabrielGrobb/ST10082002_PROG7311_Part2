using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG7311_Part2
{
    public partial class FarmerPage : System.Web.UI.Page
    {
        /// creating a new instance of the database controller class.
        private static DB_Controller myDB = new DB_Controller();

        //.............................................................................//

        #region /// Page Load Method (Jadav ,2015)(ChatGPT, 2023)
        protected void Page_Load(object sender, EventArgs e)
        {
            /// Creating a session for the logged-in farmer (Jadav ,2015).
            lblLoginUser.Text = Session["id"].ToString();

            /// Setting the add new product button to hidden.
            btnAddNewProduct.Visible = false;

            /// Setting the label for added product to hidden.
            lblAdded.Visible = false;

            if (!Page.IsPostBack)
            {
                /// Calling the display farmer product method.
                DisplayFarmerProduct();

                /// Using a compare validator for the client side date selection (ChatGPT, 2023).
                cvProdDate.ValueToCompare = DateTime.Now.ToShortDateString();
            }
        }

        #endregion

        //.............................................................................//

        #region /// A method to populate the farmers products bassed on their session id.
        protected void DisplayFarmerProduct()
        {
            myDB.PopulateFarmerGridview(gvProduct, lblLoginUser.Text);
        }

        #endregion

        //.............................................................................//

        #region /// A submit button to add a new product.
        protected void submitButton_Click(object sender, EventArgs e)
        {
            /// Calling the AddProduct Method
            AddProduct();
        }

        #endregion

        //.............................................................................//

        #region /// A method to add an additional product.
        protected void btnAddNewProduct_Click(object sender, EventArgs e)
        {
            lblerror.Text = string.Empty;
            lblAdded.Text = string.Empty;
            btnAddProduct.Visible = true;
            btnAddNewProduct.Visible = false;
        }

        #endregion

        //.............................................................................//

        #region /// A method of type async to add a farmer product.
        protected async void AddProduct() 
        {
            /// Nested if statements to add the product to the respective database tables.
            if (await myDB.addNewProductDetails(txtProdCode.Text, txtProdName.Text, txtProdType.Text, double.Parse(txtProdPrice.Text), int.Parse(txtProdQuant.Text), txtProdDate.Text))
            {
                if (await myDB.addnewProductEntity(lblLoginUser.Text, txtProdCode.Text))
                {
                    txtProdCode.Text = string.Empty; /// Clearing the product code textfield.
                    txtProdName.Text = string.Empty; /// Clearing the product name textfield.
                    txtProdType.Text = string.Empty; /// Clearing the product type textfield.
                    txtProdPrice.Text = string.Empty; /// Clearing the product price textfield.
                    txtProdQuant.Text = string.Empty; /// Clearing the product quantity textfield.
                    txtProdDate.Text = string.Empty; /// Clearing the product date textfield.
                    lblerror.Text = string.Empty; /// Clearing the error label text.
                    lblAdded.Text = "Product Successfully Added"; /// Setting the product added label text.
                    lblAdded.Visible = true; /// Setting the product added label to visible.
                    btnAddProduct.Visible = false; /// hidding the add product button.
                    btnAddNewProduct.Visible = true; /// Showing the add new product button.
                    DisplayFarmerProduct(); /// Calling the Display Farmer product method.
                }
            }
            else 
            {
                /// if the product is not added, this label will appear.
                lblerror.Text = "The Product Code is not unique! Please make alterations to add the product.";
            }
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