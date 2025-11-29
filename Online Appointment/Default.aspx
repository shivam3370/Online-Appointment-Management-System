<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Appointment.Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment Portal</title>

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
    <div style="text-align:center"><h1>Online Appointment Management Portal </h1></div>
    <div style="text-align: center; margin-left: 500px;">
        <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvDoctors" runat="server" AutoGenerateColumns="False" OnRowCommand="gvDoctors_RowCommand" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"
    CellPadding="6" GridLines="Both">
            <Columns>
                <asp:BoundField DataField="DoctorID" HeaderText="Dr. ID" Visible="True" />
                <asp:BoundField DataField="Name" HeaderText="Doctor Name" />
                <asp:BoundField DataField="Specialization" HeaderText="Specialization" />
                <asp:BoundField DataField="ConsultationFee" HeaderText="Fee" DataFormatString="{0:C}" />
                 <asp:TemplateField>
                <ItemTemplate>
                <asp:Button ID="btnBook" runat="server" Text="Book" CommandName="Book" CommandArgument='<%#Eval("DoctorID")+"|"+Eval("Name") +"|"+ Eval("Specialization")%>'
                  Style="background-color: #28a745; color: antiquewhite; border-radius: 30px; padding: 10px 10px;border:solid;border-color:#28a745" />
                </ItemTemplate>
               </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div style="text-align: center;margin-top:20px;margin-right:500px">
            <asp:Button ID="btnAddDr" runat="server" OnClick="btnAddDr_Click" Text="Add New Doctor" Style="background-color:#007bff; color:white;padding:10px 10px; border-radius:8px; border:none;"/>
            <asp:Button ID="btnViewAppoint" runat="server" OnClick="btnViewAppoint_Click" Text="View Appointment" Style="background-color:#007bff; color:white;padding:10px 10px; border-radius:8px;border:none"/>
        </div>

    </div>
</form>
    </div>
</body>
</html>
