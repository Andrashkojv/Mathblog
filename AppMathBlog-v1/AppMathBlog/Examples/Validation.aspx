<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="AppMathBlog.Validation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <script type="text/javascript">
        function CustomValidator1_OnClientValidate(source, arguments) {
           if (arguments.Value % 5 == 0) {
               arguments.IsValid = true;               
           } else {
               arguments.IsValid = false;              
           }
        }
        function CustomValidator2_OnClientValidate(source, arguments) {            
            arguments.IsValid = document.getElementById('gF').checked || document.getElementById('gM').checked;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h2>Приклади валідації</h2>
    
    <h3>RequiredFieldValidator</h3>    
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator 
        runat="server"
        ID="RequiredFieldValidator1"          
        ControlToValidate="TextBox1" 
        ValidationGroup="group1"
        Display="Dynamic"
        EnableClientScript="true"
        Text="Це поле не можна залишати порожнім"
        ErrorMessage="Помилка перевірки поля TextBox1"         
        ForeColor="Red">
    </asp:RequiredFieldValidator>
                       
    <h3>RangeValidator</h3>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:RangeValidator         
        runat="server"
        ID="RangeValidator1" 
        ControlToValidate="TextBox2" 
        ValidationGroup="group1" 
        Text="Значення поля повинно бути цілим числом із проміжку [0,100]"
        ErrorMessage="Помилка перевірки поля TextBox2" 
        Type="Integer" 
        MinimumValue="0" 
        MaximumValue="100"
        Display="Dynamic"
        ForeColor="Red">
    </asp:RangeValidator>
                
    <h3>CompareValidator</h3>            
    <asp:TextBox runat="server" ID="TextBox3"></asp:TextBox>
    <asp:CompareValidator 
        runat="server"
        ValidationGroup="group1"  
        ControlToValidate="TextBox3" 
        ValueToCompare="0" 
        Type="Double" 
        Operator="GreaterThan" 
        ErrorMessage="Помилка перевірки поля TextBox3"
        Text="Значення поля повинно бути дійсним додатнім числом"
        Display="Dynamic"
        ForeColor="Red">
    </asp:CompareValidator>
    <br /> <br />
    <asp:TextBox ID="Password1" runat="server" TextMode="Password"></asp:TextBox>   
    <asp:TextBox ID="Password2" runat="server" TextMode="Password"></asp:TextBox>             
    <asp:CompareValidator 
        runat="server"
        ID="CompareValidator1"
        ValidationGroup="group1"
        ControlToValidate="1"
        ErrorMessage="Помилка перевірки поля Password2" 
        Text="Значення полів Password1 та Password2 не співпадають"
        ControlToCompare="Password1" 
        Type="String"
        Operator="Equal"
        Display="Dynamic"
        ForeColor="Red"></asp:CompareValidator>            
            
                  
    <h3>RegularExpressionValidator</h3>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator 
        runat="server" 
        ID="RegularExpressionValidator1"     
        ControlToValidate="TextBox4"
        ValidationExpression=".+\.[Pp][Nn][Gg]|.+\.[Jj][Pp][Gg]"        
        ErrorMessage="Помилка перевірки поля TextBox4"
        Text="Значення поля повинно відповідати формату *.png або *.jpg"
        Display="Dynamic"
        ForeColor="Red">
    </asp:RegularExpressionValidator>
       
    
    <h3>CustomValidator</h3>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Text="-"></asp:ListItem>
        <asp:ListItem Text="2" Value="2"></asp:ListItem>
        <asp:ListItem Text="15" Value="15"></asp:ListItem>
    </asp:DropDownList>    
    <asp:CustomValidator 
        ID="CustomValidator1" 
        runat="server"        
        ValidationGroup="group1"
        ControlToValidate="DropDownList1"
        ClientValidationFunction="CustomValidator1_OnClientValidate"                
        OnServerValidate="CustomValidator1_OnServerValidate"
        ErrorMessage="Помилка перевірки списку DropDownList1"
        Text="Вибране значення повинно бути кратним 5"
        Display="Dynamic"
        ForeColor="Red">
    </asp:CustomValidator>
    <br /><br />
    <asp:RadioButton runat="server" ID="gF" ClientIDMode="Static" Text="ж." GroupName="Gender" />
    <asp:RadioButton runat="server" ID="gM" Text="ч." ClientIDMode="Static" GroupName="Gender" />
    <asp:CustomValidator 
        runat="server" 
        ID="CustomValidator2" 
        ValidationGroup="group1"
        ClientValidationFunction="CustomValidator2_OnClientValidate"
        OnServerValidate="CustomValidator2_OnServerValidate"         
        ErrorMessage="Помилка перевірки RadioButton"
        Text="Виберіть стать" 
        Display="Dynamic" 
        ForeColor="Red">
    </asp:CustomValidator>
    
   <h3>ValidationSummary</h3>
   <asp:ValidationSummary 
       runat="server"
       ID="ValidationSummary1"  
       ValidationGroup="group1"
       ShowMessageBox="false" 
       DisplayMode="BulletList" 
       HeaderText="Помилки заповнення форми"        
       ForeColor="Red"/>
      
    <br /><br />
    <asp:Button 
        runat="server"
        ID="Button1" 
        ValidationGroup="group1"  
        Text="Button" 
        OnClick="Button1_Click" 
        CausesValidation="True" />    

</asp:Content>
