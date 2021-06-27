<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservarEnd.aspx.cs" Inherits="HardSoft.App.ORL.ReservarEnd" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>
<html lang="en"> 
<head runat="server"  >
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Centro ORL de Quilmes</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:600italic,400,800,700,300' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=BenchNine:300,400,700' rel='stylesheet' type='text/css'>
    <script src="/App/ORL/js/modernizr.js"></script>
 
       <script language="JavaScript" type="text/javascript">

           function testForEnter() {
               if (event.keyCode == 13) {
                   event.cancelBubble = true;
                   event.returnValue = false;
               }
           }
           function validNumber(e) {
               e.preventDefault();
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               return ((tecla > 47 && tecla < 58) || tecla == 8);
           }

           function validLetter(e) {
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               var especiales = [8, 32, 13];/*back, space, enter */

               for (var i in especiales) {
                   if (tecla == especiales[i]) { return true;/*break; */ }
               }
               return (((tecla > 96 && tecla < 123) || (tecla > 64 && tecla < 91)) || tecla == 8);
           }

           var nav4 = window.Event ? true : false;


           function validateFloatKeyPress(el, evt, ints, decimals) {

               // El punto lo cambiamos por la coma

               if (evt.keyCode == 46) {
                   evt.keyCode = 44;
               }

               // Valores numéricos
               var charCode = (evt.which) ? evt.which : event.keyCode;
               if (charCode != 44 && charCode > 31
                   && (charCode < 48 || charCode > 57)) {
                   return false;
               }

               // Sólo una coma
               if (charCode == 44) {
                   if (el.value.indexOf(",") !== -1) {
                       return false;
                   }
                   return true;
               }

               // Determinamos si hay decimales o no
               if (el.value.indexOf(",") == -1) {
                   // Si no hay decimales, directamente comprobamos que el número que hay ya supero el número de enteros permitidos
                   if (el.value.length >= ints) {
                       return false;
                   }
               }

               else {
                   // Damos el foco al elemento
                   el.focus();
                   // Para obtener la posición del cursor, obtenemos el rango de la selección vacía
                   var oSel = this.document.selection.createRange();
                   // Movemos el inicio de la selección a la posición 0
                   oSel.moveStart('character', -el.value.length);
                   // La posición de caret es la longitud de la selección
                   iCaretPos = oSel.text.length;
                   // Distancia que hay hasta la coma
                   var dec = el.value.indexOf(",");
                   // Si la posición es anterior a los decimales, el cursor está en la parte entera
                   if (iCaretPos <= dec) {
                       // Obtenemos la longitud que hay desde la posición 0 hasta la coma, y comparamos
                       if (dec >= ints) {
                           return false;
                       }
                   }
                   else { // El cursor está en la parte decimal
                       // Obtenemos la longitud de decimales (longitud total menos distancia hasta la coma menos el carácter coma)
                       var numDecimals = el.value.length - dec - 1;
                       if (numDecimals >= decimals) {
                           return false;
                       }
                   }
               }
               return true;
           }

           function decimales(evt, control) {
               //Limita un control a números con dos decimales.
               var texto = control.value;
               var coma = texto.indexOf(',');

               if (evt.keyCode <= 13 || (evt.keyCode >= 48 && evt.keyCode <= 57)) {
                   if ((coma != -1) && (texto.length - (coma + 1)) >= 2) {
                       return false;
                   }
               }
               else if (evt.keyCode == 44 && texto.length > 1) {
                   if (coma != -1 && texto.indexOf(',', coma) != -1) {
                       return false;
                   }
               } else {
                   return false;
               }
               return true;
           }

           function acceptNum2(evt, valo) {
               // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46
               var key = nav4 ? evt.which : evt.keyCode;


               if (key == 46) {

                   if (valo.indexOf(".") != -1) {
                       //retun -1 si no encuentra . en string
                       return false;
                   }

               } else {

                   return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
               }

           }
           function acceptNum(e) {
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               return ((tecla > 47 && tecla < 58) || tecla == 8);
           }
    </script>
     <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
          
    <script src="/js/jquery.maskedinput.js"></script>
   
    
     <script type="text/javascript" src="/js/preloader.js"></script>
    <link rel="stylesheet" href="/css/preloader.css"/>

    <style>
             .spinner-wrapper {
    background: rgba(33, 33, 31, 0.68);
    /* loading color */
}
    </style>

    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<header class="top-header">
		<div class="container"> 	
            
            <div class="row">
             <div class=" col-xs-6  col-md-7 col-lg-7  ">
					<nav class="navbar navbar-default">
					  <div class="container-fluid nav-bar">
					    <!-- Brand and toggle get grouped for better mobile display -->
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" style="right: 65%;">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					    </div>

					    <!-- Collect the nav links, forms, and other content for toggling -->
					    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					      
					      <ul class="nav navbar-nav navbar-right">
					        <li><a class="menu active" href="http://www.corlquilmes.com.ar/App/ORL/Inicio.aspx" >Inicio</a></li>
					        <li><a class="menu" href="http://www.corlquilmes.com.ar/App/ORL/Inicio.aspx#about">Institucional</a></li>
					        <li><a class="menu" href="http://www.corlquilmes.com.ar/App/ORL/Inicio.aspx#service">Centro Médico</a></li>
					     
					        <li><a class="menu" href="http://www.corlquilmes.com.ar/App/ORL/Inicio.aspx#contact">Contacto</a></li>
                               <li><a class="menu" href="Reservar.aspx" style="color:red">  Turnos    </a></li>
					      </ul>
					    </div><!-- /navbar-collapse -->
					  </div><!-- / .container-fluid -->
					</nav>
				</div>
				<div class="col-xs-6  col-lg-5 col-md-5 header-logo pull-right" style="text-align:right; 
    margin-top: 1px;
