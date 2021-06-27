<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="miCuentaNew.ascx.cs" Inherits="intranet.App.UsrCtrl.miCuentaNew" %>



<div class="miCuenta" style="padding-top:5px">
    <a href="javascript:miCuenta();">
        
        <span class=" glyphicon glyphicon-user"></span>
       
        
        Mi Cuenta</a>
</div>
<div id="miCuenta">

    
                                 <div class="box-rool-shadows open">
                              
                                      

 <div class="box-rool-shadows__shadow-container">
                 <div class="prof-rool active header-rwd__user--professional">
                                   
                                         
                                        <span class="pic-ins-shadow" style="background-image: url('../../images/personal.png');"></span>
                                        <span class="txt-perfil">
<%--                                            <span class="name-profile-type"><asp:Label ID="lblUsuario" runat="server">Usuario</asp:Label></span>--%>
                                                <span class="profile-type">
                                                   <asp:Label ID="lblMail" runat="server">xxxxxxxxx@xxx.xxx</asp:Label> 
                                                                                                </span>
                                            
                                                  <div style="display:none">  <asp:Label ID="lbluser" runat="server"></asp:Label></div>
                <div style="font-size: 15px;
    font-weight: 600;"> <asp:Label ID="LblNombre" runat="server">Mi empresa</asp:Label>   </div>
                      <div style="font-size: 13px;line-height: 15px;">        <asp:Label ID="LblNombre2" runat="server"></asp:Label>  </div>
  <span class="name-profile-type"> CUIT: <asp:Label ID="lblCuit" runat="server">CUIT</asp:Label>    </span>  

                                            <!-- <span class="edit-prof">Editar perfil (20%)</span> -->
                                        </span>
                   </div>


    <div id="miCuenta-container">
       
         
        <div id="footer-accesos" class="header-rdw__user-links" style="padding-top:15px">
           
                   <div style="font-weight:600"> 
                           <asp:Label ID="lblAfip" runat="server" Text="" CssClass="alert-success"></asp:Label> 
          </div>
                <div style="font-weight:500"> 
                           <asp:Label ID="lblrol" runat="server" Text="" CssClass="alert-info"></asp:Label> 
          </div>
            
              <ul class="list-unstyled"  style="margin-top:8px">

                <li ><a href="/App/Registro/ModificarPwdIntranet.aspx"   ><span class="glyphicon glyphicon-lock
"></span> Cambiar contraseña</a></li>
             <li  id="usrCabiarEmpresa"><a   onclick="cambiar()"  style="cursor:pointer"><span class="glyphicon  glyphicon-transfer
"></span> Cambiar de Empresa </a></li>

                  <asp:Panel ID="PbnCerrarcaja" runat="server" Visible="false">
                       <li  id="usrCerrarCaja"><a   onclick="cerrarCaja()"  style="cursor:pointer"><span class="glyphicon   glyphicon-usd
"></span> Cerrar 

                          (<asp:Label ID="lbluserCerrarCaja" runat="server" Text="20/20/20"></asp:Label>)
                                               </a></li>
                  </asp:Panel>

                 </ul>
        </div>
       
     
        <div align="center" style=" background:#333;
bottom: 8px;
 padding:5px;
width: 300px;
position: absolute;border-bottom-right-radius: 10px;
border-bottom-left-radius: 10px;">
           <%-- <input type="button" class="btn btn-primary " value="Salir" onclick="javascript: miCuenta();" />&nbsp;&nbsp;&nbsp;--%>
        
 
     


              <button id="btnEliminar1" type="button" class="btn btn-primary   " onclick="salir()" >
   <span class=" glyphicon glyphicon-log-out"></span>  Cerrar Sesión
  </button>
            <div style="display:none">
                 
           <asp:Button ID="btnSalir" runat="server"  class="buttom" Text="Cerrar Sesión" OnClick="btnSalir_Click"  CausesValidation="false"/> 
                    
            </div>
               </div>
    </div>
</div>




                                      </div>
   </div>
<script>
   

    function encontruccion() {

        alert("En contrucción.");

       

    }
    function salir() {
         
        $('#MiCuenta1_btnSalir').click();
    }


   </script>
