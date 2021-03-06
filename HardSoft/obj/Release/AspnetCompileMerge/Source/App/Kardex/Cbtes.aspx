<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Cbtes.aspx.cs" Inherits="HardSoft.App.Kardex.Cbtes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
  
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
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

     <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="http://www.hardsoft.com.ar/css/jquery-ui.css">
          
    <script src="http://www.hardsoft.com.ar/js/jquery.maskedinput.js"></script>
    <script src="http://www.hardsoft.com.ar/Scripts/jquery-ui.js"></script>

  
  
    <div class=" container" style="margin-top: 36px;">  
          <div style="display:none">
    <asp:HiddenField ID="Hdcliente" runat="server" />
           <asp:HiddenField ID="HdNota" runat="server" />
 
    </div>
    <div   style="margin-top:0px;text-transform:uppercase" >
         
       
      <div class="alert alert-cab"  >
         Comprobante 
            </div> 

       
     
<div class="row"  style=" background:  rgba(245, 245, 245, 0.51);margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
     <div class="col-xs-6">
          <div class="form-horizontal"> 
  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> FECHA </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtFecha" runat="server" class="campoFecha form-control" Width="100px"  ></asp:TextBox>
      
         </div>
        <label for="TxtNombre" class="control-label col-xs-1">  </label>
         <div class="col-xs-4">

     
      <select id="cmbTipoVta" class="form-control">
          <option value="1"> Productos</option> 
           <option value="2">  Servicios</option> 
            <option value="3">  Productos y Servicios</option>
      </select>
         </div>
           
     </div> 

  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> Vendedor</label>
         <div class="col-xs-8">

<select id="cmbVendedor" class="form-control">
          <option value="1">VENDEDOR 01</option> 
      </select>
      
         </div>
           
     </div> 

     <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> Tipo Comprobante</label>
         <div class="col-xs-8">
  <%-- Cuando se trate de una operación entre un Responsable Inscripto y Monotributista, Consumidor Final, o Exento, el Responsable Inscripto deberá emitir comprobantes tipo “B”.
             Si se trata de operaciones entre responsables inscriptos Cbate A (NO acepta dni solo cuit)--%>

<select id="cmbTipoCbate" class="form-control"> 
   <%--  <option value="1">Factura A</option> --%>
     <option value="6">Factura B</option> 
      
                        
      </select>
      
         </div>
           
     </div>  
              
                   </div>
    </div>

    <div class="col-xs-6">
        <div class="form-horizontal">
        
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Cliente:</label>
         <div class="col-xs-6">
<asp:TextBox ID="TxtClienteNombre" runat="server"  class="form-control"    ></asp:TextBox>
             <input id="hddIdCli" type="hidden" value="" />
         </div> 
               
               
               <div class="col-xs-2">
                     
      <a class="tooltips" style="cursor:pointer "  onclick="VerCli()">    <img src="../../images/buscar-documentos.png"  style="height:28px" /><span>Buscar Cliente</span></a> 
             <a class="tooltips" style="cursor:pointer "  onclick="CliNuevo()">   <img src="/images/add-mas.png" style="height: 25px; padding-left:5px;padding-top:2px"><span>Nuevo Cliente</span></a> 
             
         </div>

     </div>

              <div class="form-group">
         <label for="TxtTipoDoc3" class="control-label col-xs-4"><span id="TxtTipoDoc"> CUIT/DOC</span> </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtDoc" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>     

  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> Tel </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtTel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
         
          </div>
 </div>
    

    </div>

</div>

  
 

<div class="row"  style="    background: rgba(245, 245, 245, 0.51);margin-left:0px; margin-right:0px;  margin-top:5px; padding:20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
 

<div class="col-md-12 " style="margin-top:6px; background: -webkit-linear-gradient(top,#555,#333); text-align:left;  text-shadow: #969696 0.1em 0.1em 0.2em;   border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px; color:white">
    
    
   
  <div class="col-md-10 " style="padding-top:5px" >  
         Ingreso de Artículos <a class="tooltips" style="cursor:pointer " onclick="VerProv()">   
        &nbsp; <img src="/images/cesta-de-la-compra-boton-agregar.png" style="height: 26px;">        
<span>Agregar Articulo </span></a>
</div>

    
      <div  class="col-md-2 ">
    <button id="btnAdd" type="button" class="btn2 btn-danger   " onclick="VerProv()">
    <span class=" glyphicon glyphicon-plus"></span> Agregar 
 </button>
 </div>


    </div>
  
        
<div class="row">
    <div class="col-xs-12">
    <div id="ResultadoProv"  style="overflow-y: auto; overflow-x: hidden; height: 150px; width: 100%; background-color:rgb(240, 244, 251) "></div>
        <br />

            <div  class="control-label col-xs-5  pull-left"  id="condicion2"> 
        <a class="tooltips" style="cursor:pointer; background-color:coral ;padding: 10px; " onclick="VerCondicion()"> CONDICIÓN DE VENTA &nbsp <img src="../../../images/cheque.png"> 
       
<span>Forma de Pago </span></a> </div>

          <label for="TxtTotal" class="control-label col-xs-5  pull-right" style=" background-color:#eceae9 ;padding: 10px;     font-size: 24px;" > <strong> TOTAL: <span id="IdTotal" style="color: red;">0</span> </strong>$</label>

    </div>




    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            
       

</div> 

    </div>

<div id="condicion" class="row"  style=" background: rgba(245, 245, 245, 0.51);display:none;margin-left:0px; margin-right:0px;  margin-top:5px; padding:20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;text-transform:uppercase">
<div class="row"  style="  padding:15px;">
 
  <div class="col-xs-12" style="margin-top:6px; background: -webkit-linear-gradient(top,#555,#333); text-align:left;  text-shadow: #969696 0.1em 0.1em 0.2em;   border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px; color:white;">&nbsp;&nbsp;   Condiciones de Venta  </div>


 
<div class="col-xs-6"> 

         <div class="form-horizontal">
        
          <div class="form-group" style="background-color: seashell;">
         <label for="TxtCliente" class="control-label col-xs-6">Pago en efectivo $ </label>
                <div class="col-xs-3">

            
       <input id="TxtPagoEfetivoEnt"  onKeyPress="return acceptNum2(event, this.value)"   value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="" />               
                       </div>
           <div class="col-xs-3">
      
  <input id="TxtPagoEfetivo"  onKeyPress="return acceptNum2(event, this.value)"  value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="" />
     
     </div>
      </div>
           <div class="form-group"  >
         <label for="TxtCliente" class="control-label col-xs-6">BANCOS </label>
                   <div class="col-xs-3">

            
       <input id="TxtPagoBcoEnt"  onKeyPress="return acceptNum(event)"   value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="" />               
                       </div>
           <div class="col-xs-3">
      
  <input id="TxtPagoBco" onKeyPress="return acceptNum2(event, this.value)"   value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="" />
     
     </div>
      </div>
      
         
          </div>
    
     </div>
    <div class="col-xs-6">
        

         <div class="form-horizontal">
        
          <div class="form-group">
         <label for="TxtCliente" class="control-label col-xs-6">Tarjetas $ </label>
                <div class="col-xs-3">
 
           <input id="TxTjTotal"  value="0" type="text"  onKeyPress="return acceptNum(event)"  onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control"   />
                    
                    
                        </div>
           <div class="col-xs-3 "  style="text-align:left">
      
          <div style="text-align:left;margin:auto">
                <a class="tooltips" style="cursor:pointer "  onclick="VerTJ()">  <img src="../../../images/tarjeta.png" class="pull-left"/>        
<span>Tarjetas </span></a></div>
            
     </div>
      </div>
      
     <div class="form-group">
         <label for="TxtCliente" class="control-label col-xs-6">Cheques $ </label>
                <div class="col-xs-3">
                      <input id="TxtChTotal" type="text" onKeyPress="return acceptNum(event)"  value="0" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control"  />
         
          </div>
           <div class="col-xs-3" >
      <div style="text-align:left;margin:auto">
          <a class="tooltips" style="cursor:pointer "  onclick="verC()">  <img src="../../../images/cheque.png" class="pull-left"/> 
       
<span>Cheques </span></a></div>

            
 
     </div>
      </div>
     


         
          </div>
   
    </div>


  
    <div class="col-xs-6" style="background-color:aliceblue; color:red; font-size:20px;font-weight:700"> 
        <div  class="col-xs-9" style="text-align:right">A PAGAR $</div>
          <div  class="col-xs-3" style="text-align:left" id="lblSaldo">00.00</div>
    </div>
       <div class="col-xs-6" style="background-color:aliceblue; color:blue; font-size:20px;font-weight:700"> 
        <div  class="col-xs-9" style="text-align:right">CAMBIO $</div>
          <div  class="col-xs-3" style="text-align:left" id="lblCambio">00.00</div>
    </div>
</div>
 

  
<div class="row">
<div class="col-xs-12"> 
      <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button"  class="btn2 btn-primary" onclick="AltaFact()" >
    <span class=" glyphicon glyphicon-print"></span> Generar 
 </button>
    
 

        <button id="btnVolver1a" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
    
               

              <br />
 
                     


               </div>
    </div>
</div>
   
    
      </div>
