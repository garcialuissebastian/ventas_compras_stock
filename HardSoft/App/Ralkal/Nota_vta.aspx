<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true"  enableEventValidation="false" CodeBehind="Nota_vta.aspx.cs" Inherits="HardSoft.App.Ralkal.Nota_vta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script><link rel="stylesheet" href="http://www.hardsoft.com.ar/css/jquery-ui.css"/><script type="text/javascript" src="../../js/bootstrap-datepicker.js" ></script><script src="../../js/jquery.maskedinput.js"></script><script src="http://www.hardsoft.com.ar/Scripts/jquery-ui.js"></script><script language="JavaScript" type="text/javascript"> 
          
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
        function acceptNum(evt) {
            // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46
            var key = nav4 ? evt.which : evt.keyCode;
            
            return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
        }

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
    </script><div class="container">


          <div style="display:none">
    <asp:HiddenField ID="Hdcliente" runat="server" />
           <asp:HiddenField ID="HdNota" runat="server" />
    <asp:Button ID="BtnRp" runat="server" Text="rp" OnClick="BtnRp_Click" />
    </div>
    <div   style="margin-top:0px;text-transform:uppercase" >
         
       
        
        <div class="alert alert-success">
           Nota de venta
       </div>     
        
     
<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >


    <div class="col-xs-6">
        <div class="form-horizontal">
        
                <div class="form-group">
         <label for="TxtCliente" class="control-label col-xs-4">Vendedor </label>
                <div class="col-xs-7">

 <asp:DropDownList ID="cmbVendedor"  runat="server" CssClass="cmbBuscar form-control " Width="100%"  >                                          
                                            
                                        </asp:DropDownList>
             </div>
           <div class="col-xs-1">
     
           <a class="tooltips" style="cursor:pointer " href="#"  onclick="PopC()">    <img src="../../../images/buscar-documentos.png" /> 
       
<span>Buscar Cliente</span></a>
     </div>
      </div>
      

          <div class="form-group">
         <label for="TxtCliente" class="control-label col-xs-4">Cliente </label>
                <div class="col-xs-7">

 <asp:DropDownList ID="cmbClientes" runat="server" CssClass="cmbBuscar form-control " Width="100%"  >                                          
                                            
                                        </asp:DropDownList>
             </div>
           <div class="col-xs-1">
     
           <a class="tooltips" style="cursor:pointer " href="#"  onclick="PopC()">    <img src="../../../images/buscar-documentos.png" /> 
       
<span>Buscar Cliente</span></a>
     </div>
      </div>
      
         
          </div>

     <div class="col-xs-6">

    </div>

    </div>

</div>

  

</div>


<div class="row"  style="margin-left:0px; margin-right:0px;  margin-top:5px; padding:20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >


    <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Producto </label>
                <div class="col-xs-7">

 <asp:DropDownList ID="cmbProd" runat="server" CssClass="cmbBuscar form-control " Width="100%"  >                                          
                                            
                                        </asp:DropDownList>
             </div>
           <div class="col-xs-1">
     
           <a class="tooltips" style="cursor:pointer " href="#"  onclick="PopCat()">   <img src="../../../images/buscar-documentos.png" /><span>Buscar Producto</span></a></div> 
           
   
      </div>
        
         
          </div>

     <div class="col-xs-6">

    </div>

    </div>

     <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
         <label for="TxtMonto" class="control-label col-xs-4  " > <strong> PRECIO: <span id="TxtMonto" style="color: red;"></span>  $ <br />Stock: <span id="TxtStock" style="color: red;"></span></strong></label>

             <label for="TxtMonto" class="control-label col-xs-3  " > Cantidad</label>
  
              <div class="col-xs-2"> 
                  
                  
                  
                  <input id="TxtCant" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="1"   class="form-control"/>
                  
                  
                  
                   </div>
 
              
               <div class="col-xs-3">
 
                       <button id="btnAdd" type="button" class="btn2 btn-danger   " onclick="gvProductos()" >
    <span class=" glyphicon glyphicon-plus"></span> Agregar 
 </button>


             </div>
        
        
         
          </div>

     <div class="col-xs-6">

    </div>

    </div>





