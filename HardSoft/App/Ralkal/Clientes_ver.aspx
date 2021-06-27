<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="Clientes_ver.aspx.cs" Inherits="HardSoft.App.Ralkal.Clientes_ver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     <script language="JavaScript" type="text/javascript">
         
         function acceptNum(e) {
             var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
             return ((tecla > 47 && tecla < 58) || tecla == 8);
         } 
         </script>




     <div class=" container">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                   Ver Clientes             </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
       <strong>    Información del cliente </strong> 
            </div>

<div class="row" style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
 
   <div class="form-group">
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
      <asp:DropDownList ID="cmbTipoOp" runat="server"  class="form-control">
          <asp:ListItem Value="0">CUIT</asp:ListItem>
          <asp:ListItem Value="1">N° Documento</asp:ListItem>
          <asp:ListItem Value="2">Razón Social</asp:ListItem>
          <asp:ListItem Value="3">Apellido</asp:ListItem>
          <asp:ListItem Value="4">Ramo</asp:ListItem>
      </asp:DropDownList>
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscar" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
         <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="btn2 btn-danger" OnClick="BtnBuscar_Click" />
         </div>
       </div> 
</div>

<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />

</div>




    <div class="row"> 
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='scrollDiv2' style="overflow-y: auto; overflow-x: hidden; height: 350px; width: 100%;">
 <asp:GridView ID="gvGrilla3" runat="server" Width="100%"
                            AutoGenerateColumns="False"  
                               
                            EmptyDataText="&nbsp;&nbsp;No posee registro" 
                  ShowHeaderWhenEmpty="True" EmptyDataRowStyle-CssClass="GridRow"
                            GridLines="Horizontal" HeaderStyle-HorizontalAlign="Center" 
                  OnSelectedIndexChanged="gvGrilla_SelectedIndexChanged"  CssClass="table table-responsive" >

                              <Columns >                           
                                  
                                  
                                  
                                                    
                                  

                                  <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectImageUrl="~/images/ver.png" SelectText="Ver Mas.." HeaderText="Ver"   />
                                  
                                  
                                  
                                                    
                                  

                                  <asp:BoundField DataField="Id" HeaderText="Id" />
                                  <asp:BoundField DataField="Nombre"    HeaderText="Nombre">
                                  </asp:BoundField>
                                  <asp:BoundField DataField="Apellido" HeaderText="Apellido"    >
                                  </asp:BoundField>
                                 
                               
                                  <asp:BoundField DataField="Doc_no" HeaderText="Doc_no" />
                                 
                               
                                      <asp:BoundField DataField="Razon_social" HeaderText="Razon_social" />
                                      <asp:BoundField DataField="Cuit" HeaderText="Cuit" />
                                      <asp:BoundField DataField="Ramo" HeaderText="Ramo" />
                                 
                               
                              </Columns>
  <EditRowStyle BackColor="#2461BF" />

<EmptyDataRowStyle CssClass="GridRow"></EmptyDataRowStyle>
                 <FooterStyle BackColor="#507CD1" ForeColor="White"   />                  
               <SelectedRowStyle Font-Bold="true" ForeColor="#333333" />
                                        <RowStyle CssClass="GridRow" />
                                        <HeaderStyle CssClass="HeaderGrid" />
                                        <AlternatingRowStyle CssClass="GridRowAlt" />

     </asp:GridView>
</div>
              </div>
     </div>

        </div>
   </div>
      <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
</asp:Content>
