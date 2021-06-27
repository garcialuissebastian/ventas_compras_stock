

<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Contra_Orden.aspx.cs" Inherits="HardSoft.App.Kardex.Contra_Orden" %>
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
    </style>


     <div class=" container" style="margin-top: 36px;">  
    <div style="margin-top:0px;text-transform:uppercase"  >
     <div style="display:none">
           <asp:TextBox ID="TxtIdFc" runat="server"></asp:TextBox>
           <asp:Button ID="BtnImpFc" runat="server" Text="" OnClick="BtnImpFc_Click" />
             </div>
        
        <div class="alert alert-cab"  >
           <div class="row">
             <div class="col-xs-6">
       <strong>   Contra Orden </strong>
                </div> 
             <div class="col-xs-6" style="text-align:right">
       <strong>   N° Orden: <asp:Label ID="lblOrden" runat="server" Text="Label"></asp:Label> </strong>
                </div> 
               </div>
            </div>

          <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
   
               <div class="col-xs-6"> 
       <div class="form-horizontal"  > 
                              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="color:white !important;font-weight:800" >Cliente:</label>
         <div class="col-xs-10">
<asp:TextBox ID="TxtClienteNombre" runat="server"  class="form-control"    ></asp:TextBox>
            
         </div>  
     </div> 
     
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="color:white !important;font-weight:800" >Tel:</label>
         <div class="col-xs-10">
<asp:TextBox ID="TxtTel" runat="server"  class="form-control"    ></asp:TextBox>
            
         </div>  
     </div> 
           
             </div> 
    </div>  
             <div class="col-xs-6"> 
       <div class="form-horizontal"  >
   
                            
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="color:white !important;font-weight:800" >Equipo:</label>
         <div class="col-xs-10">
<asp:TextBox ID="TxtEquipo" runat="server"  class="form-control"    ></asp:TextBox>
            
         </div>  
     </div>

       
    
           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="color:white !important;font-weight:800" >Motivo:</label>
         <div class="col-xs-10">
<asp:TextBox ID="TxtMotivo" runat="server"  class="form-control"    ></asp:TextBox>
            
         </div>  
     </div> 
               </div>   </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      
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
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>
    
           
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


          <div   style="margin-top:0px;text-transform:uppercase;margin-left:10px;margin-right:10px" >
      
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
  
         
         <div class="col-xs-12"  style="margin-bottom:15px; margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
 Técnico
         </div>
       


       <div class="col-xs-6">
          
       <div class="form-horizontal" >
         

                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Problema detectado por el cliente </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtMotivoR" runat="server" class="form-control" TextMode="MultiLine"  ></asp:TextBox>
      
         </div>
           
     </div> 

                 <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Informe Técnico </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxrInfoTec" runat="server" class="form-control" TextMode="MultiLine"  ></asp:TextBox>
      
         </div>
           
     </div> 
        
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Observación</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtObservacion" runat="server" class="form-control"    TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div> 

              <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
REPARACIÓN
         </div>
           
     </div>
                        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4 " style="">Valor de reparación $</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtValorRep" runat="server" class="form-control" Width="100px"  onkeypress="return acceptNum2(event, this.value)" onkeydown="if (event.keyCode == 13) {  return false;} " ></asp:TextBox>
      
         </div>
           
     </div>  
          
             </div>
          </div>
       <div class="col-xs-6">

           
          
        <div class="form-horizontal">
              
         
            
               <div class="form-group hidden">
         <label for="TxtNombre" class="control-label col-xs-4">Tiempo de reparación </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtTiempoRep" runat="server" class="form-control"    ></asp:TextBox>
      
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
 
          <div class="col-xs-12">
                    <div class="col-md-12  " style="margin-top:6px; background-color:#deeaea; text-align:left;    border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Repuestos <a class="tooltips" style="cursor:pointer " onclick="VerProv()"> 
        
        &nbsp <img src="/images/add-mas.png" style="height: 16px;">        
<span>Agregar Repuesto </span></a>

    </div>

     
     <div id='ResultadoProv' style=  "margin-bottom:10px; overflow-y: auto; overflow-x: hidden; height: 120px; width: 100%; background-color: floralwhite;">
      
</div>


<div  style="color:red;font-size:20px;margin-right:20px;text-align:right" >TOTAL DE REPUESTOS$: <span id="IdTotal">00.00 </span></div>

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
         <asp:TextBox ID="TxtIdOrd" runat="server"></asp:TextBox>
          <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
    </div>
  