</div>

 
        
<div class="row">
    <div class="col-xs-12">
    <div id="ResultadoGv"  style="overflow-y: auto; overflow-x: hidden; height: 150px; width: 100%; background-color:rgb(240, 244, 251) "></div>
        <br />

            <div  class="control-label col-xs-5  pull-left"  id="condicion2"> 
        <a class="tooltips" style="cursor:pointer; background-color:coral ;padding: 10px; " onclick="VerCondicion()"> CONDICIÓN DE VENTA &nbsp <img src="../../../images/cheque.png"> 
       
<span>Forma de Pago </span></a> </div>

          <label for="TxtTotal" class="control-label col-xs-5  pull-right" style=" background-color:#eceae9 ;padding: 10px; " > <strong> TOTAL: <span id="TxtTotal" style="color: red;">0</span> </strong>$</label>

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

<div id="condicion" class="row"  style="display:none;margin-left:0px; margin-right:0px;  margin-top:5px; padding:20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div class="row">
  <div class="col-xs-12" style="margin:10px"> <h5>Condiciones de Venta</h5> </div>


</div>
   <div class="row">
<div class="col-xs-6"> 

         <div class="form-horizontal">
        
          <div class="form-group" style="background-color: seashell;">
         <label for="TxtCliente" class="control-label col-xs-6">Pago en efectivo $ </label>
                <div class="col-xs-4">

     <input id="TxtPagoEfetivo"  onKeyPress="return acceptNum(event)"   value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="width:80px" />
             
                    
                       </div>
           <div class="col-xs-2">
      
 
     </div>
      </div>
           <div class="form-group"  >
         <label for="TxtCliente" class="control-label col-xs-6">Parte de pago Maq. N° </label>
                <div class="col-xs-4">

     <input id="TxtMaq" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" />
             </div>
           <div class="col-xs-2">
      
 
     </div>
      </div>
      
         
          </div>
   
    
    
    
    
    
    
     </div>
    <div class="col-xs-6">
        

         <div class="form-horizontal">
        
          <div class="form-group">
         <label for="TxtCliente" class="control-label col-xs-6">Seña $ </label>
                <div class="col-xs-4">
 
           <input id="TxtSena"  value="0" type="text"  onKeyPress="return acceptNum(event)"  onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="width:80px" />
                    
                    
                        </div>
           <div class="col-xs-2">
      
 
     </div>
      </div>
      
     <div class="form-group">
         <label for="TxtCliente" class="control-label col-xs-6">Anticipo $ </label>
                <div class="col-xs-4">
                      <input id="TxtAnticipo" type="text" onKeyPress="return acceptNum(event)"  value="0" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="width:80px" />
         
          </div>
           <div class="col-xs-2">
      
 
     </div>
      </div>
     


         
          </div>
   
    </div>
</div>
     <div class="row">

          <div class="form-horizontal">
        
          <div class="form-group"  style="background-color:aliceblue;margin:5px" >

        
                <div class="col-xs-6">
                     <label for="TxtCliente" class="control-label col-xs-2">Cuotas </label>
                     <div class="col-xs-2">
  
                     <input id="TxtCantCouta" onKeyPress="return acceptNum(event)"  value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="width:80px" />
         
                             </div>  
                     <div class="col-xs-3">
                          <select id="cmbTipoCuota" class="form-control" style="width:100px">
          <option value="0">Mensual</option>
          <option value="1">Semanal</option>
          <option value="1">Por día</option>
      </select>
       
                     </div>
                            <label for="TxtCliente" class="control-label col-xs-3">Pesos $  </label>
                <div class="col-xs-2">
                <input id="TxtPesoCota" onKeyPress="return acceptNum(event)"  value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="width:80px" />
         
    </div>
                         

                      </div>
 
                
               <div class="col-xs-6" style="color:red">
            
                            <label for="TxtCliente" class="control-label col-xs-6" >Vuelto $  </label>
                <div class="col-xs-6 pull-left" id="TxtDeuda" >
                    
    </div>
           
                   
                    </div>
          
              </div>
 



              </div>
      </div>     

 <div class="row">
