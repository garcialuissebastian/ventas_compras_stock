<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master"  Culture="Auto" UICulture="Auto"  AutoEventWireup="true" enableEventValidation="false" CodeBehind="AsistenciaPersona.aspx.cs" Inherits="HardSoft.App.ORL.AsistenciaPersona" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" >
    
    
	    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>

        
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

             var len = valo.length;

             var index = valo.indexOf('.');

             if (index > 0) {

                 var CharAfterdot = (len + 1) - index;

                 if (CharAfterdot > 3) {

                     return false;

                 }

             }
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
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

    <style>
            .ajax__calendar .ajax__calendar_day {
    border: 1px solid #dcdbdb;
}
            .ajax__calendar .ajax__calendar_hover .ajax__calendar_day {
    background-color: #0ba1ec;
    border-color: #daf2fc;
    color: #0066cc;
}
        .alert-negro{
    color: #f1f3f5;
    background-color: #333; 
  border: 1px solid;
    box-shadow: 0 4px 5px #555;
    border-radius: 10px 10px 10px 10px;
 
}
        .alert-negro{
    color: #f1f3f5;
    background-color: #333; 
  border: 1px solid;
    box-shadow: 0 4px 5px #555;
    border-radius: 10px 10px 10px 10px;
 
}
        .alert-cab {
   color: #fff;
background-color: #222222;
border: 1px solid;
box-shadow: 0 4px 5px #555;
   
}
        .modal-header {
    padding: 7px !important;
    
}
        .modal-body {
    position: relative;
     padding: 0px  !important;
}
    </style>

     <div class=" container"  style="margin-top: 36px;">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href=/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Asitencia del Paciente         </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
       <div style="display:none">
         <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>    Asitencia del Paciente</strong> 
            </div>
         
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-2"> 
       
       </div>
  
    
    <div class="col-xs-8" >
         <div class="form-horizontal">
             <asp:UpdatePanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">
  <ContentTemplate>
<fieldset>
                <div class="form-group">
         <label for="l" class="control-label col-xs-4">Especialidad</label>
         <div class="col-xs-4">   
             <asp:DropDownList ID="CmbEspecialidad" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="CmbEspecialidad_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-4"> </div>
           
     </div> 
                    <div class="form-group">
         <label for="l" class="control-label col-xs-4">Profesional</label>
    <div class="col-xs-4">   
             <asp:DropDownList ID="cmbProf" runat="server" CssClass="form-control" AutoPostBack="True" ></asp:DropDownList>      
         </div>
                        <div class="col-xs-4"> </div>
      
         </div> 
    

   <script language="javascript">
       function disablenonthursdays(sender, args)
       {
           for(var day =0; day <sender._days.all.length; day++)
           {
               for(var weekday =0; weekday < 6; weekday++)
               {
                   if(sender._days.all[day].id != 'calendarValidToDate_day_'+ weekday +'_4')
                   {
                       sender._days.all[day].disabled = true;
                       sender._days.all[day].innerHTML = '<div>' +sender._days.all[day].innerText+ '</div>';
                   }
               }
           }
       }
</script>
                         <div class="form-group">
        
                             
                              <label for="l" class="control-label  col-xs-3 col-md-4">Día</label>
    <div class="col-xs-6 col-md-4">   
               <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaHasta" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup" runat="server" TargetControlID="TxtFechaHasta"   OnClientShown="disablenonthursdays"  
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
    
    </div>
                        <div class="col-xs-2 col-md-4"> </div>
      
         </div>











    
              <!-- Modal -->
  <div class="modal fade" id="ModalRp" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-xs">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body"> 
          <div   style="margin-top:0px;text-transform:uppercase" > 
        <div class="alert alert-negro"  > 
           DESCARGAR INFORME
       </div>      
<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
 
    <div class="col-xs-12">
       <label for="TxtNunDoc" class=" col-xs-2"  style="color:black;text-align:right; padding-top: 5px;"   > Desde</label>
         <div class="col-xs-4"> 

     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaDesde2" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup12" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup12" runat="server" TargetControlID="TxtFechaDesde2"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
     
    </div> 

         <label for="TxtNunDoc" class=" col-xs-2"  style="color:black;text-align:right; padding-top: 5px;"   >Hasta</label>
         <div class="col-xs-4"> 

     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaHasta2" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup21" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="imgPopup21" runat="server" TargetControlID="TxtFechaHasta2"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
     
    </div>   

          </div>

      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnDescargar21a" type="button" class="btn2 btn-default " onclick="DescargarRp2Js()"  >
    <span class=" glyphicon glyphicon-save"></span> Descargar </button>
      
                <div style="display:none">
            
       </div>
        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar</button> 
              <br /> 
               </div> 
