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
        private string dbConnect = Properties.Resources.dbConnect;

        private static DB_Controller mydb = new DB_Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayFarmer();
                //ckbProduct_CheckedChanged();

            }
        }

        protected void DisplayFarmer()
        {
            DataTable dt = new DataTable();

            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                SqlDataAdapter adapt = new SqlDataAdapter("Select F.FARMER_NAME, F.FARMER_SURNAME,F.FARMER_CELL, P.PRODUCT_CODE, P.PRODUCT_NAME,P.PRODUCT_PRICE, P.PRODUCT_QUANT, P.PRODUCT_DATE From FARMPROD FP, PRODUCT P, FARMER F Where FP.PRODUCT_CODE = P.PRODUCT_CODE AND F.USERNAME = FP.USERNAME", dbConnection);
                dbConnection.Open();
                adapt.Fill(dt);
                dbConnection.Close();

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string productName = txtProductname.Text.Trim();

            using (SqlConnection dbConnection = new SqlConnection(dbConnect))
            {
                SqlDataAdapter adapt = new SqlDataAdapter("Select F.FARMER_NAME, F.FARMER_SURNAME,F.FARMER_CELL, P.PRODUCT_CODE, P.PRODUCT_NAME,P.PRODUCT_PRICE, P.PRODUCT_QUANT, P.PRODUCT_DATE " +
                           "From FARMPROD FP, PRODUCT P, FARMER F Where FP.PRODUCT_CODE = P.PRODUCT_CODE AND F.USERNAME = FP.USERNAME AND P.PRODUCT_NAME ='" + productName + "';", dbConnection);
                dbConnection.Open();
                adapt.Fill(dt);
                dbConnection.Close();


                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void ckbProduct_CheckedChanged(object sender, EventArgs e)
        {
            txtProductname.Enabled = ckbProduct.Checked;
            ckbDate.Checked = !ckbProduct.Checked;
            txtFirstDate.Enabled = txtSecondDate.Enabled = ckbDate.Checked;
            btnFilter.Enabled = ckbProduct.Checked || ckbDate.Checked;
        }

        protected void ckbDate_CheckedChanged(object sender, EventArgs e)
        {
            txtFirstDate.Enabled = txtSecondDate.Enabled = ckbDate.Checked;
            ckbProduct.Checked = !ckbDate.Checked;
            txtProductname.Enabled = ckbProduct.Checked;
            //btnFilter.Enabled = ckbProduct.Checked;
        }
    }
}