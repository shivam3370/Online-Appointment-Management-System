<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add New Doctor.aspx.cs" Inherits="Online_Appointment.Add_New_Doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Doctor</title>
     <style>
        .big-input {
            width: 250px; height: 35px; font-size: 16px;
            padding: 5px 10px; border: 2px solid black; border-radius: 4px; 
        }
        .big-input::placeholder {
             color: black;          
             opacity: 1;   
  
        }
        .book-btn {
            background-color: #28a745; color:white; padding:5px 12px; border-radius:4px; border-color: #28a745;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <h1>Add New Doctor</h1>
        <asp:TextBox ID="txtNewDoctorName" runat="server" placeholder="Doctor Name" CssClass="big-input"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtNewSpecialization" runat="server" placeholder="Specialization" CssClass="big-input"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtNewFee" runat="server" placeholder="Consultation Fee" CssClass="big-input"></asp:TextBox><br /><br />
        <asp:Button ID="btnAddDoctor" runat="server" Text="Add Doctor" OnClick="btnAddDoctor_Click1" CssClass="book-btn"/><br /><br />
        <asp:Label ID="lblAddDoctorMsg" runat="server" ForeColor="Red"></asp:Label>
            <asp:HyperLink ID="hlDoctor" 
               runat="server" 
               Text="ViewDoctors" 
               NavigateUrl="Default.aspx"
               Visible="false"
               Style="font-size:18px; color:blue; text-decoration:underline; margin-top:15px;">
               </asp:HyperLink>
        </div>
    </form>
</body>
</html>
