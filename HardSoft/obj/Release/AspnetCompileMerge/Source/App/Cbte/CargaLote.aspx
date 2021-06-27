<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="CargaLote.aspx.cs" enableEventValidation="false" Inherits="HardSoft.App.Cbte.CargaLote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">


       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      

    <script>


        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>


    



    <div class="container" style=" margin-top: 15px; ">
         <br />
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                                    <li >
                      <a  >   Comprobantes  </a> 


                                    </li>
                     <li class="active">
                     Carga de lote                </li>
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
                 <td> 
                     </td>
                     <td> </td>

                
             </tr>
             
              <tr>
 
                 <td><strong>Cargar Lote </strong>  &nbsp&nbsp</td>
                 <td> <asp:FileUpload ID= "fuRestaurar" runat = "server"   /> 
                     </td>
                     <td>&nbsp
                            <asp:Button ID="btnConfirmarRestaurar" runat = "server" Text = "CONFIRMAR" CssClass="btn-info"
                                OnClick="btnConfirmarRestaurar_Click"    /></td>

                  <td>  </td>
                   <td>  </td>
             </tr>

         </table>
            </div>
          <div class="col-sm-3" > 
              <table class=" table-responsive table" style="padding:10px" >
                  
                  <tr>
                       <td><strong>HERRAMIENTA</strong></td>  <td><strong>  VERIFICACIÓN</strong></td>  <td>&nbsp</td>
                   </tr>
                  
                  <tr>
                      <td><strong> CUIT/CUIL</strong>&nbsp&nbsp      </td>

                      <td> <input type="text" id="cuit"  class="form-control" style="width:130px" maxlength="11"   onKeyPress="return acceptNum(event)" /></td>
                        <td>  <input type="button" value="Verificar" class="btn-primary btn"  style="margin-left:10px" onclick="Cuit()"/> </td>
                  </tr>
                    
                    <tr>
                      <td><strong> N° Doc</strong>&nbsp&nbsp      </td>

                      <td> <input type="text" id="dni"  class="form-control" style="width:130px" maxlength="8"   onKeyPress="return acceptNum(event)" /></td>
                        <td>  <input type="button" value="Verificar" class="btn-primary btn"  style="margin-left:10px" onclick="Dni()"/> </td>
                  </tr>

              </table>



          </div>
          </div>
     <div class="row">
     <br />
     <hr />
     <asp:Button ID="btnDescargar" runat="server" Text="Descargar Resultado"  CssClass="btn btn-danger" OnClick="btnDescargar_Click"/><br /><br />
      <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
          </div>
     </div>
         
     </div>
 
    



   

          <div class="row  hs_div"  >



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
                    <div id='scrollDiv' style="overflow-y: auto; overflow-x: hidden; height: 530px; width: 100%;">                                                                                             
                                                       
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
     <asp:GridView ID="grid_items" runat="server"></asp:GridView>
    
       
     </div>
    </div>
       
        


 
       
         
        <script>
            function Cuit() {
                if ($("#cuit").val() == '') { alert('Campo Vacio'); } else {
                    $.ajax({
                        url: "https://soa.afip.gob.ar/sr-padron/v2/persona/" + $("#cuit").val(),
                        responseType: "json",
                        timeout: 20000,
                        cache: true,
                        success: function (result) {




                            if (result.data != null) {

                                alert(result.data.nombre + "\n" + result.data.domicilioFiscal.direccion + " - Cod Postal:" + result.data.domicilioFiscal.codPostal);


                            } else {
                                alert('Cuit/Cuil no existente.');

                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        }
                    });
                }
            }

            function Dni() {
                if ($("#dni").val() == '') { alert('Campo Vacio'); } else { 
                $.ajax({
                    url: "https://soa.afip.gob.ar/sr-padron/v2/personas/" + $("#dni").val(),
                    responseType: "json",
                    timeout: 20000,
                    cache: true,
                    success: function (result) {




                        if (result.data != null) {

                            alert('CUIT: '+result.data );


                        } else {
                            alert('N° Doc no existente.');

                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                });
                }
            }

        </script>
            <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
</asp:Content>