<div class="col-xs-6"> 

         <div class="form-horizontal">
        
          <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-6">Fecha 1° vencimiento</label>
         <div class="col-xs-4">
           
              

     <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup" runat="server" TargetControlID="TxtDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
          <div class="col-xs-2">  </div>
</div> 

             
             
               </div>
            
     </div>
          
         
          </div>
   
    
    
    
    
    
    
     </div>
    
     <label for="TxtNunDoc" class="control-label col-xs-2">Otros medios de pago</label>

    <div class="col-xs-4" >

        <div class="row pull-left">
 
          <div class="col-xl-6">
        
                <a class="tooltips" style="cursor:pointer "  onclick="verT()">  <img src="../../../images/tarjeta.png"/>        
<span>Tarjetas </span></a>
              </div>
 

                  <div class="col-xl-6">
          
          <a class="tooltips" style="cursor:pointer "  onclick="verC()">  <img src="../../../images/cheque.png"/> 
       
<span>Cheques </span></a>

              </div>
       
 </div>   


     </div>

    <div class="row">
       <div class ="col-xs-2">

       

       </div>
          <div class ="col-xs-10"> </div>
    </div>
   
     
      <div class="Border_redondos" id="pnlT" style="display:none">
    <div class="row">
    <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
     
                  <label for="TxtNombre" class="control-label col-xs-4">Tarjeta </label>
                <div class="col-xs-7">

 <asp:DropDownList ID="CmbTarjetas" runat="server" CssClass="cmbBuscar form-control " Width="100%"  >                                          
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
           <div class="col-xs-1">
     
          
   
      </div>
        
         
          </div>

     <div class="col-xs-6">

    </div>

    </div>
</div>


     <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">


         <label for="TxtMonto" class="control-label col-xs-2  " >  Cuotas </label>
                  <div class="col-xs-2">    <input id="TxtCuotaT" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                   </div>

             <label for="TxtMonto" class="control-label col-xs-3  " >Monto</label>
  
              <div class="col-xs-2"> 
                  
                  
                  
                  <input id="TxtMontoT" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                  
                  
                  
                   </div>
 
              
               <div class="col-xs-3">
 
                       <button id="btnAddt" type="button" class="btn2 btn-danger   " onclick="gvTarjeta()" >
    <span class=" glyphicon glyphicon-plus"></span> Agregar 
 </button>


             </div>
        
        
         
          </div>

     <div class="col-xs-6">

    </div>

    </div>





</div>

</div>
    <div class="row">

      

<div class="col-xs-12">
    <div id="ResultadoTj"  style="overflow-y: auto; overflow-x: hidden; height: 80px; width: 100%; background-color:rgb(240, 244, 251) "></div>
        <br />
          <label for="TxtTotal" class="control-label col-xs-5  pull-right" > <strong> TOTAL CON TARJETA: <span id="TxtTotalTj" style="color: red;">0</span> </strong>$</label>

    </div>


</div>

