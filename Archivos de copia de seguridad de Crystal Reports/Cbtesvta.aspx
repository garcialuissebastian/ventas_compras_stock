<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master"  enableEventValidation="false" AutoEventWireup="true"   CodeBehind="Cbtesvta.aspx.cs" Inherits="HardSoft.App.Kardex.Cbtesvta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <script>
       var ultimatecka = "";
       function acceptNum2(evt, valo) {
           // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46
           var key = nav4 ? evt.which : evt.keyCode;

           var len = valo.length;
          
           var index = valo.indexOf('.'); 
           
           if (index > 0) {

               var CharAfterdot = (len + 1) - index;
               
               if (CharAfterdot > 3) { 
                   if (ultimatecka == '8') {
                      
                       return true;

                   }

                       if(key == 8){
                           ultimatecka = '8';
                           return true;
                       } else {
                           return false ;
                       }

               }

           }
           if (key == 46) {

               if (valo.indexOf(".") != -1) {
                   //retun -1 si no encuentra . en string
                   return false;
               }

           } else {

               return (key <= 13 || (key >= 48 && key <= 57) || key == 46 || key == 45);
           } 

         

            
       }
       var nav4 = window.Event ? true : false;
       function acceptNum(e) {
           var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
           return ((tecla > 47 && tecla < 58) || tecla == 8);
       }
       $(document).keypress(function (event) {
           // para q no haga submit cuando pressiono enter en alguna parte
           var keycode = event.keyCode || event.which;
           if (keycode == '13') {
               return false;
           }
       });

       </script>
       
     <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
   <script type="text/javascript" src="/js/formError.js"></script>
   <script src="/js/kardex.js?v=01"></script>

    <div class=" container" style="margin-top: 36px;">  
          <div style="display:none">
    <asp:HiddenField ID="Hdcliente" runat="server" />
           <asp:HiddenField ID="HdNota" runat="server" />
 
    </div>
       
      <div class="alert alert-cab "   style="height:50px">
           <div class="col-md-6">
         Comprobante 
                </div> 
           <div class="col-md-6" style="text-align:right">
              <asp:Label ID="lblCaja" runat="server" Text=""></asp:Label>

          </div>
            </div> 
         
          
    <div id="ini" style="background-color:  #e2e2e2;margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; height:450px; margin-bottom:10px"></div>
   <div id="tabsC" style="text-transform:uppercase;font-size:12px; display:none ">
  <ul>
       
    <li><a href="#tabsC-1"    > Generar Compronte</a></li>
    
         
       
  </ul>    

 


     <div id="tabsC-1" style="background-color: #f1f1f1;">
<div class="row"  style=" background:  rgba(245, 245, 245, 0.51);margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
     <div class="col-xs-6">
          <div class="form-horizontal"> 
  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> FECHA </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtFecha" runat="server" class="campoFecha form-control" Width="100px"  ></asp:TextBox>
      
         </div>
        <label for="TxtNombre" class="control-label col-xs-1" style="margin-top: -5px;"> Vto.<br /> Pago </label>
         <div class="col-xs-4">
                                      
                <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaPagovto" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="Imagepago" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender3"   PopupButtonID="Imagepago" runat="server" TargetControlID="TxtFechaPagovto"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
     
      <select id="cmbTipoVta" class="form-control" style="display:none">
          <option value="1"> Productos</option> 
           <option value="2">  Servicios</option> 
            <option value="3">  Productos y Servicios</option>
      </select>
         </div>
           
     </div> 

              <div class="form-group "  >
         <label for="TxtNombre" class="control-label col-xs-4"> Remito</label>
         <div class="col-xs-5">
 <div>
       <input id="TxtPto" type="text"  class="form-control" style="width:60px;float:left" placeholder="Pto." onkeypress="return acceptNum(event)"  />-
    <input id="TxtRemito" type="text"  class="form-control" style="width:110px;float:right" placeholder="N°Remito" onkeypress="return acceptNum(event)"/>
     
       
       </div>
       </div> <div class="col-xs-1"> </div>
           
     </div> 

               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">MONEDA</label>
         <div class="col-xs-3">
   <asp:DropDownList ID="cmbMoneda" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem Value="PES">Peso</asp:ListItem>
                                            <asp:ListItem Value="DOL">Dolar</asp:ListItem>
                                         
                                             
                                             
                                        </asp:DropDownList>
      
      
         </div>
                    <label for="TxtNombre" class="control-label col-xs-2 cotizacion" style="display:none">COTIZACIÓN</label>
            <div class="col-xs-3">
                <input  type="number" id="TxtCotizacion" class="form-control cotizacion" step="any" style="display:none">

                 </div> 
     </div> 



  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> CAJERO</label>
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
             Si se trata de operaciones entre responsables inscriptos Cbate A (NO acepta dni solo cuit)
      
      
       <option value="1">Factura A</option> 
     <option value="3">Nota de Crédito A</option>       
     <option value="2">Nota de Débito A</option>
     <option value="6">Factura B</option> 
      <option value="8">Nota de Crédito B</option>       
     <option value="7">Nota de Débito B</option>
      
      --%>

<select id="cmbTipoCbate" class="form-control" style="text-transform: uppercase;"> 
    
     

     
                        
      </select>
      

             


         </div>
           
     </div>  


                 <div class="form-group " >
          
         <div class="col-xs-12" >
   <a class=" btn2"   style="cursor:pointer ;  float:left;  background-color:blue;
    color: white; " onclick="VerPerc()">  
             
             
              + Agregar PERCEPCIONES E IMPUESTOS
              
   </a>
       
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
         <div class="col-xs-4">

 <asp:TextBox ID="TxtDoc" runat="server" class="form-control" onkeypress="return acceptNum(event)"  Width="130px"></asp:TextBox>
           
                  </div>
                   
        
 
          <label for="TxtNombre" class="control-label col-xs-4 text-left"><strong> </strong></label>
           
     </div>     

  <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4"> Tel </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtTel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
        
            
  <div class="form-group"  id="VerCbteAsc1"  style="display:none" >
         <label for="TxtNombre" class="control-label col-xs-4">Comprobante Asociado</label>
         <div class="col-xs-8">
         <select id="cmbCbateAsc" class="form-control" style="text-transform: uppercase; width:100%"></select>
         </div>
           
     </div>



  <div class="form-group"  >
         <label for="TxtNombre" class="control-label col-xs-4"></label>
         <div class="col-xs-1">
             <input id="Chfinal" type="checkbox"  onclick="consumidor()" class="form-control"/>      
         </div>
           <div class="col-xs-7" style="text-align:left;font-weight:800">Consumidor Final  </div>
     </div>
    
 <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4"></label>
         <div class="col-xs-1">
             <input id="ChLetra" type="checkbox"  onclick="letras()" class="form-control"/>      
         </div>
           <div class="col-xs-7" style="text-align:left;font-weight:800">Mostrar importe en letras </div>
     </div>
    


          </div>
 </div>
    

    </div>
     

</div> 

              <div class="row" id="Pecepcion" style="  display:none;  background: rgba(245, 245, 245, 0.51);margin-left:0px; margin-right:0px;  margin-top:5px; padding:20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
   <div class="col-xs-12">

        <div class="col-xs-4"> 
              <select id="CmbPerc" class="cmbBuscar form-control"  style="width: 100%">  </select> 
             
                </div>
   
          <div class="col-xs-1">Importe</div>
         <div class="col-xs-2"> 

                <asp:TextBox ID="TxtImpPerc" runat="server" CssClass="form-control"  placeholder="$"  onkeypress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} "   Text="0"  onfocus="onFocus(this)" 
  ></asp:TextBox>

                </div>
     
         <div class="col-xs-3"> 
             <input id="TxtObsPerc" type="text" class="form-control" style="width:100%; " placeholder="Observaciones"  >
                </div>
          <div class="col-xs-2">
              <button id="BtnAddPerc" type="button" class="btn2  btn-info  " onclick="AddPerc()">
    <span><strong>+ Agregar</strong> </span> 
    </button>

          </div>

                </div>
               <div class="col-xs-12">
    <div id="ResultadoPerc"  style="overflow-y: auto; overflow-x: hidden; min-height : 150px; width: 100%; background-color:rgb(240, 244, 251) ">

       
    </div>
        <br />

           
   
        
          <label for="TxtTotal" class="control-label   pull-left" style="  padding: 10px;     font-size: 16px;" >
              
               <strong>  <span id="IdTotalLetra2" style=" display:none"></span> </strong></label>


          <label for="TxtTotal" class="control-label col-xs-8  pull-right" style=" background-color:#eceae9 ;padding: 10px;     font-size: 24px;" >
              
               <strong> TOtal Percepciones e Impuestos: <span id="IdTotal2" style="color: red;">0</span> </strong>$</label>

    </div>

 
    <div style="margin:auto;    text-align: center; margin-top:5px">
      <%--  msg de error en la pantalla principal--%>
         <asp:Label ID="Label7" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
    
</div>
        

 <div class="row"  style="  padding-top:5px; padding-left:15px;padding-right:15px">

  
 
  <div class="col-xs-12" style="margin-top:6px; background: -webkit-linear-gradient(top,#555,#333); text-align:left;  text-shadow: #969696 0.1em 0.1em 0.2em;   border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px; color:white;">&nbsp;&nbsp;   Condiciones de Venta  </div>

<div    class="row"  style="text-align: right; "  > 

        <div class="col-xs-2">  
        
            <a class="tooltips pull-left" onclick="verMasCondicion()" > <img src="/images/tarjeta-de-credito.png" style="background-position:50%; background-repeat:no-repeat;cursor:pointer"> <span>Ver más</span></a>

           <label for="formadepago1" style="padding-right:2px">Contado</label>
            <input   id="ckContado"  type="checkbox"   onchange="efectivo()">
 
        </div>

          <div class="col-xs-1"> 
           <label for="formadepago1" style="padding-right:2px"> Débito </label>
            <input  id="ckTj1"   type="checkbox" onclick="tarjetaj1()" >
        </div>

          <div class="col-xs-2"> 
           <label for="formadepago1" style="padding-right:2px">Tarjeta de Crédito </label>
            <input    id="CkTj2"    type="checkbox" onclick="tarjetaj()" >
        </div>

          <div class="col-xs-1"> 
           <label for="formadepago1" style="margin-left:-15px">CtaCte </label>
             <input    id="CkCtacte"    type="checkbox" onclick="ctacte1()" >
        </div>

       
    <div class="col-xs-2"> 
           <label for="formadepago1" style="padding-right:2px">Mercado Pagos
 </label>
            <input    id="Ck30dias" type="checkbox">
        </div>

        
    <div class="col-xs-2"> 
           <label for="formadepago1" style="padding-right:2px">Tranferencia
 </label>
            <input    id="Cktranferencia" type="checkbox" onclick="tranferenciajs()">
        </div>
        
     <div class="col-xs-1" > 
           <label for="formadepago1" style="margin-left: -4px;">Cheque </label>
            <input   id="CkCheque"    type="checkbox" onclick="Cheque1()">
        </div>

        <div class="col-xs-1"> 
           <label for="formadepago1" style="padding-right:2px">Otra </label>
            <input    id="CkOtra" type="checkbox">
        </div>

    </div>
  
     <div id="pnlCondicionVta" style="display:none"> 
<div class="col-xs-6"> 

         <div class="form-horizontal">
        
          <div class="form-group" style="background-color: seashell; display:none " id="efectivo1">
         <label for="TxtCliente" class="control-label col-xs-6">Pago en efectivo $ </label>
                <div class="col-xs-3">

            
       <input id="TxtPagoEfetivoEnt"  onKeyPress="return acceptNum2(event, this.value)"   value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="" />               
                       </div>
           <div class="col-xs-3">
      
  <input id="TxtPagoEfetivo"   onfocus="onFocus(this)" autocomplete="off"  onblur="onBlur(this)"  onKeyPress="return acceptNum2(event, this.value)"  value="0" type="text" onkeydown="if (event.keyCode == 13) {  return false;} " class="form-control" style="" />
     
     </div>
      </div>
      
             
             
                  <div class="form-group"   id="Ctacte2" style="display:none">
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
        
          <div class="form-group"   id="tarjetaj1" style="display:none">
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
      
     <div class="form-group" id="cheque2" style="display:none">
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
</div>
 




<div class="row"  style="    background: rgba(245, 245, 245, 0.51);margin-left:0px; margin-right:0px;  margin-top:5px; padding:20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
 

<div class="col-md-12 " style="margin-top:6px; background: -webkit-linear-gradient(top,#555,#333); text-align:left;  text-shadow: #969696 0.1em 0.1em 0.2em;   border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px; color:white">
      <div class="col-md-6 " style="padding-top:5px" >  
         <a class="tooltips2 btn2" style="cursor:pointer ;   background-color: darkorange;
    color: white; " onclick=" VerManual()">  
             
             
               Ingreso Manual de Producto/Servicio 
        &nbsp; 
              
             <img src="/images/cesta-de-la-compra-boton-agregar.png" style="height: 26px;"/>        
<span> Articulo no perteneciente al inventario DB </span></a>
</div>

    
      <div  class="col-md-6 "  style=" padding-top: 0px;
    float: right;
    text-align: right;">
    


               <a class=" btn2" id="btnAdd" style="cursor:pointer ;   background-color: red;
    color: white; " onclick="VerProv()">  
             
             
              + Agregar Producto/Servicio del Inventario 
   </a>
 </div> 
 
    </div>
  
        
