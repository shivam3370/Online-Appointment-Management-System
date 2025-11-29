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
	public partial class BookAppointment : System.Web.UI.Page
	{
        int doctorID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 1️⃣ Check if DoctorID exists in URL
                if (Request.QueryString["DoctorID"] != null)
                {
                    ViewState["DoctorID"] = Request.QueryString["DoctorID"];
                }
                else
                {
                    lblDoctor.Text = "Error: Doctor not selected!";
                    btnBook.Enabled = false;
                    return;
                }

                // 2️⃣ Display Doctor Name + Specialization
                if (Request.QueryString["DoctorName"] != null && Request.QueryString["Spec"] != null)
                {
                    string doctorName = Request.QueryString["DoctorName"];
                    string specialization = Request.QueryString["Spec"];

                    lblDoctor.Text = "Booking appointment with: " + doctorName +
                                     " (" + specialization + ")";
                }
                else
                {
                    lblDoctor.Text = "Booking appointment";
                }
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtPatientName.Text) || string.IsNullOrEmpty(txtDate.Text) || string.IsNullOrEmpty(txtTime.Text))
            {
                lblMessage.Text = "All fields are required!";
                return;
            }

            try
            {
                string cs = ConfigurationManager.ConnectionStrings["AppointmentDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO Appointments (PatientName, DoctorID, AppointmentDate, AppointmentTime) VALUES (@PatientName, @DoctorID, @Date, @Time)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@PatientName", txtPatientName.Text);
                    cmd.Parameters.AddWithValue("@DoctorID", Request.QueryString["DoctorID"]);
                    cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                    cmd.Parameters.AddWithValue("@Time", txtTime.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Appointment booked successfully!";
                }
                hlAppointments.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}