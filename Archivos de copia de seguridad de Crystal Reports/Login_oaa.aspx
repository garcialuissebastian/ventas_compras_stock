<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_oaa.aspx.cs" Inherits="HardSoft.Login_oaa" %>

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
   background-color:white;
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
    color: black;
    font-size: 18px;
    text-shadow: 1px 1px 0px #000000;
    font-weight: lighter;
    border: 1px solid rgb(142 139 139 / 50%);
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
color:black;
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
    box-shadow: inset 0px 2px 0px 0px #8697a7;
    background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4da29f), color-stop(1, #8694a0) );
    background: -moz-linear-gradient( center top, #89c403 5%, #77a809 100% );
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#89c403', endColorstr='#77a809');
    background-color: #8a96a0;
    /* border: 1px solid #52928f; */
    color: #ffffff;
    /* font-size: 20px; */
    /* text-shadow: 1px 1px 0px #458e80;
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
  
                <img id="Main_img"  src="data:image/png;base64,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"  style="
width: 220px;
    margin-bottom: 10px;
">
<%--	 <img src="/images/logo.png" style="
width: 220px;
    margin-bottom: 10px;
">--%>
            </div>
            <div class="col-md-3"></div>
            </div>




                 <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6" style="background-color: aliceblue;padding-top: 25px;           border-radius: 10px 10px 0px 0px;">   
  
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
            <div class="col-md-6" style="background-color: aliceblue;">
  
  
                            <asp:TextBox ID="txtPwd" runat="server" placeholder="contraseña"  TextMode="Password"   ></asp:TextBox> 
                 &nbsp;     <asp:RequiredFieldValidator ID="rvTxtPwd" runat="server" ControlToValidate="txtPwd"
                        CssClass="alert-danger" ErrorMessage="Requerido" Display="Dynamic"  ></asp:RequiredFieldValidator>
                  
            </div>
            <div class="col-md-3"></div>
            </div>

                 <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6" style="background-color: aliceblue;">
  
	  <div id="login_Buttons">
                           
                
                <input type="button" value="Entrar" id="btnAceptarJS" onclick="aceptarJS();">
            </div>

 



            </div>
            <div class="col-md-3"></div>
            </div>
         




                 <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6" style="background-color: aliceblue; padding-bottom:10px; border-radius: 0px 0px  10px 10px;">   
  
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