</div> 

              </div>
        
      </div>
      
    </div>
   








    </fieldset>
                  </ContentTemplate>
                 </asp:UpdatePanel>        
                <div class="form-group">
         <label for="l" class="control-label col-xs-4"></label>
    <div class="col-xs-4">   
                <button type="button" class="btn2 btn-danger" onclick="Buscar()" > 
    <span class="  glyphicon glyphicon-search"></span> Buscar</button>
 


         </div>
                        <div class="col-xs-4"> </div>
      
         </div>
             
 
             
     

            
              </div>
 

         </div>
  
   <div class="col-xs-2" >
    
      
       
      </div>    
       
            </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HddId" runat="server"   />

</div> 
   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla'></table>

</div>
              </div>
     </div>

        </div>


       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid; height:67px;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Descargar
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:135px;float:right">Total $: 
    <span id="span_cantidad">0</span></div>
          
               </div> <br />
   </div>


    
           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       <div class="col-xs-3">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>
       <div class="col-xs-6">

        <div class="form-horizontal">
          <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4" >¿Vino?</label>
         <div class="col-xs-8">

  <select id="cmbTipoVino" class="form-control">
          <option value="NO">NO</option>
          <option value="SI">SI</option>
       
      </select>
      
         </div>
           
     </div>
            

                <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> 
             Consulta
         </label>
         <div class="col-xs-2"> 
             <input id="CkConsulta" type="checkbox" />
                   </div>


             <label for="TxtNombre" class="control-label col-xs-4"> 
            Practica
         </label>
         <div class="col-xs-2"> 
             <input id="CkPractica" type="checkbox" />
                   </div>
     </div>


      
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Particular $ </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtMonto" runat="server" class="form-control"  onkeypress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} "></asp:TextBox>
      
         </div>
           
     </div>
      
                <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> copago $ </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtCopago" runat="server" class="form-control"  onkeypress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} "></asp:TextBox>
      
         </div>
           
     </div>
      

      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Observación</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtObs" runat="server" class="form-control" TextMode="MultiLine"  ></asp:TextBox>
      
         </div>
           
     </div>
      
     
   </div>
        
        </div>
          </div>
    <div class="col-xs-3">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>

      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar</button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>
                  
                <div style="display:none">
               <asp:Button ID="Button2" runat="server" Text="Exel" OnClick="Button2_Click"  />

       </div>
        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar</button> 
              <br /> 
               </div> 