<br />
        
                <!-- Modal tarjeta-->
  <div class="modal fade" id="ModalTJ" role="dialog" style="display:none"  >
    <div class="modal-dialog" style="width:80%">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">

              <button type="button" class="close" data-dismiss="modal">×</button>
         <div class=" col-xs-6 " style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;"> Pago con Tarjeta</div>
 </div>  
          
        <div class="modal-body">

         <div  style=" background:rgba(245, 245, 245, 0.51);  margin-left:20px; margin-right:20px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
   
             
              <div class="row">
    <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
     
                  <label for="TxtNombre" class="control-label col-xs-4">Tarjeta </label>
                <div class="col-xs-8">

 <asp:DropDownList ID="CmbTarjetas" runat="server" CssClass=" form-control " Width="100%"  >                                          
                                            <asp:ListItem>Visa</asp:ListItem>
                      <asp:ListItem>Mastercard</asp:ListItem>
                      <asp:ListItem>American Express</asp:ListItem>  
         <asp:ListItem>Tarjeta Shopping</asp:ListItem>
                      <asp:ListItem>Cabal</asp:ListItem>
                      <asp:ListItem>Diners</asp:ListItem>
         <asp:ListItem>Argencard</asp:ListItem>
                      <asp:ListItem>Naranja</asp:ListItem>
                      <asp:ListItem>Nativa Mastercard</asp:ListItem>
     <asp:ListItem>Cencosud</asp:ListItem>
                      <asp:ListItem>CMR</asp:ListItem>
                      <asp:ListItem>Cordial</asp:ListItem>
        <asp:ListItem>Cordobesa</asp:ListItem>

                                        </asp:DropDownList>
          
                    
                       </div>
           
        
          </div>

    

    </div>
</div>
     <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">


         <label for="TxtMonto" class="control-label col-xs-2  " >  Cuotas </label>
                  <div class="col-xs-4">    <input id="TxtCuotaT" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"  style="width:80px"  class="form-control"/>
                   </div>

             <label for="TxtMonto" class="control-label col-xs-2  " >Importe</label>
  
              <div class="col-xs-4">  
                  <input id="TxtMontoT" type="text" onKeyPress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter"  value ="0"   class="form-control"/>
                   
                   </div>
            </div>
    </div>
          
</div>

</div>
  
          <div class="row">
    <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
     
            
         <label for="TxtMonto" class="control-label col-xs-4  " >N° Tarjeta </label>
                  <div class="col-xs-8">    <input id="TxtNumTJ" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                   </div>

         
        
          </div>

    

    </div>
</div>
     <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">


         

             <label for="TxtMonto" class="control-label col-xs-2  " >N° Cupon</label>
  
              <div class="col-xs-4">  
                  <input id="TxtNCupon" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                   
                   </div>
              <div class="col-xs-6">

                  <button id="btnAddTj" type="button" class="btn2 btn-danger   " onclick="gvTJ()">
    <span class=" glyphicon glyphicon-plus"></span>  Agregar
 </button>
              </div>

            </div>
    </div>
          
</div>

</div>
       
             
             
             
             
               <div class="row"> 

<div class="col-xs-12">
    <div id="ResultadoTj"  style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color:rgb(240, 244, 251) "></div>
        <br />
          <label for="TxtTotal" class="control-label col-xs-5  pull-right" > <strong> TOTAL CON TARJETA: <span id="TxtTotalTj" style="color: red;">0</span> </strong>$</label>

    </div>


</div>

</div>


               </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>
                <!-- Modal CHEQUE-->
  <div class="modal fade" id="ModalCHEQUE" role="dialog" style="display:none"  >
    <div class="modal-dialog" style="width:80%">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">

              <button type="button" class="close" data-dismiss="modal">×</button>
         <div class=" col-xs-6 " style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;"> Pago con cheques</div>
 </div>  
          
        <div class="modal-body">


 
      <div   style="margin-left:20px; margin-right:20px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;    background: rgba(245, 245, 245, 0.51)" >
   
          
          
          <div class="row">
    <div class="col-xs-5">
        <div class="form-horizontal">
        
          <div class="form-group">
     
                   
                <div class="col-xs-5">

 <asp:DropDownList ID="cmbBcos" runat="server" CssClass=" form-control "  >                                          
                                            <asp:ListItem>Banco Provincia</asp:ListItem>
                      <asp:ListItem>Banco Piano</asp:ListItem>
                      <asp:ListItem>Banco Santander Río</asp:ListItem>  
         <asp:ListItem>Banco Nación</asp:ListItem>
                      <asp:ListItem>Banco Itaú</asp:ListItem>
                      <asp:ListItem>Banco Hipotecario</asp:ListItem>
       

                                        </asp:DropDownList>
      </div>     
              
              
                 <div class="col-xs-4">
                    <asp:DropDownList ID="cmbTipoCh" runat="server" CssClass="   form-control " Width="100%"  >                                          
                                            <asp:ListItem>Simple </asp:ListItem>
                      <asp:ListItem>Diferido</asp:ListItem>
                 
       

                                        </asp:DropDownList>
                       </div>
 
         <label for="TxtMonto" class="control-label col-xs-1  " > Días </label>
                  <div class="col-xs-2">    <input id="TxtDias" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                   </div>
    
          </div> 
    </div>
</div> 
     <div class="col-xs-7">
        <div class="form-horizontal">
        
          <div class="form-group">


         <label for="TxtMonto" class="control-label col-xs-2  " >  cheque </label>
                  <div class="col-xs-4">    <input id="TxtChequeNo" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                   </div>

             <label for="TxtMonto" class="control-label col-xs-1  " >Monto</label>  
              <div class="col-xs-3">    
                  <input id="TxtMontoC" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum2(event, this.value)"  value ="0"   class="form-control"/>
                                      </div>               
               <div class="col-xs-2">
 
                       <button id="btnAddCh" type="button" class="btn2 btn-danger   " onclick="gvCheques()" >
    <span class=" glyphicon glyphicon-plus"></span>  
 </button>


             </div>
        
        
         
          </div>

     

    </div>
          
</div>

</div>

            <div class="row">
   
     <div class="col-xs-3         ">
        <div class="form-horizontal">
        
           <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  > FechaEmision</label>
         <div class="col-xs-8"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaEmision" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaEmision"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

          
     </div>
     
    </div>          
</div>
 <div class="col-xs-3">
        <div class="form-horizontal">
        
           <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4" >FechaCobro</label>
         <div class="col-xs-8"> 
     <div class="input-group date" data-provide="datepicker" >
    <asp:TextBox ID="TxtFechaCobro" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup2" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup2" runat="server" TargetControlID="TxtFechaCobro"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

          
     </div>
     
    </div>          
</div>
 <div class="col-xs-3">
        <div class="form-horizontal">
        
           <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4" id="Nac"> FechaVto</label>
         <div class="col-xs-8"> 
     <div class="input-group date" data-provide="datepicker" >
    <asp:TextBox ID="TxtFechaVto" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup3" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="imgPopup3" runat="server" TargetControlID="TxtFechaVto"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

          
     </div>
     
    </div>          
</div>
 <div class="col-xs-3">
        <div class="form-horizontal">
        
        
    </div>
</div> 
 <div class="col-xs-3        ">
        <div class="form-horizontal">
            <input id="hddLibrador" type="hidden" />
           <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >CUITLibrador</label>
         <div class="col-xs-8"> 
   <asp:TextBox ID="TxtCuitLibra" runat="server"  class="form-control"  Width="120px"     onKeyPress="return acceptNum(event)" ></asp:TextBox>
             <script>
                 $("#Main_TxtCuitLibra").blur(function () {
                     try {
                         
                         $.ajax({
                             url: "https://soa.afip.gob.ar/sr-padron/v2/persona/" + $("#Main_TxtCuitLibra").val(),
                             responseType: "json",
                             timeout: 20000,
                             cache: true,
                             success: function (result) {

                                 if (result.data != null) {
                                
                                     $("#hddLibrador").val(result.data.nombre + "\n" + result.data.domicilioFiscal.direccion + " - Cod Postal:" + result.data.domicilioFiscal.codPostal);
                                     alert($("#hddLibrador").val());
 
                                 } else {

                                     alert("Cuit no existente.");
                                 }

                                 $("#btnAddCh").focus();

                             },
                             error: function (jqXHR, textStatus, errorThrown) {
                             }
                         });
                     } catch (e) {

                     }

                 }); 
                 function Cuit() {
                  
                 }

                 
                 </script>
               </div>

          
     </div>
  
    </div>          
</div>
</div>

          
    <div class="row">

      

<div class="col-xs-12">
    <div id="ResultadoCh"  style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color:rgb(240, 244, 251) "></div>
        <br />
          <label for="TxtTotal" class="control-label col-xs-5  pull-right" > <strong> TOTAL CON CHEQUES: <span id="TxtTotalC" style="color: red;">0</span> </strong>$</label>

    </div>


</div>

</div>

               </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>
         <!-- Modal produc-->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


             <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
       <strong> Buscar  Productos </strong> 
            </div>


        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-2"> 
     Buscar  
       </div>
  <div class="col-xs-4" >
    
      
      <select id="cmbTipOpCli" class="form-control">
          <option value="0">Codigo</option>
          <option value="1">Nombre</option>
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscar" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina1" type="button" class="btn2  btn-default "  onclick="Buscar()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>

         </div>

       </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />

</div>




   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  

</div>
              </div>
     </div>

        </div>

     

              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>

   <!-- Modal  cliente -->
  <div class="modal fade" id="ModalC" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


             <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
       <strong> Buscar Cliente </strong> 
            </div>


        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-2"> 
     Buscar  
       </div>
  <div class="col-xs-4" >
    
      
      <select id="cmbTipoOpC" class="form-control">
          <option value="0">CUIT</option>
          <option value="1">N° Documento</option>
         <option value="2">Razón Social</option>
          <option value="3">Apellido</option>
          <option value="4">Ramo</option>

               
      </select>
  
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscarC" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnBuscarC" type="button" class="btn2  btn-default "  onclick="BuscarC()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>

         </div>
       </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField3" runat="server"   />