</div>

 
      <div class="Border_redondos" style="margin-top:5px;display:none" id="pnlC">
    <div class="row">
         
        <div class="col-xs-12">
              <h3> Pago con cheques</h3>
        </div>

    </div>
          
          
          <div class="row">
    <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
     
                   
                <div class="col-xs-6">

 <asp:DropDownList ID="cmbBcos" runat="server" CssClass="cmbBuscar form-control " Width="100%"  >                                          
                                            <asp:ListItem>Banco Provincia</asp:ListItem>
                      <asp:ListItem>Banco Piano</asp:ListItem>
                      <asp:ListItem>Banco Santander Río</asp:ListItem>  
         <asp:ListItem>Banco Nación</asp:ListItem>
                      <asp:ListItem>Banco Itaú</asp:ListItem>
                      <asp:ListItem>Banco Hipotecario</asp:ListItem>
       

                                        </asp:DropDownList>
      </div>     
              
              
                 <div class="col-xs-3">
                    <asp:DropDownList ID="cmbTipoCh" runat="server" CssClass="   form-control " Width="100%"  >                                          
                                            <asp:ListItem>Simple </asp:ListItem>
                      <asp:ListItem>Diferido</asp:ListItem>
                 
       

                                        </asp:DropDownList>
                       </div>



        
     
          
         <label for="TxtMonto" class="control-label col-xs-1  " > Días </label>
                  <div class="col-xs-2">    <input id="TxtDias" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                   </div>
   
      
        
         
          </div>

     <div class="col-xs-6">
           

               
    </div>

    </div>
</div>


     <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">


         <label for="TxtMonto" class="control-label col-xs-2  " >  cheque </label>
                  <div class="col-xs-3">    <input id="TxtCuotaC" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                   </div>

             <label for="TxtMonto" class="control-label col-xs-2  " >Monto</label>  
              <div class="col-xs-2">    
                  <input id="TxtMontoC" type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum(event)" value ="0"   class="form-control"/>
                                      </div>               
               <div class="col-xs-3">
 
                       <button id="btnAddCh" type="button" class="btn2 btn-danger   " onclick="gvCheques()" >
    <span class=" glyphicon glyphicon-plus"></span> Agregar 
 </button>


             </div>
        
        
         
          </div>

     <div class="col-xs-6">

    </div>

    </div>
          
</div>

</div>
    <div class="row">

      

<div class="col-xs-12">
    <div id="ResultadoCh"  style="overflow-y: auto; overflow-x: hidden; height: 80px; width: 100%; background-color:rgb(240, 244, 251) "></div>
        <br />
          <label for="TxtTotal" class="control-label col-xs-5  pull-right" > <strong> TOTAL CON CHEQUES: <span id="TxtTotalC" style="color: red;">0</span> </strong>$</label>

    </div>


</div>

</div>



</div>

<div class="row">
<div class="col-xs-12"> 
      <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button"  class="btn2 btn-primary" onclick="Guardar()" >
    <span class=" glyphicon glyphicon-save"></span> Aguardar
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
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOp" class="form-control">
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
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
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


<br />
      </div>
          <script type="text/javascript">


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
            
              
              function Exitoa() {

                  Limpiar();
                  alert('Guardado');

                  $("#Main_BtnRp").click();

              }

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
              function verT() {
                  if ($("#pnlT").css('display') == 'none') {
                      $("#pnlT").show();
                  } else {
                      $("#pnlT").hide();
                  }
                 
              }
              function verC() {
                  if ($("#pnlC").css('display') == 'none') {
                      $("#pnlC").show();
                  } else {
                      $("#pnlC").hide();
                  }
              }
      

