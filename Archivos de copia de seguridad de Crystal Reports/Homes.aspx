<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master" AutoEventWireup="true" CodeBehind="Homes.aspx.cs" Inherits="HardSoft.App.Homes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      

    <script>


        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>

   
    
    <style>
        #Cuerpo {

            background-color:#d7e6e1;
        }

     .navbar-nav > li > .dropdown-menu {
    border-radius: 4px;
    margin-top: 0px;
 padding: 3px;
    opacity: 1;
}
    </style>


    <div class="container" style=" margin-top: 30px">

        <div class="hidden-sm hidden-xs">
         

         <div class="row  hs_div hidden"  >



 <div class="col-md-12"    style="padding:10px ;border: 1px solid #aaaaaa;border-radius: 5px 5px 5px 5px;
 
color: #222222; background-color:white"  >
    
     <div class="col-sm-9" style="">
          <div style="    color:#838682;
    font-size: 32px;
    font-weight: bold;
    padding-top: 10px;
    padding-left: 10px;float: left; padding:5px;
   ">
         <div style=" font-size:32px; font-weight:600">   <asp:Label ID="lblEmpresa2" runat="server" Text="MI EMPRESA"></asp:Label></div> 
              

            <div style="color:#333; font-size:24px;font-weight:500;float: left;    margin-top: 10px;">    <asp:Label ID="lblCuit2" runat="server" Text="1-11111111-1"></asp:Label> </div>
 <br />
                 <div style=" font-size:32px; font-weight:600; text-align: left; color: #333333;   margin-top: 28px;">   <asp:Label ID="lblModo" runat="server" Text=""></asp:Label></div> 
          
          </div>
          </div>

     <div class="col-sm-3">

      <%--   <img src="../../images/MiLogo.png" class="img-responsive" />--%>

        <%-- <img src="../images/ignis.jpg" class="img-responsive" />
    --%>
         <asp:Image ID="img" runat="server" class="img-responsive" />
         
          </div>
     </div>
 
    



     </div>
            </div>


        <div >

          <img src="/App/ORL/img/3sMovil_V3.png" alt="" border="0" class=" img-responsive" style="margin:auto;padding-right:9px;vertical-align: middle;margin-top: 50px;">
        </div>

</div>
       

 

     

</asp:Content>