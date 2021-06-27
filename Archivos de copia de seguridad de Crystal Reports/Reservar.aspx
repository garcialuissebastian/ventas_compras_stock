<%@ Page Language="C#" AutoEventWireup="true"  Culture="Auto" UICulture="Auto" CodeBehind="Reservar.aspx.cs" Inherits="HardSoft.App.ORL.Reservar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>
<html lang="en"> 
<head runat="server"  >
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
     
	<title>Centro Otorrinolaringologico de Quilmes - Turnos</title>
    
     
     <META NAME="AUTHOR" CONTENT="CORL QUILMES">
<META NAME="DESCRIPTION" CONTENT="El Centro Otorrinolaringologico de Quilmes se encuentra ubicado en pleno centro de nuestra ciudad, calle Alsina N° 280, entre Alvear y Brown.
Tel: 011 4253-4310 .-  Mail :corldequilmes@gmail.com">
    <META NAME="KEYWORDS" CONTENT="Zacarias Turnos Online">
<META NAME="KEYWORDS" CONTENT="Otorrinolaringologico de Quilmes,ORL,CORL">
    <META NAME="KEYWORDS" CONTENT="ORL de Quilmes">
      <META NAME="KEYWORDS" CONTENT="Otorrino de Quilmes">
    <META NAME="KEYWORDS" CONTENT="Alsina 280, Quilmes.">
      <META NAME="KEYWORDS" CONTENT="Centro Otorrinolaringologico de Quilmes">
      <META NAME="KEYWORDS" CONTENT="Elías Zacarías Turnos">
<META NAME="Resource-type" CONTENT="Document">
<META NAME="Revisit-after" CONTENT="2 days">
<META NAME="robots" content="index,follow">


	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:600italic,400,800,700,300' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=BenchNine:300,400,700' rel='stylesheet' type='text/css'>
    <script src="/App/ORL/js/modernizr.js"></script>
  <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
       <script language="JavaScript" type="text/javascript">
           $(document).keypress(function (event) {
               // para q no haga submit cuando pressiono enter en alguna parte
               var keycode = event.keyCode || event.which;
               if (keycode == '13') {
                   return false;
               }
           });

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
					<a href="http://www.corlquilmes.com.ar" id="logo2"><img src="" alt="" class="" id="logo1"></a>
				</div>
                    
                    
                    <div class="col-xs-8 hidden-md hidden-lg" style="-webkit-text-stroke-width: 1px;text-align:left
-webkit-text-stroke-color:red; font-size:16px; margin-top: 2px;">
                
                 
                   <div style="color:red;font-weight:800"><a href="Reservar.aspx" style="color:red;font-weight:800;"> TURNOS</a></div>   

                              <div  style="margin-top:0px"><a href="tel:+541142534310" style="color:red;font-weight:800;margin-top:10px">4253-4310</a></div> 
				      </div>
                
                </div>

				
			</div>
		</div>
	</header> <!-- end of header area -->

    <form id="form1" runat="server">
    
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
 
         <div class="spinner-wrapper">
        <div class="loader">Cargando...</div>
    </div>



     <div class="container">
 
 
  <div class="row" id="cabecera" style="margin-top: 128px;
background-color: #e1e1e1;
 font-size: 24px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
text-align: center;
    color: white;
">
      <div class ="col-md-12" style="color: #50c0b4;     ">
       <strong>  SISTEMA DE TURNOS ONLINE</strong> 
      </div>
          </div>
 
    <div class="row">
    
  



&nbsp;<asp:UpdatePanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">


  <ContentTemplate>
<fieldset>


     <div class="col-md-4 col-xs-12">
            
              <div  class="uno" > 
              <div class="col-sm-2 col-xs-2"> <img src="img/uno.png"   /></div>   
            <div  class="col-sm-10 col-xs-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 14px;
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
     height: 111px;
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
          </div></div>
                 <div class="hidden-xs "  style   ="  