<div class="row">
    <div class="col-xs-12">
    <div id="ResultadoProv"  style="overflow-y: auto; overflow-x: hidden; min-height : 150px; width: 100%; background-color:rgb(240, 244, 251) ">

        <table id="tabla_fact_det"></table>
    </div>
        <br />

            <div  class="control-label col-xs-5  pull-left hidden"  id="condicion2" > 
        <a class="tooltips" style="cursor:pointer; background-color:coral ;padding: 10px; " onclick="VerCondicion()"> CONDICIÓN DE VENTA &nbsp <img src="../../../images/cheque.png"> 
       
<span>Forma de Pago </span></a> </div>
   
        
          <label for="TxtTotal" class="control-label   pull-left" style="  padding: 10px;     font-size: 16px;" >
              
               <strong>  <span id="IdTotalLetra" style=" display:none"></span> </strong></label>


          <label for="TxtTotal" class="control-label col-xs-5  pull-right" style=" background-color:#eceae9 ;padding: 10px;     font-size: 24px;" >
              
               <strong> TOTAL: <span id="IdTotal" style="color: red;">0</span> </strong>$</label>

    </div>

 
    <div style="margin:auto;    text-align: center; margin-top:5px">
      <%--  msg de error en la pantalla principal--%>
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
   
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            
       

</div> 


      </div>

 
  
                    
                    <div class="row" style="margin-bottom:10px">
<div class="col-xs-12"> 
      <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >

           <input id="hddProd" type="hidden" />
             
             <input id="hddTotalOri" type="hidden"  value="0"/>
             
              <button id="btnAgregar1a" type="button"  class="btn2 btn-primary" onclick="AltaFact()" >
    <span id="btnAgregar1aIco" class=" glyphicon glyphicon-print"></span> Generar 
 </button>
    
 

        <button id="btnVolver1a" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
    
               

           
 
                     


               </div>
    </div>
</div>

               <!-- Modal manual-->
  <div class="modal fade" id="ModalManual" role="dialog" style="display:none"  >
    <div class="modal-dialog" style="width:80%">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">

              <button type="button" class="close" data-dismiss="modal">×</button>
         <div class=" col-xs-6 " style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;">Ingreso Manual</div>
 </div>  
          
        <div class="modal-body">

         <div  style=" background:rgba(245, 245, 245, 0.51);  margin-left:20px; margin-right:20px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
    <div class="row" style="padding:10px">


      <div class="col-md-4">
      <div class="form-horizontal">
         <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Venta</div>
  
        <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Tipo: </label>
         <div class="col-xs-8">

  <select  id="Main_CmbTipoArticulo" class="form-control">
	<option value="ARTICULO">ARTICULO</option>
	<option value="SERVICIO">SERVICIO</option>
	<option value="BIENES DE USO">BIENES DE USO</option>
	<option value="MATERIA PRIMA">MATERIA PRIMA</option>

</select>
      
         </div>
           
     </div>
       
          
          
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">IVA VENTA : </label>
         <div class="col-xs-8">

   <asp:DropDownList ID="CmdIva" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem Value="0.21">IVA General (21%)</asp:ListItem>
                                            <asp:ListItem Value="0.105">IVA Diferencial (10.5%)</asp:ListItem>
                                            <asp:ListItem Value="0.27">IVA Diferencial (27%)</asp:ListItem>
                                            <asp:ListItem Value="0">Exento (0%)</asp:ListItem>
                                            
                                             
                                        </asp:DropDownList>
      
         </div>
           
     </div>
   
                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">IBB: </label>
         <div class="col-xs-8">

   <asp:DropDownList ID="cmbIbb" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID"> 
                                             
                                        </asp:DropDownList>
      
         </div>
           
     </div>  
          
        
            <div class="col-md-12  " style="display:none;background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Compra</div>
   <div class="form-group" style="display:none">
         <label for="inputName" class="control-label col-xs-4">IVA COMPRA : </label>
         <div class="col-xs-8">

   <asp:DropDownList ID="CmbIvaCompra" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem Value="0.21">IVA General (21%)</asp:ListItem>
                                            <asp:ListItem Value="0.105">IVA Diferencial (10.5%)</asp:ListItem>
                                            <asp:ListItem Value="0.27">IVA Diferencial (27%)</asp:ListItem>
                                            <asp:ListItem Value="0">Exento (0%)</asp:ListItem>
                                             
                                        </asp:DropDownList>
      
         </div>
           
     </div>
   

           <div class="col-md-12  " style="display:none;background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Cuentas Contables</div>
           <div class="form-group"  style="display:none">
         <label for="inputName" class="control-label col-xs-4">VENTAS:</label>
         <div class="col-xs-8">

  
               <select id="Main_CmbVtas" class="cmbBuscar form-control"  style="width: 100%">  </select> 
             


      
         </div>
           
     </div>
        
          
          <div class="form-group" style="display:none">
         <label for="inputName" class="control-label col-xs-4"> COMPRA: </label>
         <div class="col-xs-8">
 
      
                <select id="Main_CmbCompras" class="cmbBuscar form-control"  style="width: 100%">  </select> 
             



         </div>
           
     </div>

          </div>

      </div>
      
         <div class="col-md-8">
             <div class="form-horizontal">
                      <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px"> Servicio</div>
 
              <div class="form-group">
         <label for="inputName" class="control-label col-xs-2">Descripción: </label>
         <div class="col-xs-10">
 
                                             
                  <asp:TextBox ID="TxtDescripManual" runat="server"  CssClass="form-control"    TextMode="MultiLine"></asp:TextBox>                              
                                     
      
         </div>
           
     </div>          
     <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Precio Venta</div>
                 <div class="form-group">

                        <label for="inputName" class="control-label col-xs-1" style="display:none" >U.Med </label>
       
                       <div class="col-xs-1">
                           <select id="cmbUnidad" class=" form-control" style="display:none">
  <option value="7" style="padding-left:10px;"> unidades</option>
                               <option value="1" style="padding-left:10px;"> kilogramos</option>
                               <option value="2" style="padding-left:10px;"> metros</option>
                               <option value="3" style="padding-left:10px;"> metros cuadrados</option>
                               <option value="4" style="padding-left:10px;"> metros cúbicos</option>
                               <option value="5" style="padding-left:10px;"> litros</option>
                               <option value="6" style="padding-left:10px;"> 1000 kWh</option>
                              <option value="8" style="padding-left:10px;"> pares</option><option value="9" style="padding-left:10px;"> docenas</option><option value="10" style="padding-left:10px;"> quilates</option><option value="11" style="padding-left:10px;"> millares</option><option value="14" style="padding-left:10px;"> gramos</option><option value="15" style="padding-left:10px;"> milimetros</option><option value="16" style="padding-left:10px;"> mm cúbicos</option><option value="17" style="padding-left:10px;"> kilómetros</option><option value="18" style="padding-left:10px;"> hectolitros</option><option value="20" style="padding-left:10px;"> centímetros</option><option value="25" style="padding-left:10px;"> jgo. pqt. mazo naipes</option><option value="27" style="padding-left:10px;"> cm cúbicos</option><option value="29" style="padding-left:10px;"> toneladas</option><option value="30" style="padding-left:10px;"> dam cúbicos</option><option value="31" style="padding-left:10px;"> hm cúbicos</option><option value="32" style="padding-left:10px;"> km cúbicos</option><option value="33" style="padding-left:10px;"> microgramos</option><option value="34" style="padding-left:10px;"> nanogramos</option><option value="35" style="padding-left:10px;"> picogramos</option><option value="41" style="padding-left:10px;"> miligramos</option><option value="47" style="padding-left:10px;"> mililitros</option><option value="48" style="padding-left:10px;"> curie</option><option value="49" style="padding-left:10px;"> milicurie</option><option value="50" style="padding-left:10px;"> microcurie</option><option value="51" style="padding-left:10px;"> uiacthor</option><option value="52" style="padding-left:10px;"> muiacthor</option><option value="53" style="padding-left:10px;"> kg base</option><option value="54" style="padding-left:10px;"> gruesa</option><option value="61" style="padding-left:10px;"> kg bruto</option><option value="62" style="padding-left:10px;"> uiactant</option><option value="63" style="padding-left:10px;"> muiactant</option><option value="64" style="padding-left:10px;"> uiactig</option><option value="65" style="padding-left:10px;"> muiactig</option><option value="66" style="padding-left:10px;"> kg activo</option><option value="67" style="padding-left:10px;"> gramo activo</option><option value="68" style="padding-left:10px;"> gramo base</option><option value="96" style="padding-left:10px;"> packs</option><option value="98" style="padding-left:10px;"> otras unidades</option>               
                     </select>           
                            </div>     
                     <label for="inputName" class="control-label col-xs-1" style="display:none">P.Uni</label>
         <div class="col-xs-2">
             <div style="display:none"> 
             <asp:TextBox ID="TxtNetoMaual" runat="server" CssClass="form-control"  placeholder="$"  onkeypress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} "   Text="0"  onfocus="onFocus(this)" 
 onblur="onBlur(this)"  ></asp:TextBox>
                  </div>
               </div>   
         <label for="inputName" class="control-label col-xs-1" >Cant. </label>
       
                       <div class="col-xs-1">
             <asp:TextBox ID="TxtCantManual" onfocus="onFocus(this)" placeholder="1" onblur="onBlur(this)"  runat="server"  CssClass="form-control" onkeypress="return acceptNum(event)" style="width:50px;" Text="1"   ></asp:TextBox>
               </div>    
                           
    
                 
     
         <label for="inputName" class="control-label col-xs-1">Precio</label>
         <div class="col-xs-2">
             <asp:TextBox ID="TxtFinalManual" runat="server" CssClass="form-control" placeholder="$"   onkeypress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} "  Text="0"  onfocus="onFocus(this)" 
 onblur="onBlur(this)"></asp:TextBox>
               </div>           
     </div>           
                     <div class="form-group">
               
                         <label for="inputName" class="control-label col-xs-1" >Desc.% </label>
       
                       <div class="col-xs-2">
           <input type="text" id="TxtDescuento2" class="form-control" placeholder="0" value="0" onfocus="onFocus(this)" onblur="onBlur(this)" onkeypress="return acceptNum2(event, this.value)" autocomplete="off">
                           </div>  
         <div class="col-xs-1"> </div> 
                         
                         <label for="inputName" class="control-label col-xs-8" style="margin:auto;text-align: left"> 
             <button id="BtnAddManual" type="button" class="btn2  btn-info  " onclick="AddArtManual()">
    <span  ><strong>+ Agregar</strong> </span> 
    </button>              <button type="button" class="btn2 btn-danger" data-dismiss="modal"><strong>X</strong> Cerrar</button>
 
             </label>
     </div>
               
                          <div class="form-group" style="display:none">
               
         <label for="inputName" class="control-label col-xs-2">
       
      <strong>     Recalcular</strong>
         </label>
        <label for="inputName" class="control-label col-xs-2"> 

                <input id="Ckrecal" type="checkbox" class=" pull-left"  checked="checked" />
        </label>
          
         

                              <div class="col-xs-8"></div>
     </div>
                 
             
             </div>


 

</div>
    </div>

<script>
    function ListarIBB() {
        try {

            var json = JSON.stringify
      ({
          "v_tipo": '',
          "v_valor": ''

      });

            $.ajax({
                type: "POST",
                url: "Tabla_iibb.aspx/WsListar_kx_iibb",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: (function (Resultado) {

                    var Especialidad = Resultado.d;

                    $('#Main_cmbIbb').empty();


                    $.each(Especialidad, function (index, especialidades) {
                        $('#Main_cmbIbb').append(
                              $('<option></option>').val(especialidades.valor).html(especialidades.Nombre)
                            );

                    });
                }),
                error: errores
            });


        } catch (e) {
            alert(e.message);
        }
    }

    $("#Main_CmdIva").change(function () {
        if ($("#Ckrecal").is(':checked')) {
            CalNeto();
        }
    });

    $("#Ckrecal").change(function () {
        if ($("#Ckrecal").is(':checked')) {
            CalNeto();
        }
    });

    $("#Main_TxtCantManual").blur(function () {
        if ($("#Ckrecal").is(':checked')) {
            CalNeto();
        }

    });

       $("#TxtPagoEfetivo").blur(function () {
        if ($("#TxtPagoEfetivo").val()=='') {
            $("#TxtPagoEfetivo").val('0');
              $("#TxtPagoEfetivoEnt").val('0');
            
        }

    });


    
    $("#Main_TxtCantManual").keyup(function (e) {
        if (e.keyCode == 13) {
            if ($("#Ckrecal").is(':checked')) {
                CalNeto();
            }

        }
    });

    $("#Main_TxtNetoMaual").blur(function () {
        if ($("#Main_TxtNetoMaual").val() == "") {
            $("#Main_TxtNetoMaual").val('0');
        }
        if ($("#Ckrecal").is(':checked')) {
            CalNeto();
        } 
    });
    $("#Main_TxtNetoMaual").keyup(function (e) {
        if (e.keyCode == 13) {
            if ($("#Ckrecal").is(':checked')) {
                CalNeto();
            }
        }
    });

    $("#Main_TxtFinalManual").blur(function () {

        if ($("#Main_TxtFinalManual").val() == "") {
            $("#Main_TxtFinalManual").val('0:00');
        }
        if ($("#Ckrecal").is(':checked')) {
            CalFinal();
        }
         
    });
    $("#Main_TxtFinalManual").focus(function () {

        if ($("#Main_TxtFinalManual").val() == "0.00") {
            $("#Main_TxtFinalManual").val('');
        }
        

    });

    $("#Main_TxtFinalManual").keyup(function (e) {
        if (e.keyCode == 13) {
            if ($("#Ckrecal").is(':checked')) {
                CalFinal();
            }
        }
    });

    
            function tranferenciajs() {

                 if ($("#Cktranferencia").is(":checked")) {
   $("#TxtPagoBco").val( $("#IdTotal").text());
           $("#TxtPagoBco").change();

            } else {
             
                  $("#TxtPagoBco").val("0");
           $("#TxtPagoBco").change();
            }

            }



    $("#Main_TxtCantManual").blur(function () {

        if( $("#Main_TxtCantManual").val()==""){
            $("#Main_TxtCantManual").val('1');
        }

    });
    function CalNeto() {
        var neto = 1 + parseFloat($("#Main_CmdIva").val());       
        $("#Main_TxtFinalManual").val(parseFloat(parseFloat($("#Main_TxtNetoMaual").val() * parseFloat(neto)).toFixed(2) * parseFloat($("#Main_TxtCantManual").val())).toFixed(2));
         
    }
    function CalFinal() {
             var neto = 1 + parseFloat($("#Main_CmdIva").val()); 
             $("#Main_TxtNetoMaual").val(parseFloat(  parseFloat($("#Main_TxtFinalManual").val()) / neto).toFixed(2)); 
    }
