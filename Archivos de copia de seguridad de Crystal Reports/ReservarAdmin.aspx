<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservarAdmin.aspx.cs" Inherits="HardSoft.App.ORL.ReservarAdmin" %>
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
				<div class="col-xs-5 header-logo">
					<br>
					<a href="index.aspx" id="logo2"><img src="img/logo1.png" alt="" class="img-responsive logo" id="logo1"></a>
				</div>

				<div class="col-md-7">
					<nav class="navbar navbar-default">
					  <div class="container-fluid nav-bar">
					    <!-- Brand and toggle get grouped for better mobile display -->
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					    </div>

					    <!-- Collect the nav links, forms, and other content for toggling -->
					    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					      
					      <ul class="nav navbar-nav navbar-right">
					        <li><a class="menu active" href="Inicio.aspx#home" >Inicio</a></li>
					        <li><a class="menu" href="Inicio.aspx#about">Institucional</a></li>
					        <li><a class="menu" href="Inicio.aspx#service">Centro Médico</a></li>
					     
					        <li><a class="menu" href="Inicio.aspx#contact">Contacto</a></li>
                               <li><a class="menu" href="Reservar.aspx">Turnos</a></li>
					      </ul>
					    </div><!-- /navbar-collapse -->
					  </div><!-- / .container-fluid -->
					</nav>
				</div>
			</div>
		</div>
	</header> <!-- end of header area -->

    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
     
         <div class="spinner-wrapper">
        <div class="loader">Cargando...</div>
    </div>



     <div class="container">
 
 
  <div class="row" id="cabecera" style="margin-top: 117px;
background-color: #e1e1e1;
 
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
text-align: center;
    color: white;
">
      <div class ="col-md-12" style="color: #50c0b4;    font-size: 20px; ">
       <strong>  SISTEMA DE TURNOS ONLINE</strong> 
      </div>
          </div>
 
    <div class="row">
    
  



&nbsp;<asp:UpdatePanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">


  <ContentTemplate>
<fieldset>


     <div class="col-md-4">
            
              <div   style="  
    background-color:#fbffff;
    padding: 3px;
    border-radius: 10px 10px 10px 10px;
    border: 1px solid;
    /* box-shadow: 0 4px 5px #555; */
    /* border: 1px solid; */
    margin-bottom: 3px;
    height: 40px;
   
 "> 
              <div class="col-sm-2">  </div>   
            <div  class="col-sm-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 16px;
    text-transform: uppercase;
    padding: 5px;
    ">    Seleccione una especialidad y su profesinal.</div> 
              </div>
         
         
          <div style="  
background-color:  #e1e1e1;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
  margin-bottom:5px;
     border: 1px solid;
    
 ">
            

     <div class="form-horizontal" >
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Especialidad</label>
         <div class="col-xs-8">   
             <asp:DropDownList ID="CmbEspecialidad" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="CmbEspecialidad_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-1"> </div>
           
     </div>
           
         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3">Profesional</label>
    <div class="col-xs-8">   
             <asp:DropDownList ID="cmbProf" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbProf_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-1"> </div>
      
         </div>
  
         
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Día</label>
    <div class="col-xs-8">   
               <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaHasta" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup" runat="server" TargetControlID="TxtFechaHasta"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
    
    </div>
                        <div class="col-xs-1"> </div>
      
         </div>
       
                      <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-8">   
             <button id="btnGuardar" type="button" class="btn btn-danger " onclick="buscarJs()"  >
    <span class=" glyphicon  glyphicon-print"> </span>  &nbsp Imprimir Turnos</button>
         </div>

                <div style="display:none">
                <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button4_Click" />
                </div>
                <script>
                    function buscarJs() {
                        
                            $("#Button4").click();
                        
                    }

                </script>
                        <div class="col-xs-1"> </div>
      
         </div>
            </div>


          </div>
              


                

     
                
                                    
 </div>
    <div class="col-md-4">
        
              <div   style="  
    background-color:#fbffff;
    padding: 3px;
    border-radius: 10px 10px 10px 10px;
    border: 1px solid;
    /* box-shadow: 0 4px 5px #555; */
    /* border: 1px solid; */
    margin-bottom: 3px;
    height: 40px;
   
 "> 
              <div class="col-sm-2">  </div>   
            <div  class="col-sm-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 16px;
    text-transform: uppercase;
    padding: 5px;
    ">   Cancelar Turnos</div> 
              </div>
         
         
          <div style="  
