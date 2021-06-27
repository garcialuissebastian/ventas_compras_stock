<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="remito.aspx.cs" Inherits="HardSoft.App.Kardex.remito" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>

     
    <form id="form1" runat="server">
        <div>
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
    
            REMITOS 

            <br />
               <br />

            <table>
                <tr> <td>Fecha Remito</td><td>  
                    
                    <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    
          
      <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorw1" ControlToValidate="TxtFechaDesde" CssClass=" alert-danger"
                                              SetFocusOnError="true" Display="Dynamic" ErrorMessage="*" ToolTip="*" />

   
          
     </div>
          </td> <td> <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div> </td>  </tr>

                    <tr> <td>Nro Cbte :</td><td>
                        
                        <asp:TextBox ID="TxtComprobante" runat="server"></asp:TextBox>    </td><td>   <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1e" ControlToValidate="TxtComprobante" CssClass=" alert-danger"
                                              SetFocusOnError="true" Display="Dynamic" ErrorMessage="*" ToolTip="*" /></td></tr>



                    <tr> <td> </td><td> </td><td>    <asp:Button ID="Button2" runat="server" Text="Imprimir" OnClick="Button2_Click" />   </td></tr>

            </table>
    
            <br />
               <br />
             <br />
               <br />
         <h2>  ******* El tamanio del papel tiene que ser B5(JIS)  </h2>

              <h2>  ******* MARGEN ---> PREDETERMINADO  </h2>
        
            <h2>  ******* PONER LA HOJA  bien al fondo  </h2>
     
             <br /> <br />

            <img src="../../images/remitoImprimir.png" />
        </div>
    </form>
</body>
</html>
