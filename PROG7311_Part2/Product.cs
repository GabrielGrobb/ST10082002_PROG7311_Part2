using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PROG7311_Part2
{
    public class Product
    {
        private string farmerName;
        private string farmerSurname;
        private string farmerCell;

        private string productCode;
        private string productName;
        private double productPrice;
        private int productQuant;
        private DateTime productDate;

        public Product(string fname, string fsurname, string fcell ,string code, string name, double price, int quantity, DateTime date) 
        {
            this.farmerName = fname;
            this.farmerSurname = fsurname;
            this.farmerCell = fcell;
            this.productCode = code;
            this.productName = name;
            this.productPrice = price;
            this.productQuant = quantity;
            this.productDate = date;
        }
        public string FarmerName { get => farmerName; set => farmerName = value; }
        public string FarmerSurname { get => farmerSurname; set => farmerSurname = value; }
        public string FarmerCell { get => farmerCell; set => farmerCell = value; }
        public string ProductCode { get => productCode; set => productCode = value; }
        public string ProductName { get => productName; set => productName = value; }
        public double ProductPrice { get => productPrice; set => productPrice = value; }
        public int ProductQuant { get => productQuant; set => productQuant = value; }
        public DateTime ProductDate { get => productDate; set => productDate = value; }
        
    }
}