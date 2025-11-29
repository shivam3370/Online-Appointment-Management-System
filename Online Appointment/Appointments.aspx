<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="Online_Appointment.Appointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointments</title>

<style>
.big-input {
    width: 250px;          
    height: 35px;          
    font-size: 16px;       
    padding: 5px 10px;
    border: 2px solid black;
    border-radius: 4px;  
}


.big-input::placeholder {
    color: black;          
    opacity: 1;   
}
</style>
    
</head>
<body>
    <div style="text-align:center"><h1>All Appointment </h1></div>
    <div style="text-align: center;margin-left: 550px;>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False">
    <Columns>
    <asp:BoundField DataField="AppointmentID" HeaderText="ID" />
    <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
    <asp:BoundField DataField="DoctorName" HeaderText="Doctor" />
    <asp:BoundField DataField="AppointmentDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
    <asp:BoundField DataField="AppointmentTime" HeaderText="Time" />
    </Columns>
    </asp:GridView>
    </div>
    </form>
    </div>
</body>
</html>