</script>
       </div> 
               </div>
  
      </div>
      
    </div>
   
 </div> 
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
                  <input id="TxtMontoT" type="text" onfocus="onFocus(this)" autocomplete="off"  onblur="onBlur(this)"  onKeyPress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter"  value ="0"   class="form-control"/>
                   
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
                  <input id="TxtMontoC" onfocus="onFocus(this)" autocomplete="off"  onblur="onBlur(this)"   type="text" onkeydown="if (event.keyCode == 13) {  return false;} // evita el submit presionan enter" onKeyPress="return acceptNum2(event, this.value)"  value ="0"   class="form-control"/>
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
         
          <option value="0">Razón Social</option>          
 
         
         
          
           
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
        
        <div class="modal-footer" style="text-align: center;">
          
         <%--   <button   type="button" class="btn2 btn-info   " onclick="CliNuevo()">
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>--%>
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



    
                 <div class="form-group" style="display:none">

         <label for="TxtNombre" class="control-label col-xs-4">Cod.Cliente </label>
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
                 
         </div>
               <div class="col-xs-2">
                   <button id="btnVerPersona" type="button" class="btn2 btn-default " onclick="Cuit()">
    <span class=" glyphicon glyphicon-search"></span> 
 </button>

               </div>    <div class="col-xs-2">
      <a id="afip" class="tooltips" style="cursor:pointer ; display:none" href="#"   >        <img src="../../images/afip.jpeg" style="width:88px" />
           <span>Constancia</span></a>
         
         </div>
     </div>
                  <div class="form-group">
         <label for="l" class="control-label col-xs-4">Razón Social</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

       <div class="form-group" style="display:none">
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
        <asp:TextBox ID="valorFoco" runat="server"></asp:TextBox>
          
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

       <div style="display:none">
        <input id="TxtAnularTipo" type="text" />
         <input id="TxtAnularNro" type="text" />
            <input id="TxtAnularFecha" type="text" />
        </div>
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
          <option value="9">Todos</option>
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

      <div class="alert alert-danger alert-dismissable" id="MsgStock" style="display:none;text-align:left;font-weight:bold">
  
 <div id="MsgStocklbl" style="text-transform:uppercase"></div>
</div>

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
    <div class="row">
  
</div>


 

   

    </div>


 
        
<div class="row">
  
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label6" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField6" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtRpid" runat="server"></asp:TextBox>
         <asp:TextBox ID="TxtTipoRep" runat="server"></asp:TextBox>
    </div>
</div>
        
   
</div> 
              </div>
        
      </div>
      
   


           <div class='modal fade' id='Modalkx_Precio' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-md'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 
EDITAR ARTICULO
   <button type='button' class='close' data-dismiss='modal'>&times;</button>

 </div> 

 <div class='modal-body'> 