">
					<div class="col-xs-4  col-lg-12 ">
					<a href="index.aspx" id="logo2"><img src="" alt="" class="" id="logo1"></a>
				</div>
                    
                    
                    <div class="col-xs-8 hidden-md hidden-lg" style="-webkit-text-stroke-width: 1px;text-align:left
-webkit-text-stroke-color:red; font-size:16px; margin-top: 2px;">
                
                 
                   <div style="color:red;font-weight:800"><a href="Reservar.aspx" style="color:red;font-weight:800;"> TURNOS</a></div>   

                              <div  style="margin-top:0px"><a href="tel:+541142534310" style="color:red;font-weight:800;margin-top:10px">4253-4310</a></div> 
				      </div>
                
                </div>

				
			</div>
		</div>
	</header>

    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
     
         <div class="spinner-wrapper">
        <div class="loader">Cargando...</div>
    </div>



     <div class="container">
 
 
  <div class="row" style="margin-top: 150px;
background-color: #e1e1e1;
 
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
text-align: center;
    color: white;
">
      <div class ="col-md-12" style="color: #50c0b4;    font-size: 20px; ">
       <strong>  SISTEMA DE TURNO</strong> 
      </div>
          </div>
 
    <div class="row">
    
  



 
     </div> 
     
        
          
         <asp:Panel ID="Pnl" runat="server"  >
              <!-- Modal -->
  <div class="modal fade" id="ModalCat" data-toggle="modal" data-backdrop="static" data-keyboard="false"   role="dialog" style="display:none; background-color: rgba(33, 33, 31, 0.68);    margin-top: 120px;"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
          
              <div class="modal-header" style="    font-weight: 700;
    font-size: 17px;
    color: #47a89d;">
      
       Reserva Exitosa    -   <asp:Label ID="lblEsp" runat="server" Text=""></asp:Label>
        </div>
       
        
        <div class="modal-body">

   <div class="form-horizontal">
            
                <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4 "  id="A">Turno</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtTurno" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
     
     </div>
     </div>
            <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4 " id="Apellido">Nombre</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtNombre" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
         <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="TxtNombre" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>

                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Apellido</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtApellido" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="TxtApellido" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
                    
                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"   >Documento</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtDoc" runat="server"  CssClass="form-control"  onKeyPress="return acceptNum(event)" ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1w" ControlToValidate="TxtDoc" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
        
                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Obra Social</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:DropDownList ID="cmbObraSocial" runat="server" CssClass="form-control"> 
                  
  
             </asp:DropDownList>
              </div>
        <div class="col-xs-2 col-md-4">            
    
     </div>
     </div>
     
                     <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Tel</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtCel" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
            
               
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TxtCel" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
              <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >E-Mail</label>
         <div class="col-xs-6 col-md-4">
            
                  <asp:TextBox ID="txtMail" runat="server"   CssClass="form-control" ></asp:TextBox>
                                       
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        
              <div class="wait"  style="display:none; text-align:center; margin:auto;  float:left"><img src='/images/Loading_icon.gif'    width="65"/></div>
               
                                            <asp:RegularExpressionValidator ID="retxtMail" runat="server" ControlToValidate="txtMail" CssClass="  alert-danger"
                                                ValidationExpression=".*@.*\..*" ErrorMessage="No valido" Display="Dynamic" ToolTip="Debe ingresar una dirección de mail valida"></asp:RegularExpressionValidator>
                                       
     </div>
     </div> 
               <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4" id="Apel">Comprobante</label>
         <div class="col-xs-6 col-md-4">
            
          
        
                             <asp:ImageButton ID="ImageButton1" runat="server" Height="55px" ImageUrl="https://arquivirtual.quilmes.gov.ar/municipal/img/pdf.png" OnClick="ImageButton1_Click" Width="59px" />
              
              </div>
        <div class="col-xs-2 col-md-4">
         <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="TxtNombre" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>

</div>

         <div   style="margin-top:5px; margin-bottom:5px;  padding:5px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
              <asp:Label ID="lblmsg2" runat="server" Text="" CssClass=" alert-danger" ></asp:Label>
  
             <div style="display:none">
             <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
        </div>

       <button id="btnGuardar1aCli" type="button" class="btn btn-primary " onclick="AltaJs()"  >
    <span class=" glyphicon  glyphicon-print"></span> Imprimir</button>


        <button type="button" class="btn btn-danger" onclick="SalirJs()"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

              <br />
               


               </div>
             
      
   </div>
        
      </div>
      
    </div>
   
 </div>
             </asp:Panel>
          </div>

    
    <script  >
  
        $(document).ready(function () {

         
            var ancho = $(window).width();

            if (ancho < 720) {


             
                $("#logo1").attr("src", "img/logochico1.png");
                $("#logo2").attr("href", "Reservar.aspx");
                $("#logo1").css({ 'margin-bottom': '0px', 'width': '50px' });
                $("#cabecera").css({ 'margin-top': '58px', 'font-size': '16px' });

                $(".nav-bar").css({ 'margin-top': '8px' });
                $("#logo1").click(function () {

                    window.location.href = "Reservar.aspx";
                });

            } else {
                $("#logo1").attr("src", "img/logo1.png");
            }
        });

        $(document).ready(function () {
            $("#ModalCat").modal();
          //  $(".campoFecha").mask("99/99/9999");

        });

        function SalirJs() {

            window.location.href = "http://www.corlquilmes.com.ar";
        }
        function AltaJs() {


            $("#ImageButton1").click();


        }
      
</script>

    <div>
    
    </div>
    </form>
</body>
</html>