background-color:  #e1e1e1;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
  margin-bottom:5px;
     border: 1px solid;
    
 ">
            

     <div class="form-horizontal" >
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Especialidad</label>
         <div class="col-xs-8">   
             <asp:DropDownList ID="CmbEspecialidad1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="CmbEspecialidad_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-1"> </div>
           
     </div>
           
         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3">Profesional</label>
    <div class="col-xs-8">   
             <asp:DropDownList ID="cmbProf1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbProf_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-1"> </div>
      
         </div>
  
         
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Día</label>
    <div class="col-xs-8">   
               <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="Txtdia1" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="Txtdia1"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
    
    </div>
                        <div class="col-xs-1"> </div>
      
         </div>
       
                      <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-8">   
             <button id="btnGuardar1" type="button" class="btn btn-info " onclick="CancelarJs()"  >
    <span class=" glyphicon  "> </span>  &nbsp Cancelar Turnos</button>
         </div>
 
                <div style="display:none">
               <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click1"   />
                </div>
                <script>
                    function CancelarJs() {
                        if ($("#Txtdia1").val() == "") {
                            alert("Ingrese una fecha");
                        } else {
                            if (confirm("Esta seguro que desea cancelar los turnos ?")) {
                                $("#Button2").click();
                            }
                        }
                    }

                </script>
                        <div class="col-xs-1"> </div>
      
         </div>
            </div>


          </div>
              
  
         </div>
    
    <div class="col-md-4">
    

   </div>

    </fieldset>
      </ContentTemplate>
    </asp:UpdatePanel>

     </div> 
     
        
          <div class="row" style="margin-top: 10px;
background-color: #e1e1e1;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
text-align: center;
color:white;margin-bottom:20px       
">
                <div class ="col-md-12">



       
                    <button id="btnVolver1" type="button" class="btn   btn-primary" onclick="javascript:window.history.back(-1);">
      <span class=" glyphicon glyphicon-log-out"></span>Volver</button>&nbsp
     <asp:Button ID="Button1" runat="server" Text="Reservar"  CssClass="btn btn-danger" OnClick="Button1_Click"/>

            </div>
            </div>

         
         <asp:Panel ID="Pnl" runat="server" Visible="false">
              <!-- Modal -->
   
             
                 </asp:Panel>
         

    
    <script  >
        function SalirJs() {
            $("#Button3").click();
        }

        $(document).ready(function () {
           
            $(".campoFecha").mask("99/99/9999");

        });

        function AltaJs() {
            $("#wait").show();
            
            $("#Button2").click();
            $("#TxtNombre").val('');
           $("#TxtApellido").val('');
            $("#TxtDoc").val('');
            $("#TxtCel").val('');
            $("#txtMail").val('');
       
            $("#wait").hide();
            
        }
        
       
   

            $(document).ajaxStart(function () {
                $(".spinner-wrapper").css("display", "block");
                $(".loader").css("display", "block");
            });
            $(document).ajaxComplete(function () {
                $(".spinner-wrapper").css("display", "none");
                $(".loader").css("display", "none");

            });
        
 
        $(document).ready(function () {

            $("#ContentPlaceHolder1_gvSueldo").attr('border', '0');
            var ancho = $(window).width();

            if (ancho < 720) {

                $("#logo1").attr("src", "img/logochico1.png");
                $("#logo2").attr("href", "Reservar.aspx");
                $("#logo1").css({ 'margin-bottom': '0px' });
                $(".nav-bar").css({ 'margin-top': '8px' });
                $("#logo1").click(function () {

                    window.location.href = "Reservar.aspx";
                });

            }
        });
 

      
</script>

    <div>
    
    </div>
    </form>
</body>
</html>
