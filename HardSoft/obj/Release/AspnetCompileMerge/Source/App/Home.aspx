<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HardSoft.App.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">


       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      

    <script>


        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>


    



    <div class="container" style=" margin-top: 30px">

        <h2>.:: Bienvenido ::.</h2>

         <div class="row  hs_div"  >



 <div class="col-md-12"    style="padding-top:10px ;border: 1px solid #aaaaaa;border-radius: 5px 5px 5px 5px;
 
color: #222222; "  >
    
     <div class="col-sm-9" style="">
          <div style="    color: #239a00;
    font-size: 32px;
    font-weight: bold;
    padding-top: 10px;
    padding-left: 10px;float: left; padding:5px;
   ">
         <div style=" font-size:32px; font-weight:600">   <asp:Label ID="lblEmpresa2" runat="server" Text="MI EMPRESA"></asp:Label></div> 
              

            <div style="color:#333; font-size:24px;font-weight:500;float: left;    margin-top: 6px;">    <asp:Label ID="lblCuit2" runat="server" Text="1-11111111-1"></asp:Label> </div>

          
          </div>
          </div>

     <div class="col-sm-3">

         <img src="../../images/MiLogo.png" class="img-responsive" />

     </div>
     </div>
 
    



     </div>


</div>
       

 

     <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>

</asp:Content>