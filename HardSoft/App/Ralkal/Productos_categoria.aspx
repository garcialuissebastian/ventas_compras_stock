<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" CodeBehind="Productos_categoria.aspx.cs" Inherits="HardSoft.App.Ralkal.Productos_categoria" %>

<%@ Register Src="~/App/Ralkal/CtrlFrm/Categoria_Productos.ascx" TagPrefix="uc1" TagName="Categoria_Productos" %>




<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

    <div class="container">
    <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                     Categoria de productos             </li>
                                </ol>
        </nav>


        <uc1:Categoria_Productos runat="server" ID="Categoria_Productos" />


        </div>
      <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
</asp:Content>
