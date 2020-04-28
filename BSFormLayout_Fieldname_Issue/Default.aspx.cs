using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class _Default : System.Web.UI.Page {

    string Email_add;

    protected void Page_Load(object sender, EventArgs e) {

      
        }

    protected void BsCbKategorie_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        LabelInfo.Visible = false;


        // Specials
        BootstrapGridViewITCustomFields.Visible = BsCbKategorie.SelectedItem.Value.ToString() == "109";
        //BootstrapImageKat.Visible = Session["for_department"].ToString() == "36" && BsCbKategorie.SelectedItem.Text.ToString() != "-";
        //if (Session["for_department"].ToString() == "36") BootstrapImageKat.ImageUrl = "custom/ladungs/" + BsCbKategorie.SelectedItem.Text.ToString() + ".jpg";

        Session["for_department"] = "10";  // for your test
  
        if (Session["for_department"].ToString() == "10")
        {
            if (BsCbKategorie.SelectedItem.Value.ToString() == "30")
            {
                Email_add = ";dddddddd@gggg.com";
            }

            if (BsCbKategorie.SelectedItem.Value.ToString() == "12")
            {
                LabelInfo.Visible = true;
                LabelInfo.Text = "Something anonymized text";
            }
        }
    }

    protected void BootstrapGridViewITCustomFields_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
    {
        // Todo get Tempid
        e.NewValues["ticket_temp_id"] = Session["Current_Ticketid"];
    }

    protected void BsCbKategorie_Init(object sender, EventArgs e)
    {
        try
        {

            string add_language = "en_US"; //Session["Main_Language"].ToString();
            BsCbKategorie.TextField = "kategorie_"+ add_language;
                    }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }
}