</div> 

              </div>
        
      </div>
      
    </div>
   
 

 
    
         <script>



                
          var date = new Date();
          var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
          var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);

          var dd = primerDia.getDate();
          var mm = primerDia.getMonth() + 1; //January is 0!

          var yyyy = primerDia.getFullYear();
          if (dd < 10) {
              dd = '0' + dd;
          }
          if (mm < 10) {
              mm = '0' + mm;
          }
          var today = dd + '/' + mm + '/' + yyyy;

             $('#Main_TxtFechaDesde2').val(today);
              $('#Main_TxtFechaHasta2').val(today);



          var v_pro = '';
          $('#Main_TxtCodSistema').prop('disabled', true);
        
       
          function Buscar() {

              try {

                  if ($('#Main_TxtFechaHasta').val() != '') {
                      var v_buscar = $('#cmbTipoOp').val();
                      var json = JSON.stringify
                        ({
                            "v_serv": $('#Main_CmbEspecialidad').val(),
                            "v_prof": $('#Main_cmbProf').val(),
                            "v_fecha": $('#Main_TxtFechaHasta').val()

                        });
                      $.ajax({
                          type: "POST",
                          url: "AsistenciaPersona.aspx/WsListar",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: resultado,
                          error: errores
                      });
                  } else {
                      alert('seleccione una fecha.');
                  }
              } catch (e) {
                  alert(e.message);
              }
          }



             function PopAlta() {
              //$("#Main_Button2").click();
               $("#ModalRp").modal();
          }
 
          function resultado(Resultado) {
              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = "";

             

              var total = parseFloat('0');
                var Cototal = parseFloat('0');
              $("#Resultado").show();
              $("#Resultado").empty();
              Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;font-size: 10px;'><thead><tr> <th></th><th>fecha</th> <th>hora</th><th>APELLIDO</th><th>NOMBRE</th><th>DOCUMENTO</th><th>TEL</th><th>MAIL</th><th>SERVICIO</th><th> OBRASOCIAL</th><th> PARTI- </br> CULAR </th><th>COPAGOS</th><th></th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {

                  var asi = '';

                    if (pacientes.Copago == '') {
                      pacientes.Copago = '00.00';
                  }
                 
                  if (pacientes.Pago == '') {
                      pacientes.Pago = '00.00';
                  }
                  if (pacientes.Vino == '') {
                      pacientes.Vino = 'NO';
                      asi = "<td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.id + ",\"" + pacientes.Vino + "\",\"" + pacientes.Pago + "\" ,\"" + pacientes.Pago_Obs + "\",\"" + pacientes.Practica + "\" ,\"" + pacientes.Consulta + "\"  ,\"" + pacientes.Copago + "\"   );' > <img src='/images/factura.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>No asistio</span></a></td>";
                  }
                  if (pacientes.Vino == 'NO') {
                      pacientes.Vino = 'NO';
                      asi = "<td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.id + ",\"" + pacientes.Vino + "\",\"" + pacientes.Pago + "\" ,\"" + pacientes.Pago_Obs + "\",\"" + pacientes.Practica + "\" ,\"" + pacientes.Consulta + "\" ,\"" + pacientes.Copago + "\"   );' > <img src='/images/factura.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>No asistio</span></a></td>";
                  }
                  if (pacientes.Vino == 'SI') { 

                      asi = "  <td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.id + ",\"" + pacientes.Vino + "\",\"" + pacientes.Pago + "\" ,\"" + pacientes.Pago_Obs + "\",\"" + pacientes.Practica + "\" ,\"" + pacientes.Consulta + "\"   ,\"" + pacientes.Copago + "\" );'> <img src='/images/factura-aprobada2.png' style='height: 25px;background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Verificar asistencia</span></a></td>";
                  }                  
                  Tabla_Datos = Tabla_Datos + "<tr >" + asi + "<td>" + pacientes.fecha + "</td><td>" + pacientes.hora + "</td><td>" + pacientes.APELLIDO + "</td><td>" + pacientes.NOMBRE + "</td><td>" + pacientes.DOCUMENTO + "</td><td>" + pacientes.TEL + "</td><td>" + pacientes.MAIL + "</td><td>" + pacientes.SERVICIO + "</td><td>" + pacientes.OBRASOCIAL + "</td> <td style='color: red;font-weight: 700;'> " + parseFloat(pacientes.Pago.replace(',', '.')).toFixed(2) + "</td><td style='color: red;font-weight: 700;'> " + parseFloat(pacientes.Copago.replace(',', '.')).toFixed(2) + "</td>  <td  style='width:30px'> <a class='tooltips' onclick='PopPaciente(" + pacientes.HC + ");' > <img src='/images/hombre.png' style='background-position:40%; background-repeat:no-repeat;cursor:pointer' /> <span></span></a></td></tr>";

                  total = parseFloat(pacientes.Pago.replace(',', '.')) + parseFloat(total);
                  Cototal = parseFloat(pacientes.Copago.replace(',', '.')) + parseFloat(Cototal);

                  $("#span_cantidad").text(parseFloat(total).toFixed(2)   +' Copago $: ' + Cototal);
                //  alert(total);
              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
             // fn_cantidad();
             
          }

          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }


          function fn_cantidad() {
              cantidad = $("#grilla tbody").find("tr").length;
              $("#span_cantidad").html(cantidad);
          };
          function PopPaciente(ids) {
              window.location.href = 'Pacientes.aspx?pac=' + ids + '&url=AsistenciaPersona&serv=' + $("#Main_CmbEspecialidad").val() + '&prof=' + $("#Main_CmbEspecialidad").val() + '&dia=' + $("#Main_TxtFechaHasta").val();
          }

          $(document).ajaxStart(function () {
              $(".spinner-wrapper").css("display", "block");
              $(".loader").css("display", "block");
          });
          $(document).ajaxComplete(function () {
              $(".spinner-wrapper").css("display", "none");
              $(".loader").css("display", "none");

          });
             $('#Main_HddId').val('0.00');
              $('#Main_HddId2').val('0.00');
          var valor = '0.00';

             $("#Main_TxtMonto").blur(function () {
              if ($("#Main_TxtMonto").val() == '') {
                  $("#Main_TxtMonto").val( $('#Main_HddId').val())
              }
          });
        
          $("#Main_TxtMonto").focus(function () {
              $('#Main_HddId').val($("#Main_TxtMonto").val());
              $("#Main_TxtMonto").val('');
              
          });


             $("#Main_TxtCopago").blur(function () {
              if ($("#Main_TxtCopago").val() == '') {
                  $("#Main_TxtCopago").val( $('#Main_HddId2').val())
              }
          });
        
          $("#Main_TxtCopago").focus(function () {
              $('#Main_HddId2').val($("#Main_TxtCopago").val());
              $("#Main_TxtCopago").val('');
              
          });
          function PopVer(id, v_vino, v_pago, v_obs, v_prac,v_consult, v_copago) {
              
              if (v_prac=='SI') {
                  $("#CkPractica").prop("checked", true);
              } else {
                  $("#CkPractica").prop("checked", false);
              }
              
              if (v_consult == 'SI') {
                  $("#CkConsulta").prop("checked", true);
              } else {
                  $("#CkConsulta").prop("checked",false);
              }

              if (v_vino == 'NO') {
                  $("#cmbTipoVino").val('NO');
              } else {
                  $("#cmbTipoVino").val('SI');
              }
              $("#cmbTipoVino").val('SI');
              $("#Main_TxtId").val(id);
              $("#Main_TxtMonto").val(parseFloat(v_pago.replace(',', '.')).toFixed(2));
                $("#Main_TxtCopago").val(parseFloat(v_copago.replace(',', '.')).toFixed(2));
              $("#Main_TxtObs").val(v_obs);
              

              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();

              $("#TituloPop").text('ASISTENCIA DEL PACIENTE');
              $("#ModalCat").modal();
          }

          function ModificarJs() {
              try {
                  var sPractica = 'NO';
                  var sConsulta = 'NO';
                  if ($("#CkConsulta").is(':checked')) {
                      sConsulta= "SI";
                  }
                  if ($("#CkPractica").is(':checked')) {
                      sPractica= "SI";
                  }
                  var json = JSON.stringify
            ({
                "v_vino": $("#cmbTipoVino").val(),
                          "v_monto": $("#Main_TxtMonto").val(),
                "v_copago": $("#Main_TxtCopago").val(),
               
                "v_obs": $("#Main_TxtObs").val(),
                "ids": $("#Main_TxtId").val(),
                "v_prac": sPractica,
                "v_consulta": sConsulta
            });

                  $.ajax({
                      type: "POST",
                      url: "AsistenciaPersona.aspx/WsMonto",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function () {
                          Buscar();
                          $("#ModalCat").modal('hide');
                          $("#CkConsulta").prop("checked", false);
                          $("#CkPractica").prop("checked", false);
              }),
                      error: errores
                  });


              } catch (e) {
                  alert(e.message);
              }
          }
     
          $(document).ready(function () {


              $(".campoFecha").mask("99/99/9999");
             

          });

          var today = new Date();
          var dd = today.getDate();
          var mm = today.getMonth() + 1; //January is 0!

          var yyyy = today.getFullYear();
          if (dd < 10) {
              dd = '0' + dd;
          }
          if (mm < 10) {
              mm = '0' + mm;
          }
          var today = dd + '/' + mm + '/' + yyyy;
          document.getElementById("Main_TxtFechaHasta").value = today;
 
          var getUrlParameter = function getUrlParameter(sParam) {
              //obtiene parametros desde la url ?ss=ds
              var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                  sURLVariables = sPageURL.split('&'),
                  sParameterName,
                  i;

              for (i = 0; i < sURLVariables.length; i++) {
                  sParameterName = sURLVariables[i].split('=');

                  if (sParameterName[0] === sParam) {
                      return sParameterName[1] === undefined ? true : sParameterName[1];
                  }
              }
          };
          // utilizacion

          
          if (getUrlParameter('serv') != null) {
              $("#Main_CmbEspecialidad").val(getUrlParameter('serv'));
              $("#Main_cmbProf").val(getUrlParameter('prof'));
              $("#Main_TxtFechaHasta").val(getUrlParameter('dia'));
              Buscar();
          }



          
          Sys.UI.Point = function Sys$UI$Point(x, y) {

              x = Math.round(x);
              y = Math.round(y);

              var e = Function._validateParams(arguments, [
                  { name: "x", type: Number, integer: true },
                  { name: "y", type: Number, integer: true }
              ]);
              if (e) throw e;
              this.x = x;
              this.y = y;
          }
          Sys.UI.Bounds = function Sys$UI$Bounds(x, y, width, height) {
              x = Math.round(x);
              y = Math.round(y);

              var e = Function._validateParams(arguments, [
                  { name: "x", type: Number, integer: true },
                  { name: "y", type: Number, integer: true },
                  { name: "width", type: Number, integer: true },
                  { name: "height", type: Number, integer: true }
              ]);
              if (e) throw e;
              this.x = x;
              this.y = y;
              this.height = height;
              this.width = width;
             }


             function DescargarRp2Js() {
 
              try {

                 
                      var v_buscar = $('#cmbTipoOp').val();
                      var json = JSON.stringify
                        ({
                            "v_serv": $('#Main_CmbEspecialidad').val(),
                            "v_prof": $('#Main_cmbProf').val(),
                            "v_fecha": $('#Main_TxtFechaDesde2').val(),
                              "v_fecha2": $('#Main_TxtFechaHasta2').val()
                        });
                  $.ajax({
                      type: "POST",
                      url: "AsistenciaPersona.aspx/WsListarRp",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Result) {
                          $("#Main_Button2").click(); 
                      }),
                          error: errores
                      });
                 
              } catch (e) {
                  alert(e.message);
              }
          }


</script>

    
</asp:Content>

