<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Ordenes_Servicios.aspx.cs" Inherits="HardSoft.App.OAA.Ordenes_Servicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      
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
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

    <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
    <style>

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

     <div class=" container"  style="margin-top: 36px;">   
    
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>  Ordenes de Servicio </strong> 
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
          <option value="0">N° Orden</option>
          <option value="1">Cod.Manual</option>
          <option value="2">N° Doc</option>
     
           
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
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />

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
           <div style="display:none">
           <asp:TextBox ID="TxtIdFc" runat="server"></asp:TextBox>
           <asp:Button ID="BtnImpFc" runat="server" Text="" OnClick="BtnImpFc_Click" />
             </div>

       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
         
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo</button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />
   </div>



           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog   " style="width:88%; ">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"   style="background-color: rgb(241, 241, 241);">
      <div class="row" >
              <div class=" col-xs-6 " id="TituloPop"   style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;" >
      
       </div>     
         <div class=" col-xs-6 "  >
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
          </div>
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
       
     


    
      <div id="tabs" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs-1"> Datos</a></li>
      <li><a href="#tabs-2"> Servicio</a></li>
    
      
  </ul>


  <div id="tabs-1">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
 

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
               <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
CLIENTE
         </div>
           
     </div>



    
                 <div class="form-group">

         <label for="TxtNombre" class="control-label col-xs-4">Orden.Manual </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtCodMunualOrd" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>
   <label for="TxtNombre" class="control-label col-xs-3">Orden.Sistema </label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtCodSistemaOrd" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>


           
     </div>
         
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
         <label for="TxtNombre" class="control-label col-xs-4"> N°DOC </label>
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
       <div class="col-xs-6">
        <div class="form-horizontal">
           <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
  EQUIPO
         </div>
           
     </div>
             <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> EQUIPO </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEquipo" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>     
          
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> MODELO </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtModelo" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
                <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">CLAVE </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtClave" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div> 
          
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> N° SERIE </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtSerie" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div> 
        
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">OBSERVACIONES </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtObservaciones" runat="server" class="form-control"  TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div> 
   
                
        
        
        
        
        </div>
          </div>
 
</div>
      </div>
   <div id="tabs-2">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
 

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
               <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
 Técnico
         </div>
           
     </div>

                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Problema detectado por el cliente </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtMotivo" runat="server" class="form-control" TextMode="MultiLine"  ></asp:TextBox>
      
         </div>
           
     </div> 

                 <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Informe Técnico </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxrInfoTec" runat="server" class="form-control" TextMode="MultiLine"  ></asp:TextBox>
      
         </div>
           
     </div> 
        
       <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
REPARACIÓN
         </div>
           
     </div>
            
               <div class="form-group" style="display:none">
         <label for="TxtNombre" class="control-label col-xs-4">Tiempo de reparación </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtTiempoRep" runat="server" class="form-control"    ></asp:TextBox>
      
         </div>
           
     </div> 
                       
                        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Valor de reparación $ </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtValorRep" runat="server" class="form-control" Width="100px"  onkeypress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} " ></asp:TextBox>
      
         </div>
           
     </div> 
 



        </div>
          </div>
       <div class="col-xs-6">
        <div class="form-horizontal">
          <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
 
         </div>
           
     </div>

