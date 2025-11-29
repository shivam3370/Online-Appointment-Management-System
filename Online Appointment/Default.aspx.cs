using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Appointment
{
	public partial class Default : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDoctors();
            }
        }
        private void BindDoctors()
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Doctors", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvDoctors.DataSource = dt;
                gvDoctors.DataBind();
            }
        }
        protected void gvDoctors_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Book")
            {
                string[] data = e.CommandArgument.ToString().Split('|');

                string doctorID = data[0];          
                string doctorName = data[1];        
                string specialization = data[2];    

                
                Response.Redirect("BookAppointment.aspx?DoctorID=" + doctorID +"&DoctorName=" + doctorName +"&Spec=" + specialization);
            }
        }

        protected void btnAddDr_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add New Doctor.aspx");
        }

        protected void btnViewAppoint_Click(object sender, EventArgs e)
        {
            Response.Redirect("Appointments.aspx");
        }
    }
}
