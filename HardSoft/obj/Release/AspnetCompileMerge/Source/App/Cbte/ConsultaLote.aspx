<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="ConsultaLote.aspx.cs" enableEventValidation="false" Inherits="HardSoft.App.Cbte.ConsultaLote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <style>
        #sec_detalle {
    
    
}


    </style>

       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      

    <script>


        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>


    



    <div class="container" style=" margin-top: 15px">
         <br />
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                                    <li >
                      <a  >   Comprobantes  </a> 


                                    </li>
                     <li class="active">
                     Consulta de lote                </li>
                                </ol>
        </nav>
    









         <div class="row  hs_div"  >



 <div class="col-md-12"    style="padding-top:10px ;border: 1px solid #aaaaaa;border-radius: 5px 5px 5px 5px;
background-color: rgb(253, 253, 97) ;
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

         <img src="http://www.hardsoft.com.ar/images/MiLogo.png" class="img-responsive" />

     </div>
     </div>
 
    



     </div>

        <div class="row  hs_div"  >



 <div class="col-md-12"    style="padding-top:10px ;border: 1px solid #aaaaaa;border-radius: 5px 5px 5px 5px;
background-color: white ;
color: #222222; "  >
      
      <div class="row">
        <div class="col-sm-7">
         <table class="table-responsive  ">
            
             <tr>  <td> <strong>Comprobante</strong>  &nbsp&nbsp</td>
                   <td> <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                       <asp:ListItem Value="1">Factura A</asp:ListItem>
                       <asp:ListItem Value="6">Factura B</asp:ListItem>
                       </asp:DropDownList></td>
 
                 <td></td>
                   <td>&nbsp
                            <asp:Button ID="btnConfirmarRestaurar" runat = "server" Text = "Buscar" CssClass="btn btn-info"
                                OnClick="btnConfirmarRestaurar_Click"    /></td>

                     <td> </td>

                
             </tr>
             
              

         </table>
            </div>
          <div class="col-sm-3" > 
            
               

          </div>
          </div>
     <div class="row"> 
          <div class="col-sm-12" style="margin-top:5px" > 
    <div id='scrollDiv2' style="overflow-y: auto; overflow-x: hidden; height: 200px; width: 100%;">
 <asp:GridView ID="gvGrilla" runat="server" Width="100%"
                            AutoGenerateColumns="False"  
                               
                            EmptyDataText="&nbsp;&nbsp;No posee registro" 
                  ShowHeaderWhenEmpty="True" EmptyDataRowStyle-CssClass="GridRow"
                            GridLines="Horizontal" HeaderStyle-HorizontalAlign="Center" 
                  OnSelectedIndexChanged="gvGrilla_SelectedIndexChanged">

                              <Columns >                                              
                                  
                                      <asp:CommandField ShowSelectButton="True"  SelectText="<div class='Seba1'>dsa</div>"  
                                       AccessibleHeaderText="Seleccionar" ButtonType="Image" HeaderText="Seleccionar" 
                                       SelectImageUrl="~/images/ver.png"      >
                                           

                                 
                                   </asp:CommandField>


                                  <asp:BoundField DataField="Id" HeaderText="Lote Id" />
                                  <asp:BoundField DataField="CantReg"    HeaderText="CantRegistros">
                                  </asp:BoundField>
                                  <asp:BoundField DataField="Resultado" HeaderText="Resultado"    >
                                  </asp:BoundField>
                                 
                               
                                  <asp:BoundField DataField="aud" HeaderText="Generado" 
                                          DataFormatString="{0:dd/MM/yyyy}" />
                                 
                               
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

     <div class="row">
     <br />
     <hr />
   
      <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
          </div>
     </div>
         
     </div>
   
          <asp:Panel ID="PnlPop" runat="server"  Visible="false"  >
  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">
     <div class="row  hs_div" >
 
 <div class="col-md-12"    style="padding-top:10px ;border: 1px solid #aaaaaa;border-radius: 5px 5px 5px 5px;