<div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Digitalizador / Tactil </label>
         <div class="col-xs-2"> 
                      
             <input id="Ck1" type="checkbox"  onclick="SiNO(1)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id1" style="text-align:left"> No Funciona </span>
              


                  </div>
           
     </div> 

  <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Boton Home </label>
         <div class="col-xs-2"> 
                      
             <input id="Ck2" type="checkbox"  onclick="SiNO(2)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id2" style="text-align:left"> No Funciona </span>
              


                  </div>
           
     </div> 
  <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Camara Tracera</label>
         <div class="col-xs-2"> 
                      
             <input id="Ck3" type="checkbox"  onclick="SiNO(3)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id3" style="text-align:left"> No Funciona </span>
              


                  </div>
           
     </div> 

                            
       <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Camara Delantera</label>
         <div class="col-xs-2"> 
                      
             <input id="Ck4" type="checkbox"  onclick="SiNO(4)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id4" style="text-align:left"> No Funciona </span>
              


                  </div>
           
     </div> 

     <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Sensor de Proximidad</label>
         <div class="col-xs-2"> 
                      
             <input id="Ck5" type="checkbox"  onclick="SiNO(5)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id5" style="text-align:left"> No Funciona </span>
              


                  </div>
           
     </div>  

                <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Parlantes</label>
         <div class="col-xs-2"> 
                      
             <input id="Ck6" type="checkbox"  onclick="SiNO(6)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id6" style="text-align:left"> No Funciona </span>
              


                  </div>
           
     </div> 


  <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Auricular</label>
         <div class="col-xs-2"> 
                      
             <input id="Ck7" type="checkbox"  onclick="SiNO(7)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id7" style="text-align:left"> No Funciona </span>
              


                  </div>
           
     </div> 

  <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4">Boton Power</label>
         <div class="col-xs-2"> 
                      
             <input id="Ck8" type="checkbox"  onclick="SiNO(8)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id8" style="text-align:left"> No Funciona </span> 

                  </div>
           
     </div> 


  <div class="form-group" style="">
         <label for="TxtNombre" class="control-label col-xs-4"> Volumen</label>
         <div class="col-xs-2"> 
                      
             <input id="Ck9" type="checkbox"  onclick="SiNO(9)"/>  
             
                  </div>
                           <div class="col-xs-6" > 
           <span id="Id9" style="text-align:left"> No Funciona </span> 

                  </div>
           
     </div> 


        </div>
          </div>
 
</div>
      </div>

    </div>

<script>
    function SiNO(ids) {

        if ($("#Ck" + ids + "").is(':checked')) {
            $("#Id" + ids + "").text("FUNCIONA");
        } else {
            $("#Id" + ids + "").text("NO FUNCIONA");

        }
    }

        function boolCk(ids) {
      
            if ($("#Ck" + ids + "").is(':checked')) {
                return "SI";
            } else {
                return "NO";
            }

        }

        function Ckiar(ids, val) {
            if (val == "SI") {
                $("#Ck" + ids + "").prop("checked", true);
                $("#Id" + ids + "").text("FUNCIONA");
            } else {
                $("#Ck" + ids + "").prop("checked", false);
                $("#Id" + ids + "").text("NO FUNCIONA");
            } 
        }
</script>
 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
          <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
    </div>
  
</div>
        
            <div   style="margin-top:5px; margin-bottom:5px;background-color:#b9b9b9; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar</button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJsOrd2()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>


        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

       <div id="Err" style="width:300px;float:right;font-weight:800" class="alert-danger"></div> 
    
               

              <br />
                
               </div>
              