</script>


        <script type="text/javascript">
            $(function () {
                ListarVendedores();
            
                ListarProd();
                ListarCliente();
             
                $("#TxtCant").val("1");


                $("#Main_cmbProd").change(function () {
                    Precio($("#Main_cmbProd").val());
                    Stock($("#Main_cmbProd").val());

                })



                $(".cmbBuscar").select2();

               
 


                $("#TxtCant").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                          gvProductos();
                    }
                });

                $("#TxtMontoT").keyup(function (e) {
                    if (e.keyCode == 13) {
                        gvTarjeta();
                    }
                });



                $("#TxtCant").on("blur", function () {
                    if ($("#TxtCant").val() == '') {
                        $("#TxtCant").val('1');
                    }
                    
                });

                //condiciones

                var deuda = 0;

                $("#TxtPagoEfetivo").on("blur", function () {
                    if ($("#TxtPagoEfetivo").val() == '') {
                        $("#TxtPagoEfetivo").val('0');
                    } 
                        
                        deuda = parseFloat($("#TxtPagoEfetivo").val()) + parseFloat($("#TxtSena").val()) + parseFloat($("#TxtAnticipo").val()) + parseFloat($("#TxtAnticipo").val()) + (parseFloat($("#TxtCantCouta").val()) * parseFloat($("#TxtPesoCota").val()))
 
                        $("#TxtDeuda").text((deuda - parseFloat($("#TxtTotal").text())).toFixed(2));
                    

                });

                $("#TxtSena").on("blur", function () {
                    if ($("#TxtSena").val() == '') {
                        $("#TxtSena").val('0');
                    }  

                        deuda = parseFloat($("#TxtPagoEfetivo").val()) + parseFloat($("#TxtSena").val()) + parseFloat($("#TxtAnticipo").val()) + parseFloat($("#TxtAnticipo").val()) + (parseFloat($("#TxtCantCouta").val()) * parseFloat($("#TxtPesoCota").val()))
                        $("#TxtDeuda").text((deuda - parseFloat($("#TxtTotal").text())).toFixed(2));
                    

                });

                $("#TxtAnticipo").on("blur", function () {
                    if ($("#TxtAnticipo").val() == '') {
                        $("#TxtAnticipo").val('0');
                    }  

                        deuda = parseFloat($("#TxtPagoEfetivo").val()) + parseFloat($("#TxtSena").val()) + parseFloat($("#TxtAnticipo").val()) + parseFloat($("#TxtAnticipo").val()) + (parseFloat($("#TxtCantCouta").val()) * parseFloat($("#TxtPesoCota").val()))
                        $("#TxtDeuda").text((deuda - parseFloat($("#TxtTotal").text())).toFixed(2));
                    

                });

                $("#TxtCantCouta").on("blur", function () {
                    if ($("#TxtCantCouta").val() == '') {
                        $("#TxtCantCouta").val('0');
                    }  

                        deuda = parseFloat($("#TxtPagoEfetivo").val()) + parseFloat($("#TxtSena").val()) + parseFloat($("#TxtAnticipo").val()) + parseFloat($("#TxtAnticipo").val()) + (parseFloat($("#TxtCantCouta").val()) * parseFloat($("#TxtPesoCota").val()))
                        $("#TxtDeuda").text((deuda - parseFloat($("#TxtTotal").text())).toFixed(2));
                    

                });
                $("#TxtPesoCota").on("blur", function () {
                    if ($("#TxtPesoCota").val() == '') {
                        $("#TxtPesoCota").val('0');
                    }  

                        deuda = parseFloat($("#TxtPagoEfetivo").val()) + parseFloat($("#TxtSena").val()) + parseFloat($("#TxtAnticipo").val()) + parseFloat($("#TxtAnticipo").val()) + (parseFloat($("#TxtCantCouta").val()) * parseFloat($("#TxtPesoCota").val()))
                        $("#TxtDeuda").text((deuda - parseFloat($("#TxtTotal").text())).toFixed(2));
                    

                });


            });

            function Guardar() {
                try {

                    $(".mierror").empty();
                    if ($("#Main_cmbVendedor").val() == "0") {
                        $("#Main_cmbVendedor").focus().after("<span class='alert-danger mierror'>Seleccione un vendedor</span>");

                        return false;
                    }

                    if ($("#Main_cmbClientes").val() == "0") {
                        $("#Main_cmbClientes").focus().after("<span class='alert-danger mierror'>Seleccione un Cliente</span>");

                        return false;
                    }

                    if ($("#TxtTotal").text() == "0") {
                        $("#TxtTotal").focus().after("<span class='alert-danger mierror'>       Agrege productos</span>");

                        return false;
                    }

                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {


                            "Id_vendedor": $("#Main_cmbVendedor").val(),
                            "Pago_efectivo": $("#TxtPagoEfetivo").val(),
                            "Senia": $("#TxtSena").val(),
                            "Maquina": $("#TxtMaq").val(),
                            "Anticipo": $("#TxtAnticipo").val(),
                            "Coutas": $("#TxtCantCouta").val(),
                            "Coutas_tipo": $("#cmbTipoCuota option:selected").text(),
                            "Coutas_pesos": $("#TxtPesoCota").val(),
                            "Total_vta": $("#TxtTotal").text(),
                            "Deuda": $("#TxtDeuda").text(),
                            "Aud": '',
                            "Id_cliente": $("#Main_cmbClientes").val(),
                            "Vto": $("#Main_TxtDesde").val()

                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Nota_vta.aspx/WsGuardar",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: Exitoa,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }


             

            function Alta_Completoa() {
                alert("Registro dado de alta");
            }

            function Modificado_Completoa() {
                alert("Registro completo");
            }
            function Quitar_Completoa() {
                alert("Registro Eliminado");
            }

            function errores(msg) {
                var jsonObj = JSON.parse(msg.responseText);
                alert('Error: ' + jsonObj.Message);
            }

            function PopCat() {
                $("#ModalCat").modal();
            }
            function PopC() {
                $("#ModalC").modal();
            }
            function ListarProd() {
                try {

                    var json = JSON.stringify
              ({
                  "v_tipo": '',
                  "v_valor": ''
              });

                    $.ajax({
                        type: "POST",
                        url: "Nota_vta.aspx/WsListarP",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarCat,
                        error: errores
                    });
                     

                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarCat(Resultado) {

                var Especialidad = Resultado.d;

                $('#Main_cmbProd').empty();

                $('#Main_cmbProd').append('<option value="0">Seleccione un producto</option>');

                $.each(Especialidad, function (index, especialidades) {
                    $('#Main_cmbProd').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                        );
                });

               
                //select un item  para select2
                $("#Main_cmbProd").val(0).change();
            }

            function CargarVerP(prod) {

                $("#Main_cmbProd").val(prod).change();
                $("#ModalCat").modal('hide');


            }

            function ListarCliente() {
                try {

                    var json = JSON.stringify
              ({
                  "v_tipo": '',
                  "v_valor": ''
              });

                    $.ajax({
                        type: "POST",
                        url: "Nota_vta.aspx/WsListarC",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarC,
                        error: errores
                    });


                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarC(Resultado) {

                var Especialidad = Resultado.d;
                $('#Main_cmbClientes').empty();

                $('#Main_cmbClientes').append('<option value="0">Seleccione un cliente</option>');

                $.each(Especialidad, function (index, especialidades) {
                    $('#Main_cmbClientes').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.Nombre + ' ' + especialidades.Apellido)
                        );
                });


                //select un item  para select2
                $("#Main_cmbClientes").val(0).change();
            }

            function ListarVendedores() {
                try {

                    var json = JSON.stringify
              ({
                  
                  "v_valor": ''
              });

                    $.ajax({
                        type: "POST",
                        url: "Nota_vta.aspx/WsListarV",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarV,
                        error: errores
                    });


                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarV(Resultado) {

                var Especialidad = Resultado.d;
                $('#Main_cmbVendedor').empty();

                $('#Main_cmbVendedor').append('<option value="0">Seleccione un vendedor</option>');

                $.each(Especialidad, function (index, especialidades) {
                    $('#Main_cmbVendedor').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.Nombre + ' ' + especialidades.Apellido)
                        );
                });


                //select un item  para select2
                $("#Main_cmbVendedor").val(0).change();
            }

            function Limpiar(frm) {
                var inputs = document.getElementsByTagName("input");
                for (var i = 0; i < inputs.length; i++) {
                    inputs[i].value = "";
                }
            }





            function CargarVerC(prod) {

                $("#Main_cmbClientes").val(prod).change();
                $("#ModalC").modal('hide');


            }


            function Buscar() {

                try {
                     
                  
                    var v_buscar = $('#cmbTipoOp').val();
                    var json = JSON.stringify
                      ({
                          "v_tipo": $('#cmbTipoOp').val(),
                          "v_valor": $('#Main_TxtBuscar').val()

                      });
                    $.ajax({
                        type: "POST",
                        url: "Producto_ver.aspx/WsListar",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: resultado,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }

            function resultado(Resultado) {
                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

                $("#Resultado").show();
                $("#Resultado").empty();
                Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>#</th> <th>Codigo</th><th>Nombre</th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                    Tabla_Datos = Tabla_Datos + "<tr onclick='CargarVerP(" + pacientes.Id + ");' style='cursor:pointer;'><td style='background-image:url(/images/seleccionar-objeto.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Codigo + "</td><td>" + pacientes.Nombre + "</td></tr>";
                });

                Tabla_Fin = "</tbody></table>";
                $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            }
             
            function BuscarC() {

                try {
                     

                    var v_buscar = $('#cmbTipoOpC').val();
                    var json = JSON.stringify
                      ({
                          "v_tipo": $('#cmbTipoOpC').val(),
                          "v_valor": $('#Main_TxtBuscarC').val()

                      });
                    $.ajax({
                        type: "POST",
                        url: "Nota_vta.aspx/WsListarC",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: resultadoC,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }

            function resultadoC(Resultado) {
                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

                $("#ResultadoC").show();
                $("#ResultadoC").empty();
                Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>#</th> <th>NOMBRE</th><th>APELLIDO</th><th>DOC_NO</th><th>RAZON_SOCIAL</th><th>CUIT</th><th>RAMO</th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                    Tabla_Datos = Tabla_Datos + "<tr onclick='CargarVerC(" + pacientes.Id + ");' style='cursor:pointer;'><td style='background-image:url(/images/seleccionar-objeto.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Apellido + "</td><td>" + pacientes.Doc_no + "</td><td>" + pacientes.Razon_social + "</td><td>" + pacientes.Cuit + "</td><td>" + pacientes.Ramo + "</td></tr>";
                });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoC").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            }

            function Precio(v_id) {

                try { 
                    var json = JSON.stringify
                      ({
                          "v_id": v_id
                         
                      });
                    $.ajax({
                        type: "POST",
                        url: "Nota_vta.aspx/WsPrecio",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: SetPrecio,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }
            function SetPrecio(Resultado) {

                
                    var sal = Resultado.d;

                
                    $("#TxtMonto").text(sal );

            }
            function Stock(v_id) {

                try {
                    var json = JSON.stringify
                      ({
                          "v_id": v_id

                      });
                    $.ajax({
                        type: "POST",
                        url: "Nota_vta.aspx/WsStock",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: SetStock,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }
            function SetStock(Resultado) {


                var sal = Resultado.d;


                $("#TxtStock").text(sal);

            }
            function gvTarjeta() {

                try {

                    if ($("#TxtCuotaT").val() != '0') {


                        var json = JSON.stringify
                          ({
                              "v_id": '',
                              "v_nombre": $('#Main_CmbTarjetas option:selected').text(),
                              "v_precio": $('#TxtMontoT').val(),
                              "v_cant": $('#TxtCuotaT').val()
                          })
                        $.ajax({
                            type: "POST",
                            url: "Nota_vta.aspx/gvTarjeta",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultadoAddT,
                            error: errores
                        });
                    }
                } catch (e) {
                    alert(e.message);
                }
            }

            function resultadoAddT(Resultado) {

                $("#TxtCuotaT").val("0");
                $("#TxtMontoT").val("0");

                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";
                var v_total = 0;
                $("#ResultadoTj").show();
                $("#ResultadoTj").empty();
                Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>#</th>  <th>Nombre</th><th>Cuotas</th><th>Monto $</th><th>Total</th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                    var Total = 0;
                    if (pacientes.Cant != 0) {

                        Total = parseFloat(pacientes.Precio) * parseFloat(pacientes.Cant);

                    } else {

                        Total = pacientes.Precio;
                    }

                    v_total = v_total + Total;
                    Tabla_Datos = Tabla_Datos + "<tr ><td onclick='gvTarjeta_del(" + pacientes.Id + ");'    style='cursor:pointer;background-image:url(/images/boton-eliminar.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Nombre + "</td> <td>" + pacientes.Cant + "</td><td>" + pacientes.Precio + "</td><td>" + Total + "</td></tr>";
                });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoTj").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                $("#TxtTotalTj").text(v_total.toFixed(2));
            }

            function gvProductos() {

                try {

                    if ($('#Main_cmbProd').val() != 0) {

                       
                        var json = JSON.stringify
                          ({
                              "v_id": $('#Main_cmbProd').val(),
                              "v_nombre": $('#Main_cmbProd option:selected').text(),
                              "v_precio": $('#TxtMonto').text(),
                              "v_cant": $('#TxtCant').val()

                          })
                        $.ajax({
                            type: "POST",
                            url: "Nota_vta.aspx/gvProductos",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultadoAdd,
                            error: errores
                        });
                    }
                } catch (e) {
                    alert(e.message);
                }
            }
            function gvProductos_del(v_id) {

                try {

                    if ($('#Main_cmbProd').val() != 0) {


                        var json = JSON.stringify
                          ({
                              "v_id": v_id                              

                          })
                        $.ajax({
                            type: "POST",
                            url: "Nota_vta.aspx/gvProductos_del",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultadoAdd,
                            error: errores
                        });
                    }
                } catch (e) {
                    alert(e.message);
                }
            }
        
            function gvTarjeta_del(v_id) {
            
                try {

                    if (true) {


                        var json = JSON.stringify
                          ({
                              "v_id": v_id

                          })
                        $.ajax({
                            type: "POST",
                            url: "Nota_vta.aspx/gvTarjeta_del",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultadoAddT,
                            error: errores
                        });
                    }
                } catch (e) {
                    alert(e.message);
                }
            }
            function resultadoAdd(Resultado) {

                $("#TxtCant").val("1");
                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";
                var v_total = 0;
                $("#ResultadoGv").show();
                $("#ResultadoGv").empty();
                Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>#</th> <th>Cant.</th> <th>Nombre</th><th>Unit. Precio $</th><th>Total $</th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                    var Total=0;
                    if (pacientes.Cant != 0) {
                        Total = parseFloat(pacientes.Precio) * parseFloat(pacientes.Cant);
                    } else {

                        Total = pacientes.Precio;
                    }
                   
                    v_total = v_total +  Total;
                    Tabla_Datos = Tabla_Datos + "<tr ><td onclick='gvProductos_del(" + pacientes.Id + ");'    style='cursor:pointer;background-image:url(/images/boton-eliminar.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Cant + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Precio + "</td><td>" + Total + "</td></tr>";
                });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoGv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                $("#TxtTotal").text(v_total.toFixed(2));
            }
            function Limpiar(frm) {
                $("#ResultadoGv").empty();
                var inputs = document.getElementsByTagName("input");
                for (var i = 0; i < inputs.length; i++) {
                    inputs[i].value = "";
                }

                $("#TxtCant").val("1");
                $("#TxtPagoEfetivo").val("0");
                $("#TxtSena").val("0");
                $("#TxtAnticipo").val("0");
                $("#TxtCantCouta").val("0");
                $("#TxtPesoCota").val("0");
                $("#TxtStock").text("0");
                $("#TxtMonto").text("0");
                $("#TxtTotal").text("0");
                $("#TxtDeuda").text("0");

                $("#Main_cmbProd").val(0).change();
            }



        </script>
       <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
        
          <link href="http://www.hardsoft.com.ar/css/select2.css" rel="stylesheet" />
     <link href="http://www.hardsoft.com.ar/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="http://www.hardsoft.com.ar/js/select2.js"></script>

</asp:Content>