</div>




   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoC' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  

</div>
              </div>
     </div>

        </div>

     

              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>







       <%-- fin conteiner--%>
        </div>

     


          <!-- Modal  cliente-->
  <div class="modal fade" id="ModalCli" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="background-color: #efefef;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <div class=" col-xs-6 "  style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;"> Clientes</div>
       
             
        </div>
        <div class="modal-body"> 

             <div style="margin-top:0px;text-transform:uppercase;padding:5px"  >
     
         
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOpCli" class="form-control">
          <option value="4">DNI</option>
          <option value="3">CUIT</option>
           <option value="6">Apellido</option>
          <option value="0">Nombre</option>          
          <option value="1">Id</option>
          <option value="2">Cod Manual</option>
           <option value="5">N°Documento</option>
          
           
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscarCli" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina2" type="button" class="btn2  btn-default "  onclick="BuscarCli()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>

         </div>
       </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="Label3" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField4" runat="server"   />

</div> 
   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoCli' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grillaCli'></table>

</div>
              </div>
     </div>

        </div>
              </div>
        
        <div class="modal-footer">
          
          <button type="button" class="btn2 btn-danger" data-dismiss="modal" id="closeCli">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>
  
                 <!-- Modal  cliente Alta-->
   
  <div class="modal fade" id="ModalCliAlta" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"   style="background-color: rgb(241, 241, 241);">
      <div class="row" >
              <div class=" col-xs-6 "    style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;" >
      
       </div>     
         <div class=" col-xs-6 "  >
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
          </div>
        </div>
        <div class="modal-body">  
          <div   style="margin-top:0px;text-transform:uppercase" >
              
      <div id="tabs2" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs2-1"> Datos</a></li>
      <li><a href="#tabs2-2"> Contacto</a></li>
    
      
  </ul>


  <div id="tabs2-1">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
 

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
               <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
 DATOS
         </div>
           
     </div>



    
                 <div class="form-group">

         <label for="TxtNombre" class="control-label col-xs-4">Cod.Manual </label>
         <div class="col-xs-3">
 
             <input id="TxtCodMunualPPPP" type="text" class="form-control"  />
         </div>
   <label for="TxtNombre" class="control-label col-xs-3">Cod.Sistema </label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtCodSistema" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>


           
     </div>
         
           <div class="form-group">
      <div class="col-xs-4">

             <select id="CmbTipoDoc" class="form-control" style="width: 95px;float:right;height: 35px;">
                 <option value="DNI"> DNI </option>
                  <option value="CUIT"> CUIT </option>
                  <option value="LE"> LE </option>
                  <option value="LC"> LC </option>
                   <option value="CDI"> CDI</option>
                 <option value="CIE"> CI Extranjera</option>
                   <option value="Pasaporte"> Pasaporte</option>
                       <option value="Otro"> Otro</option>
             </select>

      </div>
         <div class="col-xs-4">
<asp:TextBox ID="TxtCuit" runat="server"  class="form-control"  Width="120px"     onKeyPress="return acceptNum(event)" ></asp:TextBox>
                 
         </div> <div class="col-xs-4">

      <a id="afip" class="tooltips" style="cursor:pointer ; display:none" href="#"   >        <img src="../../images/afip.jpeg" style="width:88px" />
           <span>Constancia</span></a>
         
         </div>
     </div>
                  <div class="form-group">
         <label for="l" class="control-label col-xs-4">Nombre</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

       <div class="form-group">
         <label for="TxtApe" class="control-label col-xs-4">Apellido</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtApellido" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

<div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >IVA</label>
        <div class="col-xs-8">
              <select id="cmbAfip" class="form-control">
                   <option value="CONSUMIDOR_FINAL">CONSUMIDOR FINAL</option>
          <option value="MONOTRIBUTO">MONOTRIBUTO</option>         
       <option value="EXENTO">EXENTO</option>
       <option value="EXPORTACION">EXPORTACIÓN</option>
                  <option value="RESPONSABLE_INSCRIPTO">RESPONSABLE INSCRIPTO</option>
   <option value="RESPONSABLE_INSCRIPTO_CBU">RESPONSABLE INSCRIPTO CBU</option>
                  <option value="RESPONSABLE_INSCRIPTO_M">RESPONSABLE INSCRIPTO M</option>
      </select>
               </div>
           
     </div>
 
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Observaciones</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtObservacion" runat="server" class="form-control"  TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>

      
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Cuenta contable</label>
         <div class="col-xs-8">

  <select id="cmbCtaContable" class="form-control">
          <option value="Deudores_por_Ventas">Deudores por Ventas</option> 
      </select>
      
         </div>
           
     </div>
      
 
        
        </div>
          </div>
       <div class="col-xs-6">
        <div class="form-horizontal">
                <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
DOMICILIO
         </div>
           
     </div>
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Calle </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtCalle" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Número </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtNum" runat="server" class="form-control"   onKeyPress="return acceptNum(event)" ></asp:TextBox>
      
         </div>

             <label for="TxtNombre" class="control-label col-xs-2">Dpto </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtDpto" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >País</label>
         <div class="col-xs-4">
              <input id="HddPais" type="hidden" />
  <select id="cmbPais" class="form-control">
          
      </select>
      
         </div>

                
             <label for="TxtNombre" class="control-label col-xs-1">CP</label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtCp"  onKeyPress="return acceptNum(event)" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

                 <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Provincia</label>
         <div class="col-xs-8">
              <input id="HddProv" type="hidden" />
  <select id="cmbProv" class="form-control">
          
      </select>
      
         </div>
           
     </div>
      
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Departamento</label>
         <div class="col-xs-8">
             <input id="HddDep" type="hidden" />
  <select id="cmbDepartamento" class="form-control">
          
       
      </select>
      
         </div>
           
     </div>
      
     <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Distrito</label>
         <div class="col-xs-8">
 <input id="HddDis" type="hidden" />
  <select id="cmbDistrito" class="form-control">
          
       
      </select>
      
         </div>
           
     </div>
      
        
        </div>
          </div>
 
</div>
      </div>
   <div id="tabs2-2">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
     <div class="col-xs-6">
        <div class="form-horizontal">
                <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
Contacto
         </div>
           
     </div>
            
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Teléfono</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpTel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Celular</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpCel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">E-mail</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpMail" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

   <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Web</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpWeb" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
   
        <div class="form-group">
         <div id="TxtMsj" class="col-xs-12  alert-danger"></div>
   
           
     </div>
   
      
        </div>
          </div>

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
               <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
 Otro contacto
         </div>
           
     </div>

                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TextBox1" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
           
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Teléfono</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtContacTel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Celular</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtContactCel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">E-mail</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtContacMail" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

    
        
        </div>
          </div>
   
 
</div>
      </div>

    </div>


 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label4" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField5" runat="server"   />
    <div style="display:none">
          <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
    </div>
</div>
        
            <div   style="margin-top:5px; margin-bottom:5px;background-color:#b9b9b9; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
        

       <button id="btnGuardar1aCli" type="button" class="btn2 btn-default " onclick="AltaCliJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>


        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button> 
              <br />
                
               </div> 
</div> 
              </div>
        
      </div>
      
    </div>
   
 </div>
    
    <!-- model articulos -->

     
     <div class="modal fade" id="ModalArt" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
       
        <div class="modal-body"> 
   
            
      <div id="tabsArt" style="">
  <ul>
    <li><a href="#tabs-1"> Datos</a></li>
       <li><a href="#tabs-2"> Rubro / Sub Rubro</a></li> 
       <li><a href="#tabs-3"> Marca / Modelo</a></li> 
      
  </ul>

   

 <div id="tabs-1" style="background-color: #f1f1f1;">
        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-2"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOp" class="form-control">
              <option value="3">CodBarra Proveedor</option>
           <option value="1">CodBarra Sistema</option>      
          <option value="0">Nombre</option>
            <option value="1">Cod Sistema</option>
          <option value="2">Cod Manual</option>
      </select>
      
       
      </div>
    
    <div class="col-xs-4" >
<asp:TextBox ID="TxtBuscarA" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina1R" type="button" class="btn2  btn-default "  onclick="Buscar3()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>

         </div>
       </div> 
</div>
</div>

        </div>
<div id="tabs-2" style="background-color: #f1f1f1;">

        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
     <div class="col-xs-2"  style="text-align:left">
   
   </div> 
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-1"> 
    RUBRO
       </div>
  <div class="col-xs-3" > 
      <select id="cmbRubro" class="cmbBuscar form-control" style="width: 100%"    onchange="pp()">
                <option value="0">- -</option> 
      </select> 
      </div>
   
     
 <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-2"> 
   SUB RUBRO
       </div>
      
     <div class="col-xs-3"  style="text-align:left">
       
          <select id="cmbSubRubro" class="cmbBuscar form-control" style="width: 100%" onchange="BuscarXSubrubro()">
                <option value="0">- -</option> 
      </select>

         </div>
       
   <div class="col-xs-1"  style="text-align:left">
   
   </div> 


   </div> 
</div>
</div>
  
      </div>

