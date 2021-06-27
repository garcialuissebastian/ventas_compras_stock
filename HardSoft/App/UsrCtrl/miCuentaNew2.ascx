<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="miCuentaNew2.ascx.cs" Inherits="intranet.App.UsrCtrl.miCuentaNew2" %>



<div class="miCuenta" style="padding-top:5px">
    <a href="javascript:miCuenta();">
        
        <span class=" glyphicon glyphicon-user"></span>
       
        
        Mi Cuenta</a>
</div>
<div id="miCuenta">

    
                                 <div class="box-rool-shadows open">
                              
                                      

 <div class="box-rool-shadows__shadow-container">
                 <div class="prof-rool active header-rwd__user--professional">
                                    <a href="perfil" class="clearfix">
                                         
                                        <span class="pic-ins-shadow" style="background-image: url('../../images/personal.png');"></span>
                                        <span class="txt-perfil">
                                            <span class="name-profile-type"><asp:Label ID="lblUsuario" runat="server">- Usuario</asp:Label></span>
                                                <span class="profile-type">
                                                  <asp:Label ID="lblMail" runat="server">xxxxxxxxx@xxx.xxx</asp:Label>
                                                                                                </span>
                                            <!-- <span class="edit-prof">Editar perfil (20%)</span> -->
                                        </span>
                   </div>


    <div id="miCuenta-container">
       
         
        <div id="footer-accesos" class="header-rdw__user-links" style="padding-top:15px">
       
            <ul class="list-unstyled" >
              
                <li ><a href="/App/Orl/ModificarPwd.aspx"   ><span class="glyphicon glyphicon-lock
"></span> Cambiar contraseña</a></li>
           
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
