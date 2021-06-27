
<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master" AutoEventWireup="true" CodeBehind="Configuracion.aspx.cs" Inherits="HardSoft.App.OAA.Configuracion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
      <script>
    
       $(document).keypress(function (event) {
        
           // para q no haga submit cuando pressiono enter en alguna parte
               var keycode = event.keyCode || event.which;
               if (keycode == '13') {
                   return false;
               }
           });
           function acceptNum(e) {
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               return ((tecla > 47 && tecla < 58) || tecla == 8);
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

             

               if (key == 45 ) {// perimta el -

                    return true;
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
        .alert-cab {
   color: #fff;
background-color: #222222;
border: 1px solid;
box-shadow: 0 4px 5px #555;
   
}
    </style>
    
    
    <style> 
     .MarcoMio {   
  margin-top: 5px;  
  background-color: #333;  
  padding: 5px; 
  border-radius: 10px 10px 10px 10px; 
  border: 1px solid; 
  box-shadow: 0 4px 5px #555; 
  color: white;  
  padding-left: 15px;  
   }  
 </style> 


    <%--   modal--%>  


  <div class='modal fade' id='Modalkx_config' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-lg'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 

            <div class="row">
              <div class=" col-xs-6 " id="TituloPop" style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;">Alta de Cliente</div>     
         <div class=" col-xs-6 ">
                 <button type="button" class="close" data-dismiss="modal">×</button>
           </div>
          </div>
             
 </div> 

 <div class='modal-body'> 
  
 <div id="tabs" style="text-transform:uppercase">
  <ul>  <li><a href="#tabs-2">Datos</a></li>
    <li><a href="#tabs-1"> Listas $$ </a></li>
       <li><a href="#tabs-4">Actualizar  $$ </a></li>
     <li><a href="#tabs-3">Logo </a></li>
       <li><a href="#tabs-5">Certificado </a></li>
    
      
  </ul>

     <div id="tabs-5">  

     <div class='row'   >  
         
             <div class='form-horizontal'> 

      <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'>config.xml</label>  
   <div class='col-xs-6'>  
    <asp:TextBox ID='Txtconfig' runat='server' CssClass='form-control'    ></asp:TextBox> 
  </div> 
<div class='col-xs-2'>
</div> 
</div> 
   <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'>loginTicketResponse.xml</label>  
   <div class='col-xs-6'>  
    <asp:TextBox ID='TxtloginTicketResponse' runat='server' CssClass='form-control'    ></asp:TextBox> 
  </div> 
<div class='col-xs-2'>
</div> 
</div> 
                   <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'>Contraseña</label>  
   <div class='col-xs-6'>  
    <asp:TextBox ID='TxtPass' runat='server' CssClass='form-control'    TextMode="Password"></asp:TextBox> 
  </div> 
<div class='col-xs-2'>
</div> 
</div> 
   <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'>Nombre Certificado</label>  
   <div class='col-xs-6'>  
    <asp:TextBox ID='TxtCert' runat='server' CssClass='form-control'    ></asp:TextBox> 
  </div> 
<div class='col-xs-2'>
</div> 
</div> 
 
</div>

         <div class="col-md-4" style="text-align:right">  Subir certificado</div>
          <div class="col-md-8">
               <input type="file"    id="f_UploadCer"  accept="application/x-pkcs12"   size="35" class="form-control" >
       </div>
         <br />
          
               <div class="col-md-4" style="text-align:right;margin-top:10px">   </div>
          <div class="col-md-3" style=" margin-top:10px">
              <button onclick="previewFileCer()" class=" btn2 btn-info" type="button"> Guardar </button>
  
       </div>
          <div class="col-md-3 alert-danger" style=" margin-top:10px; text-align:left " id="lblCer">    </div>
           <div class="col-md-2" >    </div>
   <br />   

       
     </div>
</div>

<div id="tabs-3"> 
     <div class='row'   >  
         <div class="col-md-4">  Logo de la Empresa (**.jpg)</div>
          <div class="col-md-8">
               <input type="file"    id="f_UploadImage"  accept="image/jpeg"   size="35" class="form-control" onchange="previewFile()">
       </div>
   <br />   <br />
         <div style="text-align:center;margin:auto">
             <img src=""  class="img-responsive " id="milogo" style="    margin: auto;
    padding-top: 10px;" />
             </div>
     </div>
</div>


     <div id="tabs-4"> 
     <div class='row'   >  
      
         <h4 >   Aumento de los precios de todas las lista en base a un porcentaje. </h4>
         <br />
             <div class="col-xs-6">
         <div class='form-horizontal'> 
      <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-6'> % AUMENTO POR COSTO  </label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtCosto' runat='server' Width="100px" CssClass='form-control' onkeypress="return acceptNum2(event, this.value)" placeholder="%" ></asp:TextBox> 
  </div> 
 
  <div class='col-xs-2'>  
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="TxtCosto" CssClass=" alert-danger"
    SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />
    </div> 
        
</div> 

                 <div class='form-group'>  
   
   <div class='col-xs-4'>  
     
  </div> 
   <div class='col-xs-8'>  

        
   <asp:Button ID="BtnMonto" runat="server" Text="Realizar Aumento" CssClass="btn2 btn-info" OnClick="BtnMonto_Click" />




 
  </div>
</div> 


</div>

     </div>

           <div class="col-xs-6">
               </div>

           <br />

           </div>
     
</div>

  <div id="tabs-1">
      <div class='form-horizontal'> 

          <div class='row'   >  
              <h4>Porcentajes en las listas de precios (%) - Margenes de Ganancia </h4>  
              <p style="font-size: 12px;
    color: red;">  ** esta configuracion corresponde a la utilidad inicial que aparecera a la hora de especificar los precios de cada articulo, Pudiendo ser modificado individualmente en ese mismo momento. </p>
               <div class="col-xs-6">
         <div class='form-horizontal'> 
      <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Lista 1</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl1' runat='server' CssClass='form-control' onkeypress="return acceptNum2(event, this.value)" placeholder="%" ></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
 
             
             <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l1_desc</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl1_desc' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 

  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l2</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl2' runat='server' CssClass='form-control' onkeypress="return acceptNum2(event, this.value)" placeholder="%" ></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l2_desc</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl2_desc' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 

  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l3</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl3' runat='server' CssClass='form-control' onkeypress="return acceptNum2(event, this.value)" placeholder="%" ></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l3_desc</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl3_desc' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 

             </div>
                   </div>
                 <div class="col-xs-6">
         <div class='form-horizontal'> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l4</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl4' runat='server' CssClass='form-control' onkeypress="return acceptNum2(event, this.value)" placeholder="%" ></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l4_desc</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl4_desc' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 

  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l5</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl5' runat='server' CssClass='form-control' onkeypress="return acceptNum2(event, this.value)" placeholder="%" ></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> l5_desc</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtl5_desc' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  
           <div class='form-group'>  
<label for="inputName" class="control-label col-xs-12 alert alert-info" style="
    text-align: center;
">Actualizar el precio de todos los articulos en base a estas utilidades  </label>
</div> 


                     <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-3'> </label>  
   <div class='col-xs-5'>  
  <button type="button" class="btn2 btn-info"  onclick="actulizar()">  

 <span class=" glyphicon glyphicon-ok"></span> 
Actualizar precios
 </button>

  </div> 
<div class='col-xs-4'>
</div> 
</div> 
      
         </div>
                   </div>
        </div>
           </div>
      </div>

   <div id="tabs-2">
        <div class='row'>   
    <div class="col-xs-6">
         <div class='form-horizontal '>   
  <div class='form-group  hidden  ' >  
    <label for='inputName' class='control-label col-xs-4'> id</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group hidden'>  
    <label for='inputName' class='control-label col-xs-4'> Usuario</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtUsuario' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
   <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Nombre</label>  
   <div class='col-xs-8'>  
    <asp:TextBox ID='TxtNombre' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Cuit</label>  
   <div class='col-xs-5'>  
    <asp:TextBox ID='TxtCuit' runat='server' CssClass='form-control' onkeypress="return acceptNum(event)"></asp:TextBox> 
  </div> 
 
</div> 
                <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> IIBB</label>  
   <div class='col-xs-5'>  
    <asp:TextBox ID='TxtIIBB' runat='server' CssClass='form-control' onkeypress="return acceptNum(event)"></asp:TextBox> 
  </div> 
 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Domicilio Comercial</label>  
   <div class='col-xs-8'>  
    <asp:TextBox ID='TxtDomicilioComercial' runat='server' CssClass='form-control' TextMode="MultiLine"></asp:TextBox> 
  </div> 
 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Condicion IVA</label>  
   <div class='col-xs-8'>  
    
       
  <select id="Main_TxtCondicionIVA" class="form-control">
          <option value="Monotributo" selected="selected">Monotributo</option>
          <option value="Responsable Inscripto">Responsable Inscripto</option>
       
      </select>
  </div> 
 
</div> 


               <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Inicio Actividad</label>  
   <div class='col-xs-8'>   
        
          <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaIniActividad" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaIniActividad"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
  
  </div> 
 
</div> 
   
 </div>  
      </div>

        <div class="col-xs-6">
               <div class='form-horizontal'>  

 

  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Pto Vta</label>  
   <div class='col-xs-2'>  
    <asp:TextBox ID='TxtPtoVta' runat='server' CssClass='form-control' onkeypress="return acceptNum(event)"></asp:TextBox> 
  </div> 
<div class='col-xs-6'>
</div> 
</div> 
  
 
                   
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> RazonSocial</label>  
   <div class='col-xs-8'>  
    <asp:TextBox ID='TxtRazonSocial' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
 
</div> 
  
                   
                    <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> RazonSocial2</label>  
   <div class='col-xs-8'>  
    <asp:TextBox ID='TxtRazonSocial2' runat='server' CssClass='form-control'></asp:TextBox> 
       <div style="display:none">
          <asp:TextBox ID='valorFoco' runat='server' CssClass='form-control'></asp:TextBox></div>
       
  </div> 
 
</div> 
<div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'>	Descripción</label>  
   <div class='col-xs-8'>  
  
      
       
       <asp:DropDownList ID="TxtModo" runat="server" CssClass='form-control'>
            <asp:ListItem>PRUEBA_SIN_AFIP</asp:ListItem>
            <asp:ListItem>Prueba</asp:ListItem>
            <asp:ListItem>Produccion</asp:ListItem>


       </asp:DropDownList>

  </div> 
 
</div> 

  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Principal</label>  
   <div class='col-xs-3'>  
     
         <select id="Main_TxtPrincipal" class="form-control">
          <option value="N">NO</option>
          <option value="S">SI</option>
       
      </select>
  </div> 
<div class='col-xs-3'>
</div> 
</div> 
      </div>

        </div>
 </div>
        </div>

    </div>
   

  

  <div   style='margin-top: 5px; text-align: center;' class='MarcoMio' >  

  <button id='btnModificar1b' type='button' class='btn2 btn-default ' onclick='ModPopJs()'  >  

 <span class=' glyphicon glyphicon-save'></span> 
Modificar 
 </button>  
  <button id='btnGuardar1b' type='button' class='btn2 btn-default ' onclick='AltaPopJs()'  >  

 <span class=' glyphicon glyphicon-save'></span> 
Guardar 
 </button>  

 <button type='button' class='btn2 btn-danger' data-dismiss='modal'>  

 <span class=' glyphicon glyphicon-floppy-remove'></span> 
Cerrar 
 </button> 


 </div> 

 </div>  

        </div> 

  </div>   
      </div>  
  

 <%--     -------------------------------------------- formulario principal -------------------------------------%>


 <div class='row'>   
      <div class="container" style="margin-top:30px;padding-top:5px ">
              <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
       Mis Empresas      </li>
                                </ol>
        </nav>
     <div class="alert alert-cab">
      MIS EMPRESAS 
            </div>
      <div   style='text-align:center;   margin-bottom: 0px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
       <div style='color:white;text-align:right; padding-top: 5px;' class='col-xs-3'>   
    Buscar  
    </div> 
  <div class='col-xs-3' >  
                    <select id='cmbTipoOp' class='form-control'>       
                   <option value='0'>Nombre</option>      
                       </select>      
   </div> 
       <div class='col-xs-3' >  
           <asp:TextBox ID='TxtBuscar' runat='server'  class='form-control'></asp:TextBox>   
   </div>  
   <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_config() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_config' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillakx_config'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_kx_config()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
  </button>  
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
   
            <br />
   &nbsp   <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label> <br /><br />
      </div> 
   
   </div>
    <script> 
           function erroresJs(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }
  function Buscar_kx_config() { 
try {    

    var v_buscar = $('#cmbTipoOp').val(); 
    var json = JSON.stringify 
   ({ 
        'v_tipo': $('#cmbTipoOp').val(), 
       'v_valor': $('#Main_TxtBuscar').val() 

   }); 
$.ajax({ 
    type: 'POST', 
    url: 'Configuracion.aspx/WsListar_kx_config', 
    data: json, 
    contentType: 'application/json; charset=utf-8', 
    dataType: 'json', 
    success: resultado_kx_config, 
    error: erroresJs 
  }); 

    } catch (e) { 
      alert(e.message);
    }
    }

  function resultado_kx_config(Resultado) { 
   var v_obj = Resultado.d; 
   var Tabla_Titulo = ''; 
   var Tabla_Datos = ''; 
   var Tabla_Fin = ''; 
   $('#Resultado_kx_config').show(); 
   $('#Resultado_kx_config').empty();   
   Tabla_Titulo = "  <table    id='grillakx_config' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th> <th>Nombre</th><th>Cuit</th><th>DomicilioComercial</th><th>CondicionIVA</th><th>RazonSocial</th> <th>RazonSocial2</th> <th>FechaIniActividad</th><th>PtoVta</th><th>Descripción</th><th>Principal</th> </tr></thead><tbody> ";
   $.each(v_obj, function (index, obj) {      
       Tabla_Datos = Tabla_Datos + " <tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod_kx_config(" + obj.id + ");' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td style='width:30px'> <a class='tooltips' onclick='gvDel_kx_config(" + obj.id + ",\"" + obj.Principal + "\" );'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>     <td>" + obj.Nombre + " </td> <td>" + obj.Cuit + " </td> <td>" + obj.DomicilioComercial + " </td> <td>" + obj.CondicionIVA + " </td> <td>" + obj.RazonSocial + " </td>  <td>" + obj.RazonSocial2 + " </td> <td>" + obj.FechaIniActividad + " </td> <td>" + obj.PtoVta + " </td> <td>" + obj.Modo + " </td>  <td>" + obj.Principal + " </td> </tr>";
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_config').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin); 
     fn_cantidad_kx_config(); 
     } 

    function fn_cantidad_kx_config() { 
     cantidad = $('#grillakx_config tbody').find('tr').length; 
     $('#span_cantidad').html(cantidad); 
     }; 
    
  var  tableM = document.getElementById("grillakx_config");
  function gvDel_kx_config(ids, tipo) {
     

      if (tipo != "S") {
              try {
                  if (confirm('Esta seguro que desea eliminar el registro ?')) {
                      var json = JSON.stringify
                          ({
                              'v_Id': ids
                          });

                      $.ajax({
                          type: 'POST',
                          url: 'Configuracion.aspx/WmGvDel_kx_config',
                          data: json, contentType: 'application/json; charset=utf-8',
                          dataType: 'json',
                          success: (function (Result) {
                              Buscar_kx_config();
                          }),
                          error: erroresJs
                      });
                  }
              }
              catch (e) {
                  alert(e);
              }
          } else {
              alert("Antes de eliminar configure otro como Princial, ya que este es el principal ahora.");

          }


      }


          $("#Main_Txtl1").focus(function () {
                    $("#Main_valorFoco").val( $("#Main_Txtl1").val());
                   $("#Main_Txtl1").val('');
                   
                   return; 
             }); 

            $("#Main_Txtl1").blur(function () {

                     if ($("#Main_Txtl1").val() == '') {
                    $("#Main_Txtl1").val( $("#Main_valorFoco").val()) ;
                }

                 
        });


           $("#Main_Txtl2").focus(function () {
                     $("#Main_valorFoco").val( $("#Main_Txtl2").val());

                   $("#Main_Txtl2").val('');
                   
                   return; 
             }); 

            $("#Main_Txtl2").blur(function () {

                     if ($("#Main_Txtl2").val() == '') {
                    $("#Main_Txtl2").val( $("#Main_valorFoco").val()) ;
                } 
        });

        $("#Main_Txtl3").focus(function () {
                  $("#Main_valorFoco").val( $("#Main_Txtl3").val());

                   $("#Main_Txtl3").val('');
                   
                   return; 
             }); 

            $("#Main_Txtl3").blur(function () {

                     if ($("#Main_Txtl3").val() == '') {
                    $("#Main_Txtl3").val( $("#Main_valorFoco").val()) ;
                }

                 
        });



            $("#Main_Txtl4").focus(function () {
                  $("#Main_valorFoco").val( $("#Main_Txtl4").val());

                   $("#Main_Txtl4").val('');
                   
                   return; 
             }); 

            $("#Main_Txtl4").blur(function () {

                     if ($("#Main_Txtl4").val() == '') {
                    $("#Main_Txtl4").val( $("#Main_valorFoco").val()) ;
                }

                 
        });
    $("#Main_Txtl5").focus(function () {
                  $("#Main_valorFoco").val( $("#Main_Txtl5").val());

                   $("#Main_Txtl5").val('');
                   
                   return; 
             }); 

            $("#Main_Txtl5").blur(function () {

                     if ($("#Main_Txtl5").val() == '') {
                    $("#Main_Txtl5").val( $("#Main_valorFoco").val()) ;
                }

                 
        });

    function PopMod_kx_config(id) { 
        try { 
            
             $("#ui-id-5").show(); 
           $("#lblCer").text("");
    $("#btnModificar1b").show(); 
    $("#btnGuardar1b").hide(); 
    $("#TituloPop").text('Modificar'); 
    $('#Modalkx_config').modal(); 
    $('#Main_Txtid').val(id); 
    
          
            $("#Main_Txtconfig").text("");
            $("#Main_TxtloginTicketResponse").text("");
            $("#Main_TxtPass").text("");
            $("#Main_TxtCert").text("");
            $("#f_UploadCer").text("");

    var json = JSON.stringify 
        ({ 
          'v_tipo':'99', 
          'v_valor': id 
        }); 
      $.ajax({ 
      type: 'POST', 
      url: 'Configuracion.aspx/WsListar_kx_config', 
      data: json, 
      contentType: "application/json; charset=utf-8", 
      dataType: "json", 
      success: function (Resultado) { 
          var v_obj = Resultado.d; 
          $.each(v_obj, function (index, obj) {           
          $('#Main_Txtid').val(obj.id); 
          $('#Main_TxtUsuario').val(obj.Usuario); 
          $('#Main_Txtl1').val(parseFloat(obj.l1.replace(',', '.')).toFixed(2));
          $('#Main_Txtl1_desc').val(obj.l1_desc); 
          $('#Main_Txtl2').val(parseFloat(obj.l2.replace(',', '.')).toFixed(2));
          $('#Main_Txtl2_desc').val(obj.l2_desc); 
          $('#Main_Txtl3').val(parseFloat(obj.l3.replace(',', '.')).toFixed(2));
          $('#Main_Txtl3_desc').val(obj.l3_desc); 
          $('#Main_Txtl4').val(parseFloat(obj.l4.replace(',', '.')).toFixed(2));
          $('#Main_Txtl4_desc').val(obj.l4_desc); 
          $('#Main_Txtl5').val(parseFloat(obj.l5.replace(',', '.')).toFixed(2));
          $('#Main_Txtl5_desc').val(obj.l5_desc); 
          $('#Main_TxtNombre').val(obj.Nombre); 
          $('#Main_TxtCuit').val(obj.Cuit); 
          $('#Main_TxtDomicilioComercial').val(obj.DomicilioComercial); 
          $('#Main_TxtCondicionIVA').val(obj.CondicionIVA); 
          $('#Main_TxtRazonSocial').val(obj.RazonSocial); 
         
          $('#Main_TxtIIBB').val(obj.IIBB); 
          $('#Main_TxtFechaIniActividad').val(obj.FechaIniActividad); 
          $('#Main_TxtPtoVta').val(obj.PtoVta); 
          $('#Main_TxtModo').val(obj.Modo); 
          $('#Main_TxtRazonSocial2').val(obj.RazonSocial2); 
          $('#Main_TxtPrincipal').val(obj.Principal); 
          $("#milogo").removeAttr('src');
              $("#milogo").attr('src', "data:image/png;base64," + arrayBufferToBase64(obj.Logo)); 
              $('#Main_Txtconfig').val(obj.CONFIG_XML); 
              $('#Main_TxtloginTicketResponse').val(obj.LOGINTICKETRESPONSE_XML); 
               $('#Main_TxtCert').val(obj.CERTIFICADO); 

          
        }); 
      }, 
      error: erroresJs 
    }); 
    } catch (e) { 
    alert(e.message);
    } 
    }

      
    function arrayBufferToBase64(buffer) {
        var binary = '';
        var bytes = new Uint8Array(buffer);
        var len = bytes.byteLength;
        for (var i = 0; i < len; i++) {
            binary += String.fromCharCode(bytes[i]);
        }
        return window.btoa(binary);
    }

    var dataURL2 = "";
    function resizeAndUpload(file) {
        var reader = new FileReader();
        reader.onloadend = function () {

            $(".spinner-wrapper").css("display", "block");
            $(".loader").css("display", "block");


            var tempImg = new Image();
            tempImg.src = reader.result;
            tempImg.onload = function () {

                var MAX_WIDTH = 1024;
                var MAX_HEIGHT = 768;
                var tempW = tempImg.width;
                var tempH = tempImg.height;
                if (tempW > tempH) {
                    if (tempW > MAX_WIDTH) {
                        tempH *= MAX_WIDTH / tempW;
                        tempW = MAX_WIDTH;
                    }
                } else {
                    if (tempH > MAX_HEIGHT) {
                        tempW *= MAX_HEIGHT / tempH;
                        tempH = MAX_HEIGHT;
                    }
                }

                var canvas = document.createElement('canvas');

                canvas.width = tempW;
                canvas.height = tempH;
                var ctx = canvas.getContext("2d");
                ctx.drawImage(this, 0, 0, tempW, tempH);
                var dataURL = canvas.toDataURL("image/png");
                // return dataURL;
                $("#milogo").removeAttr('src');
                $("#milogo").attr('src', dataURL);


                var blob = dataURItoBlob(dataURL); // blob la guarda
                //    return blob;
                $(".spinner-wrapper").css("display", "none");
                $(".loader").css("display", "none");
            }

        }
        reader.readAsDataURL(file);// llama a la funcion

    }
    function previewFile() {
        
        if ($("#f_UploadImage").val() != '') {

            $('#btnAgregar1b31').removeClass("glyphicon-save");
            $('#btnAgregar1b31').addClass("glyphicon-refresh glyphicon-refresh-animate");

            //  $('#f_UploadImage')[0].files[0].name; // nombre

            //var formData = new FormData();
            //formData.append('file', $('#f_UploadImage')[0].files[0]);



            resizeAndUpload($('#f_UploadImage')[0].files[0]); // redimenciona y la guarda 


        } else {
            $('#wait').hide();

            alert('Adjunte un arhivo.');

        }

    }

    function dataURItoBlob(dataURI) {
        // separate out the mime component
        var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

        var binary = atob(dataURI.split(',')[1]);
        var array = [];
        for (var i = 0; i < binary.length; i++) {
            array.push(binary.charCodeAt(i));
        }
        var blob = new Blob([new Uint8Array(array)], { type: mimeString });

    

        return blob;
    }
        function ModPopJs() {
            try {



                if ($("#Main_TxtCuit").val()=='')
                {
                    alert('El campo cuit es obligatorio');
                    return;

                }
                
                if ($("#Main_TxtNombre").val()=='')
                {
                    alert('El campo Nombre es obligatorio');
                    return;

                }
            $(".spinner-wrapper").css("display", "block");
            $(".loader").css("display", "block");

            var binary = atob($("#milogo").attr('src').split(',')[1]);
            var array = [];
            for (var i = 0; i < binary.length; i++) {
                array.push(binary.charCodeAt(i));
            }


            var json = JSON.stringify
            ({
                'v_obj': {
                    'id': $('#Main_Txtid').val(),
                    'Usuario': $('#Main_TxtUsuario').val(),
                    'l1': parseFloat($('#Main_Txtl1').val().replace(',', '.')).toFixed(2) ,
                    'l1_desc': $('#Main_Txtl1_desc').val(),
                    'l2': $('#Main_Txtl2').val(),
                    'l2_desc': $('#Main_Txtl2_desc').val(),
                    'l3': $('#Main_Txtl3').val(),
                    'l3_desc': $('#Main_Txtl3_desc').val(),
                    'l4': $('#Main_Txtl4').val(),
                    'l4_desc': $('#Main_Txtl4_desc').val(),
                    'l5': $('#Main_Txtl5').val(),
                    'l5_desc': $('#Main_Txtl5_desc').val(),
                    'Nombre': $('#Main_TxtNombre').val(),
                    'Cuit': $('#Main_TxtCuit').val(),
                    'DomicilioComercial': $('#Main_TxtDomicilioComercial').val(),
                    'CondicionIVA': $('#Main_TxtCondicionIVA').val(),
                    'RazonSocial': $('#Main_TxtRazonSocial').val(),
                    'Logo': array,
                    'IIBB': $('#Main_TxtIIBB').val(),
                    'FechaIniActividad': $('#Main_TxtFechaIniActividad').val(),
                    'PtoVta': $('#Main_TxtPtoVta').val(),
                    'Modo': $('#Main_TxtModo').val(),
                    'RazonSocial2': $('#Main_TxtRazonSocial2').val(),
                    'Principal': $('#Main_TxtPrincipal').val(),
                      'Todo': 'NO'
                }
            });
            $.ajax({
                type: "POST",
                url: 'Configuracion.aspx/WmGvMod_kx_config',
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: (function (Result) {
                    $('#Modalkx_config').modal('hide');
                    Buscar_kx_config();
                    LimpiarPop();
                }),
                error: erroresJs,
                complete: (function () {
                    $(".spinner-wrapper").css("display", "none");
                    $(".loader").css("display", "none");
                
                })
            });
        } catch (e) {
            alert(e.message);
        } 
    } 
        function actulizar() {
             try {

                   if (!confirm("Esta seguro que desea actualizar los precios de todos los articulos en base a las utilidades (margen) de cada lista?")) {
                       return;
                        }

                if ($("#Main_TxtCuit").val()=='')
                {
                    alert('El campo cuit es obligatorio');
                    return;

                }
                
                if ($("#Main_TxtNombre").val()=='')
                {
                    alert('El campo Nombre es obligatorio');
                    return;

                }
            $(".spinner-wrapper").css("display", "block");
            $(".loader").css("display", "block");

            var binary = atob($("#milogo").attr('src').split(',')[1]);
            var array = [];
            for (var i = 0; i < binary.length; i++) {
                array.push(binary.charCodeAt(i));
            }


            var json = JSON.stringify
            ({
                'v_obj': {
                    'id': $('#Main_Txtid').val(),
                    'Usuario': $('#Main_TxtUsuario').val(),
                    'l1': parseFloat($('#Main_Txtl1').val().replace(',', '.')).toFixed(2) ,
                    'l1_desc': $('#Main_Txtl1_desc').val(),
                    'l2': $('#Main_Txtl2').val(),
                    'l2_desc': $('#Main_Txtl2_desc').val(),
                    'l3': $('#Main_Txtl3').val(),
                    'l3_desc': $('#Main_Txtl3_desc').val(),
                    'l4': $('#Main_Txtl4').val(),
                    'l4_desc': $('#Main_Txtl4_desc').val(),
                    'l5': $('#Main_Txtl5').val(),
                    'l5_desc': $('#Main_Txtl5_desc').val(),
                    'Nombre': $('#Main_TxtNombre').val(),
                    'Cuit': $('#Main_TxtCuit').val(),
                    'DomicilioComercial': $('#Main_TxtDomicilioComercial').val(),
                    'CondicionIVA': $('#Main_TxtCondicionIVA').val(),
                    'RazonSocial': $('#Main_TxtRazonSocial').val(),
                    'Logo': array,
                    'IIBB': $('#Main_TxtIIBB').val(),
                    'FechaIniActividad': $('#Main_TxtFechaIniActividad').val(),
                    'PtoVta': $('#Main_TxtPtoVta').val(),
                    'Modo': $('#Main_TxtModo').val(),
                    'RazonSocial2': $('#Main_TxtRazonSocial2').val(),
                    'Principal': $('#Main_TxtPrincipal').val(),
                      'Todo': 'SI'
                }
            });
            $.ajax({
                type: "POST",
                url: 'Configuracion.aspx/WmGvMod_kx_config',
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: (function (Result) {
                    $('#Modalkx_config').modal('hide');
                    Buscar_kx_config();
                    LimpiarPop();
                }),
                error: erroresJs,
                complete: (function () {
                    $(".spinner-wrapper").css("display", "none");
                    $(".loader").css("display", "none");
                
                })
            });
        } catch (e) {
            alert(e.message);
        } 

        }
    function LimpiarPop() {
      

          $("#milogo").removeAttr('src');
          $('#Main_Txtid').val(''); 
          $('#Main_TxtUsuario').val(''); 
          $('#Main_Txtl1').val('20'); 
          $('#Main_Txtl1_desc').val(''); 
          $('#Main_Txtl2').val('0'); 
          $('#Main_Txtl2_desc').val(''); 
          $('#Main_Txtl3').val('0'); 
          $('#Main_Txtl3_desc').val(''); 
          $('#Main_Txtl4').val('0'); 
          $('#Main_Txtl4_desc').val(''); 
          $('#Main_Txtl5').val('0'); 
          $('#Main_Txtl5_desc').val(''); 
          $('#Main_TxtNombre').val(''); 
          $('#Main_TxtCuit').val(''); 
          $('#Main_TxtDomicilioComercial').val(''); 
          $('#Main_TxtCondicionIVA').val('Monotributo');
          $('#Main_TxtRazonSocial').val(''); 
        
          $('#Main_TxtIIBB').val(''); 
     
          $('#Main_TxtPtoVta').val(''); 
          $('#Main_TxtModo').val(''); 
          $('#Main_TxtRazonSocial2').val(''); 
          $('#Main_TxtPrincipal').val('N');

          $("#milogo").removeAttr('src');


          var primerDia = new Date();

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
   
          $("#Main_TxtFechaIniActividad").val(today);
         
      } 
         
        function PopAlta_kx_config() { 
             $("#ui-id-5").hide(); 
            
      
        LimpiarPop(); 

        
        $("#Main_TxtModo").val("PRUEBA_SIN_AFIP").change();

    $("#btnModificar1b").hide(); 
    $("#btnGuardar1b").show(); 
    $("#TituloPop").text('Alta'); 
    $("#Modalkx_config").modal(); 
    $("#Main_Txtid").val('0'); 
    $("#Main_Txtid").prop('disabled', true); 
      } 
 
    function AltaPopJs() { 
        try {
             
            
                if ($("#Main_TxtCuit").val()=='')
                {
                    alert('El campo cuit es obligatorio');
                    return;

                }
                
                if ($("#Main_TxtNombre").val()=='')
                {
                    alert('El campo Nombre es obligatorio');
                    return;

                }
            $(".spinner-wrapper").css("display", "block");
            $(".loader").css("display", "block");
            var array = [];
            if ($("#milogo").attr('src') != null) {
                var binary = atob($("#milogo").attr('src').split(',')[1]);
                for (var i = 0; i < binary.length; i++) {
                    array.push(binary.charCodeAt(i));
                }
            }
           
          var json = JSON.stringify 
          ({ 
            'v_obj': { 
          'id': $('#Main_Txtid').val(), 
          'Usuario': $('#Main_TxtUsuario').val(), 
          'l1': $('#Main_Txtl1').val(), 
          'l1_desc': $('#Main_Txtl1_desc').val(), 
          'l2': $('#Main_Txtl2').val(), 
          'l2_desc': $('#Main_Txtl2_desc').val(), 
          'l3': $('#Main_Txtl3').val(), 
          'l3_desc': $('#Main_Txtl3_desc').val(), 
          'l4': $('#Main_Txtl4').val(), 
          'l4_desc': $('#Main_Txtl4_desc').val(), 
          'l5': $('#Main_Txtl5').val(), 
          'l5_desc': $('#Main_Txtl5_desc').val(), 
          'Nombre': $('#Main_TxtNombre').val(), 
          'Cuit': $('#Main_TxtCuit').val(), 
          'DomicilioComercial': $('#Main_TxtDomicilioComercial').val(), 
          'CondicionIVA': $('#Main_TxtCondicionIVA').val(), 
          'RazonSocial': $('#Main_TxtRazonSocial').val(),

          'Logo': array,

          'IIBB': $('#Main_TxtIIBB').val(), 
          'FechaIniActividad': $('#Main_TxtFechaIniActividad').val(), 
          'PtoVta': $('#Main_TxtPtoVta').val(), 
          'Modo': $('#Main_TxtModo').val(), 
          'RazonSocial2': $('#Main_TxtRazonSocial2').val(), 
          'Principal': $('#Main_TxtPrincipal').val() 
            } 
          }); 
          $.ajax({ 
        type: "POST", 
        url: 'Configuracion.aspx/WmGvAlta_kx_config', 
        data: json, 
        contentType:"application/json; charset=utf-8", 
        dataType: 'json', 
        success: (function (Result) { 
        $('#Modalkx_config').modal('hide'); 
        Buscar_kx_config(); 
        LimpiarPop(); 
    }), 
        error: erroresJs,
        complete: (function () {
            $(".spinner-wrapper").css("display", "none");
            $(".loader").css("display", "none");

        })
    }); 
      } catch (e) { 
        alert(e.message); 
      } 
    }


    $("#Main_TxtCuit").blur(function () {
        if ($("#Main_TxtCuit").val() != "") {

            validaCuit();
        }

    });


    function validaDigito(cuit) {

        if (cuit.length != 11)
            return false;
        else {
            var Caracters_1_2 = cuit.charAt(0) + cuit.charAt(1);
            if (Caracters_1_2 != "20" &&
                   Caracters_1_2 != "23" &&
                   Caracters_1_2 != "24" &&
                   Caracters_1_2 != "27" &&
                   Caracters_1_2 != "30" &&
                   Caracters_1_2 != "33" && Caracters_1_2 != "34")
                return false;
            else {
                var mult = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2];
                var total = 0;
                for (var i = 0; i < mult.length; i++) {
                    total += parseInt(cuit.charAt(i)) * mult[i];
                }
                var mod = total % 11;
                var digito = mod == 0 ? 0 : mod == 1 ? 9 : 11 - mod;
            }
            return digito == parseInt(cuit.charAt(10));
        }
    }

    function validaCuit() {
        try {
            var numeroCuit = $('#Main_TxtCuit').val();

            if (!validaDigito(numeroCuit)) {

                alert(" El CUIT/CUIL ingresado no posee el formato correcto o el dígito informado es erróneo.");
                $('#Main_TxtCuit').val('');
                //    $('#ContentPlaceHolder1_txtNumeroCuit').focus();
                return;
            }

        } catch (e) {
            $('#Main_TxtCuit').val('');
            $('#Main_TxtCuit').focus();

        }
    }

        function previewFileCer() {

            if ($("#f_UploadCer").val() != '') {

                 //  $('#f_UploadImage')[0].files[0].name; // nombre

                     var formData = new FormData();
                     formData.append('file', $('#f_UploadCer')[0].files[0]);
                dataURItoBlobCer(formData);
                
                }
        }



                function dataURItoBlobCer(fd) {

                 
                 $.ajax({
                     type: 'post',
                     async: true,
                     url: '/Services/KardexCert.ashx',
                     data: fd,
                     success: function (status) {
                         if (status != 'error') {
                            
                             try {
                                 if (status != 'Extension no validad.') {
                                    
                                     var v_conf =  "Config"+$("#Main_TxtCuit").val()+"PV"+ $("#Main_TxtPtoVta").val()+ $("#Main_TxtModo").val()+".xml";
                                     var v_resp = "TicketResponse"+$("#Main_TxtCuit").val()+"PV"+ $("#Main_TxtPtoVta").val()+ $("#Main_TxtModo").val()+".xml";
                                     var json = JSON.stringify
                                         ({
                                             'v_Id': $('#Main_Txtid').val(),
                                             'Cert': status,
                                             'v_conf':v_conf,
                                             'v_resp': v_resp,
                                             'v_pass': $("#Main_TxtPass").val(),
                                              'v_cuit':$("#Main_TxtCuit").val()
                                     });
                                     $.ajax({
                                         type: "POST",
                                         url: 'Configuracion.aspx/WsUpdateCert',
                                         data: json,
                                         contentType: "application/json; charset=utf-8",
                                         dataType: 'json',
                                         success: (function (Result) { 
                                             $('#Main_Txtconfig').val(v_conf);
                                              $('#Main_TxtloginTicketResponse').val(v_resp);
                                             $("#Main_TxtCert").val(status);
                                             $("#lblCer").text("oK..Salga e ingresar devuelta para aplicar cambios!!");
                                              
                                         }),
                                         error: errores
                                     });

                                 } else {
                                    
                                     throw "Extension no validad.";
                                 }
                             } catch (e) {
                                 alert(e);
                             }
 

                         }
                     },
                     processData: false,
                     contentType: false,
                     error: errores
                 });

     
             }


        $(function () {
            $('#Main_Txtconfig').prop('disabled', true);
            $('#Main_TxtloginTicketResponse').prop('disabled', true);
              $('#Main_TxtCert').prop('disabled', true);
      
        Buscar_kx_config();
       



           $('#tabs').tabs();
        });




    </script>


       <script>
           $(document).ready(function () {

               $(this).everyTime(25000, function () {
                   $("#miLoader").hide();
                   $.ajax({
                       type: "POST",
                       url: "../ActiveSession.aspx/KeepActiveSession",
                       data: {},
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       async: true,
                       success: VerifySessionState,
                       error: function (XMLHttpRequest, textStatus, errorThrown) {
                           window.location.href = "/Inicio.aspx";

                       }
                   });


               });




               function VerifySessionState(result) {
                   $("#miLoader").show();
                   if (!result.d) {

                       window.location.href = "/Inicio.aspx";
                   }
               }

               //fin de ready

           });
     </script>
  
</asp:Content>