background-color:  #e1e1e1;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
 height: 132px;
  margin-bottom: 8px;
     border: 1px solid;
 ">
                      <div class="form-horizontal" >
       
    <div  style="text-align: center;
    font-size: 14px;
    color: #0b0b0b;
    font-weight: 700;
   
    background-color: aliceblue; margin-bottom:5px" >
      * SOLO PARA REIMPRIMIR TURNOS YA EMITIDOS *
         </div> 


           <div class="form-group">
         <label for="l" class="control-label col-xs-3">Documento</label>
    <div class="col-xs-8">   
        <asp:TextBox ID="TxtBuscar" runat="server" CssClass="form-control" onkeypress="return acceptNum(event)"></asp:TextBox>
         </div>
                        <div class="col-xs-1"> </div>
      
         </div>


            <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-8">   
             <button id="btnGuardar" type="button" class="btn btn-danger " onclick="buscarJs()"  >
    <span class=" glyphicon  glyphicon-print"> </span>  &nbsp Buscar Mi Turno</button>
         </div>

                <div style="display:none">
                <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button4_Click" />
                </div>
                <script>
                    function buscarJs() {
                        if ($("#TxtBuscar").val() !="") {
                            $("#Button4").click();
                        } 
                    }

                </script>
                        <div class="col-xs-1"> </div>
      
         </div>
         
           </div>
       
                   </div>



                

     
                
                                    
 </div>
    <div class="col-md-4 col-xs-12" style=" margin-bottom:8px">

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
              <div class="col-sm-2 col-xs-2"> <img src="img/dos.png"   /></div>   
            <div  class="col-sm-10 col-xs-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 14px;
    text-transform: uppercase;
    padding: 5px;
    ">    Seleccione uno de los días de atención.</div> 
              </div>
    <div style="    text-transform:uppercase;  margin-left: 0px;
    margin-right: 0px;
    padding: 10px;
    border-radius: 10px 10px 10px 10px;
    border: 1px solid;
    box-shadow: 0 4px 5px #555;
    text-align: center; margin:auto; width:100%;  ">

        <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="White"  BorderColor="White"     Width="100%"   Font-Size="9pt" NextPrevFormat="FullMonth"  SelectionMode="Day"  OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle  ForeColor="#333333" Font-Bold="True" Font-Size="8pt" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#c3c3c3" ForeColor="White" />
            <TitleStyle BackColor="White"    Font-Bold="True" ForeColor="Black" Font-Size="12pt" />
            <TodayDayStyle BackColor="#CCCCCC" />
            
           
    </asp:Calendar>
      
        <br />
        <div style="font-size:21px">
      <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
        </div>
    </div>
         </div>
    
    <div class="col-md-4 col-xs-12">
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
              <div class="col-sm-2 col-xs-2"> <img src="img/tres.png"   /></div>   
            <div id="scrollToHere"  class="col-sm-10 col-xs-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 14px;
    text-transform: uppercase;
    padding: 5px;
    ">    Seleccione alguno de los horarios .</div> 
              </div>
     <div style="float:right; 
   text-transform:uppercase;  margin-left: 0px;
    margin-right: 0px;
    padding: 10px;
    border-radius: 10px 10px 10px 10px;
    border: 1px solid;
    box-shadow: 0 4px 5px #555;
  
    overflow-y: auto; overflow-x: hidden;  min-height:248px; max-height:420px; width:100%;background-color:#e1e1e1;
 "> 


         <asp:GridView ID="gvSueldo" runat="server" Width="100%" 
                            AutoGenerateColumns="False"
                               BorderWidth="0px"
                            EmptyDataText="&nbsp; - Seleccione una fecha - " ShowHeaderWhenEmpty="True" EmptyDataRowStyle-CssClass="GridRow2"
                            GridLines="Horizontal" HeaderStyle-HorizontalAlign="Center">

                              <Columns> 

           

 <asp:TemplateField>
            <ItemTemplate>
                <asp:RadioButton ID="chkRow"   onclick = "RadioCheck(this);" runat="server"  CssClass="ck_grid"  />
            </ItemTemplate>
