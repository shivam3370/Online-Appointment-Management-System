using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Appointment
{
	public partial class Add_New_Doctor : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        
        protected void btnAddDoctor_Click1(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNewDoctorName.Text) ||
                string.IsNullOrEmpty(txtNewSpecialization.Text) ||
                string.IsNullOrEmpty(txtNewFee.Text))
            {
                lblAddDoctorMsg.Text = "All fields are required!";
                return;
            }
            try
            {
                decimal fee;
                if (!Decimal.TryParse(txtNewFee.Text, out fee))
                {
                    lblAddDoctorMsg.Text = "Enter a valid fee!";
                    return;
                }

                string cs = ConfigurationManager.ConnectionStrings["AppointmentDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO Doctors (Name, Specialization, ConsultationFee) VALUES (@Name, @Spec, @Fee)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtNewDoctorName.Text);
                    cmd.Parameters.AddWithValue("@Spec", txtNewSpecialization.Text);
                    cmd.Parameters.AddWithValue("@Fee", fee);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblAddDoctorMsg.ForeColor = System.Drawing.Color.Green;
                lblAddDoctorMsg.Text = "Doctor Added successfully!";
                txtNewDoctorName.Text = "";
                txtNewSpecialization.Text = "";
                txtNewFee.Text = "";
                hlDoctor.Visible = true;
            }
            catch (Exception ex)
            {
                lblAddDoctorMsg.ForeColor = System.Drawing.Color.Red;
                lblAddDoctorMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}