<div id="tabs-3" style="background-color: #f1f1f1;">

        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
     <div class="col-xs-2"  style="text-align:left">
   
   </div> 
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-1"> 
    MARCA
       </div>
  <div class="col-xs-3" > 
      <select id="cmbMarca" class="cmbBuscar form-control" style="width: 100%"  onchange="pp2()">
                <option value="0">- -</option> 
      </select> 
      </div>
   
     
 <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-2"> 
   MODELO
       </div>
      
     <div class="col-xs-3"  style="text-align:left">
       
          <select id="cmbModelo" class="cmbBuscar form-control" style="width: 100%" onchange="BuscarXmodelo()">
                <option value="0">- -</option> 
      </select>

         </div>
       
   <div class="col-xs-1"  style="text-align:left">
   
   </div> 


   </div> 
</div>
</div>
  
      </div> 
 
</div>

<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="Label5" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="e" runat="server"   />
    <input id="hddIdArt" type="hidden" />
       <input id="hddIdMod" type="hidden" />
</div> 
  <div class="row" style="background-color: rgb(241, 241, 241);margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoB' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
         
     </div>
           </div>
  </div>

<div class="row" style="    margin-left: 0px;  margin-right: 0px;  padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div class="col-xs-6">
      <div class="form-horizontal">
        
             <div class="form-group" style="color:red; font-weight:800">
         <label for="TxtNombre" class="control-label col-xs-4" ><strong> CANTIDAD</strong></label>
        <div class="col-xs-8"><strong>
            <asp:TextBox ID="txtCant" runat="server" CssClass="form-control" Width="80px" onkeypress="return acceptNum(event)">                
            </asp:TextBox>
            </strong>
               </div>

             
           
     </div>
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Depósito</label>
        <div class="col-xs-8">
              <select id="cmbDep" class="form-control"> 
      </select>
               </div>

             
           
     </div>

           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Lista de Precio</label>
        <div class="col-xs-8">
              <select id="cmbPrecio" class="form-control"> 
      </select>
               </div>

             
           
     </div>
</div>


</div>
 
<div class="col-xs-5"> 

      <div class="form-horizontal">
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-5" >Stock :</label>
        <div class="col-xs-7">
            <asp:TextBox ID="TxtStock" runat="server" CssClass="form-control" style="width: 100px;"></asp:TextBox>
               </div>
           
     </div>    

   <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-5" >Precio Neto $:</label>
        <div class="col-xs-7">
            <asp:TextBox ID="TxtNeto" runat="server" CssClass="form-control" style="width: 100px;"></asp:TextBox>
               </div>
           
     </div>  
 <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-5" >Precio Final $:</label>
        <div class="col-xs-7">
            <asp:TextBox ID="TxtFinal" runat="server" CssClass="form-control" style="width: 100px;"></asp:TextBox>
               </div>
           
     </div>  


</div>
    </div>
    <div class="col-xs-1"> 


  <div class="form-horizontal">
          <div class="form-group">
      
        <div class="col-xs-12">
          
       
               </div>
           
     </div>    

   <div class="form-group">
        
        <div class="col-xs-12">
            <button id="BtnDep" type="button" class="btn2  btn-info  " onclick="AddArt()">
    <span class=" glyphicon glyphicon-ok"></span> 
 </button>
               </div>
           
     </div>  
 <div class="form-group">
        
        <div class="col-xs-12">
              <button id="BtnDep2" type="button" class="btn2  btn-danger  " data-dismiss="modal">
    <span class=" glyphicon glyphicon-remove"></span> 
 </button>
               
         
        
        </div>
           
     </div>  


</div>

    </div>
</div>


 

   

    </div>


 
        
<div class="row">
  
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label6" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField6" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtRpid" runat="server"></asp:TextBox>
    </div>