</asp:TemplateField>



 


  <asp:BoundField DataField="ID"   ItemStyle-Width="0px" ItemStyle-Font-Size="0px" HeaderStyle-Font-Size="0px" HeaderStyle-Width="0px">
                                  <HeaderStyle Font-Size="0px" Width="0px" />
                                  <ItemStyle Font-Size="0px" Width="0px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="hora" HeaderText="HORA" >
                                  <HeaderStyle HorizontalAlign="Center" />
                                  <ItemStyle HorizontalAlign="Left" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="fecha" HeaderText="FECHA" >
                                 
                                  
                                  <ItemStyle HorizontalAlign="Left" />
                                  </asp:BoundField>
                                 
                                  
                              </Columns>
  <EditRowStyle BackColor="#2461BF" />
                              <EmptyDataRowStyle CssClass="GridRow2" />
                 <FooterStyle BackColor="#507CD1" ForeColor="White"   />
                 







               <SelectedRowStyle Font-Bold="true" ForeColor="#333333" />
                                        <RowStyle CssClass="GridRow2" />
                                        <HeaderStyle CssClass="HeaderGrid2" />
                                        <AlternatingRowStyle CssClass="GridRowAlt2" />







             </asp:GridView>



     </div>

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
  <div class="modal fade" id="ModalCat" data-toggle="modal" data-backdrop="static" data-keyboard="false" role="dialog" style="display:none; background-color: rgba(33, 33, 31, 0.68);    margin-top: 120px;"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="    font-weight: 700;
    font-size: 14px;
    color: #47a89d;">
      
       Datos Personales  -    Reserva
        </div>
        <div class="modal-body">

   <div class="form-horizontal">
             <br />
       <asp:HiddenField ID="Hddexiste" runat="server" />

           <div class="form-group" >
   
         <div class="col-xs-6 col-md-4" style="text-align:center">
         
           
              
              </div>
               <style>
                   #foto{
                       margin:auto;width:80px
                   }
                   #nombreDoc{
color: #358279;
    font-weight: 700;

                   }
               </style>
        <div class="col-xs-12" style="text-align:center;   ">
             
            <asp:Image ID="foto" runat="server" CssClass="img-responsive img-circle "  Visible="false" />
            <br />
            <asp:Label ID="nombreDoc" runat="server" Text=""></asp:Label>
                 
     </div>
     </div>
        



                  <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"   >Documento</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtDoc" runat="server" class="form-control"  onKeyPress="return acceptNum(event)" ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1w" ControlToValidate="TxtDoc" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
        
            
            <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4" id="Apellido">Nombre</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
         <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="TxtNombre" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>

                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Apellido</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtApellido" runat="server" class="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="TxtApellido" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
                    
        
               
                  <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-3 col-md-4"  >Fecha Nac.</label>
         <div class=" col-xs-6 col-md-3  "> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtNac" runat="server"  placeholder="dia/mes/año"   CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtNac"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-5"> 

               <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="TxtNac" CssClass=" alert-danger"
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
            
             <asp:TextBox ID="TxtCel" runat="server" class="form-control"  ></asp:TextBox>
        
              
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
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Observación</label>
         <div class="col-xs-6 col-md-4">
            
                  <asp:TextBox ID="txtObs" runat="server"   CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                       
        
              
              </div>
        <div class="col-xs-2 col-md-4">
                                  
     </div>
     </div>
      
       
       
                   <div class="form-group">
                      <div class="col-md-8"> 
  <asp:Label ID="lblmsg2" runat="server" Text="" CssClass=" alert-danger" ></asp:Label>
        
    


     </div >  
                       <div class="col-md-4"> 
                  
</div>
                  </div>
 
 