background-color: white ;
color: #222222; "  >   
      
     <div class="col-sm-12" style="">      
          <asp:GridView ID="gvLote" runat="server" Width="100%"
                            AutoGenerateColumns="False"
                               
                            EmptyDataText="&nbsp;&nbsp;No posee registro" ShowHeaderWhenEmpty="True" EmptyDataRowStyle-CssClass="GridRow"
                            GridLines="Horizontal" HeaderStyle-HorizontalAlign="Center">

                              <Columns>                                              

                                   
                                  <asp:BoundField DataField="Id" HeaderText="Lote Id" />
                                  <asp:BoundField DataField="CantReg"    HeaderText="CantReg">
                                  </asp:BoundField>
                                  <asp:BoundField DataField="Resultado" HeaderText="Resultado"    >
                                  </asp:BoundField>
                                 
                               
                              </Columns>
  <EditRowStyle BackColor="#2461BF" />

<EmptyDataRowStyle CssClass="GridRow"></EmptyDataRowStyle>
                 <FooterStyle BackColor="#507CD1" ForeColor="White"   />                  
               <SelectedRowStyle Font-Bold="true" ForeColor="#333333" />
                                        <RowStyle CssClass="GridRow" />
                                        <HeaderStyle CssClass="HeaderGrid" />
                                        <AlternatingRowStyle CssClass="GridRowAlt" />

     </asp:GridView>
      <br />
         <asp:GridView ID="gvError" runat="server" Width="100%"
                            AutoGenerateColumns="False"
                               
                            EmptyDataText="&nbsp;&nbsp;No posee Errores" ShowHeaderWhenEmpty="True" EmptyDataRowStyle-CssClass="GridRow"
                            GridLines="Horizontal" HeaderStyle-HorizontalAlign="Center">

                              <Columns>                                              

                                   
                                  <asp:BoundField DataField="id_lote" HeaderText="Lote Id" />
                                  <asp:BoundField DataField="Cod"    HeaderText="Código">
                                  </asp:BoundField>
                                  <asp:BoundField DataField="msg" HeaderText="Descripción Error"    >
                                  </asp:BoundField>
                                 
                               
                              </Columns>
  <EditRowStyle BackColor="#2461BF" />

<EmptyDataRowStyle CssClass="GridRow"></EmptyDataRowStyle>
                 <FooterStyle BackColor="#507CD1" ForeColor="White"   />                  
               <SelectedRowStyle Font-Bold="true" ForeColor="#333333" />
                                        <RowStyle CssClass="GridRow" />
                                        <HeaderStyle CssClass="HeaderGrid" />
                                        <AlternatingRowStyle CssClass="GridRowAlt" />

     </asp:GridView>
         <br />
                    <div id='scrollDiv' style="overflow-y: auto; overflow-x: hidden; height: 280px; width: 100%;">                                                                                             
                                                       
          <asp:GridView ID="gvDetalle" runat="server" Width="100%"
                            AutoGenerateColumns="False"
                               
                            EmptyDataText="&nbsp;&nbsp;No posee registro" ShowHeaderWhenEmpty="True" EmptyDataRowStyle-CssClass="GridRow"
                            GridLines="Horizontal" HeaderStyle-HorizontalAlign="Center">

                              <Columns>                                              

                                   
                                  <asp:BoundField DataField="DocNro" HeaderText="DocNro" />
                                  <asp:BoundField DataField="CbteDesde"    HeaderText="N° Cbte">
                                  </asp:BoundField>
                                  
                                  <asp:BoundField DataField="ImpTotal" HeaderText="ImpTotal" />
                                  <asp:BoundField DataField="ImpNeto" HeaderText="ImpNeto"  /> 
                               
                                  <asp:BoundField DataField="ImpIVA" HeaderText="ImpIVA" />
                                  <asp:BoundField DataField="CAE" HeaderText="CAE" />
                                  <asp:BoundField DataField="CAEFchVto" HeaderText="CAEFchVto" />
                                  <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" >
                               
                                  <ItemStyle ForeColor="#CC0000" />
                                  </asp:BoundField>
                               
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
       
<br />
       
     </div>
    </div>
       </div>
        <div class="modal-footer">
              <asp:Button ID="btnDescargar" runat="server" Text="Descargar Resultado"  CssClass="btn btn-danger pull-left" OnClick="btnDescargar_Click"/> 
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>

        </asp:Panel>




           <asp:updatepanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">
   <ContentTemplate>
<fieldset>
        
 

 
             </fieldset>
</ContentTemplate>
 <Triggers>

 
</Triggers>
 </asp:updatepanel> 

         
       
 </div>

    
 
      


        


     <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
      <script>
          $(document).ready(function () {

              $("#myModal2").modal();

          });
      </script>

       <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
</asp:Content>