</div>
        
   
</div> 
              </div>
        
      </div>
      
    <script>

     
     

        // barcod

        $("#Main_TxtBuscarA").on("keydown", function (event) {
            if (event.which == 13) {
                Buscar3();
                $("#Main_TxtBuscarA").val('');
            }
        });
        ////

        var v_pro = '';
        $("#Main_TxtFecha").prop('disabled', true);
        $("#Main_TxtCodSistema").prop('disabled', true);
        $("#Main_TxtClienteNombre").prop('disabled', true);
        $("#Main_TxtDoc").prop('disabled', true);
        $("#Main_TxtTel").prop('disabled', true);

        // conficion de vta
        $("#TxtPagoEfetivoEnt").prop('disabled', true);
        $("#TxtPagoBcoEnt").prop('disabled', true);
        $("#TxTjTotal").prop('disabled', true);
        $("#TxtChTotal").prop('disabled', true);


        function fecha() {
            var hoy = new Date();
            var hoy = new Date();
            var dd = hoy.getDate();
            var mm = hoy.getMonth() + 1; //hoy es 0!
            var yyyy = hoy.getFullYear();

            if (dd < 10) {
                dd = '0' + dd
            }

            if (mm < 10) {
                mm = '0' + mm
            }

            hoy = dd + '/' + mm + '/' + yyyy;
            $("#Main_TxtFecha").val(hoy);


        }

        fecha();
        function fn_cantidad() {
            cantidad = $("#grilla tbody").find("tr").length;
            $("#span_cantidad").html(cantidad);
        };
        $(document).ajaxStart(function () {
            $(".spinner-wrapper").css("display", "block");
            $(".loader").css("display", "block");
        });
        $(document).ajaxComplete(function () {
            $(".spinner-wrapper").css("display", "none");
            $(".loader").css("display", "none");

        });
        $(function () {
            $('#tabs').tabs();
            $('#tabs2').tabs();
            $('#tabsArt').tabs();
            $(".cmbBuscar").select2();
            $("#TxtPagoEfetivo").keyup(function () {
                
                $("#TxtPagoEfetivoEnt").val($("#TxtPagoEfetivo").val());

                calcular();

            });
            $("#TxtPagoBco").keyup(function () {
                $("#TxtPagoBcoEnt").val( $("#TxtPagoBco").val());
                calcular();
            });
             
 
        });

        function calcular() {
           
            var totalP = parseFloat($("#TxtPagoEfetivoEnt").val()) + parseFloat($("#TxtPagoBcoEnt").val()) + parseFloat($("#TxTjTotal").val()) + parseFloat($("#TxtChTotal").val());
            var totalF = parseFloat($("#IdTotal").text()) -totalP;
            

            if ($("#IdTotal").text() == '0')
            {
                alert('Debe ingresar Articulos a facturar.');
            }
            if (totalF > 0) {
                
                $("#lblSaldo").text(parseFloat(totalF).toFixed(2));
                $("#lblCambio").text('00.00');
            }
            if (totalF < 0) {
                totalF = totalP - parseFloat($("#IdTotal").text());
                
                $("#lblCambio").text(parseFloat(totalF).toFixed(2));
                $("#lblSaldo").text('00.00');
            }
            if (totalF == 0) {                
                $("#lblCambio").text('00.00');
                $("#lblSaldo").text('00.00');
            }

        }

        function VerCli() {
            //  PopMk();

            $("#ModalCli").modal();

        }
        function CliNuevo() {
            ListarPais();
            $("#ModalCliAlta").modal();

        }
        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }
        function BuscarCli() {

            try {
                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": $('#cmbTipoOpCli').val(),
                      "v_valor": $('#Main_TxtBuscarCli').val()

                  });
                $.ajax({
                    type: "POST",
                    url: "Clientes.aspx/WsListar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoCli,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        var tableM = document.getElementById("grillaCli");
        function llenarArt(obj) {
            try {

                // select la fila
                if ($(obj).hasClass('active')) {
                    $(obj).removeClass('active');
                } else {
                    $(obj).addClass('active').siblings().removeClass('active');
                }

                tableM = document.getElementById("grillaCli");


                if (tableM != null) {
                    for (var i = 1; i < tableM.rows.length; i++) {

                        if ($(tableM.rows[i]).hasClass('active')) {


                            $("#Main_TxtClienteNombre").val($(tableM.rows[i]).find('td:eq(3)').text());
                            $("#Main_TxtTel").val($(tableM.rows[i]).find('td:eq(6)').text() + '- ' + $(tableM.rows[i]).find('td:eq(6)').text());
                            $("#hddIdCli").val($(tableM.rows[i]).find('td:eq(1)').text());
                            $("#Main_TxtDoc").val($(tableM.rows[i]).find('td:eq(5)').text());
                            $("#TxtTipoDoc").text($(tableM.rows[i]).find('td:eq(4)').text());
                            

                        };
                    }
                }


                $("#ModalCli").modal('hide');

            } catch (e) {
                alert(e.message + '-2');
            }

        }
        function resultadoCli(Resultado) {
            var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#ResultadoCli").show();
            $("#ResultadoCli").empty();
            Tabla_Titulo = "<table   id='grillaCli' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Id</th> <th>Manual</th><th>Nombre</th><th>TipoDoc</th><th>N°Doc</th><th>Tel</th><th>Cel</th><th>Dirección</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {
                var nomb2 = pacientes.Nombre.concat(pacientes.Apellido);
                Tabla_Datos = Tabla_Datos + "<tr onclick='llenarArt(this)' style='cursor:pointer;'> <td style='background-image:url(/images/seleccionar-objeto.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + ' ' + pacientes.Apellido + "</td><td>" + pacientes.Tipo_Doc + "</td><td>" + pacientes.Doc_No + "</td><td>" + pacientes.Emp_Tel + "</td><td>" + pacientes.Emp_Cel + "</td><td>" + pacientes.Calle + ' N° ' + pacientes.Numero + "</td></tr>";
            });

            Tabla_Fin = "</tbody></table>";
            $("#ResultadoCli").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();

        }

        function AltaCliJs() {
            try {

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                    // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                    "v_obj": {

                        "Id": '0',
                        "Cod_Manual": $("#Main_TxtCodMunual").val(),
                        "Tipo_Doc": $("#CmbTipoDoc").val(),
                        "Doc_No": $("#Main_TxtCuit").val(),
                        "Iva": $("#cmbAfip").val(),
                        "Nombre": $("#Main_TxtNombre").val(),
                        "Apellido": $("#Main_TxtApellido").val(),
                        "Observacion": $("#Main_TxtObservacion").val(),
                        "Cta_contable": $("#cmbCtaContable").val(),
                        "Calle": $("#Main_TxtCalle").val(),
                        "Numero": $("#Main_TxtNum").val(),
                        "Dpto": $("#Main_TxtDpto").val(),
                        "Pais": $("#cmbPais").val(),
                        "Cp": $("#Main_TxtCp").val(),
                        "Provincia": $("#cmbProv").val(),
                        "Departamento": $("#cmbDepartamento").val(),
                        "Distrito": $("#cmbDistrito").val(),


                        "Contac_Nomb": $("#Main_TxtContactoNom").val(),
                        "Contac_Tel": $("#Main_TxtContacTel").val(),
                        "Contac_Cel": $("#Main_TxtContactCel").val(),
                        "Contac_Mail": $("#Main_TxtContacMail").val(),
                        "Emp_Tel": $("#Main_TxtEmpTel").val(),
                        "Emp_Cel": $("#Main_TxtEmpCel").val(),
                        "Emp_Mail": $("#Main_TxtEmpMail").val(),
                        "Emp_Web": $("#Main_TxtEmpWeb").val()

                    }
                });

                $.ajax({
                    type: "POST",
                    url: "Ordenes_Servicios.aspx/WmAlta2Cli",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Modificado_Completo,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function Modificado_Completo(Resultado) {
            if (Resultado.d != '1') {

                var Ids = Resultado;
                var Ids2 = 0;
                $.each(Ids, function (index, ids) {
                    Ids2 = ids;
                });
                $("#Main_TxtClienteNombre").val($("#Main_TxtNombre").val() + ' ' + $("#Main_TxtApellido").val());
                $("#Main_TxtTel").val($("#Main_TxtEmpTel").val() + '- ' + $("#Main_TxtEmpCel").val());

                $("#hddIdCli").val(Ids2);

                $("#Main_TxtDoc").val($("#Main_TxtCuit").val());
                $("#ModalCliAlta").modal('hide');
                limpiarCli();
            } else {
                limpiarCli();
                alert('El N°Doc ya existe en la base de datos de Clientes.');
            }
        }


        function ListarPais() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Proveedores.aspx/WsListarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: CargarPais,
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        function CargarPais(Resultado) {

            var Especialidad = Resultado.d;

            $('#cmbPais').empty();

            $('#cmbPais').append('<option value="0">- -</option>');

            $.each(Especialidad, function (index, especialidades) {
                $('#cmbPais').append(
                      $('<option></option>').val(especialidades.Id).html(especialidades.nombre)
                    );
            });


            //select un item  para select2
            //   $("#cmbPais").val(0).change();


        }

        function ListarProvincia(ids, sel) {
            try {

                var json = JSON.stringify
          ({

              "v_valor": ids
          });

                $.ajax({
                    type: "POST",
                    url: "Proveedores.aspx/WsListarProvincia",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: CargarProv,
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        function CargarProv(Resultado) {

            var Especialidad = Resultado.d;

            $('#cmbProv').empty();

            $('#cmbProv').append('<option value="0">- -</option>');


            $.each(Especialidad, function (index, especialidades) {
                if ($("#HddProv").val() == especialidades.Id) {


                    $('#cmbProv').append(
                         $('<option  selected></option>').val(especialidades.Id).html(especialidades.Provincia)
                       );
                } else {
                    $('#cmbProv').append(
                      $('<option></option>').val(especialidades.Id).html(especialidades.Provincia)
                    );
                }
            });


            //select un item  para select2
            //  $("#cmbProv").val(1).change();
        }

        function ListarDepartamento(ids) {
            


            try {

                var json = JSON.stringify
          ({

              "v_valor": ids
          });

                $.ajax({
                    type: "POST",
                    url: "Proveedores.aspx/WsListarDepartamento",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: CargarDepa,
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        function CargarDepa(Resultado) {

            var Especialidad = Resultado.d;

            $('#cmbDepartamento').empty();

            $('#cmbDepartamento').append('<option value="0">- -</option>');

            $.each(Especialidad, function (index, especialidades) {
                if ($("#HddDep").val() == especialidades.Id) {
                   
                    $('#cmbDepartamento').append(
                          $('<option selected></option>').val(especialidades.Id).html(especialidades.NombreDepartamento)
                        );
                } else {
                    $('#cmbDepartamento').append(
                         $('<option></option>').val(especialidades.Id).html(especialidades.NombreDepartamento)
                       );
                }

            });


            //select un item  para select2
            //  $("#cmbDepartamento").val(1).change();
        }

        function ListarDistrito(ids) {

            try {

                var json = JSON.stringify
          ({

              "v_valor": ids
          });

                $.ajax({
                    type: "POST",
                    url: "Proveedores.aspx/WsListarDistrito",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: CargarDist,
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        function CargarDist(Resultado) {



            var Especialidad = Resultado.d;

            $('#cmbDistrito').empty();

            $('#cmbDistrito').append('<option value="0">- -</option>');


            $.each(Especialidad, function (index, especialidades) {
                if ($("#HddDis").val() == especialidades.Id) {
                    $('#cmbDistrito').append(
                          $('<option selected></option>').val(especialidades.Id).html(especialidades.NombreDistrito)
                        );
                } else {

                    $('#cmbDistrito').append(
                        $('<option></option>').val(especialidades.Id).html(especialidades.NombreDistrito)
                      );
                }
            });


            //select un item  para select2
            //  $("#cmbDistrito").val(1).change();
        }
        function validarEmail(valor) {
            if (valor != '') {
                if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(valor)) {
                    $("#TxtMsj").text('');
                } else {
                    $("#TxtMsj").text("La dirección de email es incorrecta!.");
                }
            }

        }



        function limpiarCli() {

            $("#tabs2").tabs({ active: 0 });

            $("#HddProv").val('');
            $("#HddDep").val('');
            $("#HddDis").val('');
            $("#Main_TxtContactoNom").val('');
            $("#Main_TxtContacTel").val('');
            $("#Main_TxtContactCel").val('');
            $("#Main_TxtContacMail").val('');
            $("#Main_TxtEmpTel").val('');
            $("#Main_TxtEmpCel").val('');
            $("#Main_TxtEmpMail").val('');
            $("#Main_TxtEmpWeb").val('');

            $('#Main_TxtCodMunual').val('');
            $('#Main_TxtCodSistema').val('0');
            $('#Main_TxtObservacion').val('');
            $('#Main_TxtCuit').val('');

            $('#Main_TxtNombre').val('');
            $('#Main_TxtApellido').val('');
            $('#Main_TxtCalle').val('');
            $('#Main_TxtNum').val('');
            $('#Main_TxtDpto').val('');
            $('#Main_TxtCp').val('');




            $("#cmbPais").attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
            $("#cmbProv").empty();
            $('#cmbDepartamento').empty();
            $('#cmbDistrito').empty();
            $('#cmbAfip').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
            $('#cmbTipo').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");

        }
        function Cuit() {



            if ($("#cuit").val() == '') { alert('Campo Vacio'); } else {
                var doc = '0';
                if ($("#CmbTipoDoc").val() == 'DNI') {
                    $.ajax({
                        url: "https://soa.afip.gob.ar/sr-padron/v2/personas/" + $("#Main_TxtCuit").val(),
                        responseType: "json",
                        timeout: 20000,
                        cache: true,
                        success: function (result) {

                            if (result.data != null) {
                                $('#afip').hide();
                                ver_cuit(result.data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        }
                    });

                }

                if ($("#CmbTipoDoc").val() == 'CUIT') {

                    ver_cuit($("#Main_TxtCuit").val());
                    $('#afip').show();
                    $('#afip').prop('href', 'https://soa.afip.gob.ar/sr-padron/v1/constancia/' + $("#Main_TxtCuit").val());

                } else {
                    $('#afip').hide();
                }

            }
            function ver_cuit(v_cuit) {
                try {
                    $.ajax({
                        url: "https://soa.afip.gob.ar/sr-padron/v2/persona/" + v_cuit,
                        responseType: "json",
                        timeout: 20000,
                        cache: true,
                        success: function (result) {

                            if (result.data != null) {

                                // alert(result.data.nombre + "\n" + result.data.domicilioFiscal.direccion + " - Cod Postal:" + result.data.domicilioFiscal.codPostal);

                                $("#cmbAfip").val("CONSUMIDOR_FINAL");
                                var ape = result.data.nombre.substr(0, result.data.nombre.indexOf(' '));
                                var nom = result.data.nombre.substr(result.data.nombre.indexOf(' ') + 1);
                                $("#Main_TxtNombre").val(nom);
                                $("#Main_TxtApellido").val(ape);
                                var calle = result.data.domicilioFiscal.direccion.substr(0, result.data.domicilioFiscal.direccion.indexOf(' '));
                                var nume = result.data.domicilioFiscal.direccion.substr(result.data.domicilioFiscal.direccion.indexOf(' ') + 1);
                                $("#Main_TxtCalle").val(calle);
                                $("#Main_TxtNum").val(nume);


                                $("#Main_TxtCp").val(result.data.domicilioFiscal.codPostal);

                                if (result.data.domicilioFiscal.idProvincia == 1) {
                                }
                                if (result.data.categoriasMonotributo != null) {
                                    $("#cmbAfip").val("MONOTRIBUTO");
                                }

                                if (result.data.idCatAutonomo != null) {
                                    $("#cmbAfip").val("RESPONSABLE INSCRIPTO");
                                }



                            } else {
                                $('#afip').prop('href', '#');

                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        }
                    });
                } catch (e) {

                }
            }

        }
        $("#Main_TxtCuit").blur(function () {
            Cuit();
        });

        $("#Main_TxtContacMail").blur(function () {
            validarEmail($("#Main_TxtContacMail").val());
        });

        $("#Main_TxtEmpMail").blur(function () {
            validarEmail($("#Main_TxtEmpMail").val());
        });


        $("#cmbPais").change(function () {
            ListarProvincia($("#cmbPais").val());
            $("#cmbDepartamento").val(0).change();
            $("#cmbDistrito").val(0).change();

        })

        $("#cmbProv").change(function () {
            
            ListarDepartamento($("#cmbProv").val());
            $("#cmbDistrito").val(0).change();
        })

        $("#cmbDepartamento").change(function () {
            ListarDistrito($("#cmbDepartamento").val());
        })



        ////////////// articulos
        $("#Main_TxtStock").prop('disabled', true);
        $("#Main_TxtNeto").prop('disabled', true);
        $("#Main_TxtFinal").prop('disabled', true);
        function VerProv() {
            $("#ModalArt").modal();
            limpiarArt();

        }
         
        
          function VerTJ() {
              $("#ModalTJ").modal();
              
          }

          function limpiarArt() {
              $("#tabsArt").tabs({ active: 0 });
              document.getElementById("cmbDep").selectedIndex = "0";
              document.getElementById("cmbPrecio").selectedIndex = "0";
            $("#Main_txtCant").val('1');
            $("#hddIdArt").val('0');
            $("#Main_TxtStock").val('');
            $("#Main_TxtNeto").val('');
            $("#Main_TxtFinal").val('');
            $("#cmbPrecio").val('1');
            $("#ResultadoB").show();
            $("#ResultadoB").empty();

            var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                     ({

                     });

            $.ajax({
                type: "POST",
                url: "Contra_Orden.aspx/WsLimpArt",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: '',
                error: errores
            });
        }

        $("#Main_txtCant").val('1');



        function AddArtOS() {
            
                    try {

                        var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({ 
                          });

                        $.ajax({
                            type: "POST",
                            url: "Contra_Orden.aspx/WsAddArticuloSO",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Resultado) {

                                var Pacientes = Resultado.d;
                                var Tabla_Titulo = "";
                                var Tabla_Datos = "";
                                var Tabla_Fin = "";

                                $("#ResultadoProv").show();
                                $("#ResultadoProv").empty();
                                Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th>Cod_Sis</th><th>Cod_Man</th><th>Descripción</th><th>Cantidad</th><th>Alic</th><th>Precio $</th><th>Sub Total $</th></tr></thead><tbody>";

                                var sal2 = parseFloat("00.00");
                                var sal;
                                $.each(Pacientes, function (index, pacientes) {
                                    sal = parseFloat((parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * parseFloat(pacientes.Cant)));

                                    Tabla_Datos = Tabla_Datos + "<tr   style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Cant + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + "</td></td></tr>";
                                    sal2 = sal + sal2;
                               


                                    $("#Main_TxtClienteNombre").val(pacientes.ClienteSelect.Nombre + ' ' + pacientes.ClienteSelect.Apellido);
                                    $("#Main_TxtTel").val(pacientes.ClienteSelect.Emp_Tel + ' ' + pacientes.ClienteSelect.Emp_Cel);
                                    $("#hddIdCli").val(pacientes.ClienteSelect.Id);
                                    $("#Main_TxtDoc").val(pacientes.ClienteSelect.Doc_No);
                                    $("#TxtTipoDoc").text(pacientes.ClienteSelect.Tipo_Doc);


                                    $("#cmbTipoVta").val("2");


                                });
                               

                                $("#IdTotal").text(parseFloat(sal2).toFixed(2));
                                $("#lblSaldo").text(parseFloat(sal2).toFixed(2));

                                Tabla_Fin = "</tbody></table>";
                                $("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                                
                            }),
                            error: errores
                        });

                    } catch (e) {
                        alert(e.message);
                    }
            
        }
        function AddArt() {
            if ($("#hddIdArt").val() != '0') {
                if ($("#Main_txtCant").val() != '0') {

                    try {

                        var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "v_id": $("#hddIdArt").val(),
                              "v_cant": $("#Main_txtCant").val(),
                              "v_deposito": $("#cmbDep").val(),
                              "v_lista": $("#cmbPrecio").val()
                          });

                        $.ajax({
                            type: "POST",
                            url: "Contra_Orden.aspx/WsAddArticulo",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Resultado) {

                                var Pacientes = Resultado.d;
                                var Tabla_Titulo = "";
                                var Tabla_Datos = "";
                                var Tabla_Fin = "";

                                $("#ResultadoProv").show();
                                $("#ResultadoProv").empty();
                                Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th>Cod_Sis</th><th>Cod_Man</th><th>Descripción</th><th>Cantidad</th><th>Alic</th><th>Precio $</th><th>Sub Total $</th></tr></thead><tbody>";

                                var sal2 = parseFloat("00.00");
                                var sal;
                                $.each(Pacientes, function (index, pacientes) {
                                    sal = parseFloat((parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * parseFloat(pacientes.Cant)));

                                    Tabla_Datos = Tabla_Datos + "<tr   style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Cant + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + "</td></td></tr>";
                                    sal2 = sal + sal2;

                                });


                                $("#IdTotal").text(parseFloat(sal2).toFixed(2));
                                $("#lblSaldo").text(parseFloat(sal2).toFixed(2));

                                Tabla_Fin = "</tbody></table>";
                                $("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                                $("#ModalArt").modal('hide');
                            }),
                            error: errores
                        });

                    } catch (e) {
                        alert(e.message);
                    }
                }
            }
        }
        function ListaPrecios() {

            // LISTA de precio del usuario 1  

            try {
                var json = JSON.stringify
                  ({
                      "v_id": '1'
                  });
                $.ajax({
                    type: "POST",
                    url: "Articulo.aspx/WsListarPrecios",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        if (result.d != null) {
                            var Pacientes = result.d;

                            $('#cmbPrecio').empty();

                            $('#cmbPrecio').append(
                                      $('<option></option>').val('1').html('Lista1 -' + Pacientes.l1_desc)
                                    );
                            $('#cmbPrecio').append(
                                   $('<option></option>').val('2').html('Lista2 -' + Pacientes.l2_desc)
                                 );
                            $('#cmbPrecio').append(
                                   $('<option></option>').val('3').html('Lista3 -' + Pacientes.l3_desc)
                                 );
                            $('#cmbPrecio').append(
                                   $('<option></option>').val('4').html('Lista4 -' + Pacientes.l4_desc)
                                 );

                            $('#cmbPrecio').append(
                                   $('<option></option>').val('5').html('Lista5 -' + Pacientes.l5_desc)
                                 );



                        }
                    },
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function ListarDeposito() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Deposito.aspx/WsListar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: CargarDep,
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        function CargarDep(Resultado) {

            var Especialidad = Resultado.d;

            $('#cmbDep').empty();


            $.each(Especialidad, function (index, especialidades) {
                $('#cmbDep').append(
                      $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                    );
            });


        }

        function Buscar3() {

            try {


                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": $('#cmbTipoOp').val(),
                      "v_valor": $('#Main_TxtBuscarA').val()

                  });
                $.ajax({
                    type: "POST",
                    url: "Contra_Orden.aspx/WsListarArticulo",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoArt,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function resultadoArt(Resultado) {
            var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#ResultadoB").show();
            $("#ResultadoB").empty();
            Tabla_Titulo = "<table   id='grillaArt' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Cod_Sis</th><th>Cod_Man</th><th>Descripción</th><th>Alic</th><th>P.Vta1</th><th>P.Vta2</th><th>P.Vta3</th><th>P.Vta4</th><th>P.Vta5</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {
                Tabla_Datos = Tabla_Datos + "<tr    onclick='RowArt2(this," + pacientes.Id + ");' style='cursor:pointer;'> <td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.P_FinalL1.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL2.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL3.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL4.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL5.replace(',', '.')).toFixed(2) + "</td></tr>";
            });

            Tabla_Fin = "</tbody></table>";
            $("#ResultadoB").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

        }


        $("#cmbDep").change(function () {

            RowArt2("", $("#hddIdArt").val());
        });

        $("#cmbPrecio").change(function () {

            RowArt2("", $("#hddIdArt").val());
        });

        function RowArt2(obj, ids) {
            $("#ResultadoDep").show();
            $("#ResultadoDep").empty();
            if (obj != "") {
                if ($(obj).hasClass('active')) {
                    $(obj).removeClass('active');
                } else {
                    $(obj).addClass('active').siblings().removeClass('active');
                }
            }
            $("#hddIdArt").val(ids);
            var json = JSON.stringify
({

    "v_valor": ids

});

            $.ajax({
                type: "POST",
                url: "Contra_Orden.aspx/WsListarDep_IdArt",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                    if (result.d != null) {
                        $("#Main_TxtStock").val('0');
                        var Pacientes = result.d.Depositos;
                        $.each(Pacientes, function (index, pacientes) {

                            if (pacientes.id_deposito == $("#cmbDep").val()) {

                                $("#Main_TxtStock").val(pacientes.stock);


                            }

                        });

                        if ("1" == $("#cmbPrecio").val()) {
                            $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL1.replace(',', '.')).toFixed(2));
                            $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL1.replace(',', '.')).toFixed(2));

                             
                        }
                        if ("2" == $("#cmbPrecio").val()) {
                            $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL2.replace(',', '.')).toFixed(2));
                            $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL2.replace(',', '.')).toFixed(2));
                        }
                        if ("3" == $("#cmbPrecio").val()) {
                            $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL3.replace(',', '.')).toFixed(2));
                            $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL3.replace(',', '.')).toFixed(2));
                        }
                        if ("4" == $("#cmbPrecio").val()) {
                            $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL4.replace(',', '.')).toFixed(2));
                            $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL4.replace(',', '.')).toFixed(2));
                        }
                        if ("5" == $("#cmbPrecio").val()) {
                            $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL5.replace(',', '.')).toFixed(2));
                            $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL5.replace(',', '.')).toFixed(2));
                        }



                    }
                },

                error: errores
            });

        }

        function gvChDel(ids) {
            try { 
                var json = JSON.stringify
                  ({
                      "v_id": ids
                  });
                $.ajax({
                    type: "POST",
                    url: "Cbtes.aspx/gvCh_del",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Resultado) {
                   
                        var Pacientes = Resultado.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";

                        var sal2 = parseFloat("00.00");
                        var sal;

                        $("#ResultadoCh").show();
                        $("#ResultadoCh").empty();
                        Tabla_Titulo = "<table    class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Banco</th><th>Tipo</th><th>Dias</th><th>Cheque</th><th>Monto</th></tr></thead><tbody>";
                        $.each(Pacientes, function (index, pacientes) {
                            sal = parseFloat((parseFloat(pacientes.monto.replace(',', '.')).toFixed(2) ));
                            Tabla_Datos = Tabla_Datos + "<tr style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvChDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.banco + "</td><td>" + pacientes.tipo + "</td><td>" + pacientes.Dias + "</td><td>" + pacientes.cheque_no + "</td><td>" + pacientes.monto + "</td></tr>";
                            sal2 = sal + sal2;

                        });
                        $("#TxtTotalC").text(parseFloat(sal2).toFixed(2));
                        $("#TxtChTotal").val(parseFloat(sal2).toFixed(2));
                        

                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoCh").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                        limpiarCh();




                    },
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function gvTJDel(ids) {
            try {
                var json = JSON.stringify
                  ({
                      "v_id": ids
                  });
                $.ajax({
                    type: "POST",
                    url: "Cbtes.aspx/gvTJ_del",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Resultado) {

                        var Pacientes = Resultado.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";

                        var sal2 = parseFloat("00.00");
                        var sal;

                        $("#ResultadoTj").show();
                        $("#ResultadoTj").empty();
                        Tabla_Titulo = "<table    class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Tarjeta</th><th>Num</th><th>N°Cupon</th><th>Cuotas</th><th>Importe</th></tr></thead><tbody>";
                        $.each(Pacientes, function (index, pacientes) {
                            sal = parseFloat((parseFloat(pacientes.Monto.replace(',', '.')).toFixed(2)));
                            Tabla_Datos = Tabla_Datos + "<tr style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvTJDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Tarjeta + "</td><td>" + pacientes.Tarjeta_No + "</td><td>" + pacientes.Cupon_No + "</td><td>" + pacientes.Cuotas + "</td><td>" + pacientes.Monto + "</td></tr>";
                            sal2 = sal + sal2;

                        });
                        $("#TxtTotalTj").text(parseFloat(sal2).toFixed(2));
                        $("#TxTjTotal").val(parseFloat(sal2).toFixed(2));


                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoTj").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                        limpiarTJ();




                    },
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }
        function gvProDel(ids) {
            try {



                var json = JSON.stringify
                  ({
                      "v_id": ids
                  });
                $.ajax({
                    type: "POST",
                    url: "Contra_Orden.aspx/gvArt_del",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Resultado) {
                        var Pacientes = Resultado.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";

                        $("#ResultadoProv").show();
                        $("#ResultadoProv").empty();
                        Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th>Cod_Sis</th><th>Cod_Man</th><th>Descripción</th><th>Cantidad</th><th>Alic</th><th>Precio $</th><th>Sub Total $</th></tr></thead><tbody>";

                        var sal2 = parseFloat("00.00");
                        var sal;
                        $.each(Pacientes, function (index, pacientes) {
                            sal = parseFloat((parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * parseFloat(pacientes.Cant)));

                            Tabla_Datos = Tabla_Datos + "<tr   style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Cant + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + "</td></td></tr>";
                            sal2 = sal + sal2;

                        });

                        $("#IdTotal").text(sal2);
                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                    },
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }



        ListarDeposito();
        ListaPrecios();
        // COndicion de venta


        function VerCondicion() {

            if ($("#condicion").css('display') == 'none') {
                $("#condicion").show();

                $('html, body').animate({

                    scrollTop: $("#condicion2").offset().top - 100

                }, 500);

            } else {
                $("#condicion").hide();
            }

        }
       
        function verC() {
            $("#ModalCHEQUE").modal();
        }
        function limpiarCh() {
                 $("#TxtChequeNo").val('0');
 
                            $("#TxtMontoC").val('0');                            
                            $("#TxtDias").val('0');
            //     $("#TxtTotalC").text('0');
                            calcular();
        }

        function limpiarTJ() {
            $("#TxtNumTJ").val('0');
            $("#TxtNCupon").val('0');
            $("#TxtCuotaT").val('0');
            $("#TxtMontoT").val('0');
          //  $("#TxtTotalTj").text('0');
            calcular();
        }
        //$("#Main_TxtFechaEmision").prop('disabled', true);
        //$("#Main_TxtFechaCobro").prop('disabled', true);
        //$("#Main_TxtFechaVto").prop('disabled', true);
        function gvCheques() {

            if ($("#TxtMontoC").val() != "0") {


                try {

                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {
                            "Id": '0',
                            "cheque_no": $("#TxtChequeNo").val(),
                            "banco": $("#Main_cmbBcos").val(),
                            "tipo": $("#Main_cmbTipoCh").val(),
                            "monto": $("#TxtMontoC").val(),
                            "id_cbte": '0',
                            "Dias": $("#TxtDias").val(),
                            "Librador": $("#hddLibrador").val(),
                            "CodCliente": $("#hddIdCli").val(),
                            "FechaEmision": $("#Main_TxtFechaEmision").val(),
                            "FechaCobro": $("#Main_TxtFechaCobro").val(),
                            "FechaVto": $("#Main_TxtFechaVto").val(),
                            "CUITLibrador": $("#Main_TxtCuitLibra").val()

                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Cbtes.aspx/WmAddCheque",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Resultado) {
                            var Pacientes = Resultado.d;
                            var Tabla_Titulo = "";
                            var Tabla_Datos = "";
                            var Tabla_Fin = "";

                            var sal2 = parseFloat("00.00");
                            var sal;

                            $("#ResultadoCh").show();
                            $("#ResultadoCh").empty();
                            Tabla_Titulo = "<table    class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Banco</th><th>Tipo</th><th>Dias</th><th>Cheque</th><th>Importe</th></tr></thead><tbody>";
                            $.each(Pacientes, function (index, pacientes) {
                                sal = parseFloat((parseFloat(pacientes.monto.replace(',', '.')).toFixed(2)));
                                Tabla_Datos = Tabla_Datos + "<tr style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvChDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.banco + "</td><td>" + pacientes.tipo + "</td><td>" + pacientes.Dias + "</td><td>" + pacientes.cheque_no + "</td><td>" + pacientes.monto + "</td></tr>";
                                sal2 = sal + sal2;

                            });
                            $("#TxtTotalC").text(parseFloat(sal2).toFixed(2));
                            $("#TxtChTotal").val(parseFloat(sal2).toFixed(2));
                            Tabla_Fin = "</tbody></table>";
                            $("#ResultadoCh").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                            limpiarCh();

                        }),
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }




            }
        }


        
        function gvTJ() {
            try {

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                    // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                    "v_obj": {
                        "Id": '0',
                        "Tarjeta": $("#Main_CmbTarjetas").val(),
                        "Tarjeta_No": $("#TxtNumTJ").val(),
                        "Cuotas": $("#TxtCuotaT").val(),
                        "Cupon_No": $("#TxtNCupon").val(),
                        "id_cbte": '0',
                        "Monto": $("#TxtMontoT").val()

                    }
                });

                $.ajax({
                    type: "POST",
                    url: "Cbtes.aspx/WmAddTJ",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Pacientes = Resultado.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";

                        var sal2 = parseFloat("00.00");
                        var sal;

                        $("#ResultadoTj").show();
                        $("#ResultadoTj").empty();
                        Tabla_Titulo = "<table   class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Tarjeta</th><th>Num</th><th>N°Cupon</th><th>Cuotas</th><th>Importe</th></tr></thead><tbody>";
                        $.each(Pacientes, function (index, pacientes) {
                            sal = parseFloat((parseFloat(pacientes.Monto.replace(',', '.')).toFixed(2)));
                            Tabla_Datos = Tabla_Datos + "<tr style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvTJDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Tarjeta + "</td><td>" + pacientes.Tarjeta_No + "</td><td>" + pacientes.Cupon_No + "</td><td>" + pacientes.Cuotas + "</td><td>" + pacientes.Monto + "</td></tr>";
                            sal2 = sal + sal2;

                        });
                        $("#TxtTotalTj").text(parseFloat(sal2).toFixed(2));
                        $("#TxTjTotal").val(parseFloat(sal2).toFixed(2));


                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoTj").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                        limpiarTJ();


                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }


  

        function AltaFact() {
            try {

            
            var v_tipo = $("#TxtTipoDoc").text();
            if (v_tipo == 'CUIT') {
                v_tipo= '80';
            }
            if (v_tipo == 'CDI') {
                v_tipo = '87';
            }
            if (v_tipo == 'LE') {
                v_tipo = '89';
            }
            if (v_tipo == 'LC') {
                v_tipo = '90';
            }
            if (v_tipo == 'DNI') {
                v_tipo = '96';
            }
            if (v_tipo == 'Otro') {
                v_tipo = '99';
            }

            if (v_tipo == 'Pasaporte') {
                v_tipo = '94';
            }
            if (v_tipo == 'CIE') {
                v_tipo = '91';
            }
            
       
            if ($("#IdTotal").text() != "0") {

                  if ($("#lblSaldo").text() == "00.00") {
                    if ($("#hddIdCli").val() != "") {
                        if ($("#Main_TxtDoc").val() != "") {
                        try {

                            var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                            ({
                                // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                                "v_obj": {

                                    "Id": '0',
                                    "CbteTipo": $("#cmbTipoCbate").val(),
                                    "Concepto": $("#cmbTipoVta").val(),
                                    "Vendedor": $("#cmbVendedor").val(),
                                    "Cliente": $("#hddIdCli").val(),
                                    "Fecha": $("#Main_TxtFecha").val(),
                                    
                                    "DocTipo": v_tipo,
                                    "DocNro": $("#Main_TxtDoc").val(),
                                    "ImpTotal": $("#IdTotal").text(),


                                    "Pago_Efectivo": $("#TxtPagoEfetivoEnt").val(),
                                    "Pago_Bancos": $("#TxtPagoBcoEnt").val(),
                                    "Pago_Cheques": $("#TxtChTotal").val(),
                                    "Pago_Tarjetas": $("#TxTjTotal").val()


                                }
                            });

                            $.ajax({
                                type: "POST",
                                url: "Cbtes.aspx/WmAddFc",
                                data: json,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: (function (result) {

                                    var obj = result.d;

                                    if (obj.Resultado=='R') {
                                        alert('Cbate n°:' + obj.Id + '- Rechazado:' + obj.Observaciones);
                                    }
                                    alert(obj.Id);
                                    $("#Main_TxtRpid").val(obj.Id);                                 
                                     $("#Main_BtnImp").click();
                                    LimpiarTodo();

                                }),
                                error: errores
                            });

                        } catch (e) {
                            alert(e.message);
                        }

                        } else {
                            alert("Seleccione un cliente. ");
                        }

                    } else {
                        alert("Seleccione un cliente. ");
                    }

                } else {
                    alert("Posee Saldo pendiente. ");
                }
            }





        } catch (e) {
            alert(e.message);
        }
        }

        

        function LimpiarTodo() {
            try {

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                                    });

                $.ajax({
                    type: "POST",
                    url: "Cbtes.aspx/WmLimpiarSesion",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success:'',
                    error: errores
                });
                var selectForm = document.forms[0];
               // limpiaForm(selectForm);
                $(selectForm)[0].reset();
                limpiarArt();
                limpiarCh();
                limpiarTJ();
                limpiarCli();
                fecha();
                $("#TxtTotalTj").text('0');
                $("#TxtTotalC").text('0');


                $("#IdTotal").text('0');
                $("#hddIdCli").val('0');
                
                $("#lblSaldo").text('00.00');
                $("#lblCambio").text('00.00');


                $("#ResultadoCh").show();
                $("#ResultadoCh").empty();

                $("#ResultadoTj").show();
                $("#ResultadoTj").empty();


                $("#ResultadoB").show();
                $("#ResultadoB").empty();

                $("#ResultadoProv").show();
                $("#ResultadoProv").empty();

                $("#ResultadoCli").show();
                $("#ResultadoCli").empty();

              
            } catch (e) {
                alert(e.message);
            }



        }


        $(".campoFecha").mask("99/99/9999");
        function limpiaForm(miForm) {
            // recorremos todos los campos que tiene el formulario
            $(':input', miForm).each(function() {
                var type = this.type;
                var tag = this.tagName.toLowerCase();
                //limpiamos los valores de los campos…
                if (type == 'text' || type == 'password' || tag == 'textarea')
                    this.value = "";
                    // excepto de los checkboxes y radios, le quitamos el checked
                    // pero su valor no debe ser cambiado
                else if (type == 'checkbox' || type == 'radio')
                    this.checked = false;
                    // los selects le ponesmos el indice a -
                else if (tag == 'select')
                    this.selectedIndex = -1;
            });
        }



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
        // solapas

        $('#tabsArt').tabs({
            activate: function (event, ui) {
                var activeTabId = $(this).tabs('option', 'active');
                if (activeTabId == 1) {
                    CargarRUbros();
                }
                if (activeTabId == 2) {
                    CargarMarca();
                }
            }
        });


        function pp() {
            CargarSub($("#cmbRubro").val());
            BuscarXrubro(); // llena la grilla art
            $('#cmbSubRubro').val('0');
            $('#select2-cmbSubRubro-container').text('- -');
        }

        function pp2() {
            CargarModelo($("#cmbMarca").val());
            BuscarXmarca();

            $('#cmbModelo').val('0');
            $('#select2-cmbModelo-container').text('- -');
        }
        function CargarRUbros() {
            try {

                var json = JSON.stringify
                  ({
                      "v_tipo": '0',
                      "v_valor": ''

                  });
                $.ajax({
                    type: "POST",
                    url: "Rubros.aspx/WsListar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#cmbRubro').empty();
                        $('#cmbRubro').append('<option value="0" selected="selected">- -</option>');
                        $.each(Especialidad, function (index, especialidades) {
                            $('#cmbRubro').append(
                                     $('<option  selected></option>').val(especialidades.Id).html(especialidades.NombreRubro)
                                   );
                        });


                        $('#cmbRubro').val('0');
                        $('#select2-cmbRubro-container').text('- -');
                        $('#cmbSubRubro').val('0');
                        $('#cmbSubRubro').empty();
                        $('#select2-cmbSubRubro-container').text('- -');

                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }
        function CargarSub(sub) {

            try {
                var json = JSON.stringify
                  ({
                      "v_sub": sub
                  });
                $.ajax({
                    type: "POST",
                    url: "SubRubro.aspx/WsListarSub",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#cmbSubRubro').empty();
                        $('#cmbSubRubro').append('<option value="0" selected="selected">- -</option>');
                        $.each(Especialidad, function (index, especialidades) {
                            $('#cmbSubRubro').append(
                                     $('<option  selected></option>').val(especialidades.Id).html(especialidades.NombreSubRubro)
                                   );
                        });


                    
                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }


        function CargarMarca() {
            try {

                var json = JSON.stringify
                  ({
                      "v_tipo": '0',
                      "v_valor": ''

                  });
                $.ajax({
                    type: "POST",
                    url: "Marca.aspx/WsListarMarca",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#cmbMarca').empty();
                        $('#cmbMarca').append('<option value="0" selected="selected">- -</option>');
                        $.each(Especialidad, function (index, especialidades) {
                            $('#cmbMarca').append(
                                     $('<option  selected></option>').val(especialidades.Id).html(especialidades.Nombre)
                                   );
                        });
                         
                        $('#cmbMarca').val('0');
                        $('#select2-cmbMarca-container').text('- -');
                        $('#cmbModelo').val('0');
                        $('#cmbModelo').empty();
                        $('#select2-cmbModelo-container').text('- -');
                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }
        function CargarModelo(sub) {

            try {
                var json = JSON.stringify
                  ({
                      "v_sub": sub
                  });
                $.ajax({
                    type: "POST",
                    url: "Marca.aspx/WsListarModelo",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#cmbModelo').empty();
                        $('#cmbModelo').append('<option value="0" selected="selected">- -</option>');
                        $.each(Especialidad, function (index, especialidades) {
                            $('#cmbModelo').append(
                                     $('<option  selected></option>').val(especialidades.Id).html(especialidades.Nombre)
                                   );
                        });


                       
                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }





        function BuscarXrubro() {

            try {
                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": '4',
                      "v_valor": $('#cmbRubro').val()
                  });
                $.ajax({
                    type: "POST",
                    url: "Articulo.aspx/WsListarArticulo",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoArt,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function BuscarXSubrubro() {

            try {

                var json = JSON.stringify
                  ({
                      "v_tipo": '5',
                      "v_valor": $('#cmbSubRubro').val()
                  });
                $.ajax({
                    type: "POST",
                    url: "Articulo.aspx/WsListarArticulo",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoArt,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }


        function BuscarXmarca() {

            try {

                var json = JSON.stringify
                  ({
                      "v_tipo": '6',
                      "v_valor": $('#cmbMarca').val()
                  });
                $.ajax({
                    type: "POST",
                    url: "Articulo.aspx/WsListarArticulo",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoArt,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function BuscarXmodelo() {

            try {

                var json = JSON.stringify
                  ({
                      "v_tipo": '7',
                      "v_valor": $('#cmbModelo').val()
                  });
                $.ajax({
                    type: "POST",
                    url: "Articulo.aspx/WsListarArticulo",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoArt,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        $(window).load(function () {


            var TipoOp = getUrlParameter('TipoOp');           

            if (TipoOp=='OS') {
                AddArtOS();
            }
        });




    </script>


     
          <link href="http://www.hardsoft.com.ar/css/select2.css" rel="stylesheet" />
     <link href="http://www.hardsoft.com.ar/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="http://www.hardsoft.com.ar/js/select2.js"></script>
     

</asp:Content>