</div>

         <div   style="margin-top:5px; margin-bottom:5px;  padding:5px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >

             <div style="display:none">
             <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" CausesValidation="false" />
        
        </div>

           

       <button id="btnGuardar1aCli" type="button" class="btn btn-primary " onclick="AltaJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Reservar</button>


        <button type="button" class="btn btn-danger" onclick="SalirJs()" > 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

              <br />
               


               </div>
             
      
   </div>
        
      </div>
      
    </div>
   
   </div>
             </asp:Panel>
         
           <asp:Panel ID="Pnl2" runat="server" Visible="false">
            <!-- Modal -->
  <div class="modal fade" id="ModalInicio" data-toggle="modal" data-backdrop="static" data-keyboard="false" role="dialog" style="display:none; background-color: rgba(33, 33, 31, 0.68);    margin-top: 120px;"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="    font-weight: 700;
    font-size: 14px;
    color: #47a89d;">
      
        Reserva de Turno
        </div>
        <div class="modal-body">

   

         <div   style="margin-top:5px; margin-bottom:5px;  padding:25px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;  " >
 
             <h3>
                 - Usted podrá solitar su turno online solo para consultas médicas. 
                 <br />- En caso de estudios médicos o ser <span style="color:red"> mayor de 64 años </span>  llamar al 011 4253-4310 / 1133894444 o vía Email: &nbsp &nbsp corldequilmes@gmail.com

             </h3>
             <div style="text-align:center">
        <button type="button" class="btn btn-danger" onclick="SalirJs2()" > 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button></div>
 

              <br />
               


               </div>
             
      
   </div>
        
      </div>
      
    </div>
   
   </div>
    </asp:Panel>
    <script  >
        function SalirJs() {
            $("#Button3").click();
        }

        function SalirJs2() {
            $("#ModalInicio").modal('hide');
        }
 
        
        
        $(document).ready(function () {
            $("#ModalCat").modal();
            $("#ModalInicio").modal();
            
          $(".campoFecha").mask("99/99/9999");

     
        });
        //$("#TxtDoc").blur(function () {
        //    existe();          
        //});
        //$("#TxtDoc").keyup(function (e) {
        //    if (e.keyCode == 13) {
        //        existe()
        //    }
        //});

        function existe() {
            try {
                if (true) {
                    var json = JSON.stringify
                ({
                    "v_valor": $("#TxtDoc").val()
                });
                    $.ajax({
                        type: "POST",
                        url: "Reservar.aspx/WsExiste",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Resultado) {
                            var tur = Resultado.d;
                            if (tur != null) {

                                $("#TxtNombre").val(tur.NOMBRE);
                                $("#TxtApellido").val(tur.APELLIDO);
                                $("#TxtNac").val(tur.Fecha_Nac);
                                $("#cmbObraSocial").val(tur.OBRASOCIAL);
                                $("#TxtCel").val(tur.TEL);
                                $("#txtMail").val(tur.MAIL);
                               



                                $("#TxtNombre").prop('disabled', true);
                                $("#TxtApellido").prop('disabled', true);
                                $("#TxtNac").prop('disabled', true);
                                $("#cmbObraSocial").prop('disabled', true);
                                $("#TxtCel").prop('disabled', true);
                                $("#txtMail").prop('disabled', true);
                                

                                $("#Hddexiste").val(tur.id);
                            } else {
                                $("#Hddexiste").val('0');

                                $("#TxtNombre").val('');
                                $("#TxtApellido").val('');
                                $("#TxtNac").val('');
                               
                                $("#TxtCel").val('');
                                $("#txtMail").val('');

                                $("#TxtNombre").prop('disabled',false);
                                $("#TxtApellido").prop('disabled', false);
                                $("#TxtNac").prop('disabled', false);
                                $("#cmbObraSocial").prop('disabled', false);
                                $("#TxtCel").prop('disabled', false);
                                $("#txtMail").prop('disabled', false);
                            } 
                        }),
                        error: errores
                    });
                } else { alert('debe seleccionar un empleado'); }
            } catch (e) {
                alert(e.message);

            }
        }

        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

        function AltaJs() {
            $("#wait").show();

            $("#TxtNombre").prop('disabled', false);
            $("#TxtApellido").prop('disabled', false);
            $("#TxtNac").prop('disabled', false);
            $("#cmbObraSocial").prop('disabled', false);
            $("#TxtCel").prop('disabled', false);
            $("#txtMail").prop('disabled', false);
          
            $("#Button2").click();
           // $("#TxtNombre").val('');
           //$("#TxtApellido").val('');
           // $("#TxtDoc").val('');
           // $("#TxtCel").val('');
           // $("#txtMail").val('');
           // $("#TxtNac").val('');
            
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
        

        function RadioCheck(rb) {

            var gv = document.getElementById("<%=gvSueldo.ClientID%>");

            var rbs = gv.getElementsByTagName("input");



            var row = rb.parentNode.parentNode;

            for (var i = 0; i < rbs.length; i++) {

                if (rbs[i].type == "radio") {

                    if (rbs[i].checked && rbs[i] != rb) {

                        rbs[i].checked = false;

                        break;

                    }

                }

            }

        }
        $(document).ready(function () {

            $("#ContentPlaceHolder1_gvSueldo").attr('border', '0');
            var ancho = $(window).width();

            if (ancho < 720) {


                $('td a').click(function () {

                    $('html,body').animate({
                        scrollTop: $("#scrollToHere").offset().top
                    }, 2000);
                });
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

     
 
</script>

    <div>
    
    </div>
    </form>
</body>
</html>
