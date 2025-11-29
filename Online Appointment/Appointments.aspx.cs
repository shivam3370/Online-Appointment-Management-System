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
	public partial class Appointments : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAppointments();
            }
        }
        private void BindAppointments()
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT a.AppointmentID, a.PatientName, d.Name AS DoctorName, a.AppointmentDate, a.AppointmentTime " +
                               "FROM Appointments a JOIN Doctors d ON a.DoctorID = d.DoctorID";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();
            }

        }
	}
}