<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" CodeBehind="Puesto_per.aspx.cs" Inherits="HardSoft.App.Ralkal.Puesto_per" %>

<%@ Register Src="~/App/Ralkal/CtrlFrm/Puestos.ascx" TagPrefix="uc1" TagName="Puestos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">


     <div class="container">
    <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                    Puestos            </li>
                                </ol>
        </nav>

    <uc1:Puestos runat="server" id="Puestos" />
    
         </div>
  <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
</asp:Content>

