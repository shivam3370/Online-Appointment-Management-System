<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="Online_Appointment.BookAppointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<style>
.big-input {
    width: 250px;          /* Increase width */
    height: 35px;          /* Increase height */
    font-size: 16px;       /* Bigger text */
    padding: 5px 10px;
    border: 2px solid black;
    border-radius: 4px;  
}

/* Placeholder color for all browsers */
.big-input::placeholder {
    color: black;          
    opacity: 1;   
  
}
</style>
</head>
<body>
    <div style="text-align:center";><h1>Enter Booking Details</h1></div>
    <div style="text-align: center; margin-left: 10px;">
     <form id="form1" runat="server">
     <div>
         <asp:Label ID="lblDoctor" runat="server" Text=""></asp:Label><br /><br />
         <asp:TextBox ID="txtPatientName" runat="server" CssClass="big-input" placeholder="Patient Name"></asp:TextBox><br /><br />
         <asp:TextBox ID="txtDate" runat="server" CssClass="big-input" placeholder="YYYY-MM-DD"></asp:TextBox><br /><br />
         <asp:TextBox ID="txtTime" runat="server" CssClass="big-input" placeholder="HH:MM"></asp:TextBox><br /><br />
         <asp:Button ID="btnBook" runat="server" Text="Book Appointment" OnClick="btnBook_Click"
              Style="background-color: #28a745; color: white; border-radius: 10px;  padding:10px 10px;border-color:#28a745" />
         <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
         <asp:HyperLink ID="hlAppointments" 
               runat="server" 
               Text="View All Appointments" 
               NavigateUrl="Appointments.aspx"
               Visible="false"
               Style="font-size:18px; color:blue; text-decoration:underline; margin-top:15px;">
         </asp:HyperLink>
     </div>
     </form>
    </div>
</body>
</html>