<!-- Modal cuerpo--> 
        <div class="form-horizontal">

                   <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4"> </label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtIdPop" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
            <div class="col-xs-4"></div>
     </div>

                   <div class="form-group" >
         <label for="TxtNombre" class="control-label col-xs-4"> Cantidad </label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtCantPop" runat="server" class="form-control" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" onblur="onBlur(this)" style="width:100px;" ></asp:TextBox>
      
         </div>
            <div class="col-xs-4"></div>
     </div>

            
              <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4"> </label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtIvaPop" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>
            <div class="col-xs-4"></div>
     </div>

               

          


              <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4">Precio Neto $:</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtNetoPop" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
            <div class="col-xs-4"></div>
     </div>


                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Precio por Unidad Final $:</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtFinalPop" runat="server" onchange="modificarPopPrecio()" class="form-control" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" onblur="onBlur(this)" style="width: 100px;" placeholder="0.00"  ></asp:TextBox>
      
         </div>
            <div class="col-xs-4"></div>
     </div>

            
                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Descuento %:</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtDescPop" runat="server" onchange="modificarPopPorcentaje()" class="form-control" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" onblur="onBlur(this)" style="width: 100px;" placeholder="0"  ></asp:TextBox>
      
         </div>
            <div class="col-xs-4"></div>
     </div>

                <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4">Original:</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtOriginalPop" runat="server" class="form-control" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" onblur="onBlur(this)" style="width: 100px;" placeholder="0"  ></asp:TextBox>
      
         </div>
            <div class="col-xs-4"></div>
     </div>
                       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> </label>
         <div class="col-xs-4">

     <button id="btnCambiarP" type="button" class="btn2 btn-primary" onclick="GuardarModalPrecio()">
   Guardar 
 </button>
      
         </div>
            <div class="col-xs-4"></div>
     </div>


        




         </div> 





 </div> 

  </div>   
      </div>  
 </div>  

      
   
     
        <script>
            function verMasCondicion() { 
              
if(! $("#pnlCondicionVta").is(':visible'))
{
      $("#pnlCondicionVta").show();
} else {
      $("#pnlCondicionVta").hide();
}
     } 
         

        function onBlur(obj) {
                 if ($(obj).val() == '') {
                    $(obj).val( $("#Main_valorFoco").val()) ;
                } 
            }
            function onFocus(obj) {

                  $("#Main_valorFoco").val($(obj).val()); 
                   $(obj).attr('placeholder', 
                $(obj).val()); 
                   $(obj).val(''); 
                   return; 
            }

        // barcod

        var  tableA = document.getElementById("tabla_fact_det");
        function ModalPrecio(ids, obj) { 
          
                    
                    tableA = document.getElementById("tabla_fact_det");

                    
            if (tableA != null) {
              
                        for (var i = 1; i < tableA.rows.length; i++) { 
                            if ( $(tableA.rows[i]).find('td:eq(3)').text() == ids) { 
                                $("#Main_TxtFinalPop").val($(tableA.rows[i]).find('td:eq(10)').text());
                                $("#Main_TxtDescPop").val($(tableA.rows[i]).find('td:eq(12)').text());
                                 $("#Main_TxtOriginalPop").val($(tableA.rows[i]).find('td:eq(13)').text());
                                $("#Main_TxtIvaPop").val($(tableA.rows[i]).find('td:eq(9)').text());
                                  $("#Main_TxtCantPop").val($(tableA.rows[i]).find('td:eq(7)').text());

                                $("#Main_TxtIdPop").val($(tableA.rows[i]).find('td:eq(4)').text() );

                                  var miva = parseFloat((parseFloat($("#Main_TxtIvaPop").val().replace('%', '').replace(',', '.')) / parseFloat("100")) + parseFloat("1")).toFixed(2);
        
       if ($("#Main_TxtFinalPop").val() =="") {
         $("#Main_TxtFinalPop").val("0");
       } 
                            $("#Main_TxtNetoPop").val(   parseFloat(  (parseFloat($("#Main_TxtFinalPop").val().replace(',', '.')).toFixed(2)  /miva ) ).toFixed(2));


                            };
                        }
                    }
             $("#Modalkx_Precio").modal();
            
            }

              $("#Main_TxtFinalPop").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                          $("#btnCambiarP").focus();                
                    }
                });

             $("#TxtDescuento").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                          $("#BtnDep").focus();                
                    }
                });
            function modificarPopPrecio() {


                 $("#Main_TxtDescPop").val(  parseFloat( parseFloat(( parseFloat($("#Main_TxtOriginalPop").val()) - parseFloat( $("#Main_TxtFinalPop").val() )) * 100 )/ parseFloat($("#Main_TxtOriginalPop").val())).toFixed(2) );

            }

              function modificarPopPorcentaje() {


                 $("#Main_TxtFinalPop").val( parseFloat(parseFloat($("#Main_TxtOriginalPop").val() ) -  parseFloat(( parseFloat($("#Main_TxtOriginalPop").val() ) * parseFloat( $("#Main_TxtDescPop").val()  ) )/ 100 )).toFixed(2) );

            }
               $("#Main_TxtDescPop").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                          $("#btnCambiarP").focus();                
                    }
            });

                $("#btnCambiarP").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                          GuardarModalPrecio();         
                    }
                });
          
        function GuardarModalPrecio() { 
            try {
              
                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "v_id": $("#Main_TxtIdPop").val(),
                              "v_cant": $("#Main_TxtCantPop").val(),
                              "v_deposito":"",
                               "v_lista": "6",
                              "PrecioSelect": $("#Main_TxtFinalPop").val(),
                              "NetoSelect": $("#Main_TxtNetoPop").val() ,
                               "Descuento": $("#Main_TxtDescPop").val()
                          });

                $.ajax({
                    type: "POST",
                    url: "Cbtesvta.aspx/WsModArticulo2",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (result) {

                        $("#Modalkx_Precio").modal('hide');
                        llenarGrilla(result);
                    }
                        )
                          
                       ,
                            error: errores
                });
            } catch (e) {

            }
        }


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
     //   $("#Main_TxtDoc").prop('disabled', true);
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
             $("#Main_TxtFechaPagovto").val(hoy);
   
 
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
            $("#tabsC").show();
            $("#ini").hide();
        });
        $(function () {

            $('#cmbTipoVta').prop('disabled', true);
            ListarIBB();
            ListarTipo();
            $('#tabsC').tabs();
            $('#tabs').tabs();
            $('#tabs2').tabs();
            $('#tabsArt').tabs();
            $(".cmbBuscar").select2();

           //  $( "#CkCtacte" ).prop( "checked", true ).change();

            $("#TxtPagoEfetivo").keyup(function () {
                

                $("#TxtPagoEfetivoEnt").val( parseFloat(  $("#TxtPagoEfetivo").val() )  );

                calcular();

            });
            $("#TxtPagoBco").change(function () {
                $("#TxtPagoBcoEnt").val( $("#TxtPagoBco").val());
                calcular();
            });
             
 
        });

            function limpiarCK() {
                     $("#ckContado").prop("checked", false);
                $("#ckTj1").prop("checked", false);
                $("#CkTj2").prop("checked", false);
                $("#CkCtacte").prop("checked", false);
                $("#CkCheque").prop("checked", false);
                $("#Ck30dias").prop("checked", false);
                $("#CkOtra").prop("checked", false);
                 $("#Cktranferencia").prop("checked", false);
            }
        function calcular() {


           
          
            var totalP = parseFloat($("#TxtPagoEfetivoEnt").val()) + parseFloat($("#TxtPagoBcoEnt").val()) + parseFloat($("#TxTjTotal").val()) + parseFloat($("#TxtChTotal").val());
            var totalF = parseFloat($("#IdTotal").text()) -totalP;
            

            //if ($("#IdTotal").text() == '0' ||$("#IdTotal").text() == '0.00')
            //{
            //    alert('Debe ingresar Articulos a facturar.');

            //    $("#ckContado").prop("checked", false);
            //    $("#ckTj1").prop("checked", false);
            //    $("#CkTj2").prop("checked", false);
            //    $("#CkCtacte").prop("checked", false);
            //    $("#CkCheque").prop("checked", false);
            //    $("#Ck30dias").prop("checked", false);
            //     $("#CkOtra").prop("checked", false);

            //}

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
               // $("#closeCli").click();
                limpiarCli();
            ListarPais();
            $("#cmbPais").val("1").change();
            $("#ModalCliAlta").modal();

        }
        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

        function gvDel_orden(ids) {
            try {
                if (confirm("Esta seguro que desea Anular la venta ?")) { 
                   
                      var json = JSON.stringify
                  ({
                      "ids": ids,
                      "user": $("#cmbVendedor").val()

                  });
                $.ajax({
                    type: "POST",
                    url: "Cbtesvta.aspx/WmBajaOrden",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (result) {

                        Buscar_orden();
                    }
                        ),
                    error: errores
                    });

                      }
            } catch (e) {
                alert(e);
            }

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

                            if ($(tableM.rows[i]).find('td:eq(9)').text() != "") {
                                $("#cmbPrecio").val($(tableM.rows[i]).find('td:eq(9)').text());
                            } else {
                                document.getElementById("cmbPrecio").selectedIndex = "0";
                            }

                            $("#Main_TxtClienteNombre").val($(tableM.rows[i]).find('td:eq(3)').text());
                            $("#Main_TxtTel").val($(tableM.rows[i]).find('td:eq(6)').text() + '- ' + $(tableM.rows[i]).find('td:eq(6)').text());
                            $("#hddIdCli").val($(tableM.rows[i]).find('td:eq(1)').text());
                            $("#Main_TxtDoc").val($(tableM.rows[i]).find('td:eq(5)').text());
                            $("#TxtTipoDoc").text($(tableM.rows[i]).find('td:eq(4)').text());
                            
                            BsqCbteAsc( $("#hddIdCli").val());



                        };
                    }
                }


                $("#ModalCli").modal('hide');

            } catch (e) {
                alert(e.message + '-2');
            }

            }

            function BsqCbteAsc(ids) {
                try {

                         var json = JSON.stringify
                            ({
                                "v_id":ids 
                            });
                          $.ajax({
                              type: "POST",
                              url: "Cbtesvta.aspx/WsListarAsc",
                              data: json,
                              contentType: "application/json; charset=utf-8",
                              dataType: "json",
                              success: (function (Resultado) {
                                   var Especialidad = Resultado.d;
              $('#cmbCbateAsc').empty();
           //   $('#cmbCbateAsc').append('<option value="0">- -</option>');
              $.each(Especialidad, function (index, especialidades) {
                  
                      $('#cmbCbateAsc').append(
                           $('<option  selected></option>').val(especialidades.Id).html(especialidades.nombre)
                         );
               
              }); 
                              } 
                                  ),
                              error: errores
                          });

                } catch (e) {
                    alert(e);
                }


            }

        function consumidor() {
            if ($("#Chfinal").is(":checked")) {
                $("#Main_TxtClienteNombre").val("CONSUMIDOR FINAL");
                $("#Main_TxtTel").val('');
                $("#hddIdCli").val('0');
                $("#Main_TxtDoc").val('99');
                $("#TxtTipoDoc").text('DNI');
                $("#Main_TxtDoc").click();

            } else {

                $("#Main_TxtClienteNombre").val('');
                $("#Main_TxtTel").val('');
                $("#hddIdCli").val('');
                $("#Main_TxtDoc").val('');
                $("#TxtTipoDoc").text('CUIT/DOC');

            }

        }


        function letras() {
            
            if ($("#ChLetra").is(":checked")) {
                
                $("#IdTotalLetra").show();
                

            } else {
                $("#IdTotalLetra").hide();
            }

        }

        function Cheque1() {

            if ($("#CkCheque").is(":checked")) {

                $("#cheque2").show();
                 $("#TxtChTotal").val($("#IdTotal").text());
                $("#TxtMontoC").val($("#IdTotal").text());
                

            } else {
                $("#cheque2").hide();
                $("#TxtMontoC").val("0");
                $("#TxtChTotal").val("0");
            }
            calcular();
        }

            function ctacte1() {


 //            if ($("#IdTotal").text() == '0' || $("#IdTotal").text() == '0.00')
 //            {
 //                alert(" Debe ingresar Articulos a facturar."); $("#CkCtacte").attr("checked", false);  return;
 //}

            if ($("#CkCtacte").is(":checked")) {

              //  $("#Ctacte2").show();
                
            $("#TxtPagoBco").val( $("#IdTotal").text());
           $("#TxtPagoBco").change();

            } else {
                //$("#Ctacte2").hide();
                  $("#TxtPagoBco").val("0");
           $("#TxtPagoBco").change();
            }

            
            

            }

        function tarjetaj1() {
             if ($("#ckTj1").is(":checked")) {

                $("#tarjetaj1").show();
                
                $("#TxtMontoT").val($("#IdTotal").text()); 
                 $("#TxTjTotal").val($("#IdTotal").text()); 
                
                 calcular();

            } else {
                $("#tarjetaj1").hide();
                $("#TxtMontoT").val('0'); 
                 $("#TxTjTotal").val('0'); 
                 calcular();
            }

        }


            function tarjetaj() {

            if ($("#CkTj2").is(":checked")) {

                $("#tarjetaj1").show();
                $("#TxtMontoT").val($("#IdTotal").text()); 
                $("#TxTjTotal").val($("#IdTotal").text()); 
                

                 calcular();

            } else {
                $("#tarjetaj1").hide();
                $("#TxtMontoT").val('0'); 
                 $("#TxTjTotal").val('0');
                 calcular();
            }
        }


        function efectivo() {
          
            if ($("#ckContado").is(":checked")) {
               
                $("#efectivo1").show();
                $("#TxtPagoEfetivo").val($("#IdTotal").text());                
                $("#TxtPagoEfetivoEnt").val( parseFloat(  $("#TxtPagoEfetivo").val() )  ); 
            } else {
                 $("#TxtPagoEfetivo").val('0');                
                $("#TxtPagoEfetivoEnt").val( parseFloat(  $("#TxtPagoEfetivo").val() )  );
                $("#efectivo1").hide();

            }
             calcular();
        }

        function resultadoCli(Resultado) {
            var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#ResultadoCli").show();
            $("#ResultadoCli").empty();
            Tabla_Titulo = "<table   id='grillaCli' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Id</th> <th>Manual</th><th>Nombre</th><th>TipoDoc</th><th>N°Doc</th><th>Tel</th><th>Cel</th><th>Dirección</th><th>LPrecio</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {
                var nomb2 = pacientes.Nombre.concat(pacientes.Apellido);
                Tabla_Datos = Tabla_Datos + "<tr onclick='llenarArt(this)' style='cursor:pointer;'> <td style='background-image:url(/images/seleccionar-objeto.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + ' ' + pacientes.Apellido + "</td><td>" + pacientes.Tipo_Doc + "</td><td>" + pacientes.Doc_No + "</td><td>" + pacientes.Emp_Tel + "</td><td>" + pacientes.Emp_Cel + "</td><td>" + pacientes.Calle + ' N° ' + pacientes.Numero + "</td><td>" + pacientes.ListaP+ "</td></tr>";
            });

            Tabla_Fin = "</tbody></table>";
            $("#ResultadoCli").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();

        }

        function AltaCliJs() {
            try {
               
                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                    // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidaMain_TxtNombredo adentro
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
                
                $("#TxtTipoDoc").text($("#CmbTipoDoc").val() );
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
                    async: false,
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
                    async:false,
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
                    async: false,
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
                    async:false,
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


        function ListarTipo() {
            try {
              
                var json = JSON.stringify
          ({

               
          });

                $.ajax({
                    type: "POST",
                    url: "Cbtesvta.aspx/WsListarTipo",
                    data: json,
                    async:false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: CargarTipo,
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        function CargarTipo(Resultado) {

            var Especialidad = Resultado.d;

            $('#cmbTipoCbate').empty();

            $('#cmbTipoCbate').append('<option value="0">- -</option>');
            $.each(Especialidad, function (index, especialidades) {
                 

                $('#cmbTipoCbate').append(
                         $('<option  selected></option>').val(especialidades.id_pais).html(especialidades.nombre)
                       );
                
            });


            //select un item  para select2
            $("#cmbTipoCbate").val(0).change();
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
              
               AjaxSendLoadStart();
              ListarDepartamento("1");
           
              var esTipo = "DNI";
              var esTipo2 = "NO";
              if ($("#CmbTipoDoc").val() == "CUIT") {
                  esTipo = "CUIT";
                  esTipo2 = "SI";
              }
              if ($("#CmbTipoDoc").val() == "DNI") {
                  esTipo = "DNI";
                  esTipo2 = "SI";
              }
              var mDoc = $("#Main_TxtCuit").val();
              if (esTipo2 == "SI") {
                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                             ({
                                 v_doc: mDoc,
                                 v_tipo: esTipo
                             });

                  $.ajax({
                      type: "POST",
                      url: "Clientes.aspx/validad_doc",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {
                          var Pacientes = Resultado.d;
                          
  if (Pacientes.Nombre != null) {

                              $("#cmbAfip").val(Pacientes.Iva);

                              var ape = Pacientes.Apellido==null? "":Pacientes.Apellido;
                              var nom = Pacientes.Nombre;

                              $("#Main_TxtNombre").val(nom +' ' + ape);
     // $("#Main_TxtApellido").val(ape);


                                $("#Main_TxtCuit").val(mDoc);
                              $("#CmbTipoDoc").val(esTipo) ;
                              $("#Main_TxtObservacion").val(Pacientes.Observacion);
                              
                              if (Pacientes.Calle != null) {
                                  var calle = Pacientes.Calle;
                                  var nume = Pacientes.Numero;

                                  $("#Main_TxtCalle").val(calle);
                                  $("#Main_TxtNum").val(nume);
                                  $("#Main_TxtCp").val(Pacientes.Cp); 
                                

                                 $("#cmbPais").val("1").change();

                                   $("#cmbProv").val(Pacientes.Provincia).change();
                                  $("#cmbDepartamento").val(Pacientes.Departamento).change();
                                    $("#cmbDistrito").val(Pacientes.Distrito).change();

                                   if ( Pacientes.Departamento == null) {
                                  if (Pacientes.Provincia == "1") {
                                      $("#cmbPais").val("1");

                                      $('#cmbProv').append(

                               $('<option></option>').val("1").html("Buenos Aires")
                             );
                                  } }


                              }
 


                          } else {
                            //  $('#afip').prop('href', '#');

                          }                          

                      }),
                      error: errores


                  });

              }


            

              limpiarCli();
          }




        function Cuit2() {
          
            if ($("#Main_TxtDoc").val() !='') {

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                           ({
                               v_doc: $("#Main_TxtDoc").val(),
                               v_tipo: ''
                           });

                $.ajax({
                    type: "POST",
                    url: "Cbtesvta.aspx/validad_doc2",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Pacientes = Resultado.d;
                       
                        if (Pacientes.Nombre != null) {
                            // Cta_contable == 'NO' es q  lo traigo de afip

                            if (Pacientes.ListaP != "") {
                                $("#cmbPrecio").val(Pacientes.ListaP);
                            } else {
                            document.getElementById("cmbPrecio").selectedIndex = "0";}
                            
                          
                            if (Pacientes.Cta_contable == 'NO') {
                                $("#cmbAfip").val("CONSUMIDOR_FINAL");
                                var ape = Pacientes.Nombre.substr(0, Pacientes.Nombre.indexOf(' '));
                                var nom = Pacientes.Nombre.substr(Pacientes.Nombre.indexOf(' ') + 1);
                             
                                $("#Main_TxtNombre").val(nom);
                                $("#Main_TxtApellido").val(ape);
                                $("#Main_TxtCuit").val(Pacientes.Doc_No);
                                
                                

                                if (Pacientes.Calle != null) {
                                 var calle = Pacientes.Calle.substr(0, Pacientes.Calle.indexOf(' '));
                                var nume = Pacientes.Calle.substr(Pacientes.Calle.indexOf(' ') + 1);

                                $("#Main_TxtCalle").val(calle);
                                $("#Main_TxtNum").val(nume);
                                $("#Main_TxtCp").val(Pacientes.Cp);
                                $("#TxtTipoDoc").text(Pacientes.Tipo_Doc);
                                if (Pacientes.Provincia == "1") {
                                    $("#cmbPais").val("1");
                                    $('#cmbProv').append(
                             $('<option></option>').val("1").html("Buenos Aires")
                           );
                            }
                               

                                }
                                if (Pacientes.Iva == "MONOTRIBUTO") {
                                    $("#cmbAfip").val("MONOTRIBUTO");
                                }

                                if (Pacientes.Iva == "RESPONSABLE INSCRIPTO") {
                                    $("#cmbAfip").val("RESPONSABLE INSCRIPTO");
                                } 

                             AltaCliJs(); 
                            }  if (Pacientes.Cta_contable == 'SI') { 
                               
                                $("#Main_TxtCuit").val(Pacientes.Doc_No);
                                $("#Main_TxtNombre").val(Pacientes.Nombre);
                                $("#Main_TxtApellido").val(Pacientes.Apellido);
                                $("#Main_TxtCalle").val(Pacientes.Calle);
                                $("#Main_TxtNum").val(Pacientes.Numero);
                                $("#Main_TxtCp").val(Pacientes.Cp);

                                $("#Main_TxtClienteNombre").val(Pacientes.Nombre +' '+ Pacientes.Apellido);
                                $("#Main_TxtTel").val( Pacientes.Contac_Cel+ '- ' + Pacientes.Contac_Tel);
                                $("#hddIdCli").val( Pacientes.Id);
                                $("#Main_TxtDoc").val(Pacientes.Doc_No);
                                $("#TxtTipoDoc").text(Pacientes.Tipo_Doc);
                         
                               
                            }
                          
                         
                        }
                        if (Pacientes.Cta_contable == 'NADA') {

                            alert("El número documento ingresado no existe.");
                            $("#Main_TxtDoc").val("");
                             $("#Main_TxtClienteNombre").val("");
                            $("#hddIdCli").val("");

                        }
                    }),
                    error: errores
                });

            }



      
            if ($("#CmbTipoDoc").val() == 'CUIT') {

                ver_cuit($("#Main_TxtCuit").val());
            
            } else {
                $('#afip').hide();
            }
            limpiarCli();
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
            $("#Main_TxtDoc").blur(function () {
                Cuit2();
            });

               $("#Main_TxtDoc").keyup(function (e) {
                if (e.keyCode == 13) {
                    
                    $("#cmbTipoCbate").focus();
                }
        });

            $("#Main_TxtCuit").keyup(function (e) {
                if (e.keyCode == 13) {
                    $("#Main_TxtNombre").focus();
                }
            });
        
        //$("#Main_TxtCuit").blur(function () {
        //    Cuit();
        //});

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

            });

            $("#Main_cmbMoneda").change(function () { 
                if ($("#Main_cmbMoneda").val() == "PES") {
                    $("#TxtCotizacion").val("");
                     $(".cotizacion").hide();
                    return;
                }
                 $(".cotizacion").show();
                 var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "v_id": $("#Main_cmbMoneda").val()
                          });

                        $.ajax({
                            type: "POST",
                            url: "Cbtesvta.aspx/WsCotizacion",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Resultado1) {
                              
                         $("#TxtCotizacion").val(Resultado1.d.replace(',', '.'));
                            }
                                ),
                            error: errores
                });

                
            });



            

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

         

            $("#ModalArt").modal({
                backdrop: 'static',
                keyboard: false
            })
            setTimeout(function (){
        $('#Main_TxtBuscarA').focus();
            }, 900);

            
            limpiarArt();
             $("#Main_TxtBuscarA").val("");
        
        }
         

        $("body").keyup(function (e) {

           //16 up
                                      if (e.keyCode == 40) { //down
                                          highlightFirstRow();
            }

             
            if (e.keyCode == 38) { //up

                                            highlightupRow();
            }

         
                });


          //$("#BtnDep").keyup(function (e) {
          //                            if (e.keyCode == 13) {
          //                                gvProductos();
          //          }
          //      });


          $("#BtnDep").on("keydown", function (event) {
              if (event.which == 13) {
 AddArt();
                 limpiarArt();
                
            }
        });



        // $("#Main_txtCant").focus();
            $("#Main_txtCant").on("keydown", function (event) {
              if (event.which == 13) { 
                   $("#BtnDep").focus();
            }
        });

        


 
 function highlightFirstRow()
 {
      var table = document.getElementById('grillaArt');
     var numRows = table.rows.length;
     var trs = document.getElementById('grillaArt').getElementsByTagName('tr');
    
   

     var selectrow=0;
     for (var i = 1; i+1 < numRows; i++) {

         if ($(trs[i]).hasClass('active')) {
             
            
             selectrow =  i ;
             
            } 

     }
       
     selectrow =   selectrow + 1;
     if (selectrow != numRows && numRows>0) {
        
          $(trs[selectrow]).click();
     }
     
       
     if (numRows > 0) {
            $("#BtnDep").prop("disabled", false);
         
       //  $("#Main_txtCant").val('');
         $("#Main_txtCant").focus();
         var ob = document.getElementById('Main_txtCant');

          $("#Main_valorFoco").val("1"); 
                   $("#Main_txtCant").attr('placeholder', 
               '1'); 
     $("#Main_txtCant").val(''); 


     } else { return;} 

}
 


 function highlightupRow()
 {
    
     /// para arriba
      var table = document.getElementById('grillaArt');
     var numRows = table.rows.length;
     var trs = document.getElementById('grillaArt').getElementsByTagName('tr');
     
     var selectrow=0;
     for (var i = 1; i+1 < numRows; i++) {

         if ($(trs[i]).hasClass('active')) {
             
            
             selectrow =  i ;
             
            } 

     }
       
     selectrow = selectrow - 1;

    

     if (selectrow < 0) {
        
         selectrow = numRows - 2;
     }
      console.log(selectrow);
     if (  numRows>0) {
        
          $(trs[selectrow]).click();
     }
     
         if (numRows > 0) {
            $("#BtnDep").prop("disabled", false); 
         $("#Main_txtCant").focus();
         var ob = document.getElementById('Main_txtCant');

          $("#Main_valorFoco").val("1"); 
                   $("#Main_txtCant").attr('placeholder', 
               '1'); 
     $("#Main_txtCant").val(''); 


     } else { return;} 

}
 
         


          function VerTJ() {
              $("#ModalTJ").modal();
              
          }

          function limpiarArt() {

              $("#MsgStock").hide();
              $("#MsgStocklbl").text('');
              $("#BtnDep").prop("disabled", false);
                $("#Main_TxtFinal").prop("disabled", true);
              $("#tabsArt").tabs({ active: 0 });
              document.getElementById("cmbDep").selectedIndex = "0";

            //  document.getElementById("cmbPrecio").selectedIndex = "0";
              
               $("#cmbPrecio").val('1');
              $("#Main_txtCant").val('1');
               $("#TxtDescuento").val('0');
            $("#hddIdArt").val('0');
            $("#Main_TxtStock").val('');
            $("#Main_TxtNeto").val('');
            $("#Main_TxtFinal").val('');
          //  $("#cmbPrecio").val('1');
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

                                llenarGrilla(Resultado);



                                //$("#ResultadoProv").show();
                                //$("#ResultadoProv").empty();
                                //Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th>Cod_Sis</th><th>Cod_Man</th><th>Descripción</th><th>Cantidad</th><th>Alic</th><th>Precio $</th><th>Sub Total $</th></tr></thead><tbody>";

                                //var sal2 = parseFloat("00.00");
                                //var sal;
                                $.each(Pacientes, function (index, pacientes) {
                                    //sal = parseFloat((parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * parseFloat(pacientes.Cant)));

                                    //Tabla_Datos = Tabla_Datos + "<tr   style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Cant + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + "</td></td></tr>";
                                    //sal2 = sal + sal2;
                               


                                    $("#Main_TxtClienteNombre").val(pacientes.ClienteSelect.Nombre + ' ' + pacientes.ClienteSelect.Apellido);
                                    $("#Main_TxtTel").val(pacientes.ClienteSelect.Emp_Tel + ' ' + pacientes.ClienteSelect.Emp_Cel);
                                    $("#hddIdCli").val(pacientes.ClienteSelect.Id);
                                    $("#Main_TxtDoc").val(pacientes.ClienteSelect.Doc_No);
                                    $("#TxtTipoDoc").text(pacientes.ClienteSelect.Tipo_Doc);

                                    $("#cmbTipoVta").val("2");

                                    alert('aca');
                                    $("#cmbTipoCbate").val("6");


                                });
                               

                                //$("#IdTotal").text(parseFloat(sal2).toFixed(2));
                                //$("#lblSaldo").text(parseFloat(sal2).toFixed(2));

                                //Tabla_Fin = "</tbody></table>";
                                //$("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                                
                            }),
                            error: errores
                        });

                    } catch (e) {
                        alert(e.message);
                    }
            
        }
        var obj1 = '';
            var v_ImpNeto = parseFloat("0");
                var v_ImpTrib = parseFloat("0");
        var v_impIva = parseFloat("0");
        var tienB = "";

        var v_salIvaObj = "";


        var alicDesc = "";
        var obIva = "";
        var BaseImpB = parseFloat("0");
        var ImporteB = parseFloat("0");

        var tienA = "";

        var BaseImpA = parseFloat("0");
        var ImporteA = parseFloat("0");

        var tienC = "";
        var BaseImpC = parseFloat("0");
        var ImporteC = parseFloat("0");


        var tienD = "";
        var BaseImpD = parseFloat("0");
        var ImporteD = parseFloat("0");


        $("#Main_txtCant").on("input", function (e) {
            var input = $("#Main_txtCant");
            var val = input.val();

            if (input.data("lastval") != val) { //  me  toma el total de las caracteres ingresados y no solo el del evento
                input.data("lastval", val);
              
                if (parseInt(val) > 0) {

                    if (parseInt(val) > parseInt($("#Main_TxtStock").val())) {
 
                        $("#BtnDep").prop('disabled', true);
                        $("#MsgStock").show('fade');
                        $("#MsgStocklbl").text('La cantidad disponible en el stock es: ' + $("#Main_TxtStock").val());



                    } else {
                        $("#MsgStock").hide();

                        $("#MsgStock").hide('fade');
                        $("#BtnDep").prop('disabled', false);
                    }


                }


            }

        });
        $("#Main_txtCant").blur(function () {

           
           
        })

               function ListarPerc() {

            try {
 
                $.ajax({
                    type: "POST",
                    url: "Cbtesvta.aspx/WsListarPerc",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#CmbPerc').empty();
                        
                        $.each(Especialidad, function (index, especialidades) {
                            $('#CmbPerc').append(
                                  $('<option data-tri="'+especialidades.anulado+'"></option>').val(especialidades.id_pais).html(especialidades.nombre) 
                                );
                             
 
                         
                        });
           
                          $('#CmbPerc').val('3').trigger('change');
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
            
            function gvDel_kx_percepciones(ids) {
    try {

         if (!confirm("Esta seguro que desea eliminar el regitro ?")) {
             return;  
                        }
          var json = JSON.stringify
          ({ 
          'v_id':ids 
          });
          $.ajax({
        type: "POST",
        url: 'CbtesComprasV2.aspx/gvPerc_del',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success:resultado_kx_percepciones,
        error: erroresJs
          });
      } catch (e) {
        alert(e.message);
                }
            }

               $("#Main_TxtImpPerc").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                        AddPerc();
                    }
                });
                $("#TxtObsPerc").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                        AddPerc();
                    }
                });
            function VerPerc() {
                
if($('#Pecepcion').is(':visible'))
{
    $('#Pecepcion').hide();
} else {
    $('#Pecepcion').fadeIn();
}

            }


            function AddPerc() {
                try {
                     

                    if ($("#Main_TxtImpPerc").val() == "") {
                        $("#Main_TxtImpPerc").addClass("valid");
                        $("#Main_TxtImpPerc").val('0');
                        return;
                    } else {
                        if (parseFloat($("#Main_TxtImpPerc").val()) <= 0) {
                          $("#Main_TxtImpPerc").addClass("valid");
                        return;
                    }
                    } 

        var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({  
                                  "Id_Percep": $("#CmbPerc").val(),
                                  "Monto": $("#Main_TxtImpPerc").val(), 
                              "Obs": $("#TxtObsPerc").val(),
                              "Percep": $("#CmbPerc option:selected").text(),
                                    "tributo":$("#CmbPerc option:selected").attr("data-tri")
                          });

                        $.ajax({
                            type: "POST",
                            url: "CbtesComprasV2.aspx/WsAddPerc",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success:  resultado_kx_percepciones,
                            error: errores
                        });

                } catch (e) {
                      alert(e.message);
                }
            }


            function resultado_kx_percepciones(Resultado) {

                $("#Main_TxtImpPerc").removeClass("valid");
                $("#Main_TxtImpPerc").val('0');
                 $("#TxtObsPerc").val('');
                 $("#CmbPerc").val('3').change();
                  
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
                var Tabla_Fin = '';
                var Tsal = 0;
                var Tsalfinal = 0;

   $('#ResultadoPerc').show();
             
   $('#ResultadoPerc').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_percepciones' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th></th> <th>Percepción/Impuesto</th><th>Importe $</th><th>Observaciones</th> </tr></thead><tbody> "; 
 
   if (v_obj.length > 0) {
                     $('#Pecepcion').show();
                }
                $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'> <a class='tooltips' onclick='gvDel_kx_percepciones("+ obj.Id_Percep + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Percep + " </td> <td>" + obj.Monto + " </td> <td>" + obj.Obs+ " </td> </tr>"; 
      
       Tsal = Tsal + parseFloat(obj.Monto.replace(',', '.'));
   });     
 Tabla_Fin = " </tbody></table>" ; 
                $('#ResultadoPerc').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                     
                v_ImpTrib = parseFloat(Tsal).toFixed(2);

                $("#IdTotal2").text(parseFloat(Tsal).toFixed(2)); 

                Tsalfinal = parseFloat( $("#hddTotalOri").val() ) + Tsal;
                $("#IdTotal").text(parseFloat(Tsalfinal).toFixed(2))

                ctacte1();

            
     }

        function llenarGrillaArt(ids) {
            try {

              //  $("#tabsC").tabs({ active: 1 });
                
                $("#Main_TxtOrdenId").val(ids);
                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "Id_orden": ids
                          });

                        $.ajax({
                            type: "POST",
                            url: "Cbtesvta.aspx/WsOrden",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Resultado1) {
                                console.log(Resultado1);
                                $("#Main_TxtClienteNombre").val(Resultado1.d.ClienteNombre);

                                $("#Main_TxtTel").val(Resultado1.d.TelCli);
                                 $("#cmbTipoVta").val(Resultado1.d.Concepto);
                                
                            $("#hddIdCli").val(Resultado1.d.Cliente);
                                $("#Main_TxtDoc").val(Resultado1.d.DocNro);

                                var v_tipo = Resultado1.d.DocTipo;

                    if (v_tipo == '80') {
                        v_tipo = 'CUIT' ;
                    }  

                    if (v_tipo =='96') {
                        v_tipo = 'DNI';
                    }
                            $("#TxtTipoDoc").text(v_tipo);
                            }
                                ),
                            error: errores
                });


                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "Id_orden": ids
                          });

                        $.ajax({
                            type: "POST",
                            url: "Cbtes.aspx/WsAddArticuloOrdenes",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: llenarGrilla,
                            error: errores
                });
            } catch (e) {
                alert(e);
            } 
        }
        var tableArt = document.getElementById("tabla_fact_det"); 
            function AddArt() {



                if ($("#hddIdArt").val() != '0') {
                    if ($("#Main_txtCant").val() > '0' && $("#Main_txtCant").val() != '') {

                        try {

                            // me fijo si ya hay del mismo articulo en la grilla

                            var tableArt = document.getElementById("tabla_fact_det");

                            for (var i = 1; i < tableArt.rows.length; i++) {
                                var rr = tableArt.rows[i];
                                var SelectDep = parseInt(rr.cells[1].innerHTML);
                                var Selectids = parseInt(rr.cells[3].innerHTML);
                                var SelectCant = parseInt(rr.cells[6].innerHTML);
                                var cantFinal = 0;
                                if (Selectids == $("#hddIdArt").val() && SelectDep == parseInt($("#cmbDep").val())) {

                                    cantFinal = parseInt($("#Main_txtCant").val()) + SelectCant;
                                    $("#Main_txtCant").val(cantFinal);

                                    gvProDel(parseInt(rr.cells[2].innerHTML), this);
                                }

                            }


                            var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                                ({
                                    "v_id": $("#hddIdArt").val(),
                                    "v_cant": $("#Main_txtCant").val(),
                                    "v_deposito": $("#cmbDep").val(),
                                    "v_lista": $("#cmbPrecio").val()
                                });

                            $.ajax({
                                type: "POST",
                                url: "Cbtes.aspx/WsAddArticulo",
                                data: json,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: llenarGrilla,
                                error: errores
                            });




                        } catch (e) {
                            alert(e.message);
                        }
                    }
                }
            }

        function AddArtManual() {

            $("#Main_TxtDescripManual").formError({
                remove: true,
                successImage: { enabled: false }

            });
            $("#Main_TxtFinalManual").formError({
                remove: true,
                successImage: { enabled: false }

            });
            if ($("#Main_TxtDescripManual").val() != "") {
                if ($("#Main_TxtFinalManual").val() != "0:00" && $("#Main_TxtFinalManual").val() != "0") { 
              
                    try {

                        var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "v_obj": {
                                  "Id": '99',
                                  "Iva_Venta": $("#Main_CmdIva").val(),
                                  "Iva_Compra": $("#Main_CmbIvaCompra").val(),
                                  "ListaSelect": "1",
                                  "Nombre": $("#Main_TxtDescripManual").val(),

                                  "Tipo_Art": $("#Main_CmbTipoArticulo").val(),

                                  "PrecioSelect": parseFloat(parseFloat($("#Main_TxtFinalManual").val()) / parseFloat($("#Main_TxtCantManual").val())).toFixed(2),
                                  "NetoSelect": $("#Main_TxtNetoMaual").val(),
                                  "Unidad": $("#cmbUnidad option:selected").text().trim(),                                
                                  "Cant": $("#Main_TxtCantManual").val(),                                 
                                  
                                   "Cont_Venta": $("#Main_CmbVtas").val(),
                                   "Cont_Compra": $('#Main_CmbCompras').val(), 
                                  "IIBB": $("#Main_cmbIbb").val(),                                   
                                  "Moneda": $("#Main_cmbMoneda").val(),
                                  "Cod_Manual": "MANUAL",
                                  "Descuento": $("#TxtDescuento2").val()
        

                              }
                          });

                        $.ajax({
                            type: "POST",
                            url: "Cbtesvta.aspx/WsAddArticuloManual",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: llenarGrilla,
                            error: errores
                        });




                    } catch (e) {
                        alert(e.message);
                    }


                } else { 

                    $("#Main_TxtFinalManual").formError(
     "El Monto Final no debe ser 0:00");
                }
            } else {

                $("#Main_TxtDescripManual").formError(
"Debe Ingresar un Nombre");
              

            }
                }
          


        function llenarGrilla(Resultado){ 
          
            v_ImpNeto = parseFloat("0");
            v_impIva = parseFloat("0");
            tienB = "";
            v_salIvaObj = "";
            alicDesc = "";
            obIva = "";
            BaseImpB = parseFloat("0");
            ImporteB = parseFloat("0");
            tienA = "";
            BaseImpA = parseFloat("0");
            ImporteA = parseFloat("0");
            tienC = "";
            BaseImpC = parseFloat("0");
            ImporteC = parseFloat("0");
            tienD = "";
            BaseImpD = parseFloat("0");
            ImporteD = parseFloat("0");
            obj1 = "";
            
            $("#TxtPagoEfetivo").val("0");
              $("#TxtPagoEfetivoEnt").val("0");
            
            var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#ResultadoProv").show();
            $("#ResultadoProv").empty();
            Tabla_Titulo = "<table  id='tabla_fact_det'   class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th></th> <th>Cod_Sis</th><th>Cod_Man</th><th>Descripción</th><th>Cantidad</th><th>Unidad</th><th>Alic</th><th>Precio $</th><th>Sub Total $</th><th>Desc.%</th><th></th></tr></thead><tbody>";

            var sal2 = parseFloat("00.00");
            var sal;
            var art = "";

            var v_ser = 'NO';
            var v_art = 'NO';


            $.each(Pacientes, function (index, pacientes) {
              
                if (pacientes.Tipo_Art == 'SERVICIO') {
                    v_ser = 'SI';
                }
                if (pacientes.Tipo_Art == 'ARTICULO') {
                    v_art = 'SI';
                }
              
                sal = parseFloat((parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * parseFloat(pacientes.Cant)));

                Tabla_Datos = Tabla_Datos + "<tr   style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.IdGrilla + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td> <td  style='width:30px'> <a class='tooltips' onclick='ModalPrecio(" + pacientes.IdGrilla + ",this);' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td> <td style='display:none'>" + pacientes.DepositoSelect + "</td><td style='display:none'>" + pacientes.IdGrilla + "</td> <td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td style='  text-align: justify;'>" + pacientes.Nombre + "</td><td>" + pacientes.Cant + "</td><td> " + pacientes.Unidad + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + "</td> <td>" +parseFloat(pacientes.Descuento==null?0:pacientes.Descuento).toFixed(2) + "</td><td> <div style='display:none'>" +parseFloat(pacientes.PrecioOriginal).toFixed(2) + "<div></td></tr>";
                sal2 = sal + sal2;
                                  
                var v_ImpTotal = (parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * parseFloat(pacientes.Cant)).toFixed(2));
                var v_ImpNetoTotal = parseFloat(parseFloat(pacientes.NetoSelect.replace(',', '.')).toFixed(2) * parseFloat(pacientes.Cant));
                                  
                v_ImpNeto = v_ImpNeto + v_ImpNetoTotal;
               
                var v_total = v_ImpTotal - v_ImpNetoTotal; 



                                  

                if (pacientes.Iva_Venta == "0.21")
                {
                    tienA = "S";
                    //    IVA1.Id = 5; // 21%  
                    alicDesc= "21%";
                    BaseImpA = BaseImpA + v_ImpNetoTotal;
                    ImporteA = ImporteA + v_total;
                }
                if (pacientes.Iva_Venta == "0.105")
                {
                    tienB = "S";
                    //  IVA1.Id = 4; // 10,5%
                    alicDesc = "10.5%";                                        
                    BaseImpB= BaseImpB + v_ImpNetoTotal;  
                    ImporteB = ImporteB + v_total;
                             
                }
                if (pacientes.Iva_Venta == "0.27")
                {
                    tienC = "S";
                    //  IVA1.Id = 6; // 27%
                    alicDesc =  "27%";
                    BaseImpC = BaseImpC + v_ImpNetoTotal;
                    ImporteC = ImporteC + v_total;
                }
                if (pacientes.Iva_Venta  == "0")
                {
                    tienD = "S";
                    //    IVA1.Id = 3; // 0%
                    alicDesc  = "0%";

                    //En el campo Importe Neto Gravado, se consignará 0 (cero), en el campo alícuota, 0 % (código 0003) y en el campo Impuesto Liquidado, 0 (cero).
                    //ID 19231117 Evento 3783
                    BaseImpD = BaseImpD+ v_ImpNetoTotal;                                       
                }
 
               
                // aca agrego los campos nuevos para que guarde el array de articulos
              
                if (index == Pacientes.length - 1) {

                    art += '{  "Id": "0", "Cod_Manual": "' + pacientes.Cod_Manual + '", "Id_Articulo": "' + pacientes.Id + '", "Nombre": "' + pacientes.Nombre + '" , "Cant": "' + pacientes.Cant + '" , "Alic": "' + alicDesc + '" , "NetoImpxUni": "' + parseFloat(pacientes.NetoSelect.replace(',', '.')).toFixed(2) + '" , "NetoImpTotal": "' + parseFloat(parseFloat(pacientes.NetoSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + '" , "ImpIva": "' + v_total + '" , "ImpxUni": "' + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + '" , "ImpTotal": "' + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + '" , "id_cbte": "0" , "DepositoSelect": "' + pacientes.DepositoSelect + '" , "Tipo_Art": "' + pacientes.Tipo_Art + '" , "Unidad": "' + pacientes.Unidad + '", "es_Stock": "' + pacientes.es_Stock + '", "IIBB": "' + pacientes.IIBB + '" , "Descuento": "' + parseFloat(pacientes.Descuento).toFixed(2) + '"  , "Cont_Compra": "' + pacientes.Cont_Compra + '", "Cont_Venta": "' + pacientes.Cont_Venta + '", "Compra_Neto": "' + pacientes.P_Neto + '"  }';

                } else {

                    art += '{  "Id": "0", "Cod_Manual": "' + pacientes.Cod_Manual + '", "Id_Articulo": "' + pacientes.Id + '", "Nombre": "' + pacientes.Nombre + '" , "Cant": "' + pacientes.Cant + '" , "Alic": "' + alicDesc + '" , "NetoImpxUni": "' + parseFloat(pacientes.NetoSelect.replace(',', '.')).toFixed(2) + '" , "NetoImpTotal": "' + parseFloat(parseFloat(pacientes.NetoSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + '" , "ImpIva": "' + v_total + '" , "ImpxUni": "' + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + '" , "ImpTotal": "' + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + '" , "id_cbte": "0" , "DepositoSelect": "' + pacientes.DepositoSelect + '" , "Tipo_Art": "' + pacientes.Tipo_Art + '" , "Unidad": "' + pacientes.Unidad + '", "es_Stock": "' + pacientes.es_Stock + '", "IIBB": "' + pacientes.IIBB + '", "Descuento": "' + parseFloat(pacientes.Descuento).toFixed(2) + '" , "Cont_Compra": "' + pacientes.Cont_Compra + '", "Cont_Venta": "' + pacientes.Cont_Venta + '" , "Compra_Neto": "' + pacientes.P_Neto + '" },';

                }

 
                        
            });
                             
            if (v_ser == 'SI') {
                $('#cmbTipoVta').val("2");
            }
            if (v_art == 'SI') {
                $('#cmbTipoVta').val("1");
            }

            if (v_art == 'SI' && v_ser == 'SI') {
                $('#cmbTipoVta').val("3");
            }

            if (v_art == 'NO' && v_ser == 'NO') {
                $('#cmbTipoVta').val("1");
            }

            if (tienA == "S") {
                if (v_salIvaObj != "") {
                    v_salIvaObj = v_salIvaObj + ",";
                }
                v_salIvaObj = v_salIvaObj + '{ "Id": "5" ,"BaseImp": "' + BaseImpA + '" , "Importe":"' + ImporteA + '"}';
            }
            if (tienB == "S") {
                if (v_salIvaObj != "") {
                    v_salIvaObj = v_salIvaObj + ",";
                }
                v_salIvaObj = v_salIvaObj + '{ "Id": "4" ,"BaseImp": "' + BaseImpB + '" , "Importe":"' + ImporteB + '"}';
            }

            if (tienC == "S") {
                if (v_salIvaObj !="") {
                    v_salIvaObj = v_salIvaObj + ",";
                }
                v_salIvaObj = v_salIvaObj + '{ "Id": "6" ,"BaseImp": "' + BaseImpC + '" , "Importe":"' + ImporteC + '"}';
            }

            if (tienD == "S") {
                if (v_salIvaObj != "") {
                    v_salIvaObj = v_salIvaObj + ",";
                }
                v_salIvaObj = v_salIvaObj + '{ "Id": "3" ,"BaseImp": "' + BaseImpD+ '" , "Importe":"' + ImporteD + '"}';
            }
             
              $("#hddProd").val(art); 
             $("#hddTotalOri").val(sal2);

            sal2 = sal2 +  parseFloat( $("#IdTotal2").text() ); // sumo la percepciones

            $("#IdTotal").text(parseFloat(sal2).toFixed(2));
            $("#lblSaldo").text(parseFloat(sal2).toFixed(2));




            $("#IdTotalLetra").text( "IMPORTE EN LETRAS: "+ numeroALetras($("#lblSaldo").text(), {
                plural: 'PESOS',
                singular: 'PESO',
                centPlural: 'CENTAVOS',
                centSingular: 'CENTAVO'
            }));

           

            Tabla_Fin = "</tbody></table>";
            $("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            v_impIva = parseFloat($("#IdTotal").text().replace(',', '.')).toFixed(2) - v_ImpNeto - v_ImpTrib;
            $("#ModalArt").modal('hide');
             // limpiar add manual
            $("#ModalManual").modal('hide');
            $("#Main_TxtDescripManual").val('');
            $("#Main_TxtCantManual").val('1');
            $("#Main_TxtNetoMaual").val('0');
            $("#Main_TxtFinalManual").val('0');



             efectivo();
                if ($("#ckTj1").is(":checked")) {
                 tarjetaj1();
            }
                if ($("#CkTj2").is(":checked")) {
           tarjetaj();
 }
            ctacte1();
            Cheque1();
        }

        function pad(n, width, z) {
            z = z || '0';
            n = n + '';
            return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
        }
        function jsImpRp(ids)  {
            try {
                $("#Main_TxtRpid").val(ids);
                $("#Main_BtnImp").click();
            } catch (e) {
                alert(e);
            }

        }
            $("#cmbTipoCbate").change(function () {

                $("#VerCbteAsc1").hide();
                     if (  $("#cmbTipoCbate").val() != '0' &&  $("#cmbTipoCbate").val() != '1' && $("#cmbTipoCbate").val() != '6' && $("#cmbTipoCbate").val() != '11' && $("#cmbTipoCbate").val() != '211' && $("#cmbTipoCbate").val() != '19') {
                         
                         $("#VerCbteAsc1").show();
                   }


                if ($("#cmbTipoCbate").val() == '211') {
                    $("#Main_TxtFechaPagovto").val('');
                    limpiarCK();

                    $( "#Cktranferencia" ).prop( "checked", true );
                }


                  if ($("#cmbTipoCbate").val() == '212') {
                 //   $("#Main_TxtFechaPagovto").val('');
                    limpiarCK();

                    $( "#Cktranferencia" ).prop( "checked", true );
                }


                  if ($("#cmbTipoCbate").val() == '213') {
                  //  $("#Main_TxtFechaPagovto").val('');
                    limpiarCK();

                    $( "#Cktranferencia" ).prop( "checked", true );
                      }

                }
                );

            function AltaFact() {
                letras();
                $("#Main_TxtFechaPagovto").removeClass("valid");
                if ($("#Main_TxtFechaPagovto").val() == '') 
                {
                    $("#Main_TxtFechaPagovto").addClass("valid");
                    alert("La Fecha de vencimiento del pago es obligatoria. ");
                    return;

                }
              
            if ($("#cmbTipoCbate").val() != '0') {

             
                try {
                    if ($("#cmbTipoCbate").val() == "1" && $("#TxtTipoDoc").text() != 'CUIT') {
                    
                        alert("Para Comprobantes Tipo A el tipo de documento tiene que ser CUIT.");
                        return;
                    }

                    var v_tipo = $("#TxtTipoDoc").text();
                    if (v_tipo == 'CUIT') {
                        v_tipo = '80';
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
                    if (v_tipo == 'CUIT / DOC') {
                        v_tipo = '96';
                    }
                    

                    if (v_tipo == 'Pasaporte') {
                        v_tipo = '94';
                    }
                    if (v_tipo == 'CIE') {
                        v_tipo = '91';
                    }
                    var impLetra = "";
                    if ($("#ChLetra").is(":checked")) {
                        impLetra = $("#IdTotalLetra").text();
                    }
                    var cond_vta = "";

                    var Contado = "";
                    if ($("#ckContado").is(":checked")) {
                        Contado = "X";
                        cond_vta = "S";
                    }

                    var Ck30dias = "";
                    if ($("#Ck30dias").is(":checked")) {
                        Ck30dias = "X";
                        cond_vta = "S";
                    }

                    var Tj_Debito = "";
                    if ($("#ckTj1").is(":checked")) {
                        Tj_Debito = "X";
                        cond_vta = "S";
                    }
                    var Tj_Credito = "";
                    if ($("#CkTj2").is(":checked")) {
                        Tj_Credito = "X";
                        cond_vta = "S";
                    }
                    var CtaCte = "";
                    if ($("#CkCtacte").is(":checked")) {
                        CtaCte = "X";
                        cond_vta = "S";
                    }
                    var Cheque = "";
                    if ($("#CkCheque").is(":checked")) {
                        Cheque = "X";
                        cond_vta = "S";
                    }
                    var Otra = "";
                    if ($("#CkOtra").is(":checked")) {
                        Otra = "X";
                        cond_vta = "S";
                    }

                      var Tranferencia = "";
                    if ($("#Cktranferencia").is(":checked")) {
                       Tranferencia = "X";
                        cond_vta = "S";
                    }

                    var Remito = "";
                    var Rpto = "0";
                    if ($("#TxtPto").val() == "") {
                        Rpto = "0";
                    }

                    if ($("#TxtRemito").val() != "") {
                        Remito = pad($("#TxtPto").val(), 4) + " - " + pad($("#TxtRemito").val(), 8);
                    }

                    var pesos = parseFloat($("#TxtPagoEfetivoEnt").val());

                    if (parseFloat($("#lblCambio").text()) > 0) {

                           pesos = parseFloat($("#TxtPagoEfetivoEnt").val()) - parseFloat($("#lblCambio").text());
                    }

                      
                    var miId = '0';
                   
                    if (cond_vta == "S") {
                        obj1 = '{"v_obj": { "ImpTrib":"' + v_ImpTrib + '",  "ImpNeto":"' + v_ImpNeto + '","ImpIVA":"' + v_impIva + '",  "Id": "0","CbteTipo": "' + $("#cmbTipoCbate").val() + '", "Concepto": "' + $("#cmbTipoVta").val() + '","Vendedor": "' + $("#cmbVendedor").val() + '", "Cliente": "' + $("#hddIdCli").val() + '",  "Fecha": "' + $("#Main_TxtFecha").val() + '",  "DocTipo": "' + v_tipo + '",   "DocNro":"' + $("#Main_TxtDoc").val() + '",  "ImpTotal": "' + $("#IdTotal").text() + '",  "Pago_Efectivo": "' + parseFloat(pesos).toFixed(2) + '",   "Pago_Bancos": "' + $("#TxtPagoBcoEnt").val() + '",    "Pago_Cheques": "' + $("#TxtChTotal").val() + '",   "Pago_Tarjetas": "' + $("#TxTjTotal").val() + '",   "ImporteLetra": "' + impLetra + '", "treintaDias": "' + Ck30dias + '", "Contado": "' + Contado + '", "Tj_Debito": "' + Tj_Debito + '", "Tj_Credito": "' + Tj_Credito + '", "CtaCte": "' + CtaCte + '", "Cheque": "' + Cheque + '", "Otra": "' + Otra + '", "Remito": "' + Remito + '", "anular_Tipo": "' + $("#TxtAnularTipo").val() + '", "anular_Nro": "' + $("#TxtAnularNro").val() + '" ,"anular_fecha": "' + $("#TxtAnularFecha").val() + '","anular_id": "' + $("#cmbCbateAsc").val() + '"  , "MonId": "' + $("#Main_cmbMoneda").val() + '" , "MonCotiz": "' + $("#TxtCotizacion").val() + '" ,"FchVtoPago":"' + $("#Main_TxtFechaPagovto").val() + '", "Transferencia": "' + Tranferencia + '",     "Articulos": [' + $("#hddProd").val() + ']   ,"AlicIva": [' + v_salIvaObj + '] }} ';
                       
                    if ($("#IdTotal").text() != "0") {

                        if (true) {
                            if ($("#hddIdCli").val() != "") {
                                if ($("#Main_TxtDoc").val() != "") {
                                    try {

                                                                             
                                            $('#btnAgregar1aIco').removeClass("glyphicon-print");
                                            $('#btnAgregar1aIco').addClass("glyphicon-refresh glyphicon-refresh-animate");
                                            $('#btnAgregar1a').prop('disabled', true);
                                     
                                        $.ajax({
                                            type: "POST",
                                            url: "Cbtesvta.aspx/WmAddFc",
                                            data: obj1,
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            async: false,
                                            success: (function (result) {

                                                var obj = result.d;

                                                if (obj.Resultado == 'R') {
                                                    alert('Cbate n°:' + obj.Id + '- Rechazado:' + obj.Observaciones);
                                                } else {


                                                      if (getUrlParameter('CbteAnular') != null) { // vine de anular cbate  pongo Observaciones='ANULADO NOTA CREDITO Nro: xxxx"

                                                                  var json2 = JSON.stringify
                                                                     ({
                                                                          "v_id":  getUrlParameter('CbteAnular'),
                                                                          "cbate": obj.CbteHasta
                                                                   });
                                                                
                                                              
                                                               $.ajax({
                                                                   type: "POST",
                                                                   url: "Cbtesvta.aspx/WsUpdateCancelar",
                                                                   data: json2,
                                                                   contentType: "application/json; charset=utf-8",
                                                                   dataType: "json",
                                                                   success: function (result) { 
                                                                   },
                                                                   error: errores
                                                               });

                                                           }


                                                    $("#Main_TxtRpid").val(obj.Id);
                                                    $("#tabsC").tabs({ active: 0 });
                                                    $("#Main_TxtTipoRep").val($("#cmbTipoCbate").val());
                                                    $("#Main_BtnImp").click();
                                                    LimpiarTodo();


                                                }


                                            }),
                                            error:  (function (msg) {

                                                var jsonObj = JSON.parse(msg.responseText);
                                                alert('Error: ' + jsonObj.Message);

                                                var json = JSON.stringify
                                     ({
                                         "v_obj": {
                                             "msg": jsonObj.Message,
                                             "donde": 'Cbates.aspx',
                                             "valor": obj1,
                                             "aud": '',
                                             "config_user": '',
                                             "id_user": '',
                                             "metodo": 'Cbtesvta.aspx/AltaFact() '
                                         }
                                     });
                                                bitacora(json);
                                            })

                                            ,  beforeSend: function () {
                         $(".spinner-wrapper").css("display", "block");
            $(".loader").css("display", "block");
                        },
                                            complete: (function () {

                                               $("#pnlCondicionVta").hide();

                                                    $('#btnAgregar1aIco').removeClass("glyphicon-refresh glyphicon-refresh-animate");
                                                    $('#btnAgregar1aIco').addClass("glyphicon-print");
                                                    $('#btnAgregar1a').prop('disabled', false);
                                                 $(".spinner-wrapper").css("display", "none");
            $(".loader").css("display", "none");

                                            })
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


                }else{ 
                  alert("Seleccione una opción de pago en condición de venta.");                
                }


                } catch (e) {
                    alert(e.message);
                }

            } else { alert('Seleccione un tipo de comprobante.'); }
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
                              $('#cmbPrecio').append(
                                      $('<option></option>').val('6').html('MANUAL')
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
                var sin = pacientes.Nombre;
                if (pacientes.Nombre.trim().length > 230) {
                    sin = pacientes.Nombre.substr(0, 200) + '.... (Ver más)';
                }

                Tabla_Datos = Tabla_Datos + "<tr    onclick='RowArt2(this," + pacientes.Id + ");' style='cursor:pointer;'> <td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td style='  text-align: justify;'>" + sin + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.P_FinalL1.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL2.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL3.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL4.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL5.replace(',', '.')).toFixed(2) + "</td></tr>";
            });

            Tabla_Fin = "</tbody></table>";
            $("#ResultadoB").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

        }


        $("#cmbDep").change(function () {
          
            RowArt2("", $("#hddIdArt").val()); 
        });
             $("#Main_TxtPCompra").prop('disabled', true);
        $("#cmbPrecio").change(function () {
            if ($("#hddIdArt").val() !='') {
                 RowArt2("", $("#hddIdArt").val());
            } 
           
        });

            function RowArt2(obj, ids) {
                $("#Main_txtCant").val('1');
                $("#MsgStock").hide();
                $("#MsgStocklbl").text('');
                $("#BtnDep").prop("disabled", false);



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
                                var cantFinal = 0;
                                var SelectCant = 0;


                                if (pacientes.id_deposito == $("#cmbDep").val()) {  // busca en en la lista de dep del art si tiene el deposito seleccionado

                                    // VER QUE SI VENDE DE OTRO DE POSITO HAY QUE DETALLAR EN EL COMPROBANTE DE QUE DEPOSITO SE SACO.
                                    // AHORA COMO ESTA SI LA EXISTE en la grilla lo elimina.
                                    // ver que pasa cuando agrega de otro deposito como queda registrado

                                    // me fijo si ya hay del mismo articulo en la grilla

                                    var tableArt = document.getElementById("tabla_fact_det");

                                    for (var i = 1; i < tableArt.rows.length; i++) {
                                        var rr = tableArt.rows[i];
                                        var SelectDep = parseInt(rr.cells[1].innerHTML);
                                        var Selectids = parseInt(rr.cells[3].innerHTML);
                                        SelectCant = parseInt(rr.cells[6].innerHTML);

                                        if (Selectids == $("#hddIdArt").val() && SelectDep == parseInt($("#cmbDep").val())) {
                                            cantFinal = SelectCant;
                                        }
                                    }


                                    // resto lo que esta ya agregada a la grilla y el stock
                                    var bb = parseInt(pacientes.stock) - cantFinal;
                                    $("#Main_TxtStock").val(bb);



                                }

                            });


                            if ($("#Main_TxtStock").val() < 1) {

                                $("#MsgStock").show('fade');
                                $("#MsgStocklbl").text('** No posee stock disponible. ');
                                $("#BtnDep").prop("disabled", true);

                            }
                          
                            if ("1" == $("#cmbPrecio").val()) { // si esta seleccionada la lista 1
                                $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL1.replace(',', '.')).toFixed(2));
                                $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL1.replace(',', '.')).toFixed(2));


                            }
                            if ("2" == $("#cmbPrecio").val()) { // si esta seleccionada la lista 1
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

        $("#Main_TxtFinalPop").change(function () {

   if (true) {

                            $("#Main_TxtFinalPop").prop('disabled', false);
                          
       var miva = parseFloat((parseFloat($("#Main_TxtIvaPop").val().replace('%', '').replace(',', '.')) / parseFloat("100")) + parseFloat("1")).toFixed(2);
        
       if ($("#Main_TxtFinalPop").val() =="") {
         $("#Main_TxtFinalPop").val("0");
       }
       
                            $("#Main_TxtNetoPop").val(   parseFloat(  parseFloat($("#Main_TxtFinalPop").val().replace(',', '.')).toFixed(2)  /miva ).toFixed(2));
                         
                        }
        });


          $("#Main_TxtFinal").change(function () {
   if ("6" == $("#cmbPrecio").val()) {

                            $("#Main_TxtFinal").prop('disabled', false);
                          
       var miva = parseFloat(parseFloat($("#Main_TxtIvaArt").val().replace(',', '.')) + parseFloat("1")).toFixed(2);
        
       if ($("#Main_TxtFinal").val() =="") {
         $("#Main_TxtFinal").val("0");
       }
            console.log(miva );
                            $("#Main_TxtNeto").val(   parseFloat(  parseFloat($("#Main_TxtFinal").val().replace(',', '.')).toFixed(2)  /miva ).toFixed(2));
                         
                        }
        });
        function gvChDel(ids) {
            try { 
                var json = JSON.stringify
                  ({
                      "v_id": ids
                  });
                $.ajax({
                    type: "POST",
                    url: "CbtesOden.aspx/gvCh_del",
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
                    url: "Cbtesvta.aspx/gvTJ_del",
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
                    url: "Cbtesvta.aspx/gvArt_del",
                    data: json,
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success:  
 llenarGrilla,
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
        
        function gvTJ() {
            try {

                if ($("#TxtMontoT").val() == '0') {

                    alert("Debe ingresar un monto");
                    return;
                }
                if ($("#TxtMontoT").val() == '') {

                    alert("Debe ingresar un monto");
                     return;
                }

                 if ($("#TxtNumTJ").val() == '0') {

                     alert("Debe ingresar un nro de tarjeta.");
                      return;
                }
                if ($("#TxtNumTJ").val() == '') {

                    alert("Debe ingresar un nro de tarjeta.");
                     return;
                }
                

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
                    url: "Cbtesvta.aspx/WmAddTJ",
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
                        url: "Cbtesvta.aspx/WmAddCheque",
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


        function LimpiarTodo() {
            try {

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                                    });

                $.ajax({
                    type: "POST",
                    url: "Cbtesvta.aspx/WmLimpiarSesion",
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

                    $("#ResultadoPerc").show();
                $("#ResultadoPerc").empty(); 
                  $("#Pecepcion").hide();
                 
                $("#hddTotalOri").val("0"); 
                $("#IdTotal2").text('0'); 

                  v_ImpNeto = parseFloat("0");
               v_ImpTrib = parseFloat("0");
                 v_impIva = parseFloat("0");


                
                $(".cotizacion").hide();
                $("#TxtCotizacion").val('');
                
                $("#TxtTotalTj").text('0');
                $("#TxtTotalC").text('0');

                $("#IdTotalLetra").text('');
                $("#IdTotal").text('0');
                $("#hddIdCli").val('0');
                
                $("#lblSaldo").text('00.00');
                $("#lblCambio").text('00.00');

                $( "#ckContado" ).prop( "checked", true );
                $("#ResultadoCh").show();
                $("#ResultadoCh").empty();

                $("#ResultadoTj").show();
                $("#ResultadoTj").empty();


                $("#ResultadoB").show();
                $("#ResultadoB").empty();

                $("#ResultadoProv").show();
                $("#ResultadoProv").empty();

             



                $("#ResultadoProv").html("<table id='tabla_fact_det'></table>");

                $("#ResultadoCli").show();
                $("#ResultadoCli").empty();
                
                $("#hddProd").val('');

                v_ImpNeto = parseFloat("0");
                v_impIva = parseFloat("0");
                tienB = "";
                v_salIvaObj = "";
                alicDesc = "";
                obIva = "";
                BaseImpB = parseFloat("0");
                ImporteB = parseFloat("0");
                tienA = "";
                BaseImpA = parseFloat("0");
                ImporteA = parseFloat("0");
                tienC = "";
                BaseImpC = parseFloat("0");
                ImporteC = parseFloat("0");
                tienD = "";
                BaseImpD = parseFloat("0");
                ImporteD = parseFloat("0");
                obj1 = "";
                document.getElementById("cmbTipoCbate").selectedIndex = "0";

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

                          $('#cmbSubRubro').append('<option value="0" selected="selected">Todos</option>');
                    
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

                function llenarGrillaArtCbte(ids) {
            try {

                
             $("#Main_TxtOrdenId").val(ids);
                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "Id_orden": ids
                          });

                        $.ajax({
                            type: "POST",
                            url: "Cbtesvta.aspx/WsbsqCbate",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Resultado1) {
                               
                                $("#Main_TxtClienteNombre").val(Resultado1.d.ClienteNombre);

                                $("#Main_TxtTel").val(Resultado1.d.TelCli);
                                 $("#cmbTipoVta").val(Resultado1.d.Concepto);
                                
                            $("#hddIdCli").val(Resultado1.d.Cliente);
                                $("#Main_TxtDoc").val(Resultado1.d.DocNro);
                             
                                $("#TxtRemito").val(Resultado1.d.Remito.substring(6, 15));
                                 $("#TxtPto").val( Resultado1.d.Remito.substring(0, 4) );

                                 $("#TxtAnularTipo").val(Resultado1.d.CbteTipo);
                                 $("#TxtAnularNro").val(Resultado1.d.CbteNro);
                                $("#TxtAnularFecha").val(Resultado1.d.Fecha);
                                   $("#TxTjTotal").val(Resultado1.d.Pago_Tarjetas).change();
                                $("#TxtChTotal").val(Resultado1.d.Pago_Cheques).change();
                                $("#TxtPagoEfetivoEnt").val(Resultado1.d.Pago_Efectivo).change();

                              
                                var v_tipo = Resultado1.d.DocTipo;

                                  if (Resultado1.d.CbteTipo == '211') {
                                       $("#cmbTipoCbate").val("213");
                                }

                                  if (Resultado1.d.CbteTipo=="1"  ) {
                                    $("#cmbTipoCbate").val("3");
                                }
                                   if (Resultado1.d.CbteTipo=="6"  ) {
                                    $("#cmbTipoCbate").val("8");
                                }
                                
                                if (Resultado1.d.CbteTipo == "11") {
                                   
                                    $("#cmbTipoCbate").val("13");
                                }

                                if (Resultado1.d.CbteTipo == "15") {

                                    $("#cmbTipoCbate").val("13");
                                }

                                  if (Resultado1.d.Contado=="X") {
                                      $("#ckContado").prop("checked", true);
                                       $("#ckContado" ).change();
                                }

                                  if (Resultado1.d.Tj_Debito=="X") {
                                      $("#ckTj1").prop("checked", true);
                                       $("#ckTj1" ).change();
                                }
                                 if (Resultado1.d.Tj_Credito=="X") {
                                      $("#CkTj2").prop("checked", true);
                                       $("#CkTj2" ).change();
                                }


                                   if (Resultado1.d.CtaCte=="X") {
                                      $("#CkCtacte").prop("checked", true);
                                       $("#CkCtacte" ).change();
                                }

                                  if (Resultado1.d.Cheque=="X") {
                                      $("#CkCheque").prop("checked", true);
                                       $("#CkCheque" ).change();
                                }

                                 if (Resultado1.d.Otra=="X") {
                                      $("#CkOtra").prop("checked", true);
                                       $("#CkOtra" ).change();
                                }
                                 if (Resultado1.d.Transferencia =="X") {
                                      $("#Cktranferencia").prop("checked", true);
                                       $("#Cktranferencia" ).change();
                                }

                    if (v_tipo == '80') {
                        v_tipo = 'CUIT' ;
                    }  

                    if (v_tipo =='96') {
                        v_tipo = 'DNI';
                    }
                            $("#TxtTipoDoc").text(v_tipo);
                            }
                                ),
                            error: errores
                });


                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({
                              "Id_orden": ids
                          });

                        $.ajax({
                            type: "POST",
                            url: "Cbtesvta.aspx/WsCbteArticulos",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: llenarGrilla,
                            error: errores
                });
            } catch (e) {
                alert(e);
              } 


              $("#ChLetra").prop("checked", true);
              
              letras();
        }


        $(window).load(function () {
            
                 $('#cmbVendedor').empty(); 
              $('#cmbVendedor').append('<option value="'+$("#MiCuenta1_lbluser").text()+'">'+$("#MiCuenta1_lbluser").text()+'</option>');

            var TipoOp = getUrlParameter('TipoOp');           
         //   $("#tabsC").tabs({ active: 0 });
        //    Buscar_orden();

            if (TipoOp=='OS') {
                AddArtOS();
            }

              if (getUrlParameter('CbteAnular') != null) {
                     llenarGrillaArtCbte(getUrlParameter('CbteAnular'));
            }

                 if (getUrlParameter('Orden') != null) {
                     llenarGrillaArt(getUrlParameter('Orden'));
            }
            
        });

            function VerManual() { 
                 $("#Main_CmbTipoArticulo").val("SERVICIO").change();
            $("#ModalManual").modal();
                $("#TxtDescuento2").val("0");
                $("#Main_CmdIva").val("0");
            if ($("#cmbTipoCbate").val()=="11"  ) {
                $("#Main_CmdIva").val("0");
                $("#Main_CmbIvaCompra").val("0");                
            }

            if ($("#cmbTipoCbate").val() == "12") {
                $("#Main_CmdIva").val("0");
                $("#Main_CmbIvaCompra").val("0");
            }
            if ($("#cmbTipoCbate").val() == "13") {
                $("#Main_CmdIva").val("0");
                $("#Main_CmbIvaCompra").val("0");
            }
            if ($("#cmbTipoCbate").val() == "15") {
                $("#Main_CmdIva").val("0");
                $("#Main_CmbIvaCompra").val("0");
            }
        }


        $(this).everyTime(10000, function () {
           
            $("#miLoader").hide();  // para q no aprezca el load cuando hace el keep sesion

            $.ajax({
                type: "POST",
                url: "../ActiveSession.aspx/KeepActiveSession",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                success: VerifySessionState,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    window.location.href = "/Login_oaa.aspx";

                }
            });

        }); 

        function VerifySessionState(result) {
            $("#miLoader").show();
            if (!result.d) {

                window.location.href = "/Login_oaa.aspx";
            }
        }



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
       

            $(function () {
                ListarContables();
                 ListarPerc();
                 $('#Main_CmbVtas').val('72').trigger('change');
                         $('#Main_CmbCompras').val('103').trigger('change');

 $( "#ckContado" ).prop( "checked", false).change();
                

            });
         
        
                function ListarContables() {

            try {
 
                $.ajax({
                    type: "POST",
                    url: "Cbtesvta.aspx/WsListarCtas",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#Main_CmbVtas').empty();
                         $('#Main_CmbCompras').empty();
                       
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                            $('#Main_CmbVtas').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre) 
                                );
                             $('#Main_CmbCompras').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre) 
                                );
                             $('#cmbCtaContable').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre) 
                                );
 
                         
                        });
           

                                // x defecto deudores x vta
                         $('#cmbCtaContable').val('29').trigger('change');
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }

            $('#Main_TxtApellido').change(function () {
                var razonso = $('#Main_TxtNombre').val() + ' ' + $('#Main_TxtApellido').val();
                $('#Main_TxtNombre').val( razonso);
                
            });

              $("#Main_TxtBuscarCli").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                       BuscarCli();
                    }
                });

               $("#Main_TxtFinalManual").keyup(function (e) {
                                      if (e.keyCode == 13) {
                                      AddArtManual();
                    }
               });

          $('#Main_CmbTipoArticulo').change(function () {

            
              $('#Main_CmbVtas').val('72').trigger('change');
              $('#Main_CmbCompras').val('103').trigger('change');


                if ($('#Main_CmbTipoArticulo').val() == "SERVICIO") { 
                  $('#Main_CmbVtas').val('71').trigger('change');
                  $('#Main_CmbCompras').val('76').trigger('change');
                }
         });

            $("#Main_CmbIvaCompra").val('0');
        </script>
      
          <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
     

</asp:Content>