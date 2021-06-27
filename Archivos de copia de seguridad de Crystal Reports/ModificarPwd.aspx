<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master" AutoEventWireup="true" CodeBehind="ModificarPwd.aspx.cs" Inherits="HardSoft.App.ORL.ModificarPwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

    
      <script type="text/javascript" src="/js/jquery.js"></script> 
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script> 
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>


    <div class="container">  <br /> 
            <div class="panel" style="margin-top: 15px; height: 350px; padding:10px">
                            <div class="h2">Modificar Clave de Acceso</div>
                            <div class="content">
                                <br />
                                
                                Genere una clave para su cuenta de usuario con una longitud de 6 
                                caracteres como mínimo y 10 caracteres como máximo. La misma debe contener al menos un número y una letra.<br />
                                <br />
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 200px">
                                            <br />
                                            Ingrese su nueva clave :
                                        <br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtClave"   runat="server" Width="150px" MaxLength="50" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rqtxtClave" runat="server" ControlToValidate="txtClave" ErrorMessage="Requerido" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                            <asp:RegularExpressionValidator ID="retxtClave" runat="server" ControlToValidate="txtClave" ForeColor="Red"
                                                ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,10})$" ErrorMessage="Clave invalida (Long de 6 a 10 caracteres, debe contener al menos un número y una letra)"
                                                Display="Dynamic"></asp:RegularExpressionValidator>
                                         
                                            
                                                 </td>
                                    </tr>
                                    <tr>
                                        <td>   Repita su clave : 
                                        <br />
                                            <br />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtConfirmaClave" runat="server" Width="150px" MaxLength="50" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rqtxtConfirmaClave" runat="server" ControlToValidate="txtConfirmaClave" ErrorMessage="Requerido" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                       
                                       
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtClave" ForeColor="Red"
                                                ControlToValidate="txtConfirmaClave" ErrorMessage="Las claves no son iguales"></asp:CompareValidator>
                                        
                                               
                                               </td>
                                    </tr>
                                    
                                </table>




                                <div id="login_Buttons" style="margin:auto;text-align:center">
                       
                              <input type="button" value="Volver" class="bottom btn-success"  onclick="history.back()"/>      
                                    
                                     <asp:Button ID="btnVolver" runat="server" Text="Continuar" CssClass="bottom btn-info"   OnClick="btnVolver_Click"    />
              
                                    
                                          </div> <br />
                               <div style="background-color: #C1D060;
word-spacing: 5px;
color: red;
 border:1px solid;
 padding:5px;
 text-align:center;  font-weight:500;
font-size: 16px;">   <asp:Label ID="lblmsg" runat="server"    Text="Label"></asp:Label>  </div>
                                
                            </div>
                        </div>

    </div>



     <script>
    
           $(this).everyTime(15000, function () {

                  $.ajax({
                      type: "POST",
                      url: "../ActiveSession.aspx/KeepActiveSession",
                      data: {},
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: true,
                      success: VerifySessionState,
                      error: function (XMLHttpRequest, textStatus, errorThrown) {
                          window.location.href = "../../Login_hosp.aspx";
                      }
                  });

                 
              });




              function VerifySessionState(result) {

                
                  if (!result.d) {
                    
                      window.location.href = "../../Login_orl.aspx";
                  }
              }

    </script>

</asp:Content>