</div> 
              </div>
        
      </div>
          
         </div>   
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
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField3" runat="server"   />

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
                   <option value="LC"> CIE</option>
                       <option value="LC"> PAS</option>
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
         <asp:Label ID="Label3" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField4" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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
    
    
    
           <script>
          var v_pro = '';
          $('#Main_TxtCodSistema').prop('disabled', true);
          $('#Main_TxtCodSistemaOrd').prop('disabled', true);
          $("#Main_TxtClienteNombre").prop('disabled', true);      
          $("#Main_TxtDoc").prop('disabled', true);
          $("#Main_TxtTel").prop('disabled', true);
          $("#Main_TxtValorRep").val('0.00');
          
          function AltaJsOrd2() {
              
              if ($("#hddIdCli").val() == '0') {
                  $("#Err").text('** Seleccione un Cliente para Seguir.');

              } else {
                  AltaJsOrd();

              }




          }
          function PopAlta() {
              limpiar();
              $("#btnAgregar1a").hide();
              $("#btnGuardar1a").show();
              $("#ModalCat").modal();
              
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
          });
    
               
          function ModificarJs() {
              try {

                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": {
                          
                          "Id": $("#Main_TxtCodSistemaOrd").val(),
                          "CodMunual": $("#Main_TxtCodMunualOrd").val(),                        
                          "Modelo": $("#Main_TxtModelo").val(),
                          "Equipo": $("#Main_TxtEquipo").val(),
                          "Serie": $("#Main_TxtSerie").val(),
                          "Observacion": $("#Main_TxtObservaciones").val(),
                          "Motivo": $("#Main_TxtMotivo").val(),
                          "Info_Tecnico": $("#Main_TxrInfoTec").val(),
                          "Clave": $("#Main_TxtClave").val(),
                          "Tiempo": $("#Main_TxtTiempoRep").val(),
                          "Valor": $("#Main_TxtValorRep").val(),
                          "Id_cliente": $("#hddIdCli").val(),
                           
                             "Tactil": boolCk(1),
                              "Boton_Home": boolCk(2),
                              "Camara_Tracera": boolCk(3),
                              "Camara_Delantera": boolCk(4),
                              "Sensor_Proximidad": boolCk(5),
                              "Parlantes": boolCk(6),
                              "Auricular": boolCk(7),
                              "Boton_Power": boolCk(8),
                              "Volumen": boolCk(9)

                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Ordenes_Servicios.aspx/WmMod",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: alta_Completo,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }


          }
          function PopMod(ids,obj) {

              try {
               
                  var json = JSON.stringify
                    ({ 
                        "v_id": ids 
                    });
                  $.ajax({
                      type: "POST",
                      url: "Ordenes_Servicios.aspx/WsListarId",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {
                          var Result = Resultado;
                          $.each(Result, function (index, result) {
                              limpiar();

                              $("#btnAgregar1a").show();
                              $("#btnGuardar1a").hide();
                              $("#ModalCat").modal();

                              $("#Main_TxtCodSistemaOrd").val(result.Id);
                              $("#Main_TxtCodMunualOrd").val(result.CodMunual);
                             
                              $("#Main_TxtModelo").val(result.Modelo);
                              $("#Main_TxtEquipo").val(result.Equipo);
                              $("#Main_TxtSerie").val(result.Serie);
                              $("#Main_TxtObservaciones").val(result.Observacion);
                              $("#Main_TxtMotivo").val(result.Motivo);
                              $("#Main_TxrInfoTec").val(result.Info_Tecnico);
                              $("#Main_TxtClave").val(result.Clave);
                              $("#Main_TxtTiempoRep").val(result.Tiempo);
                              $("#Main_TxtValorRep").val(parseFloat(result.Valor).toFixed(2));
                              $("#hddIdCli").val(result.Id_cliente);
                              $("#Main_TxtClienteNombre").val(result.ClienteObj.Nombre + ' ' + result.ClienteObj.Apellido);
                              $("#Main_TxtDoc").val(result.ClienteObj.Doc_No);
                              $("#Main_TxtTel").val(result.ClienteObj.Emp_Tel + ' ' + result.ClienteObj.Emp_Cel);

                              Ckiar("1", result.Tactil);
                              Ckiar("2", result.Boton_Home);
                              Ckiar("3", result.Camara_Tracera);
                              Ckiar("4", result.Camara_Delantera);
                              Ckiar("5", result.Sensor_Proximidad);
                              Ckiar("6", result.Parlantes);
                              Ckiar("7", result.Auricular);
                              Ckiar("8", result.Boton_Power);
                              Ckiar("9", result.Volumen);
                           


                          });   

                      }),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
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

                           
                              $("#Main_TxtClienteNombre").val($(tableM.rows[i]).find('td:eq(3)').text());
                              $("#Main_TxtTel").val($(tableM.rows[i]).find('td:eq(5)').text()+'- '+$(tableM.rows[i]).find('td:eq(6)').text());
                              $("#hddIdCli").val($(tableM.rows[i]).find('td:eq(1)').text());
                              $("#Main_TxtDoc").val($(tableM.rows[i]).find('td:eq(4)').text());
                              
                           
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
                  Tabla_Titulo = "<table   id='grillaCli' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Id</th> <th>Manual</th><th>Nombre</th><th>N° Doc</th><th>Tel</th><th>Cel</th><th>Dirección</th></tr></thead><tbody>";
                  $.each(Pacientes, function (index, pacientes) {
                      var nomb2 = pacientes.Nombre.concat(pacientes.Apellido);
                      Tabla_Datos = Tabla_Datos + "<tr onclick='llenarArt(this)' style='cursor:pointer;'> <td style='background-image:url(/images/seleccionar-objeto.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + ' ' + pacientes.Apellido + "</td><td>" + pacientes.Tipo_Doc + ':' + pacientes.Doc_No + "</td><td>" + pacientes.Emp_Tel + "</td><td>" + pacientes.Emp_Cel + "</td><td>" + pacientes.Calle + ' N° ' + pacientes.Numero + "</td></tr>";
                  });

                  Tabla_Fin = "</tbody></table>";
                  $("#ResultadoCli").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                  fn_cantidad();

              }

              function AltaJsOrd() {
                  try {

                      var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                      ({
                          // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                          "v_obj": {

                              "Id": '0',
                              "CodMunual":$("#Main_TxtCodMunualOrd").val(),
                              "Orden_No": '0',
                              "Modelo": $("#Main_TxtModelo").val(),
                              "Equipo": $("#Main_TxtEquipo").val(),
                              "Serie": $("#Main_TxtSerie").val(),
                              "Observacion": $("#Main_TxtObservaciones").val(),
                              "Motivo": $("#Main_TxtMotivo").val(),
                              "Info_Tecnico": $("#Main_TxrInfoTec").val(),
                              "Clave": $("#Main_TxtClave").val(),
                              "Tiempo": $("#Main_TxtTiempoRep").val(),
                              "Valor": $("#Main_TxtValorRep").val(),
                              "Id_cliente": $("#hddIdCli").val(),
                              "Fecha": '',
                              "Tactil": boolCk(1),
                              "Boton_Home": boolCk(2),
                              "Camara_Tracera": boolCk(3),
                              "Camara_Delantera": boolCk(4),
                              "Sensor_Proximidad": boolCk(5),
                              "Parlantes": boolCk(6),
                              "Auricular": boolCk(7),
                              "Boton_Power": boolCk(8),
                              "Volumen": boolCk(9)
                              
                          }
                      });

                      $.ajax({
                          type: "POST",
                          url: "Ordenes_Servicios.aspx/WmAlta",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: alta_Completo,
                          error: errores
                      });

                  } catch (e) {
                      alert(e.message);
                  }
              }


              function alta_Completo() {
                  //    Buscar();

                  limpiar();
                  $("#ModalCat").modal('hide');
                  $("#btnElimina1").click();
                  
              }


              function limpiar() {

                  $("#tabs").tabs({ active: 0 });
                  $("#Err").text('');
                  $("#Main_TxtCodMunualOrd").val('');
                  $("#Main_TxtCodSistemaOrd").val('0');
                  $("#Main_TxtClienteNombre").val('');
                  $("#hddIdCli").val('0');
                  $("#Main_TxtValorRep").val('590.00');
                  $("#Main_TxtDoc").val('');
                  $("#Main_TxtTel").val('');
                  $("#Main_TxtEquipo").val('');
                  $("#Main_TxtModelo").val('');
                  $("#Main_TxtClave").val('');
                  $("#Main_TxtSerie").val('');
                  $("#Main_TxtObservaciones").val('');
                  $("#Main_TxtMotivo").val('');
                  $("#Main_TxrInfoTec").val('');
                  $("#Main_TxtTiempoRep").val('');


                  $("#Ck1").prop("checked", false);
                  $("#Id1").text("NO FUNCIONA");
                  $("#Ck2").prop("checked", false);
                  $("#Id2").text("NO FUNCIONA");
                  $("#Ck3").prop("checked", false);
                  $("#Id3").text("NO FUNCIONA");
                  $("#Ck4").prop("checked", false);
                  $("#Id4").text("NO FUNCIONA");
                  $("#Ck5").prop("checked", false);
                  $("#Id5").text("NO FUNCIONA");
                  $("#Ck6").prop("checked", false);
                  $("#Id6").text("NO FUNCIONA");
                  $("#Ck7").prop("checked", false);
                  $("#Id7").text("NO FUNCIONA");
                  $("#Ck8").prop("checked", false);
                  $("#Id8").text("NO FUNCIONA");
                  $("#Ck9").prop("checked", false);
                  $("#Id9").text("NO FUNCIONA");
            

              }

              function PopVer(ids, obj) {
                  try {

                      if ($(obj).hasClass('active')) {
                          $(obj).removeClass('active');
                      } else {
                          $(obj).addClass('active').siblings().removeClass('active');
                      }

                      $("#Main_TxtId").val(ids);
                      $("#Main_BtnImp").click();

                  } catch (e) {
                      alert(e);
                  } 
              }

              function Buscar() {

                  try {


                      //   alert( $('#cmbTipoOp').val() );

                      var v_buscar = $('#cmbTipoOp').val();
                      var json = JSON.stringify
                        ({
                            "v_tipo": $('#cmbTipoOp').val(),
                            "v_valor": $('#Main_TxtBuscar').val()

                        });
                      $.ajax({
                          type: "POST",
                          url: "Ordenes_Servicios.aspx/WsListar",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: resultado01,
                          error: errores
                      });

                  } catch (e) {
                      alert(e.message);
                  }
              }
              function resultado01(Resultado) {
                  var Pacientes = Resultado.d;
                  var Tabla_Titulo = "";

                  var Tabla_Datos = "";
                  var Tabla_Fin = "";

                  $("#Resultado").show();
                  $("#Resultado").empty();
                  Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th><th></th><th></th><th>N°Orden</th><th>Cod</th> <th>No</th><th>Cliente</th><th>Equipo</th><th>Motivo</th><th>Info.Tecnico</th><th>Fecha</th></tr></thead><tbody>";
                  $.each(Pacientes, function (index, pacientes) {
                      var ss = "<a class='tooltips admin' style='display: none;' onclick='Fc(" + pacientes.Id + ");' > <img src='/images/divisa.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Facturar</span></a>";
                      
                      if (pacientes.Pagado != 'N') {
                          ss = "<a class='tooltips admin' style='display: none;' onclick='VerFc(" + pacientes.Pagado + ");' > <img src='/images/factura.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Factura</span></a>";

                      }
                      Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips' onclick='NuevaOrden(" + pacientes.Id + ");' > <img src='/images/anadir.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>ContraOrden</span></a></td> <td style='width:30px'> <a class='tooltips' onclick='PopMod(" + pacientes.Id + ",this);' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.Id + ",this);' > <img src='/images/Ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Más</span></a></td><td  style='width:30px'> "+ss+" </td><td>" + pacientes.Id + "</td><td>" + pacientes.CodMunual + "</td><td>" + pacientes.Orden_No + "</td><td>" + pacientes.Cliente + "</td><td>" + pacientes.Equipo + "</td><td>" + pacientes.Motivo + "</td><td>" + pacientes.Info_Tecnico + "</td><td>" + pacientes.Fecha + "</td></tr>";

                  });

                  Tabla_Fin = "</tbody></table>";
                  $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                  fn_cantidad();
                  esValido2('ADM_KARDEX');
              }

              function VerFc(ids) {
                  try {
                      $("#Main_TxtIdFc").val(ids);
                      $("#Main_BtnImpFc").click();

                  } catch (e) {

                  }

              }

              function Fc(ids) {
                  try {
                      var json = JSON.stringify
                     ({

                         "v_id": ids

                     });
                      $.ajax({
                          type: "POST",
                          url: "Ordenes_Servicios.aspx/WsFcId",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function () {
                              window.location.href = "Cbtes.aspx?TipoOp=OS";
                          }),
                          error: errores
                      });

                  } catch (e) {

                  }

              }

              function NuevaOrden(ids) {
                  try {
                      var json = JSON.stringify
                     ({
                        
                         "v_Id": ids

                     });
                      $.ajax({
                          type: "POST",
                          url: "Ordenes_Servicios.aspx/WsOrden",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function () {
                              window.location.href = "Contra_Orden.aspx";
                          }),
                          error: errores
                      });

                  } catch (e) {

                  }

              }
               // CLiente alta



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
                          success: CargarDep,
                          error: errores
                      });


                  } catch (e) {
                      alert(e.message);
                  }
              }
              function CargarDep(Resultado) {

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

               
              function esValido2(menu) {
                  $.ajax({
                      url: "/Services/controlador_intranet.ashx?data=1&permiso=" + menu,
                      responseType: "json",
                      timeout: 20000,
                      cache: true,
                      success: function (result) {
                          $.each(eval(result), function (i, obj) {
                              if (obj.existe == "si") {
                                  $('.admin').show();
                              } else {
                                  $('.admin').hide();

                              }
                          })
                      },
                      error: function (jqXHR, textStatus, errorThrown) {
                      }
                  });
              }

                
               </script>
    
</asp:Content>

