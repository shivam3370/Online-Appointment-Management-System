Online Appointment Management System

A simple web-based ASP.NET WebForms application used to manage doctor appointments.
Includes:
Doctor listing
Add new doctor
Book appointments
View all appointments
SQL Server database (AppointmentDB.bak)

Features
✔ Add new doctors
✔ Display doctors with name, specialization, and fee
✔ Book an appointment
✔ Validate patient details
✔ Show all booked appointments
✔ Stylish UI with buttons and formatting


Project Structure
/Online-Appointment
│
├── Default.aspx              → Doctors List + Add Doctor
├── BookAppointment.aspx      → Appointment Booking Page
├── Appointments.aspx         → View All Appointments
├── Web.config
│
└── Database
      └── AppointmentDB.bak   → SQL Server Database Backup

🗄Database Information
A complete SQL Server database backup is included:
/Database/AppointmentDB.bak

Database contains:
(Doctor Table)
Doctors
DoctorID
Name
Specialization
ConsultationFee

(Appointments Table)
Appointments 
AppointmentID
PatientName
DoctorID
AppointmentDate
AppointmentTime

Setup & Run Instructions:
1. Clone the Repository
   Link : https://github.com/shivam3370/Online-Appointment-Management-System.git
   Open the project in Visual Studio.

2.Restore the SQL Database
  1.Open SSMS
  2.Right-click Databases → Restore Database
  3.Choose:Source → DeviceClick->Browse ->Select AppointmentDB.bak from the /Database folder
  4.Set database name: AppointmentDB
  5.Click OK to restore
. Update Connection String (Web.config)

3.Update your SQL Server name:
  <connectionStrings>
  <add name="AppointmentDB"
   connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=AppointmentDB;Integrated Security=True"
   providerName="System.Data.SqlClient" />
   </connectionStrings>
Replace YOUR_SERVER_NAME with your actual instance name (e.g., .\SQLEXPRESS). 

4. Run the Application
   1.Open solution file in Visual Studio and run Project
   2.Application starts with Default.aspx

  You can:
  ✔ Add a new doctor
  ✔ Select doctor → Book appointment button
  ✔ View all appointments

  Approximate Time Spent 2 Days(with 4 hours each days)