</div>
        
            <div   style="margin-top:5px; margin-bottom:5px;background-color:#b9b9b9; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar</button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJsOrd()"  >
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
  
    
   
     <div class="modal fade" id="ModalArt" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
       
        <div class="modal-body"> 
  <div   style="margin-top:0px;text-transform:uppercase" >
            
      <div id="tabsArt" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs-1"> Datos</a></li>
      
      
  </ul>

   

  <div id="tabs-1" style="background-color: #f1f1f1;">
        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
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
    
    <div class="col-xs-3" >
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
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="Label3" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="e" runat="server"   />
    <input id="hddIdArt" type="hidden" />
       <input id="hddIdMod" type="hidden" />
</div> 
  <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoB' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
         
     </div>
           </div>
  </div>

        </div>


<div class="row" style="margin-left:20px; margin-right:20px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
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

   </div>

    </div>


 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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


         limpiarArt(); 
         function VerProv() {
             $("#ModalArt").modal();
             limpiarArt();
         }
         function limpiarArt() {
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

                                     Tabla_Datos = Tabla_Datos + "<tr   style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.IdGrilla + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Cant + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + "</td></td></tr>";
                                     sal2 = sal + sal2;

                                 });


                                 $("#IdTotal").text(parseFloat(sal2).toFixed(2));


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
                                       $('<option></option>').val('1').html('Lista1 -'+Pacientes.l1_desc)
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
                             $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL1).toFixed(2));
                             $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL1).toFixed(2));
                             }
                             if ("2" == $("#cmbPrecio").val()) {
                                 $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL2).toFixed(2));
                                 $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL2).toFixed(2));
                             }
                             if ("3" == $("#cmbPrecio").val()) {
                                 $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL3).toFixed(2));
                                 $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL3).toFixed(2));
                             }
                             if ("4" == $("#cmbPrecio").val()) {
                                 $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL4).toFixed(2));
                                 $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL4).toFixed(2));
                             }
                             if ("5" == $("#cmbPrecio").val()) {
                                 $("#Main_TxtNeto").val(parseFloat(result.d.P_NetoL5).toFixed(2));
                                 $("#Main_TxtFinal").val(parseFloat(result.d.P_FinalL5).toFixed(2));
                             }

                         

                     }
                 },

                 error: errores
             });

         }




         ///////////// end


          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }
      

          function fn_cantidad() {
              cantidad = $("#grilla tbody").find("tr").length;
              $("#span_cantidad").html(cantidad);
          };
          $(function () {
              $('#tabsArt').tabs();
              
              Buscar();
              $("#Main_TxtClienteNombre").prop('disabled', true);
              $("#Main_TxtTel").prop('disabled', true);
              $("#Main_TxtEquipo").prop('disabled', true);
              $("#Main_TxtMotivo").prop('disabled', true);


              $("#Main_TxtStock").prop('disabled', true);
              $("#Main_TxtNeto").prop('disabled', true);
              $("#Main_TxtFinal").prop('disabled', true);
              ListarDeposito();
              ListaPrecios();
          });
          var table = document.getElementById("grilla");

          function PopAlta() {
              
              $("#TituloPop").text('Nueva Contra Orden');
              limpiar();
              $("#btnAgregar1a").hide();
              $("#btnGuardar1a").show();
              $("#ModalCat").modal();

          }

      function   ModificarJs(){ 
                  try {

                      var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                      ({
                          // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                          "v_obj": { 
                              "Id":   $("#hddIdMod").val(),
                              "Orden_Id": $("#Main_lblOrden").text(),
                              "Observacion": $("#Main_TxtObservacion").val(),
                              "Motivo": $("#Main_TxtMotivoR").val(),
                              "Info_Tecnico": $("#Main_TxrInfoTec").val(),
                              "Tiempo": $("#Main_TxtTiempoRep").val(),
                              "Valor": $("#Main_TxtValorRep").val(),
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
                          url: "Contra_Orden.aspx/WmMod2",
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

          function PopMod(id, obj) {

              $("#TituloPop").text('Modificar Contra Orden');
              limpiar();
              
              $("#hddIdMod").val(id);
              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();
              $("#ModalCat").modal();

              try {

                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      
                      "v_id": id
                  });

                  $.ajax({
                      type: "POST",
                      url: "Contra_Orden.aspx/WmModVer",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (result) {
                          Result= result.d;
                          $("#Main_TxtMotivoR").val(Result.Motivo);
                          $("#Main_TxtObservacion").val(Result.Observacion);
                          $("#Main_TxrInfoTec").val(Result.Info_Tecnico);
                          $("#Main_TxtValorRep").val(Result.Valor.replace(',', '.'));
                         
                          Ckiar("1", Result.Tactil);
                          Ckiar("2", Result.Boton_Home);
                          Ckiar("3", Result.Camara_Tracera);
                          Ckiar("4", Result.Camara_Delantera);
                          Ckiar("5", Result.Sensor_Proximidad);
                          Ckiar("6", Result.Parlantes);
                          Ckiar("7", Result.Auricular);
                          Ckiar("8", Result.Boton_Power);
                          Ckiar("9", Result.Volumen);



                          var Pacientes = Result.Repuestos;
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

                      }),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }


          }
          function limpiar() {

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

              $("#Main_TxtValorRep").val('00.00'); 
              $("#Main_TxtSerie").val('');
              $("#Main_TxtObservacion").val('');
              $("#Main_TxtMotivoR").val('');
              $("#Main_TxrInfoTec").val('');
              $("#Main_TxtTiempoRep").val(''); 
              $("#hddIdMod").val('0');
              $("#IdTotal").text('0');
              try {

                      $("#ResultadoProv").empty();

                      var json = JSON.stringify
                        ({
                            
                        });
                      $.ajax({
                          type: "POST",
                          url: "Contra_Orden.aspx/WmResetArts",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success:'', 
                          error: errores
                      });

                  } catch (e) {
                      alert(e.message);
                  }
              }



          

          function AltaJsOrd() {
              try {

                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": { 
                          "Id": '0',
                          "Orden_Id": $("#Main_lblOrden").text(),
                          "Observacion": $("#Main_TxtObservacion").val(),
                          "Motivo": $("#Main_TxtMotivoR").val(),
                          "Info_Tecnico": $("#Main_TxrInfoTec").val(),
                          "Tiempo": $("#Main_TxtTiempoRep").val(),
                          "Valor": $("#Main_TxtValorRep").val(),
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
                      url: "Contra_Orden.aspx/WmAlta2",
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
                Buscar();

              limpiar();
              $("#ModalCat").modal('hide');
               

          }
          function Buscar() {

              try { 

                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({


                        "v_tipo": '0',
                        "v_valor": ''

                    });
                  $.ajax({
                      type: "POST",
                      url: "Contra_Orden.aspx/WsListar",
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
 
          function resultado(Resultado) {
              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = "";

              $("#Resultado").show();
              $("#Resultado").empty();
              Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th><th></th><th>No</th><th>Motivo</th><th>Info_Tecnico</th><th>Fecha</th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  var ss = "<a class='tooltips admin' style='display: none' onclick='Fc(" + pacientes.Id + ");' > <img src='/images/divisa.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Facturar</span></a>";

                  if (pacientes.Pagado != 'N') {
                      ss = "<a class='tooltips admin' style='display: none;' onclick='VerFc(" + pacientes.Pagado + ");' > <img src='/images/factura.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Factura</span></a>";

                  }

                  Tabla_Datos = Tabla_Datos + "<tr  ><td style='width:30px'> <a class='tooltips' onclick='PopMod(" + pacientes.Id + ",this);' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.Id + ",this);' > <img src='/images/Ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Más</span></a></td><td  style='width:30px'>" + ss + "</td><td>" + pacientes.No + "</td><td>" + pacientes.Motivo + "</td><td>" + pacientes.Info_Tecnico + "</td><td>" + pacientes.Fecha + "</td></tr>";
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
                      url: "Contra_Orden.aspx/WsFcId",
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

                              Tabla_Datos = Tabla_Datos + "<tr   style='cursor:pointer;'> <td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.IdGrilla + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Cant + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) + "</td><td>" + parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) * +parseFloat(pacientes.Cant)).toFixed(2) + "</td></td></tr>";
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
 
 <%--    <script>
         $(document).ready(function () {


             $(this).everyTime(50000, function () {

                 $.ajax({
                     type: "POST",
                     url: "/ActiveSession.aspx/KeepActiveSession",
                     data: {},
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     async: true,
                     success: VerifySessionState,
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                         window.location.href = "/";

                     }
                 });

             });
             function VerifySessionState(result) {

                 if (!result.d) {
                     window.location.href = "/";
                 }
             }

             //fin de ready

         });
     </script>
   --%>
</asp:Content>
