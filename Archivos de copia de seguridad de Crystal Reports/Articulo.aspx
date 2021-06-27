
<%@ Page Title="" Language="C#" MasterPageFile="../Master/HomeOn.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="Articulo.aspx.cs" Inherits="HardSoft.App.Kardex.Articulo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/App/Kardex/UsrControl/SubRubros.ascx" TagPrefix="uc1" TagName="SubRubros" %>
<%@ Register Src="~/App/Kardex/UsrControl/Marcas.ascx" TagPrefix="uc1" TagName="Marcas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      
   
         <script type="text/javascript" src="/js/jquery.js"></script>
    
      <script type="text/javascript" src="/js/formError.js"></script>

    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    <script src="../../js/jquery.maskedinput.js"></script>
   
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
     <script language="JavaScript" type="text/javascript">
         $(document).keypress(function (event) {
             // para q no haga submit cuando pressiono enter en alguna parte
             var keycode = event.keyCode || event.which;
             if (keycode == '13' ||keycode == '9' ) {
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
             // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46,'-' 45
             var key = nav4 ? evt.which : evt.keyCode;
            // alert(key);
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

                 return (key <= 13 || (key >= 48 && key <= 57) || key == 46|| key == 45);
             }
         }


         function acceptNum(e) {
             var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
             return ((tecla > 47 && tecla < 58) || tecla == 8);
         }
    </script>

    
    <style>
                  input:invalid {
  background-color: #ffdddd;
}
form:invalid {
  border: 5px solid #ffdddd;
}
.valid {
  background-color: #ddffdd;
      border: red 2px solid;
}
form:valid {
  border: 5px solid #ddffdd;
} 
input:required {
  border-color: #800000;
  border-width: 3px;
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
    
       
    <div class=" container" style="margin-top: 36px;">
   
        
    <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-cab"  >
          Articulos  
            </div>
        <div  id="esp" style="height:350px;background-color: #f1f1f1; display:none" >
      
            
            
                <div id="tabs2" style="text-transform:uppercase;font-size:12px; ">
  <ul>
    <li><a href="#tabs2-1"> Buscar</a></li>
       <li><a href="#tabs2-2"> Rubro / Sub Rubro</a></li> 
       <li><a href="#tabs2-3"> Marca / Modelo</a></li> 
  </ul> 


  <div id="tabs2-1" style="background-color: #f1f1f1;">
        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOp" class="form-control">
           <option value="9">Todo</option>
                <option value="3">CodBarra Proveedor</option>
           <option value="8">CodBarra Sistema</option>      
          <option value="0">Nombre</option>
            <option value="1">Cod Sistema</option>
          <option value="2">Cod Manual</option>
           
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscarA" runat="server"  class="form-control" onkeydown="if (event.keyCode == 13) {  return false;} "></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina1R" type="button" class="btn2  btn-default "  onclick="Buscar()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>
           <span class="pull-right" style="margin-right:20px">        <a class="tooltips tooltipsArt" style="cursor:pointer "  onclick="rpDP2()">   <img src="../../images/Excel2.png" /> <span>Descar Excel  </span></a> </span>
         </div>
       </div> 
</div>
</div>
  
      </div>

<div id="tabs2-2" style="background-color: #f1f1f1;">

        
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
      <select id="cmbRubro" class="cmbBuscar form-control" style="width: 100%" onchange="pp()">
                <option value="0"  selected="selected">- -</option> 
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
        <span class="pull-right" style="margin-right:20px">        <a class="tooltips tooltipsArt" style="cursor:pointer "  onclick="rpDP2()">   <img src="../../images/Excel2.png" /> <span>Descar Excel  </span></a> </span>
   </div> 


   </div> 
</div>
</div>
  
      </div>

<div id="tabs2-3" style="background-color: #f1f1f1;">

        
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
      <select id="cmbMarca" class="cmbBuscar form-control  " style="width: 100%" onchange="pp2()">
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
        <span class="pull-right" style="margin-right:20px">        <a class="tooltips tooltipsArt" style="cursor:pointer "  onclick="rpDP2()">   <img src="../../images/Excel2.png" /> <span>Descar Excel  </span></a> </span>
   </div> 


   </div> 
</div>
</div>
  
      </div>               

  <div class="row" style="margin-left:0px; margin-right:0px;  border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style=" margin-right: 0px;background-color: #f1f1f1;" > 
    <div id='ResultadoB' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
         
     </div>
           </div>
  </div>       

</div>
   </div>


      </div>

 <div style="">
<div class=" " >
          <div class="col-sm-6" style=" background-color: #f1f1f1; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
  <div class=" " style="  background-color:#333;color:white; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
 STOCK   <span class="pull-right" style="margin-right:10px">        <a class="tooltips tooltipsArt" style="cursor:pointer "  onclick="rpDP()">   <img src="../../images/excel.png" /> <span>Excel Stock </span></a> </span>
  </div>
                <div id='ResultadoDep' style="overflow-y: auto; overflow-x: hidden; height: 120px; width: 100%; ">
        
        <div> </div>
         
     </div>
           </div>

      <div class="col-sm-6" style="background-color: #f1f1f1; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">  
  <div class=" " style="  background-color:#333;color:white; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
 LOTE
  </div>
            <div id='ResultadoLote' style="overflow-y: auto; overflow-x: hidden; height: 120px; width: 100%; ">
        
        <div> </div>
         
     </div>
           </div>

  </div>
</div>

<script>
    function rpDP() {
        $("#Main_Button2").click();
       
    }
    function rpDP2() {
        $("#Main_Button1").click();

    }

</script>

        <div style="display:none">
               <asp:TextBox ID="valorFoco" runat="server"    CssClass="form-control" ></asp:TextBox>
           <asp:Button ID="Button1" runat="server" Text="Exel" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="ExelDep" OnClick="Button2_Click" />
        </div>
       <div   class="col-sm-12" style="margin-top:5px; margin-bottom:20px;
background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >

             
              <button id="btnAgregar1P" type="button" class="btn2 btn-default  "  onclick ="PopAlta()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo</button>
    
           
        <button id="btnVolver1P" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />




                     <!-- Modal -->
  <div class="modal fade" id="Modaladd" role="dialog" style="display:none"  >
    <div class="modal-dialog   " style="width:93%; display:none" id="MArt">
    
      <!-- Modal content-->
       
          <div class="modal-content">
     
        <div class="modal-body"  style="overflow-y: auto; overflow-x: hidden; height:630px">

      <div id="tabs" style="text-transform:uppercase;font-size:12px">
  <ul>
    <li><a href="#tabs-1"> Datos Generales</a></li>
      <li><a href="#tabs-2"> Precios</a></li>
    <li><a href="#tabs-3">Reposición y Ubicación</a></li>
      
  </ul>


  <div id="tabs-1" style="background-color: #f1f1f1;">

      <div class="row" style="">


      <div class="col-md-4">
      <div class="form-horizontal" style="background-color:#deeaea;     border-radius: 4px;padding:5px">

              <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Tipo  : </label>
         <div class="col-xs-8">

   <asp:DropDownList ID="CmbTipoArticulo" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem>ARTICULO</asp:ListItem>
                                            <asp:ListItem>SERVICIO</asp:ListItem>
                                            <asp:ListItem>BIENES DE USO</asp:ListItem>
                                            <asp:ListItem>MATERIA PRIMA</asp:ListItem>
                                            
                                             
                                        </asp:DropDownList>
      
         </div>
           
     </div>
                    
            <div class="form-group" >
         <label for="TxtNunDoc" class="control-label col-xs-4">U.Medida:</label>
         <div class="col-xs-8">
           
                          <select id="cmbUnidad" class=" form-control" style="text-transform:uppercase">
                          
  <option value="7" style="padding-left:10px;"> unidades</option>
                               <option value="1" style="padding-left:10px;"> kilogramos</option>
                               <option value="2" style="padding-left:10px;"> metros</option>
                               <option value="3" style="padding-left:10px;"> metros cuadrados</option>
                               <option value="4" style="padding-left:10px;"> metros cúbicos</option>
                               <option value="5" style="padding-left:10px;"> litros</option>
                               <option value="6" style="padding-left:10px;"> 1000 kWh</option>
                              <option value="8" style="padding-left:10px;"> pares</option><option value="9" style="padding-left:10px;"> docenas</option><option value="10" style="padding-left:10px;"> quilates</option><option value="11" style="padding-left:10px;"> millares</option><option value="14" style="padding-left:10px;"> gramos</option><option value="15" style="padding-left:10px;"> milimetros</option><option value="16" style="padding-left:10px;"> mm cúbicos</option><option value="17" style="padding-left:10px;"> kilómetros</option><option value="18" style="padding-left:10px;"> hectolitros</option><option value="20" style="padding-left:10px;"> centímetros</option><option value="25" style="padding-left:10px;"> jgo. pqt. mazo naipes</option><option value="27" style="padding-left:10px;"> cm cúbicos</option><option value="29" style="padding-left:10px;"> toneladas</option><option value="30" style="padding-left:10px;"> dam cúbicos</option><option value="31" style="padding-left:10px;"> hm cúbicos</option><option value="32" style="padding-left:10px;"> km cúbicos</option><option value="33" style="padding-left:10px;"> microgramos</option><option value="34" style="padding-left:10px;"> nanogramos</option><option value="35" style="padding-left:10px;"> picogramos</option><option value="41" style="padding-left:10px;"> miligramos</option><option value="47" style="padding-left:10px;"> mililitros</option><option value="48" style="padding-left:10px;"> curie</option><option value="49" style="padding-left:10px;"> milicurie</option><option value="50" style="padding-left:10px;"> microcurie</option><option value="51" style="padding-left:10px;"> uiacthor</option><option value="52" style="padding-left:10px;"> muiacthor</option><option value="53" style="padding-left:10px;"> kg base</option><option value="54" style="padding-left:10px;"> gruesa</option><option value="61" style="padding-left:10px;"> kg bruto</option><option value="62" style="padding-left:10px;"> uiactant</option><option value="63" style="padding-left:10px;"> muiactant</option><option value="64" style="padding-left:10px;"> uiactig</option><option value="65" style="padding-left:10px;"> muiactig</option><option value="66" style="padding-left:10px;"> kg activo</option><option value="67" style="padding-left:10px;"> gramo activo</option><option value="68" style="padding-left:10px;"> gramo base</option><option value="96" style="padding-left:10px;"> packs</option><option value="98" style="padding-left:10px;"> otras unidades</option>  
                              <option value="99" style="padding-left:10px;"> comprimidos</option>              
                     </select> 
         </div>
          
     </div>

   

              <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4">Cod Manual:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtCod_Manual" runat="server"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>

       <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Rubro:</label>
         <div class="col-xs-6">
           
           
             <asp:TextBox ID="TxtRubro" runat="server" class="form-control" placeholder=""></asp:TextBox>
             <asp:HiddenField ID="TxtIdRu" runat="server" />
              </div>
            <div class="col-xs-2">
                    


                 <a class="tooltips tooltipsArt" style="cursor:pointer "  onclick="VerRu()">    <img src="../../images/buscar-documentos.png"  style="height:28px" /><span>Buscar Rubro </span></a> 
                
                  </div>
            
     </div>
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Sub Rubro:</label>
         <div class="col-xs-8">
             <asp:HiddenField ID="TxtIdRuSub" runat="server" />
             <asp:TextBox ID="TxtSubRubro" runat="server" class="form-control" placeholder="" ></asp:TextBox>
         </div>
        
     </div>
    
      
        <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Marca:</label>
         <div class="col-xs-6">
           
           
             <asp:TextBox ID="TxtMk" runat="server" class="form-control" placeholder=""></asp:TextBox>
             <asp:HiddenField ID="HddMk" runat="server" />
              </div>
            <div class="col-xs-2">
                    
                 <a class="tooltips tooltipsArt" style="cursor:pointer "  onclick="VerMk()">    <img src="../../images/buscar-documentos.png"  style="height:28px" /><span>Buscar Marca </span></a> 
                
                  </div>
            
     </div>
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Modelo:</label>
         <div class="col-xs-8">
             <asp:HiddenField ID="HddMod" runat="server" />
             <asp:TextBox ID="TxtMod" runat="server" class="form-control" placeholder="" ></asp:TextBox>
         </div>
        
     </div>
    
          
              <div class="form-group">
        <div class="col-xs-4" style="text-align: right;">
                    <input id="Cklote" type="checkbox" /> 
  <strong>&nbsp&nbsp LOTE </strong> </div>
         <div class="col-xs-8" style="font-size:9px">
           
        (Indica si manejará un control de lotes y caducidades para este articulo)
         </div>
          
     </div>
          <div class="form-group">
        <div class="col-xs-4" style="text-align: right;">
 <input id="Ckstock" type="checkbox" /> 
  <strong> STOCK </strong>

        </div>
         <div class="col-xs-8" style="font-size:9px">
           
      (Indica si manejará un control de stock para este articulo)
         </div>
          
     </div>
         
         
      </div>

 

   </div>



<div class="col-md-8">

       <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">
           
       
        Nombre del Articulo:   <asp:TextBox ID="TxtNombre" runat="server" Width="100%" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
    </div>

   
    <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Proveedores <a class="tooltips tooltipsArt" style="cursor:pointer " onclick="VerProv()"> 
        
        &nbsp <img src="/images/add-mas.png" style="height: 16px;">        
<span>Agregar Proveedor </span></a>

    </div>

     
     <div id='ResultadoProv' style="overflow-y: auto; overflow-x: hidden; height: 120px; width: 100%; background-color: floralwhite;">
      
</div>
    
     <div  class="col-md-6 "  style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px;margin-top:10px;  ">Código Barra Del Proveedor</div>
   
     <div class="col-md-6  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px;margin-top:10px">Código Barra Del Sistema</div>
   <div class="col-md-6">
         <div class="form-horizontal" style="">
             
                    
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Código :</label>
        <div class="col-xs-8">
            <asp:TextBox ID="TxtCodBarra" runat="server" CssClass="form-control"  onkeypress="return acceptNum(event)"></asp:TextBox>
               </div>
           
     </div>        
               
      
</div>
       </div>
     <div class="col-md-6">
         
         <div class="form-horizontal" style="">
<div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" ></label>
        <div class="col-xs-10">

            <img src="../../images/BarCod.png" /> <br />
            <div style="padding-left: 73px;padding-top: 5px; padding-left:76px ">
                    <button id="btnAgregar1" type="button" class="btn2 btn-info   " onclick="ImpTk()" >
    <span class=" glyphicon glyphicon-print"></span>  
 </button>
 <script>
     function ImpTk() {
         $("#Main_BtnImp").click();
     }
            </script>
            </div>
           <div style="display:none">
            <asp:TextBox ID="TxtTipo" runat="server"></asp:TextBox>
            <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
           </div>      
        
        </div>
           
     </div> 
     
</div>
       </div>

<%--aca--%>


    </div>
          
          
            </div>

 </div>
 
<div id="tabs-2" style="background-color: #f1f1f1;">
   <div class="row" style="padding:10px">






      <div class="col-md-4">
      <div class="form-horizontal">
         <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Venta</div>
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
          
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Moneda: </label>
         <div class="col-xs-8">

   <asp:DropDownList ID="cmbMoneda" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem Value="PESO">Peso</asp:ListItem>
                                            <asp:ListItem Value="DOLAR">Dolar</asp:ListItem>
                                         
                                             
                                             
                                        </asp:DropDownList>
      
         </div>
           
     </div>          
          
   <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Compra</div>
   <div class="form-group">
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
        
          
          
             
              <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Cuentas Contables</div>
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">CONT. VENTAS  : </label>
         <div class="col-xs-8">

  
               <select id="Main_CmbVtas" class="cmbBuscar form-control"  style="width: 100%">  </select> 
             


      
         </div>
           
     </div>
         <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">CONT. COMPRA   : </label>
         <div class="col-xs-8">
 
      
                <select id="Main_CmbCompras" class="cmbBuscar form-control"  style="width: 100%">  </select> 
             



         </div>
           
     </div>

</div>


   </div>



<div class="col-md-8">
   
    <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">PRECIO </div>
    



    <div class="col-md-12"   style="    margin-bottom: -22px;" 
>  <div class="form-horizontal">
          <div class="form-group">


                <label for="inputName" class="control-label col-xs-2 "> COSTO NETO S/IVA </label>
       <div class="col-xs-2">
                <asp:TextBox ID="TxtNeto" runat="server" class="form-control" placeholder="$"    onkeypress="return acceptNum2(event, this.value)" onkeydown="saltar('Main_TxtFinalVta')"   ></asp:TextBox>                
      
             </div> 
      
           <label for="inputName" class="control-label col-xs-2"  >COSTO C/ IVA  </label>
            <div class="col-xs-2">                <asp:TextBox ID="TxtFinal" runat="server"    class="form-control" placeholder="$"  onkeypress="return acceptNum2(event, this.value)" onkeydown="
ModifyEnterKeyPressAsTab2()"></asp:TextBox>
            
         </div>   

               <label for="inputName" class="control-label col-xs-2">PRECIO VENTA C/IVA  </label>
            <div class="col-xs-2">                <asp:TextBox ID="TxtFinalVta" runat="server"    class="form-control" placeholder="$"
                onkeypress="return acceptNum2(event, this.value)"   onchange="paraPfinal()"  onkeydown="saltar('Ckrecal')"></asp:TextBox>
            
         </div>   

              </div>
 </div>
        
     </div>

     <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px;margin-top:10px">PRECIO VENTA</div>
   

     <div class="col-md-6" >
      <div class="form-horizontal" style="background-color:#f5f0ea;     border-radius: 4px;padding:10px">

          
            <div class="form-group">
               
         <label for="inputName" class="control-label col-xs-4">
       
      <strong>     Recalcular</strong>
         </label>
        <label for="inputName" class="control-label col-xs-4"> 

                <input id="Ckrecal" type="checkbox" class=" pull-left"   checked="checked" />
        </label>
           <label for="inputName" class="control-label col-xs-4">   % UTILIDAD </label>
        
           
     </div>



              <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">LISTA 1 : </label>
         <div class="col-xs-4">
                <asp:TextBox ID="TxtL1Nom" runat="server" class="form-control"   ></asp:TextBox>

      
         </div>
                    <div class="col-xs-4">
           
           
             <asp:TextBox ID="TxtL1Mar" onchange="recal()" runat="server" class="form-control" placeholder="%" onkeypress="return acceptNum2(event, this.value)" onkeydown="saltar('Main_TxtL1Neto')"></asp:TextBox>

              </div>
           
     </div>
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">LISTA 2 : </label>
         <div class="col-xs-4">
                <asp:TextBox ID="TxtL2Nom" runat="server" class="form-control"  ></asp:TextBox>

      
         </div>
                    <div class="col-xs-4">
           
           
             <asp:TextBox ID="TxtL2Mar" onchange="recal()" runat="server" class="form-control" placeholder="%" onkeypress="return acceptNum2(event, this.value)" onkeydown="saltar('Main_TxtL2Neto')"></asp:TextBox>

              </div>
           
     </div>

           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">LISTA 3 : </label>
         <div class="col-xs-4">
                <asp:TextBox ID="TxtL3Nom" runat="server" class="form-control"  ></asp:TextBox>

      
         </div>
                    <div class="col-xs-4">
           
           
             <asp:TextBox ID="TxtL3Mar" onchange="recal()" runat="server" class="form-control" placeholder="%" onkeypress="return acceptNum2(event, this.value)" onkeydown="saltar('Main_TxtL3Neto')"></asp:TextBox>

              </div>
           
     </div>

     <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">LISTA 4 : </label>
         <div class="col-xs-4">
                <asp:TextBox ID="TxtL4Nom" runat="server" class="form-control"  ></asp:TextBox>

      
         </div>
                    <div class="col-xs-4">
           
           
             <asp:TextBox ID="TxtL4Mar"  onchange="recal()" runat="server" class="form-control" placeholder="%" onkeypress="saltar('Main_TxtL4Neto')"></asp:TextBox>

              </div>
           
     </div>

               <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">LISTA 5 : </label>
         <div class="col-xs-4">
                <asp:TextBox ID="TxtL5Nom" runat="server" class="form-control"  ></asp:TextBox>

      
         </div>
                    <div class="col-xs-4">
           
           
             <asp:TextBox ID="TxtL5Mar" onchange="recal()" runat="server" class="form-control" placeholder="%" onkeypress="return acceptNum2(event, this.value)" onkeydown="saltar('Main_TxtL5Neto')"></asp:TextBox>

              </div>
           
     </div>

 
          
         
      </div>

   </div>

      <div class="col-md-6" >
      <div class="form-horizontal" style="background-color:#f5f0ea;     border-radius: 4px;padding:10px">

           
            <div class="form-group">
               
         <label for="inputName" class="control-label col-xs-5"> PRECIO NETO </label>
        <label for="inputName" class="control-label col-xs-5"> PRECIO FINAL</label>
      
         <label for="inputName" class="control-label col-xs-1">  </label>
           
           
     </div>


              <div class="form-group">
        
         <div class="col-xs-5">
                <asp:TextBox ID="TxtL1Neto" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="ModifyEnterKeyPressAsTab() " onblur="onBlurNetoLista(this,1) "  onfocus="onFocus(this)" ></asp:TextBox>

      
         </div>
                    <div class="col-xs-5">
           
           
             <asp:TextBox ID="TxtL1Final" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="ModifyEnterKeyPressAsTab() "   onblur="onBlurFinalLista(this, 1)"
   ></asp:TextBox>

              </div>
               <label for="inputName" class="control-label col-xs-1">  </label>
           
     </div>
       
               <div class="form-group">
        
         <div class="col-xs-5">
                <asp:TextBox ID="TxtL2Neto" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="ModifyEnterKeyPressAsTab()"      onblur="onBlurNetoLista(this,2)"  onfocus="onFocus(this)"></asp:TextBox>

      
         </div>
                    <div class="col-xs-5">
           
           
             <asp:TextBox ID="TxtL2Final" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="ModifyEnterKeyPressAsTab()"  onblur="onBlurFinalLista(this,2)"      ></asp:TextBox>

              </div>
                  <label for="inputName" class="control-label col-xs-2">  </label>
           
           
     </div>
               <div class="form-group">
        
         <div class="col-xs-5">
                <asp:TextBox ID="TxtL3Neto" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="ModifyEnterKeyPressAsTab()"  onblur="onBlurNetoLista(this, 3)"  onfocus="onFocus(this)" ></asp:TextBox>

      
         </div>
                    <div class="col-xs-5">
           
           
             <asp:TextBox ID="TxtL3Final" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="ModifyEnterKeyPressAsTab() "   onblur="onBlurFinalLista(this, 3)"  ></asp:TextBox>

              </div>
             <label for="inputName" class="control-label col-xs-1">  </label>
                   
     </div>
 
              <div class="form-group">
        
         <div class="col-xs-5">
                <asp:TextBox ID="TxtL4Neto" runat="server" class="form-control" placeholder="$"  onkeydown="ModifyEnterKeyPressAsTab() "   onblur="onBlurNetoLista(this,4)" onfocus="onFocus(this)" onkeypress="return acceptNum2(event, this.value)"></asp:TextBox>

      
         </div>
                    <div class="col-xs-5">
           
           
             <asp:TextBox ID="TxtL4Final" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="ModifyEnterKeyPressAsTab()" onblur="onBlurFinalLista(this, 4)"    ></asp:TextBox>

              </div>
 <label for="inputName" class="control-label col-xs-1">  </label>
                </div>
     <div class="form-group">
        
         <div class="col-xs-5">
                <asp:TextBox ID="TxtL5Neto"   runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)"   onkeydown="ModifyEnterKeyPressAsTab()"  onblur="onBlurNetoLista(this, 5)"  onfocus="onFocus(this)"></asp:TextBox>

      
         </div>
                    <div class="col-xs-5">
           
           
             <asp:TextBox ID="TxtL5Final" runat="server" class="form-control" placeholder="$" onkeypress="return acceptNum2(event, this.value)" onkeydown="saltar('btnModificar1')"  onblur="onBlurFinalLista(this,5); enListaFinal('L5') ;"  onfocus="onFocus(this)" ></asp:TextBox>

              </div>
                   <label for="inputName" class="control-label col-xs-1">  </label>
           
     </div>
 
     
      
              
      </div>

   </div>

    </div>
          
          
            </div>
 </div> 
    


 <div id="tabs-3" style="background-color: #f1f1f1;">
  <div class="row" style="padding:10px">


      <div class="col-md-4">
      <div class="form-horizontal">
        
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Depósito</label>
        <div class="col-xs-6">
              <select id="cmbDep" class="form-control"> 
      </select>
               </div>

              <div class="col-xs-2">
               <div class="hidden">
                      <button id="BtnDep" type="button" class="btn2  btn-danger  " onclick="AddDep()" >
    <span class=" glyphicon glyphicon-ok"></span> 
 </button>
               </div></div>
           
     </div>

 
          
            <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Reposición</div>
       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Stock Mín :</label>
        <div class="col-xs-8">
            <asp:TextBox ID="TxtStockMin"  onKeyPress="return acceptNum(event)" runat="server" CssClass="form-control" Text="0" style="width: 60px;" ></asp:TextBox>
               </div>
           
     </div>    
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Stock Máx :</label>
        <div class="col-xs-8">
            <asp:TextBox ID="TxtStockMax"   onKeyPress="return acceptNum(event)" runat="server" CssClass="form-control" Text="0" style="width: 60px;"></asp:TextBox>
               </div>
           
     </div>    

            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >P. de Pedido :</label>
        <div class="col-xs-5">
            <asp:TextBox ID="TxtPtoPedido"   onKeyPress="return acceptNum(event)" runat="server" CssClass="form-control " Text="0" style="width: 60px;"></asp:TextBox>
               </div>
                 <div class="col-xs-3">

                       <button id="BtnDep3" type="button" class="btn2  btn-danger  " onclick="AddDep()" >
    <span class=" glyphicon glyphicon-ok"></span> Aplicar
 </button>

             </div>

           
     </div>  
          
             <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">Ubicación</div>
       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Pasillo :</label>
        <div class="col-xs-8">
            <asp:TextBox ID="TxtPasillo" runat="server" CssClass="form-control" style="width: 100px;"></asp:TextBox>
               </div>
           
     </div>    
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Estantería :</label>
        <div class="col-xs-8">
            <asp:TextBox ID="TxtEstanteria" runat="server" CssClass="form-control" style="width: 100px;"></asp:TextBox>
               </div>
           
     </div>    

            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Nivel :</label>
        <div class="col-xs-5">
            <asp:TextBox ID="TxtNivel" runat="server" CssClass="form-control" style="width: 100px;"></asp:TextBox>
               </div>
             <div class="col-xs-3">

                       <button id="BtnDep2" type="button" class="btn2  btn-danger  " onclick="AddDep()" >
    <span class=" glyphicon glyphicon-ok"></span> Aplicar
 </button>

             </div>
     </div>    


</div>


   </div>



<div class="col-md-8">
   
    <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">REPOSICIÓN</div>
     
    <div id="ResultadoRep" style="overflow-y: auto; overflow-x: hidden; height: 170px; width: 100%; background-color: floralwhite;">
      
</div>
       <div class="col-md-12  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px">UBICACIÓN</div>
     
    <div id="ResultadoUbi" style="overflow-y: auto; overflow-x: hidden; height: 170px; width: 100%; background-color: floralwhite;">
      
</div>
    </div>
          
          
       </div>
 </div>
        
          
 </div> 
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
        <asp:TextBox ID="TxtPuesto" runat="server"></asp:TextBox>
    </div>
</div>
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >

      
    <button  id="btnModificar2" type="button" class="btn2 btn-info   pull-left" onclick="BtnFnModificarHab()">
    <span class="  glyphicon  glyphicon-pencil"></span> Modificar
  </button>
             
          
    <button  id="btnModificar1" type="button" class="btn2 btn-default  " onclick="BtnFnModificar1()">
    <span class="  glyphicon  glyphicon-pencil"></span> Guardar
  </button>
 
   
            
 
 <button id="btnGuardar1" type="button" class="btn2 btn-primary"  onclick="BtnFnGuardar1()" >
    <span class="   glyphicon glyphicon-floppy-disk"></span> Guardar
  </button>
 <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>

              <br />
 
<div style="display:none">

             
         <asp:Button ID="btnAgregar" runat="server" Text="Agregar"    />
                                         
                                       
                                         
                                       
                                           <asp:Button ID="btnModificar" runat="server"    
                                             Text=" Modificar"   />
                                                                                 
                                         
                                         <asp:Button ID="btnEliminar" runat="server"   
                                             Text="Baja"  />

    <asp:Button ID="btnCancelar" runat="server"   Text="Cancelar"  />
                                    
                                    
                                        <asp:Button ID="btnGuardar" runat="server"       Text="Guardar"   
                                             CssClass= "der" />
                                 
                       </div>          
                      


               </div>
 </div>
        <div class="modal-footer">
            
          
        </div>
      </div>
      
    </div>
   
 </div>

             <!-- Modal -->
  <div class="modal fade" id="ModalMk" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="background-color: #efefef;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
         
       <strong>  Marca</strong> 
             
        </div>
        <div class="modal-body">

         
            <uc1:Marcas runat="server" ID="Marcas" />

              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>



              <!-- Modal stock lote -->
  <div class="modal fade" id="ModalStockLote" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
      
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro"  >
      Stock Lote - Ingreso de Articulos por 
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       
       <div class="col-xs-12">
        <div class="form-horizontal">
      
        
               <div class="form-group">
         <label for="TxtNombreSk" class="control-label col-xs-2">Cod Sistema </label>
         <div class="col-xs-2">
  <asp:TextBox ID="TxtCodSisLt" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>

            <label for="TxtNombre" class="control-label col-xs-2">Deposito </label>
         <div class="col-xs-6">

<select id="cmbDepLt" class="form-control"></select>
      
         </div>
       
              
     </div>
      
   <div class="form-group">

                <label for="TxtNombreSk" class="control-label col-xs-2">Remito </label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtRemitoLt" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
         <label for="TxtNombreSk" class="control-label col-xs-2">Origen </label>
         <div class="col-xs-6">

 <asp:TextBox ID="TxtOrigenLt" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      

         <div class="form-group">


                       <label for="TxtNombre" class="control-label col-xs-2" >Proveedor</label>
         <div class="col-xs-5">
  <asp:TextBox ID="TxtProvLt" runat="server" class="form-control"  onkeypress="return acceptNum(event)" ></asp:TextBox>
      <div style="display:none">
          <asp:TextBox ID="TxtProvIdLt" runat="server"></asp:TextBox>
      </div>
         </div>
                <div class="col-xs-1" style="text-align:left">
              <a class="tooltips tooltipsArt" style="cursor: pointer;" onclick="VerProv()"> 
        
       <img src="/images/ver.png"  >    
                    
<span>Buscar Proveedor </span>   </a> &nbsp;

  </div>
    
            <div class="col-xs-2">
       
         </div>  
          
         <div class="col-xs-2">

         </div>
           
     </div>
             
      
      <div class="form-group">
           <label for="TxtNombre" class="control-label col-xs-2" >Cod Lote</label>
         <div class="col-xs-2">
  <asp:TextBox ID="TxtCodLt" runat="server" class="form-control"  onkeypress="return acceptNum(event)"  ></asp:TextBox>
      
         </div>

            <label for="TxtNombre" class="control-label col-xs-2" >Fecha Vto</label>
         <div class="col-xs-3">
      <div class=""> 
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

     

               <label for="TxtCantLtu" class="control-label col-xs-1" >Cantidad</label>
         <div class="col-xs-2">
  <asp:TextBox ID="TxtCantLt" runat="server" class="form-control"  onkeypress="return acceptNum(event)" ></asp:TextBox>
      
         </div>

        
           
     </div>
      
    
        <%--        <div  class="col-md-6 "  style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px;margin-top:10px;  ">Código Barra Del Proveedor</div>
   
     <div class="col-md-6  " style="background-color:#deeaea;     border-radius: 4px;padding:6px;font-weight:800;margin-bottom:10px;margin-top:10px">Código Barra Del Sistema</div>
   <div class="col-md-6">
         <div class="form-horizontal" style="">
             
                    
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Código :</label>
        <div class="col-xs-8">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"  onkeypress="return acceptNum(event)"></asp:TextBox>
               </div>
           
     </div>        
               
      
</div>
       </div>
     <div class="col-md-6">
         
         <div class="form-horizontal" style="">
<div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" ></label>
        <div class="col-xs-8">

            <img src="../../images/BarCod.png"  style="height:56px"/> <br />
            </div>
     <div class="col-xs-2">
            <div style="  ">
                    <button id="btnAgregar1" type="button" class="btn2 btn-info   " onclick="ImpTk()" >
    <span class=" glyphicon glyphicon-print"></span>  
 </button>
 <script>
     function ImpTk() {
         $("#Main_BtnImp").click();
     }
            </script>
            </div>
       </div>
         
             <div style="display:none">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="Button" OnClick="BtnImp_Click" />
           </div>      
        
        </div>
           
     </div> 
     
</div>
     --%>
            
              </div>



      <div style="text-align: center;
    border-top: solid;
    padding: 4px;">      <button id="btnAgregar1Sk" type="button" class="btn2 btn-danger " onclick="AddLtJs()">
     + Agregar al stock
 </button>

      </div>
  
      
              <div id='ResultadoLt' style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color: floralwhite;">
      <img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px' />
</div>
    
        </div>
          </div>
    

      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
          
                  <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
       
              <br />
                
               </div> 
</div> 
              </div>
        
      </div>
      
    </div>
   
 </div>

        <!-- Modal stock -->
  <div class="modal fade" id="ModalStock" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      Stock - Ingreso de Articulos
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       <div class="col-xs-2">
        <div class="form-horizontal">
        
         
  
         
        </div>
          </div>
       <div class="col-xs-8">
        <div class="form-horizontal">
      
          <div class="form-group">
         <label for="TxtNombreSk" class="control-label col-xs-4">Cod Sistema </label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtNombreSk" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>

                <label for="TxtNombreSk" class="control-label col-xs-2">Remito </label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtRemitoSk" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      
   <div class="form-group">
         <label for="TxtNombreSk" class="control-label col-xs-4">Origen </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtOrigenSk" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      

            
            
          <div class="form-group">


                       <label for="TxtNombre" class="control-label col-xs-4" >Proveedor</label>
         <div class="col-xs-6">
  <asp:TextBox ID="TxtProveedorSk" runat="server" class="form-control"  disabled
       ></asp:TextBox>
      <div style="display:none">
          <asp:TextBox ID="TxtProveedorSkId" runat="server"></asp:TextBox>
      </div>
         </div>
                <div class="col-xs-2" style="text-align:left">
              <a class="tooltips tooltipsArt" style="cursor: pointer;" onclick="VerProv()"> 
        
       <img src="/images/ver.png"  >    
                    
<span>Buscar Proveedor </span>   </a> &nbsp;

  </div>
    
            <div class="col-xs-2">
       
         </div>  
          
         <div class="col-xs-2">

         </div>
           
     </div>
      
      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Deposito </label>
         <div class="col-xs-8">

<select id="cmbDep2" class="form-control"></select>
      
         </div>
           
     </div>
      
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Cantidad</label>
         <div class="col-xs-3">
  <asp:TextBox ID="TxtCantidadSk" runat="server" class="form-control"  onkeypress="return acceptNum(event)" Width="80"></asp:TextBox>
      
         </div>

                <div class="col-xs-5">
  <asp:TextBox ID="TxtComentarioSk" runat="server" class="form-control"  placeholder="Comentario"    TextMode="MultiLine" ></asp:TextBox>
      
         </div>
           
     </div>
      
  
        
        </div>
          </div>
    <div class="col-xs-2">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>

      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label3" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField3" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarSkJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar 
 </button>
                  <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
       
              <br />
                
               </div> 
</div> 
              </div>
        
      </div>
      
    </div>
   
 </div>

               <!-- Modal -->
  <div class="modal fade" id="ModalRu" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="background-color: #efefef;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
         
       <strong>  SUB  Rubros </strong> 
             
        </div>
        <div class="modal-body">

            <uc1:SubRubros runat="server" ID="SubRubros" />


              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>


                <!-- Modal -->
  <div class="modal fade" id="ModalNombre" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="background-color: #efefef;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
         
       <strong>  Nombre del articulo </strong> 
             
        </div>
        <div class="modal-body">

            <asp:TextBox ID="TxtNombreGrande" runat="server" TextMode="MultiLine" Height="100px"></asp:TextBox>    

            <div style="margin-top:5px; margin-bottom:5px;background-color:#b9b9b9; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; ">


             
              <button id="btnAgregar1a4" type="button" class="btn2 btn-default " onclick="ModificarJs()" style="display: none;">
    <span class=" glyphicon glyphicon-save"></span> Modificar</button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJsOrd2()">
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>


        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

       <div id="Err" style="width:300px;float:right;font-weight:800" class="alert-danger"></div> 
    
               

              <br>
                
               </div>
              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>


               <!-- Modal -->
  <div class="modal fade" id="ModalPro" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="background-color: #efefef; text-shadow: #969696 0.1em 0.1em 0.2em;  ">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
         
       <strong>Proveedor </strong> 
             
        </div>
        <div class="modal-body">

             <div  >   
    <div style="margin-top:0px;text-transform:uppercase"  >
    
       
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOpP" class="form-control">
          <option value="0">Nombre</option>
          <option value="1">Id</option>
          <option value="2">Cod Manual</option>
          <option value="3">CUIT</option>
           
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscarP" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnPopB" type="button" class="btn2  btn-default "  onclick="BuscarP()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>
         <script>


                function ListarContables() {

            try {
 
                $.ajax({
                    type: "POST",
                    url: "Articulo.aspx/WsListarCtas",
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
                          
 
                         
                        });
           


                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }



             function BtnFnModificarHab() {
                 habilitarArt();
                 
                 $('#btnModificar1').show();
             }
             function BuscarP() {

                 try {


                     //   alert( $('#cmbTipoOp').val() );

                     var v_buscar = $('#cmbTipoOpP').val();
                     var json = JSON.stringify
                       ({
                           "v_tipo": $('#cmbTipoOpP').val(),
                           "v_valor": $('#Main_TxtBuscarP').val()

                       });
                     $.ajax({
                         type: "POST",
                         url: "Articulo.aspx/WsListarProv",
                         data: json,
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: resultadoPro,
                         error: errores
                     });

                 } catch (e) {
                     alert(e.message);
                 }
             }
             function resultadoPro(Resultado) {
                 var Pacientes = Resultado.d;
                 var Tabla_Titulo = "";
                 var Tabla_Datos = "";
                 var Tabla_Fin = "";
              

                 $("#ResultadoBuscarP").show();
                 $("#ResultadoBuscarP").empty();
                 Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th>Id</th> <th>Manual</th><th>Nombre</th><th>Tipo</th><th>Tel</th><th>Iva</th><th>Cuit</th></tr></thead><tbody>";
                 $.each(Pacientes, function (index, pacientes) {
                     Tabla_Datos = Tabla_Datos + "<tr onclick='CargarProv(" + pacientes.Id + ");' style='cursor:pointer;'><td style='background-image:url(/images/seleccionar-objeto.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.Denominacion + "</td><td>" + pacientes.Tipo + "</td><td>" + pacientes.Contac_Tel + "</td><td>" + pacientes.Iva + "</td><td>" + pacientes.Cuit + "</td></tr>";
                 });

                 Tabla_Fin = "</tbody></table>";
                 $("#ResultadoBuscarP").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                

             }

             function AddDep() {

                 try {

                      
                     var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                 ({
                     // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                     "v_obj": {
                         
                         "Id": '0',
                         "id_articulo": '0',
                         "id_deposito": $('#cmbDep').val(),
                         "Deposito": $('#cmbDep option:selected').text(),
                         "deposito_nombre": $('#cmbDep option:selected').text(),
                         "stock_minimo": $('#Main_TxtStockMin').val(),
                         "stock_maximo": $("#Main_TxtStockMax").val(),
                         "punto_pedido": $("#Main_TxtPtoPedido").val(),
                         "pasillo": $('#Main_TxtPasillo').val(),
                         "estanteria": $("#Main_TxtEstanteria").val(),
                         "nivel": $("#Main_TxtNivel").val()
 
                     }
                 });
                     $.ajax({
                         type: "POST",
                         url: "Articulo.aspx/WmAltaDep",
                         data: json,
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: resultadoDep,
                         error: errores
                     });

                 } catch (e) {
                     alert(e.message);
                 }
             }

             function ModifyEnterKeyPressAsTab2() {
                           if (!$("#Ckrecal").is(':checked')) { 
                    if (event.keyCode == 13)
                 {
                     var form = event.target.form;
    var index = Array.prototype.indexOf.call(form, event.target);
    form.elements[index + 1].focus();
    event.preventDefault();
                 }
                } 
               
             }


             function ModifyEnterKeyPressAsTab() {
                 if (event.keyCode == 13)
                 {
                     var form = event.target.form;
    var index = Array.prototype.indexOf.call(form, event.target);
    form.elements[index + 1].focus();
    event.preventDefault();
                 }
}
             function resultadoDep(Resultado) {
                 var Pacientes = Resultado.d;
                 var Tabla_TituloRep = "";
                 var Tabla_TituloUbi = "";
                 var Tabla_DatosRep = "";
                 var Tabla_DatosUbi = "";
                 var Tabla_Fin = "";

                 $("#ResultadoRep").show();
                 $("#ResultadoRep").empty();
                 Tabla_TituloRep = "<table  id='trep'   class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Depósito</th> <th>S.Mínimo</th><th>S.Máximo</th><th>P.Pedido</th></tr></thead><tbody style='text-align: center;'>";
                  
                 $("#ResultadoUbi").show();
                 $("#ResultadoUbi").empty();

                 Tabla_TituloUbi = "<table  id='tubi'   class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Depósito</th> <th>Pasillo</th><th>Estantería</th><th>Nivel</th></tr></thead><tbody style='text-align: center;'>";

                 $.each(Pacientes, function (index, pacientes) {
                     Tabla_DatosRep = Tabla_DatosRep + "<tr onclick='BuscarRep(" + pacientes.id_deposito + ");'  style='cursor:pointer;' ><td>" + pacientes.deposito_nombre + "</td><td>" + pacientes.stock_minimo + "</td><td>" + pacientes.stock_maximo + "</td><td>" + pacientes.punto_pedido + "</td></tr>";
                     Tabla_DatosUbi = Tabla_DatosUbi + "<tr ><td>" + pacientes.Deposito + "</td><td>" + pacientes.pasillo + "</td><td>" + pacientes.estanteria + "</td><td>" + pacientes.nivel + "</td></tr>";

                 });

                 Tabla_Fin = "</tbody></table>";
                 $("#ResultadoRep").html(Tabla_TituloRep + Tabla_DatosRep + Tabla_Fin);
                 $("#ResultadoUbi").html(Tabla_TituloUbi + Tabla_DatosUbi + Tabla_Fin);


                 //$('#Main_TxtStockMin').val('0');
                 //$('#Main_TxtStockMax').val('0');
                 //$('#Main_TxtPtoPedido').val('0');
                 //$('#Main_TxtPasillo').val('');
                 //$('#Main_TxtEstanteria').val('');
                 //$('#Main_TxtNivel').val('');

             }
      
            
           
             function ListaPrecios() {


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
                                
                                 $('#Main_TxtL1Nom').val(Pacientes.l1_desc);
                                 $('#Main_TxtL1Mar').val(Pacientes.l1.replace(",", "."));
                                 $('#Main_TxtL2Nom').val(Pacientes.l2_desc);
                                 $('#Main_TxtL2Mar').val(Pacientes.l2.replace(",", "."));
                                 $('#Main_TxtL3Nom').val(Pacientes.l3_desc);
                                 $('#Main_TxtL3Mar').val(Pacientes.l3.replace(",", "."));

                                 $('#Main_TxtL4Nom').val(Pacientes.l4_desc);
                                 $('#Main_TxtL4Mar').val(Pacientes.l4.replace(",", "."));
                                 $('#Main_TxtL5Nom').val(Pacientes.l5_desc);
                                 $('#Main_TxtL5Mar').val(Pacientes.l5.replace(",", "."));



                             }
                         },
                         error: errores
                     });

                 } catch (e) {
                     alert(e.message);
                 }
             }
 
             function CargarProv(ids ) {
             
                 try { 

                     $("#ModalPro").modal('hide');
                     var json = JSON.stringify
                       ({
                           "v_id": ids 
                       });
                     $.ajax({
                         type: "POST",
                         url: "Articulo.aspx/WsListarSelecProv",
                         data: json,
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (result) { 
                             if (result.d != null) {
                                 var Pacientes = result.d;
                                 var Tabla_Titulo = "";
                                 var Tabla_Datos = "";
                                 var Tabla_Fin = "";

                                 $("#ResultadoProv").show();
                                 $("#ResultadoProv").empty();
                                 Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th>  <th>Id</th> <th>Nombre</th>  <th>Cuit</th> </tr></thead><tbody  style='text-align: center;'>";
                                 $.each(Pacientes, function (index, pacientes) {
                                     Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvProDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Denominacion + "</td><td>" + pacientes.Cuit + "</td></tr>";
                                     $("#Main_TxtProvIdLt").val(pacientes.Id);
                                     $("#Main_TxtProvLt").val(pacientes.Denominacion + ' (' + pacientes.Cuit+')');

                                     $("#Main_TxtProveedorSkId").val(pacientes.Id);
                                     $("#Main_TxtProveedorSk").val(pacientes.Denominacion + ' (' + pacientes.Cuit+')');
                                 });

                                 Tabla_Fin = "</tbody></table>";
                                 $("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                             }
                         },
                         error: errores
                     });

                 } catch (e) {
                     alert(e.message);
                 }
             }

             function AddLtJs() {



                 //$("#ContentPlaceHolder1_TxtEmpresa3").addClass("valid");
                 //$("#ContentPlaceHolder1_TxtFecha_Ini3").removeClass("valid");

                 $("#Main_TxtCantLt").removeClass("valid");
                 if ($("#Main_TxtCantLt").val() <1) {
                     $("#Main_TxtCantLt").addClass("valid");
                     return;
                 }

                 $("#Main_TxtFechaCobro").removeClass("valid");
                 if ($("#Main_TxtFechaCobro").val() =="") {
                     $("#Main_TxtFechaCobro").addClass("valid");
                     return;
                 }

                 $("#Main_TxtCodLt").removeClass("valid");
                 if ($("#Main_TxtCodLt").val() == "" || $("#Main_TxtCodLt").val() < 1) {
                     $("#Main_TxtCodLt").addClass("valid");
                     return;
                 }
                 if ($("#cmbDepLt").val() == null) {
                     alert("Debe agregar un deposito para seguir.  Vaya al menu Entidad --> Deposito");
                 } else {

                     try {


                         var json = JSON.stringify
                        ({
                            "v_id": $("#Main_TxtCodSisLt").val(),
                            "v_dep": $("#cmbDepLt").val(),
                            "v_cant": $("#Main_TxtCantLt").val(),
                            "v_motivo": "INGRESO ARTICULO x LOTE",
                            "v_remito": $("#Main_TxtRemitoLt").val(),
                            "v_origen": $("#Main_TxtOrigenLt").val(),
                            "v_proveedor": $("#Main_TxtProvIdLt").val(),
                            "v_comentario":'',
                            "v_tipo_ingreso": "LOTE",
                            "v_lote": $("#Main_TxtCodLt").val(),
                            "v_vto": $("#Main_TxtFechaCobro").val()


                        });
                         $.ajax({
                             type: "POST",
                             url: "Articulo.aspx/WmAddLote",
                             data: json,
                             contentType: "application/json; charset=utf-8",
                             dataType: "json",
                             success: function (result) {
                                  
                                 actualizarStk($("#Main_TxtNombreSk").val());
                               

                                 if (result.d != null) {
                                                 var Pacientes = result.d;
                                                 var Tabla_Titulo = "";
                                                 var Tabla_Datos = "";
                                                 var Tabla_Fin = "";

                                                 $("#ResultadoLt").show();
                                                 $("#ResultadoLt").empty();
                                                 Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th>  <th>LOTE</th> <th>FECHA VTO</th>  <th>CANT</th>  <th>DEPOSITO</th></tr></thead><tbody  style='text-align: center;'>";
                                                 $.each(Pacientes, function (index, pacientes) {

                                                     var arrayDeCadenas = pacientes.Fecha_vto.split("/");
                                                     var f_dia = arrayDeCadenas[0];
                                                     var f_mes = arrayDeCadenas[1];
                                                     var f_anio = arrayDeCadenas[2];
                                                     // Please pay attention to the month (parts[1]); JavaScript counts months from 0:
                                                     // January - 0, February - 1, etc.
                                                     var fvto = new Date(f_anio, f_mes - 1, f_dia);

                                                     var today = new Date();

                                                     var color = "";
                                                     if (today > fvto) {
                                                         color = "color:red";

                                                     }
                                                     
                                                     Tabla_Datos = Tabla_Datos + "<tr   ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvLotDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Cod_Lot + "</td><td  style='" +color + "'>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td><td>" + pacientes.Dep_Desc + "</td></tr>";

                                                 });

                                                 Tabla_Fin = "</tbody></table>";
                                                 $("#ResultadoLt").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                                             }
                                         },
                             error: errores
                         });

                         ////var json = JSON.stringify
                         ////  ({
                         ////      "v_obj": {

                         ////          "Id_Art": $("#Main_TxtCodSisLt").val(),
                         ////          "Id_Dep": $("#cmbDepLt").val(),
                         ////          "Fecha_vto": $("#Main_TxtFechaCobro").val(),
                         ////          "Cant": $("#Main_TxtCantLt").val(),
                         ////          "Id_Prov": $("#Main_TxtProvIdLt").val(),
                         ////          "Cod_Lot": $("#Main_TxtCodLt").val(),
                         ////          "Dep_Desc": $("#cmbDepLt option:selected").text(),
                         ////          "Barra": ''
                         ////      }
                         ////  });
                         ////$.ajax({

                         ////    type: "POST",
                         ////    url: "Articulo.aspx/WmAddLote",
                         ////    data: json,
                         ////    contentType: "application/json; charset=utf-8",
                         ////    dataType: "json",
                         ////    success: function (result) {
                         ////        if (result.d != null) {
                         ////            var Pacientes = result.d;
                         ////            var Tabla_Titulo = "";
                         ////            var Tabla_Datos = "";
                         ////            var Tabla_Fin = "";

                         ////            $("#ResultadoLt").show();
                         ////            $("#ResultadoLt").empty();
                         ////            Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th>  <th>LOTE</th> <th>FECHA VTO</th>  <th>CANT</th>  <th>DEPOSITO</th></tr></thead><tbody  style='text-align: center;'>";
                         ////            $.each(Pacientes, function (index, pacientes) {
                         ////                Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvLotDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Cod_Lot + "</td><td>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td><td>" + pacientes.Dep_Desc + "</td></tr>";

                         ////            });

                         ////            Tabla_Fin = "</tbody></table>";
                         ////            $("#ResultadoLt").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                         ////        }
                         ////    },
                         ////    error: errores
                         ////});


                         $("#Main_TxtCodLt").val('0');
                         $("#Main_TxtFechaCobro").val('');
                         $("#Main_TxtCantLt").val('0');
                         $("#Main_TxtProvLt").val('');
                         $("#Main_TxtProvIdLt").val('0');


                     } catch (e) {
                         alert(e.message);
                     }
                 }
             }
             
             function gvLotDel(ids, oo) {
                 try { 
                    

                     if (!confirm("Esta seguro que desea eliminar ese lote ?")) {
                         return;
                     }


                     var json = JSON.stringify
                       ({
                           "v_id": ids
                       });
                     $.ajax({
                         type: "POST",
                         url: "Articulo.aspx/gvLote_del",
                         data: json,
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (result) {

                             llenarLotegrilla($("#Main_TxtCodSisLt").val());
                         },
                         error: errores
                     });

                 } catch (e) {
                     alert(e.message);
                 }
             }


             function gvProDel(ids) {
                 try {
 

                     var v_buscar = $('#cmbTipoOpP').val();
                     var json = JSON.stringify
                       ({
                           "v_id": ids 
                       });
                     $.ajax({
                         type: "POST",
                         url: "Articulo.aspx/gvProv_del",
                         data: json,
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success:  function (result) { 
                             if (result.d != null) {
                                 var Pacientes = result.d;
                                 var Tabla_Titulo = "";
                                 var Tabla_Datos = "";
                                 var Tabla_Fin = "";

                                 $("#ResultadoProv").show();
                                 $("#ResultadoProv").empty();
                                 Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th>  <th>Id</th> <th>Nombre</th>  <th>Cuit</th> </tr></thead><tbody  style='text-align: center;'>";
                                 $.each(Pacientes, function (index, pacientes) {
                                     Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Id + "</td><td>" + pacientes.Denominacion + "</td><td>" + pacientes.Cuit + "</td></tr>";
                                 });

                                 Tabla_Fin = "</tbody></table>";
                                 $("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                             }
                         },
                         error: errores
                     });

                 } catch (e) {
                     alert(e.message);
                 }
             }
             

             function ModificarSkJs() {
                 try {
                     $("#cmbDep2").formError({
                         remove: true,
                         successImage: {enabled:false}

                     });

                     $("#Main_TxtCantidadSk").formError({
                         remove: true,
                         successImage: { enabled: false }

                     });


                     if ($("#Main_TxtCantidadSk").val() == "0" || $("#Main_TxtCantidadSk").val() == "") {
                         $("#Main_TxtCantidadSk").formError(
	"DEBE AGREGAR UNA CANTIDAD.");
                         return;
                     }


                     if ($("#cmbDep2").val() == null) {

                         $("#cmbDep2").formError(
	"DEBE CREAR UN DEPOSITO ANTES DE SEGUIR. (DESDE EL MENU:--> ENTIDAD--> DEPOSITOS)");
                     } else {
                         var v_buscar = $('#cmbTipoOpP').val();
                         var json = JSON.stringify
                           ({
                               "v_id": $("#Main_TxtNombreSk").val(),
                               "v_dep": $("#cmbDep2").val(),
                               "v_cant": $("#Main_TxtCantidadSk").val(),
                               "v_motivo": "INGRESO ARTICULO",

                               "v_remito": $("#Main_TxtRemitoSk").val(),
                               "v_origen": $("#Main_TxtOrigenSk").val(),
                               "v_proveedor":  $("#Main_TxtProveedorSkId").val(),
                               "v_comentario": $("#Main_TxtComentarioSk").val(),
                               "v_tipo_ingreso": "STOCK",
                                "v_lote": "",
                            "v_vto": ""
                               
                           });
                         $.ajax({
                             type: "POST",
                             url: "Articulo.aspx/WsModStock",
                             data: json,
                             contentType: "application/json; charset=utf-8",
                             dataType: "json",
                             success: function (result) {


                                 $("#Main_TxtCantidadSk").val('');
                                 // Buscar();
                                 actualizarStk($("#Main_TxtNombreSk").val());
                                 $("#ModalStock").modal('hide');
                                 $("#Main_TxtNombreSk").val('');                                  
                                 $("#Main_TxtRemitoSk").val('');
                               $("#Main_TxtOrigenSk").val('');
                                  $("#Main_TxtProveedorSkId").val('');
                                  $("#Main_TxtComentarioSk").val(''); 
                                  $("#Main_TxtProvIdLt").val('');
                                  $("#Main_TxtProvLt").val(''); 
                                  $("#Main_TxtProveedorSkId").val('');
                                  $("#Main_TxtProveedorSk").val('');

                             },
                             error: errores
                         });
                     }
                 } catch (e) {
                     alert(e.message);
                 }
             }
             </script>

         </div>
       </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField4" runat="server"   />

</div> 
  <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoBuscarP' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
           <div class="wait" style=" margin:auto;  padding:2px; display:none"><img src='/images/Loading_icon.gif'    width="110"/><br>Loading..</div>
       
    

</div>
              </div>
     </div>

        </div></div>


              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>

          <script type="text/javascript">
              // barcod
            
              $("#Main_TxtBuscarA").on("keydown", function (event) {
                  if (event.which == 13) {
                      Buscar();
                      $("#Main_TxtBuscarA").val('');
                  }
              });
              ////


              $(document).keypress(function (event) {
                  // para q no haga submit cuando pressiono enter en alguna parte
                  var keycode = event.keyCode || event.which;
                  if (keycode == '13') {
                      return false;
                  }
              });

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
             
              function BuscarRep(ids) {

                  habiStk();
                  try {
                      var json = JSON.stringify
                        ({
                            "v_id": ids
                        });
                      $.ajax({
                          type: "POST",
                          url: "Articulo.aspx/WmListDep",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: function (result) {
                              if (result.d != null) {
                                  var Pacientes = result.d;

                                  $('#cmbDep').val(Pacientes.id_deposito);

                                  $('#Main_TxtStockMin').val(Pacientes.stock_minimo);
                                  $('#Main_TxtStockMax').val(Pacientes.stock_maximo);
                                  $('#Main_TxtPtoPedido').val(Pacientes.punto_pedido);
                                  $('#Main_TxtPasillo').val(Pacientes.pasillo);
                                  $('#Main_TxtEstanteria').val(Pacientes.estanteria);
                                  $('#Main_TxtNivel').val(Pacientes.nivel);
                              }
                          },
                          error: errores
                      });

                  } catch (e) {
                      alert(e.message);
                  }
              }
   
              function BtnFnModificar1() {
                  try {
                     
                      var v_lote = "NO";

                      if ($("#Cklote").is(':checked')) {
                          v_lote = "SI";
                      }

                      var v_stock = "NO";

                      if ($("#Ckstock").is(':checked')) {
                          v_stock = "SI";
                      }
                      var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                      ({
                          // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                          "v_obj": {

                              "Id":  $("#Main_TxtId").val(),
                              "Tipo_Art": $("#Main_CmbTipoArticulo").val(),
                              "Nombre": $("#Main_TxtNombre").val().split('"').join('-'),
                              "Cod_Manual": $('#Main_TxtCod_Manual').val(),
                              "Rubro": $("#Main_TxtIdRu").val(),
                              "Sub_Rubro": $("#Main_TxtIdRuSub").val(),
                              "Marca": $('#Main_HddMk').val(),
                              "Modelo": $("#Main_HddMod").val(),
                              "Barra_Proveedor": $("#Main_TxtCodBarra").val(),
                              "Barra_Sistema": '',
                              "Iva_Venta": $("#Main_CmdIva").val(),
                              "IIBB": $("#Main_cmbIbb").val(),
                              "Moneda": $('#Main_cmbMoneda').val(),
                              "Iva_Compra": $("#Main_CmbIvaCompra").val(),
                              "Cont_Venta": $("#Main_CmbVtas").val(),
                              "Cont_Compra": $('#Main_CmbCompras').val(),
                              "P_Neto": $("#Main_TxtNeto").val(),
                              "P_Final": $("#Main_TxtFinal").val(),
                              "Util1": $('#Main_TxtL1Mar').val(),
                              "Util2": $("#Main_TxtL2Mar").val(),
                              "Util3": $("#Main_TxtL3Mar").val(),
                              "Util4": $("#Main_TxtL4Mar").val(),
                              "Util5": $("#Main_TxtL5Mar").val(),
                              "P_NetoL1": $('#Main_TxtL1Neto').val(),
                              "P_NetoL2": $('#Main_TxtL2Neto').val(),
                              "P_NetoL3": $('#Main_TxtL3Neto').val(),
                              "P_NetoL4": $('#Main_TxtL4Neto').val(),
                              "P_NetoL5": $('#Main_TxtL5Neto').val(),
                              "P_FinalL1": $('#Main_TxtL1Final').val(),
                              "P_FinalL2": $('#Main_TxtL2Final').val(),
                              "P_FinalL3": $('#Main_TxtL3Final').val(),
                              "P_FinalL4": $('#Main_TxtL4Final').val(),
                              "P_FinalL5": $('#Main_TxtL5Final').val(),
                              "Unidad": $("#cmbUnidad option:selected").text().trim(),
                              "Lote": v_lote,
                              "es_Stock": v_stock

                          }
                      });

                      $.ajax({
                          type: "POST",
                          url: "Articulo.aspx/WsAltaMod",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function () {
                              
                              $("#btnElimina1R").click();
                              LimpiarArt();
                              $("#Modaladd").modal('hide');
                          }),

                          error: errores
                      });

                  } catch (e) {
                      alert(e.message);
                  }
              }
              
              function  BtnFnGuardar1() {
                  try {

                          if ($("#Main_TxtNombre").val()=="") {
                              return;
                      }


                      var v_lote = "NO";

                      if ($("#Cklote").is(':checked')) {
                          v_lote = "SI";
                      }
                      var v_stock = "NO";

                      if ($("#Ckstock").is(':checked')) {
                          v_stock = "SI";
                      }
                      var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                      ({
                          // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                          "v_obj": {

                              "Id": '0',
                              "Tipo_Art": $("#Main_CmbTipoArticulo").val(),
                              "Nombre": $("#Main_TxtNombre").val().split('"').join('-'),
                              "Cod_Manual": $('#Main_TxtCod_Manual').val(),
                              "Rubro": $("#Main_TxtIdRu").val(),
                              "Sub_Rubro": $("#Main_TxtIdRuSub").val(),
                              "Marca": $('#Main_HddMk').val(),
                              "Modelo": $("#Main_HddMod").val(),
                              "Barra_Proveedor": $("#Main_TxtCodBarra").val(),
                              "Barra_Sistema": '',
                              "Iva_Venta": $("#Main_CmdIva").val(),
                              "IIBB": $("#Main_cmbIbb").val(),
                              "Moneda": $('#Main_cmbMoneda').val(),            
                              "Iva_Compra": $("#Main_CmbIvaCompra").val(),
                              "Cont_Venta": $("#Main_CmbVtas").val(),
                              "Cont_Compra": $('#Main_CmbCompras').val(),
                              "P_Neto": $("#Main_TxtNeto").val(),
                              "P_Final": $("#Main_TxtFinal").val(),
                              "Util1": $('#Main_TxtL1Mar').val(),
                              "Util2": $("#Main_TxtL2Mar").val(),
                              "Util3": $("#Main_TxtL3Mar").val(),                        
                              "Util4": $("#Main_TxtL4Mar").val(),
                              "Util5": $("#Main_TxtL5Mar").val(),
                              "P_NetoL1": $('#Main_TxtL1Neto').val(),
                              "P_NetoL2": $('#Main_TxtL2Neto').val(),
                              "P_NetoL3": $('#Main_TxtL3Neto').val(),
                              "P_NetoL4": $('#Main_TxtL4Neto').val(),
                              "P_NetoL5": $('#Main_TxtL5Neto').val(),
                              "P_FinalL1": $('#Main_TxtL1Final').val(),
                              "P_FinalL2": $('#Main_TxtL2Final').val(),
                              "P_FinalL3": $('#Main_TxtL3Final').val(),
                              "P_FinalL4": $('#Main_TxtL4Final').val(),
                              "P_FinalL5": $('#Main_TxtL5Final').val(),
                              "Sistema": 'Articulos',
                              "Unidad": $("#cmbUnidad option:selected").text().trim(),
                              "Lote":v_lote,
                                "es_Stock": v_stock
                          }
                      });

                      $.ajax({
                          type: "POST",
                          url: "Articulo.aspx/WsAltaArticulo",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function () {
                             
                              LimpiarArt();
                              $("#Modaladd").modal('hide');


                              Buscar();
                          }),

                          error: errores
                      });

                  } catch (e) {
                      alert(e.message);
                  }
              }

</script>


        <script type="text/javascript">
            function desaStk() {

                $('#Main_TxtStockMin').prop('disabled', true);
                $('#Main_TxtStockMax').prop('disabled', true);
                $('#Main_TxtPtoPedido').prop('disabled', true);
                $('#Main_TxtPasillo').prop('disabled', true);
                $('#Main_TxtEstanteria').prop('disabled', true);
                $('#Main_TxtNivel').prop('disabled', true);
                $('#BtnDep3').prop('disabled', true);
                $('#BtnDep2').prop('disabled', true);
            }
            function habiStk() {

                $('#Main_TxtStockMin').prop('disabled', false);
                $('#Main_TxtStockMax').prop('disabled', false);
                $('#Main_TxtPtoPedido').prop('disabled', false);
                $('#Main_TxtPasillo').prop('disabled', false);
                $('#Main_TxtEstanteria').prop('disabled', false);
                $('#Main_TxtNivel').prop('disabled', false);
                $('#BtnDep3').prop('disabled', false);
                $('#BtnDep2').prop('disabled', false);
            }
            ListaPrecios();
            ListarDeposito();
            $(function () {

               
                ListarContables();

                ListarIBB();
                $('#tabs').tabs();
                $('#tabs2').tabs();
                $(".cmbBuscar").select2();
 
                $("#Modaladd").modal();
                $("#MArt").hide();
                $("#Modaladd").modal('hide');
                $('#Main_TxtL1Nom').prop('disabled', true);
                $('#Main_TxtL2Nom').prop('disabled', true);
                $('#Main_TxtL3Nom').prop('disabled', true);
                $('#Main_TxtL4Nom').prop('disabled', true);
                $('#Main_TxtL5Nom').prop('disabled', true);
                
               
                //$(document).ajaxStart(function () {
                //    $(".wait").css("display", "block");
                //});
                //$(document).ajaxComplete(function () {
                //    $(".wait").css("display", "none");
                //});
        


                $(document).ajaxStart(function () {
                    
                 //   $("#esp").css("display", "none");
                    $(".spinner-wrapper").css("display", "block");
                    $(".loader").css("display", "block");
                });
                $(document).ajaxComplete(function () {
                    $(".spinner-wrapper").css("display", "none");
                    $(".loader").css("display", "none");
                    $("#esp").show();
                });
                $("#esp").show();
               // $(".campoFecha").mask("99/99/9999");
              
              

                $("#cmbDep").change(function () {
                    $('#Main_TxtStockMin').val('0');
                    $('#Main_TxtStockMax').val('0');
                    $('#Main_TxtPtoPedido').val('0');
                    $('#Main_TxtPasillo').val('');
                    $('#Main_TxtEstanteria').val('');
                    $('#Main_TxtNivel').val('');

                    if ($("#cmbDep option:selected").text() == '--') {
                        desaStk();
                    } else {
                        habiStk();
                        BuscarRep($("#cmbDep").val());
                    }
                })
              
                
               
               


 

             
                    // Write on keyup event of keyword input element
                    $("#kwd_search").keyup(function () {
                       
                        // When value of the input is not blank
                        if ($(this).val() != "") {
                            // Show only matching TR, hide rest of them
                            $("#grilla tbody>tr").hide();
                            $("#grilla td:contains-ci('" + $(this).val() + "')").parent("tr").show();
                        }
                        else {
                            // When there is no input or clean again, show everything back
                            $("#grilla tbody>tr").show();
                        }
                    });

                    $("#kwd_search2").keyup(function () {

                        // When value of the input is not blank
                        if ($(this).val() != "") {
                            // Show only matching TR, hide rest of them
                            $("#grilla2 tbody>tr").hide();
                            $("#grilla2 td:contains-ci('" + $(this).val() + "')").parent("tr").show();
                        }
                        else {
                            // When there is no input or clean again, show everything back
                            $("#grilla2 tbody>tr").show();
                        }
                    });

                // Write on keyup event of keyword input element
                    $("#kwd_search3").keyup(function () {

                        // When value of the input is not blank
                        if ($(this).val() != "") {
                            // Show only matching TR, hide rest of them
                            $("#grillaM tbody>tr").hide();
                            $("#grillaM td:contains-ci('" + $(this).val() + "')").parent("tr").show();
                        }
                        else {
                            // When there is no input or clean again, show everything back
                            $("#grillaM tbody>tr").show();
                        }
                    });

                    $("#kwd_search4").keyup(function () {

                        // When value of the input is not blank
                        if ($(this).val() != "") {
                            // Show only matching TR, hide rest of them
                            $("#grilla2M tbody>tr").hide();
                            $("#grilla2M td:contains-ci('" + $(this).val() + "')").parent("tr").show();
                        }
                        else {
                            // When there is no input or clean again, show everything back
                            $("#grilla2M tbody>tr").show();
                        }
                    });

                });
                // jQuery expression for case-insensitive filter
                $.extend($.expr[":"],
                {
                    "contains-ci": function (elem, i, match, array) {
                        return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                    }

              

            });

            $("#Main_cmbPuesto").change(function () {
                //  var text =
                $("#Main_cmbPuesto option:selected").text();
                var value = $("#Main_cmbPuesto option:selected").val();
                $("#Main_TxtPuesto").val(value);

            });


            $("#Main_CmdIva").change(function () {
                if ($("#Ckrecal").is(':checked')) { 
                    recal();
                } 
            });


            $("#Main_CmbIvaCompra").change(function () {
                if ($("#Ckrecal").is(':checked')) {
                    recal();
                }
            });

               $("#Main_TxtNeto").focus(function () {
                   $("#Main_valorFoco").val( $("#Main_TxtNeto").val());
                   var obj = $("#Main_TxtNeto");
                   $(obj).attr('placeholder', 
                $(obj).val()); 
                   $("#Main_TxtNeto").val('');
                   
                   return; 
             });



            $("#Main_TxtNeto").blur(function () {

                     if ($("#Main_TxtNeto").val() == '') {
                    $("#Main_TxtNeto").val( $("#Main_valorFoco").val()) ;
                }

                if ($("#Ckrecal").is(':checked')) {
                    recal();
                } else {
                      $("#Main_TxtFinal").val(parseFloat(parseFloat($("#Main_TxtNeto").val()) * (1 + (parseFloat($("#Main_CmdIva").val())))).toFixed(2));
                }
            });


            //$("#Main_TxtNeto").keyup(function (e) {
            //    if (e.keyCode == 13) {
            //        if ($("#Ckrecal").is(':checked')) {
            //            recal();
            //        }

            //    }
            //});

           
            $("#Main_TxtFinal").focus(function (e) {

        //     $(window).keyup(function (e) {
        //var code = (e.keyCode ? e.keyCode : e.which);
        //if (code == 9) {
        //    return 0;
        //         }
        //          });

                   $("#Main_valorFoco").val( $("#Main_TxtFinal").val());
                var obj = $("#Main_TxtFinal");
                $(obj).attr('placeholder', 
                $(obj).val()); 
                   $("#Main_TxtFinal").val('');
                   
                   return; 
             });

            $("#Main_TxtFinal").blur(function () {

                if ($("#Main_TxtFinal").val() == '') {
                    $("#Main_TxtFinal").val( $("#Main_valorFoco").val()) ;
                }
                  var neto = (parseFloat($("#Main_CmbIvaCompra").val())) + 1;
                    $("#Main_TxtNeto").val(parseFloat($("#Main_TxtFinal").val() / parseFloat(neto)).toFixed(2));

                if ($("#Ckrecal").is(':checked')) {
                  
                    recal();
                }  

            });

            $("#Main_TxtFinal").keyup(function (e) {
                if (e.keyCode == 13) {
                    if ($("#Ckrecal").is(':checked')) {
                        var neto = (parseFloat($("#Main_CmbIvaCompra").val())) + 1;
                        $("#Main_TxtNeto").val(parseFloat($("#Main_TxtFinal").val() / parseFloat(neto)).toFixed(2));

                        recal();
                    }
                }
            });

            function paraPfinal() {
                if ($("#Main_TxtFinalVta").val() =="") {
                    $("#Main_TxtFinalVta").val("0");
                }
                  var neto = 1 + parseFloat($("#Main_CmdIva").val());

                var mNeto = parseFloat(parseFloat($("#Main_TxtFinalVta").val()) / neto).toFixed(2); 

                var mUtil =   parseFloat((( parseFloat(mNeto) -  parseFloat($("#Main_TxtNeto").val())  ) * 100 ) / parseFloat($("#Main_TxtNeto").val())).toFixed(2)  ;
                $("#Main_TxtL1Mar").val(mUtil);
                $("#Main_TxtL1Mar").change();
                 

            }
            function enListaFinal(list) {
                if ($("#Ckrecal").is(':checked')) {

                    var neto = 1 + parseFloat($("#Main_CmdIva").val());
                    var netoCosto = 1 + (parseFloat($("#Main_Txt" + list + "Mar").val() / 100));

                    $("#Main_Txt" + list + "Neto").val(parseFloat(parseFloat($("#Main_Txt" + list + "Final").val()) / neto).toFixed(2));

                   // $("#Main_TxtNeto").val(parseFloat(parseFloat($("#Main_Txt" + list + "Neto").val()) / netoCosto).toFixed(2));

                 //   recal();
                }
            }

            function recal() {
                if ($("#Ckrecal").is(':checked')) {
                    var neto = 1 + parseFloat($("#Main_CmbIvaCompra").val());
                    $("#Main_TxtFinal").val(parseFloat($("#Main_TxtNeto").val() * parseFloat(neto)).toFixed(2));


                    $("#Main_TxtL1Neto").val(parseFloat(parseFloat($("#Main_TxtNeto").val()) + ($("#Main_TxtNeto").val() * (parseFloat($("#Main_TxtL1Mar").val()) / 100))).toFixed(2));

                    $("#Main_TxtL1Final").val(parseFloat(parseFloat($("#Main_TxtL1Neto").val()) * (1 + (parseFloat($("#Main_CmdIva").val())))).toFixed(2));


                    $("#Main_TxtL2Neto").val(parseFloat(parseFloat($("#Main_TxtNeto").val()) + ($("#Main_TxtNeto").val() * (parseFloat($("#Main_TxtL2Mar").val()) / 100))).toFixed(2));
                    $("#Main_TxtL2Final").val(parseFloat(parseFloat($("#Main_TxtL2Neto").val()) + ($("#Main_TxtL2Neto").val() * (parseFloat($("#Main_CmdIva").val())))).toFixed(2));


                    $("#Main_TxtL3Neto").val(parseFloat(parseFloat($("#Main_TxtNeto").val()) + ($("#Main_TxtNeto").val() * (parseFloat($("#Main_TxtL3Mar").val()) / 100))).toFixed(2));
                    $("#Main_TxtL3Final").val(parseFloat(parseFloat($("#Main_TxtL3Neto").val()) + ($("#Main_TxtL3Neto").val() * (parseFloat($("#Main_CmdIva").val())))).toFixed(2));

                    $("#Main_TxtL4Neto").val(parseFloat(parseFloat($("#Main_TxtNeto").val()) + ($("#Main_TxtNeto").val() * (parseFloat($("#Main_TxtL4Mar").val()) / 100))).toFixed(2));
                    $("#Main_TxtL4Final").val(parseFloat(parseFloat($("#Main_TxtL4Neto").val()) + ($("#Main_TxtL4Neto").val() * (parseFloat($("#Main_CmdIva").val())))).toFixed(2));

                    $("#Main_TxtL5Neto").val(parseFloat(parseFloat($("#Main_TxtNeto").val()) + ($("#Main_TxtNeto").val() * (parseFloat($("#Main_TxtL5Mar").val()) / 100))).toFixed(2));
                    $("#Main_TxtL5Final").val(parseFloat(parseFloat($("#Main_TxtL5Neto").val()) + ($("#Main_TxtL5Neto").val() * (parseFloat($("#Main_CmdIva").val())))).toFixed(2));
                }

            }

                $("#Main_TxtL1Mar").focus(function () {
                   $("#Main_valorFoco").val( $("#Main_TxtL1Mar").val());

                   $("#Main_TxtL1Mar").val('');
                   
                   return; 
             });

            $("#Main_TxtL1Mar").blur(function () {

                if ($("#Main_TxtL1Mar").val() == '') {
                    $("#Main_TxtL1Mar").val( $("#Main_valorFoco").val()) ;
                } 
           });

            function onBlurNetoLista(obj, lista) {
                if ($(obj).val() == '') {
                    $(obj).val($("#Main_valorFoco").val()); 
                }  
                if (!$("#Ckrecal").is(':checked')) { 
           $("#Main_TxtL" + lista + "Mar").val(parseFloat(   (    (parseFloat($("#Main_TxtL" + lista + "Neto").val()) - parseFloat($("#Main_TxtNeto").val())) / parseFloat($("#Main_TxtNeto").val())) * 100).toFixed(2));
                     
           $("#Main_TxtL" + lista + "Final").val(parseFloat(parseFloat($("#Main_TxtL" + lista + "Neto").val()) * (1 + (parseFloat($("#Main_CmdIva").val())))).toFixed(2));

                }
            }

              
            function onBlurFinalLista(obj, lista) {
                
                if ($(obj).val() == '') {
                    $(obj).val($("#Main_valorFoco").val()); 
                }  
                if (!$("#Ckrecal").is(':checked')) { 
                    var netolistox = parseFloat($("#Main_TxtL" + lista + "Final").val() ) / (1 + (parseFloat($("#Main_CmdIva").val()))) ;

           $("#Main_TxtL" + lista + "Mar").val(parseFloat(   (    (parseFloat( netolistox ) - parseFloat($("#Main_TxtNeto").val())) / parseFloat($("#Main_TxtNeto").val())) * 100).toFixed(2));
                     
           $("#Main_TxtL" + lista + "Neto").val(parseFloat(parseFloat($("#Main_TxtL" + lista + "Final").val()) / (1 + (parseFloat($("#Main_CmdIva").val())))).toFixed(2));

                }

            }

            function onBlur(obj) {
                 if ($(obj).val() == '') {
                     $(obj).val($("#Main_valorFoco").val());
                      
                } 
            }
              function onFocus(obj) {
                  $("#Main_valorFoco").val($(obj).val()); 
                   $(obj).attr('placeholder', 
                $(obj).val()); 
                   $(obj).val(''); 
                   return; 
            }

                   $("#Main_TxtL2Mar").focus(function () {
                   $("#Main_valorFoco").val( $("#Main_TxtL2Mar").val());

                   $("#Main_TxtL2Mar").val(''); 
                   return; 
             });

            $("#Main_TxtL2Mar").blur(function () {

                if ($("#Main_TxtL2Mar").val() == '') {
                    $("#Main_TxtL2Mar").val( $("#Main_valorFoco").val()) ;
                } 
           }); 
                   $("#Main_TxtL3Mar").focus(function () {
                   $("#Main_valorFoco").val( $("#Main_TxtL3Mar").val());

                   $("#Main_TxtL3Mar").val(''); 
                   return; 
            });

            function saltar(obj) {
               
                    if (event.keyCode == 13)
                 {
                $("#" + obj).focus();
                 }

            }

            $("#Main_TxtL3Mar").blur(function () {

                if ($("#Main_TxtL3Mar").val() == '') {
                    $("#Main_TxtL3Mar").val( $("#Main_valorFoco").val()) ;
                } 
           });

              
                   $("#Main_TxtL4Mar").focus(function () {
                   $("#Main_valorFoco").val( $("#Main_TxtL4Mar").val());

                   $("#Main_TxtL4Mar").val(''); 
                   return; 
                    });

            $("#Main_TxtL4Mar").blur(function () {

                if ($("#Main_TxtL4Mar").val() == '') {
                    $("#Main_TxtL4Mar").val( $("#Main_valorFoco").val()) ;
                } 
            });



               
            $("#Main_TxtL1Final").focus(function () {

                $("#Main_valorFoco").val($("#Main_TxtL1Final").val());


                    $("#Main_TxtL1Final").attr('placeholder', 
                    $("#Main_TxtL1Final").val()); 


                   $("#Main_TxtL1Final").val(''); 
                   return; 
             });

            $("#Main_TxtL1Final").blur(function () {

                if ($("#Main_TxtL1Final").val() == '') {
                    $("#Main_TxtL1Final").val($("#Main_valorFoco").val());
                    return;
                } 
                enListaFinal('L1');


            });

            
            $("#Main_TxtFinalVta").blur(function () {

                if ($("#Main_TxtFinalVta").val() == '') {
                    $("#Main_TxtFinalVta").val($("#Main_valorFoco").val());
                    return;
                } 
               


            });

                $("#Main_TxtFinalVta").focus(function () {

                $("#Main_valorFoco").val($("#Main_TxtFinalVta").val());


                    $("#Main_TxtFinalVta").attr('placeholder', 
                    $("#Main_TxtFinalVta").val()); 


                   $("#Main_TxtFinalVta").val(''); 
                   return; 
             });

                   $("#Main_TxtL2Final").focus(function () {
                       $("#Main_valorFoco").val($("#Main_TxtL2Final").val());
                       var obj = $("#Main_TxtL2Final");
                           $(obj).attr('placeholder', 
                $(obj).val()); 

                   $("#Main_TxtL2Final").val(''); 
                   return; 
             });

            $("#Main_TxtL2Final").blur(function () {

                if ($("#Main_TxtL2Final").val() == '') {
                    $("#Main_TxtL2Final").val($("#Main_valorFoco").val());
                    return;
                } 

                enListaFinal('L2');
            });


               $("#Main_TxtL3Final").focus(function () {
                   $("#Main_valorFoco").val( $("#Main_TxtL3Final").val());

                   var obj = $("#Main_TxtL3Final");

                  $("#Main_TxtL3Final").attr('placeholder', 
                      $("#Main_TxtL3Final").val()); 

                   $("#Main_TxtL3Final").val(''); 
                   return; 
             });

            $("#Main_TxtL3Final").blur(function () {

                if ($("#Main_TxtL3Final").val() == '') {
                    $("#Main_TxtL3Final").val($("#Main_valorFoco").val());
                    return;
                } 

                enListaFinal('L3');
            });



                $("#Main_TxtL4Final").focus(function () {
                   $("#Main_valorFoco").val( $("#Main_TxtL4Final").val());
                    var obj = $("#Main_TxtL4Final");
                        $(obj).attr('placeholder', 
                $(obj).val()); 
                   $("#Main_TxtL4Final").val(''); 
                   return; 
             });

            $("#Main_TxtL4Final").blur(function () {

                if ($("#Main_TxtL4Final").val() == '') {
                    $("#Main_TxtL4Final").val($("#Main_valorFoco").val());
                    return;
                } 

                enListaFinal('L4');
            });


            function errores(msg) {
                var jsonObj = JSON.parse(msg.responseText);
                alert('Error: ' + jsonObj.Message);
            }
            function VerRu() {
                PopRubros();
                 
                $("#ModalRu").modal();

            }
            function VerNombre() {
                

                $("#ModalNombre").modal();

            }
            function PopAlta() {
                 habilitarArt();

                $("#btnModificar2").hide();

                desaStk();
                LimpiarArt();
                ListaPrecios();

                $("#Ckstock").prop("checked", false); // Si usa stock

                $("#Main_TxtNombre").focus();
                $("#Main_TxtTipo").val('0');
                $("#Main_TxtFinalVta").val('0');
               
                $("#Main_TxtFinal").prop('disabled',true);

                $("#btnModificar1").hide();
                $("#btnGuardar1").show();
                
                $("#MArt").show();
                $("#Modaladd").modal();

            }

            function VerMk() {
                PopMk();

                $("#ModalMk").modal();

            }
            function VerProv() {
                
                $("#ModalPro").modal();
            }

            function PopMk() {

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
                        success: resultadoMk,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }

            function resultadoMk(Resultado) {
                try {
                    var Pacientes = Resultado.d;
                    var Tabla_Titulo = "";
                    var Tabla_Datos = "";
                    var Tabla_Fin = "";



                    $("#ResultadoM").show();
                    $("#ResultadoM").empty();
                    Tabla_Titulo = "<table   id='grillaM' class='table     table-striped' style='width: 100%;'><thead><tr><th>Id</th><th>Rubro</th></tr></thead><tbody>";
                    $.each(Pacientes, function (index, pacientes) {
                        Tabla_Datos = Tabla_Datos + "<tr  onclick='llenarSubM(this ," + pacientes.Id + " );'  style='cursor:pointer;'><td>" + pacientes.Id + "</td><td>" + pacientes.Nombre+ "</td></tr>";

                    });

                    Tabla_Fin = "</tbody></table>";
                    $("#ResultadoM").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                    var fila = $("#grillaM tr").eq(1);
                    var valos = Pacientes[0].Id;

                    llenarSubM(fila, valos);

                } catch (e) {
                    alert(e.message);
                }


            }




            function PopRubros() {

                try {

                    var v_buscar = $('#cmbTipoOp').val();
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
                        success: resultadoRu,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }

            function resultadoRu(Resultado) {
                try{
                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

                

                $("#Resultado").show();
                $("#Resultado").empty();
                Tabla_Titulo = "<table   id='grilla' class='table     table-striped' style='width: 100%;'><thead><tr><th>Id</th><th>Rubro</th><th>Tipo</th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                    Tabla_Datos = Tabla_Datos + "<tr  onclick='llenarSub(this ," + pacientes.Id + " );'  style='cursor:pointer;'><td>" + pacientes.Id + "</td><td>" + pacientes.NombreRubro + "</td><td>" + pacientes.tipo_rubro + "</td></tr>";

                });

                Tabla_Fin = "</tbody></table>";
                $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

              
                    var fila = $("#grilla tr").eq(1);
                    var valos = Pacientes[0].Id;
                    
                    llenarSub(fila, valos);

                } catch (e) {
                    alert(e.message);
                }
                

            }

            var table = document.getElementById("grilla");
            var table2 = document.getElementById("grilla2");

            var tableM = document.getElementById("grillaM");
            var table2M = document.getElementById("grilla2M");

            var NombreR = '';
            function llenarSub(obj, sub) {
                try {
                    BuscarSub(sub);
                    // select la fila
                    if ($(obj).hasClass('active')) {
                        $(obj).removeClass('active');
                    } else {
                        $(obj).addClass('active').siblings().removeClass('active');
                    }
                    
                    table = document.getElementById("grilla");

                    
                    if (table != null) {
                        for (var i = 1; i < table.rows.length; i++) {

                            if ($(table.rows[i]).hasClass('active')) {
                               
                                $("#Main_TxtRubro").val('');
                                $("#Main_TxtIdRu").val('');
                                $("#Main_TxtRubro").val($(table.rows[i]).find('td:eq(1)').text());
                                $("#Main_TxtIdRu").val($(table.rows[i]).find('td:eq(0)').text());
                            };
                        }
                    }

                } catch (e) {
                    alert(e.message + '-2');
                }

            }
            function llenarSubM(obj, sub) {
                try {
                    BuscarSubM(sub);
                    // select la fila
                    if ($(obj).hasClass('active')) {
                        $(obj).removeClass('active');
                    } else {
                        $(obj).addClass('active').siblings().removeClass('active');
                    }

                    tableM = document.getElementById("grillaM");


                    if (tableM != null) {
                        for (var i = 1; i < tableM.rows.length; i++) {

                            if ($(tableM.rows[i]).hasClass('active')) {

                                $("#Main_TxtMk").val('');
                                $("#Main_HddMk").val('');
                                $("#Main_TxtMk").val($(tableM.rows[i]).find('td:eq(1)').text());
                                $("#Main_HddMk").val($(tableM.rows[i]).find('td:eq(0)').text());
                            };
                        }
                    }

                } catch (e) {
                    alert(e.message + '-2');
                }

            }
            function llenarSub2M(obj, sub) {
                try {



                    $(obj).addClass('active').siblings().removeClass('active');
                    table2M = document.getElementById("grilla2M");
                    $("#Main_TxtMod").val('');
                    $("#Main_HddMod").val('');
                    if (table2M != null) {
                        for (var i = 1; i < table2M.rows.length; i++) {

                            if ($(table2M.rows[i]).hasClass('active')) {

                                $("#Main_TxtMod").val($(table2M.rows[i]).find('td:eq(1)').text());
                                $("#Main_HddMod").val($(table2M.rows[i]).find('td:eq(0)').text());
                            };
                        }
                    }

                    $("#ModalMk").modal('hide');


                } catch (e) {
                    alert(e.message);
                }

            }
            function llenarSub2(obj, sub) {
                try {

                    

                    $(obj).addClass('active').siblings().removeClass('active');
                    table2M = document.getElementById("grilla2");
                    $("#Main_TxtSubRubro").val('');
                    $("#Main_TxtIdRuSub").val('');
                    if (table2M != null) {
                        for (var i = 1; i < table2M.rows.length; i++) {

                            if ($(table2M.rows[i]).hasClass('active')) {
                                 
                                $("#Main_TxtSubRubro").val($(table2M.rows[i]).find('td:eq(1)').text());
                                $("#Main_TxtIdRuSub").val($(table2M.rows[i]).find('td:eq(0)').text());
                            };
                        }
                    }
 
                    $("#ModalRu").modal('hide');


                } catch (e) {
                    alert(e.message);
                }

            }

            function BuscarSubM(sub) {

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
                        success: resultadoSubM,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }

            function resultadoSubM(Resultado) {
                var Pacientes2 = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

                $("#Resultado2M").show();
                $("#Resultado2M").empty();
                Tabla_Titulo = "<table   id='grilla2M' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>Codigo</th><th>Sub Rubro</th><th>Anulado</th></tr></thead><tbody>";
                $.each(Pacientes2, function (index, pacientes) {
                    Tabla_Datos = Tabla_Datos + "<tr onclick='llenarSub2M(this ," + pacientes.Id + " );'   style='cursor:pointer;'><td>" + pacientes.Id + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Anulado + "</td></tr>";
                });

                Tabla_Fin = "</tbody></table>";
                $("#Resultado2M").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                var obj = $("#grilla2M tr").eq(1);

                if ($(obj).hasClass('active')) {
                    $(obj).removeClass('active');
                } else {
                    $(obj).addClass('active').siblings().removeClass('active');
                }
                table2M = document.getElementById("grilla2M");
                $("#Main_TxtMod").val('');
                $("#Main_HddMod").val('');
                if (table2M != null) {
                    for (var i = 1; i < table2M.rows.length; i++) {

                        if ($(table2M.rows[i]).hasClass('active')) {

                            $("#Main_TxtMod").val($(table2M.rows[i]).find('td:eq(1)').text());
                            $("#Main_HddMod").val($(table2M.rows[i]).find('td:eq(0)').text());
                        };
                    }
                }

            }

            function Buscar() {

                try {
                


                    //   alert( $('#cmbTipoOp').val() );
                    var activeTabId = $('#tabs2').tabs('option', 'active');

                  
                        if (activeTabId == 1){
                             pp();   
                            return;
                    }
                     
                   
                    
                    var v_buscar = $('#cmbTipoOp').val();
                    var json = JSON.stringify
                      ({
                          "v_tipo": $('#cmbTipoOp').val(),
                          "v_valor": $('#Main_TxtBuscarA').val()

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

            function BuscarXrubro() {

                try {  
                  
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

                    if ( $('#cmbSubRubro').val()=='0') {
                      pp();
                        return;
                    }
              
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


            function resultadoArt(Resultado) {
                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";
            
                $("#ResultadoB").show();
                $("#ResultadoB").empty();
                Tabla_Titulo = "<table   id='grillaArt' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th></th><th></th><th>Cod_Sistema</th><th>Cod_Manual</th><th>Descripción</th><th>Tipo</th><th>P.Costo$</th><th>Alic</th><th>P.Vta1$</th><th>P.Vta2$</th><th></th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                
                    var sin = pacientes.Nombre ;
                    if (pacientes.Nombre.trim().length > 230) {
                        sin = pacientes.Nombre.substr(0, 200) + '.... (Ver más)';
                    }

                    var v_lote = 0;
                    if (pacientes.Lote == 'SI') {
                        v_lote = 1;
                    }
                   
                    
                    var v_costo =  parseFloat(pacientes.P_Final.replace(',', '.').replace(" ", "")).toFixed(2);
                      if ($("#MiCuenta1_lblrol").text() == 'VENTAS_SISJUAN') {
                         v_costo = "******";
                    }
                    if (pacientes.Anulado != 'SI') {
                        Tabla_Datos = Tabla_Datos + "<tr    onclick='RowArt2(this," + pacientes.Id + ");' style='cursor:pointer;'><td style='width:20px'> <a class='tooltips ' onclick='RowArt(this," + pacientes.Id + " )' > <img src='/images/Ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver</span></a></td>  <td style='width:20px'> <a class='tooltips admin'   onclick='RowArt4(this," + pacientes.Id + "," + v_lote + ")'  > <img src='/images/stock.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ingreso Stock</span></a></td>   <td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td style='text-align: justify;'>" + sin + "</td><td>" + pacientes.Tipo_Art + "</td> <td>" + v_costo + "</td><td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + parseFloat(pacientes.P_FinalL1.replace(',', '.').replace(" ", "")).toFixed(2) + "</td><td>" + parseFloat(pacientes.P_FinalL2.replace(',', '.').replace(" ", "")).toFixed(2) + "</td><td style='width:30px'> <a class='tooltips' onclick='gvDel_ARTICULO(" + pacientes.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   </tr>";
                    }

                    });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoB").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                fn_cantidad1();
                
             //   esValido2('ADM_KARDEX');


            }

            function RowArt4(obj, ids, lote) {

                
                LimpiarLotepop();
                $("#Main_TxtId").val(ids);
                $("#Main_TxtNombreSk").val(ids);
                $("#Main_TxtNombreSk").prop('disabled', true);
                $("#Main_TxtCodSisLt").val(ids);
                
                if (lote == 0) {
                $("#ModalStock").modal();
                } else {

                 

                    llenarLotegrilla($("#Main_TxtCodSisLt").val());

                    $("#ModalStockLote").modal();


            }
                $("#Main_TxtCantidadSk").val('0'); 

                
            }
            function llenarLotegrilla(ids){
               
                var json = JSON.stringify
                       ({
                           "v_id": ids

            });
            $.ajax({
                type: "POST",
                url: "Articulo.aspx/WmGrillaLote",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                    actualizarStk($("#Main_TxtNombreSk").val());

                    if (result.d != null) {
                        var Pacientes = result.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";

                        $("#ResultadoLt").show();
                        $("#ResultadoLt").empty();
                        Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th>  <th>LOTE</th> <th>FECHA VTO</th>  <th>CANT</th>  <th>DEPOSITO</th></tr></thead><tbody  style='text-align: center;'>";
                        $.each(Pacientes, function (index, pacientes) {

                            var arrayDeCadenas = pacientes.Fecha_vto.split("/");
                            var f_dia = arrayDeCadenas[0];
                            var f_mes = arrayDeCadenas[1];
                            var f_anio = arrayDeCadenas[2];
                            // Please pay attention to the month (parts[1]); JavaScript counts months from 0:
                            // January - 0, February - 1, etc.
                            var fvto = new Date(f_anio, f_mes - 1, f_dia);

                            var today = new Date();

                            var color = "";
                            if (today > fvto) {
                                color = "color:red";

                            }

                            Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvLotDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Cod_Lot + "</td><td style='" + color+ "'>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td><td>" + pacientes.Dep_Desc + "</td></tr>";

                        });

                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoLt").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                    }
                },
                error: errores
            });
            
            }




            function fn_cantidad1() {
                cantidad = $("#grillaArt tbody").find("tr").length;
                $("#span_cantidad").html(cantidad);
            };

                function RowArt3(obj, ids) {

                    $(obj).click(function () {
                        alert('uno');
                    });

                    $(obj).dblclick(function () {
                        alert('dos');
                    });
                }


                function gvDel_ARTICULO(ids) {

                    if (confirm("Esta seguro que desea eliminar el articulo?")) {
                        var json = JSON.stringify
        ({
            "v_ids": ids,
            "v_tipo": 'SI'

        });

                        $.ajax({
                            type: "POST",
                            url: "Articulo.aspx/Anular_articulo",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                Buscar();
                            },

                            error: errores
                        });
                    }
                }
                function actualizarStk(ids) {

                
                    $("#ResultadoDep").show();
                    $("#ResultadoDep").empty();               

                    $("#Main_TxtId").val(ids);
                    var json = JSON.stringify
        ({
            "v_tipo": '0',
            "v_valor": ids

        });

                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WsListarDep_IdArt",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {

                            if (result.d != null) {



                                var Pacientes = result.d;
                                var Tabla_TituloRep = "";
                                var Tabla_DatosRep = "";
                                var Tabla_Fin = "";

                                $("#ResultadoDep").show();
                                $("#ResultadoDep").empty();
                                $("#ResultadoLote").empty();
                                Tabla_TituloRep = "<table   class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Depósito</th> <th>Stock</th></tr></thead><tbody style='text-align: center;'>";
                             
 
                                $.each(Pacientes, function (index, pacientes) {

                                    var v_lote = 0;
                                    if (pacientes.Lote == 'SI') {
                                        v_lote = 1;
                                    }
                                    Tabla_DatosRep = Tabla_DatosRep + "<tr  onclick='lotesXdep(this," + pacientes.id_articulo + ", " + pacientes.id_deposito + "," + v_lote + ");' style='cursor:pointer;' ><td>" + pacientes.deposito_nombre + "</td><td>" + pacientes.stock + "</td></tr>";
                                });

                                Tabla_Fin = "</tbody></table>";
                                $("#ResultadoDep").html(Tabla_TituloRep + Tabla_DatosRep + Tabla_Fin);


                            }
                        },

                        error: errores
                    });

                }
                function RowArt2(obj, ids) {
                    $("#ResultadoDep").show();
                    $("#ResultadoDep").empty();
                    $("#ResultadoLote").empty();
                    if ($(obj).hasClass('active')) {
                        $(obj).removeClass('active');
                    } else {
                        $(obj).addClass('active').siblings().removeClass('active');
                    }

                    $("#Main_TxtId").val(ids);
                    var json = JSON.stringify
        ({
            "v_tipo": '0',
            "v_valor": ids

        });

                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WsListarDep_IdArt",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            
                            if (result.d != null) {



                                var Pacientes = result.d;
                                var Tabla_TituloRep = "";
                                var Tabla_DatosRep = "";
                                var Tabla_Fin = "";

                                $("#ResultadoDep").show();
                                $("#ResultadoDep").empty();

                                Tabla_TituloRep = "<table   class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Depósito</th> <th>Stock</th></tr></thead><tbody style='text-align: center;'>";


                                $.each(Pacientes, function (index, pacientes) {
                                    var v_lote = 0;
                                    if (pacientes.Lote == 'SI') {
                                        v_lote = 1;
                                    }

                                    Tabla_DatosRep = Tabla_DatosRep + "<tr  onclick='lotesXdep(this," + pacientes.id_articulo + ", " + pacientes.id_deposito + "," + v_lote + ");' style='cursor:pointer;' ><td    >" + pacientes.deposito_nombre + "</td><td>" + pacientes.stock + "</td></tr>";
                                });

                                Tabla_Fin = "</tbody></table>";
                                $("#ResultadoDep").html(Tabla_TituloRep + Tabla_DatosRep + Tabla_Fin);

                             
                            }
                        },

                        error: errores
                    });

                }
            
                $("#Main_TxtCodSisLt").prop('disabled', true);
                $("#Main_TxtProvLt").prop('disabled', true);
                function deshabilitarArt() {
                    $("#btnModificar1").hide();

                    $("#cmbUnidad").prop('disabled', true);
                    $("#Main_CmbTipoArticulo").prop('disabled', true);
                    $("#Main_TxtNombre").prop('disabled', true);
                    $('#Main_TxtCod_Manual').prop('disabled', true);
                    $("#Main_TxtIdRu").prop('disabled', true);
                    $("#Main_TxtIdRuSub").prop('disabled', true);
                     $("#Main_TxtFinalVta").prop('disabled', true);

                    $("#Main_TxtRubro").prop('disabled', true);
                    $("#Main_TxtSubRubro").prop('disabled', true);

                    $("#Main_TxtMk").prop('disabled', true);
                    $("#Main_TxtMod").prop('disabled', true);

                    $('#Main_HddMk').prop('disabled', true);
                    $("#Main_HddMod").prop('disabled', true);

                    $("#Main_TxtCodBarra").prop('disabled', true);

                    $("#Main_CmdIva").prop('disabled', true);
                    $("#Main_cmbIbb").prop('disabled', true);
                    $('#Main_cmbMoneda').prop('disabled', true);
                    $("#Main_CmbIvaCompra").prop('disabled', true);
                    $("#Main_CmbVtas").prop('disabled', true);
                    $('#Main_CmbCompras').prop('disabled', true);
                    $("#Main_TxtNeto").prop('disabled', true);
                    $("#Main_TxtFinal").prop('disabled', true);

                    $('#Main_TxtL1Neto').prop('disabled', true);
                    $('#Main_TxtL2Neto').prop('disabled', true);
                    $('#Main_TxtL3Neto').prop('disabled', true);
                    $('#Main_TxtL4Neto').prop('disabled', true);
                    $('#Main_TxtL5Neto').prop('disabled', true);
                    $('#Main_TxtL1Final').prop('disabled', true);
                    $('#Main_TxtL2Final').prop('disabled', true);
                    $('#Main_TxtL3Final').prop('disabled', true);
                    $('#Main_TxtL4Final').prop('disabled', true);
                    $('#Main_TxtL5Final').prop('disabled', true);

                    $('#Main_TxtL1Mar').prop('disabled', true);
                    $('#Main_TxtL2Mar').prop('disabled', true);
                    $('#Main_TxtL3Mar').prop('disabled', true);
                    $('#Main_TxtL4Mar').prop('disabled', true);
                    $('#Main_TxtL5Mar').prop('disabled', true);

                    $('#cmbDep').prop('disabled', true);
                    $('#Main_TxtStockMin').prop('disabled', true);
                    $('#Main_TxtStockMax').prop('disabled', true);
                    $('#Main_TxtPtoPedido').prop('disabled', true);
                    $('#Main_TxtPasillo').prop('disabled', true);
                    $('#Main_TxtEstanteria').prop('disabled', true);
                    $('#Main_TxtNivel').prop('disabled', true);
                    $('#BtnDep').prop('disabled', true);
                    $('#ResultadoRep').prop('disabled', true);
                    $('.tooltipsArt').hide();
                
                       if ($("#MiCuenta1_lblrol").text() == 'VENTAS_SISJUAN') {
                           deshabilitarPrecios();
                    }
                }
                function habilitarArt() {

                    $("#Main_CmbTipoArticulo").prop('disabled', false);
                    $("#cmbUnidad").prop('disabled', false);
                 $("#Main_TxtFinalVta").prop('disabled', false);
                    $("#Main_TxtNombre").prop('disabled', false);
                    $('#Main_TxtCod_Manual').prop('disabled', false);
                    $("#Main_TxtIdRu").prop('disabled', false);
                    $("#Main_TxtIdRuSub").prop('disabled', false);

                    $("#Main_TxtRubro").prop('disabled', false);
                    $("#Main_TxtSubRubro").prop('disabled', false);

                    $("#Main_TxtMk").prop('disabled', false);
                    $("#Main_TxtMod").prop('disabled', false);

                    $('#Main_HddMk').prop('disabled', false);
                    $("#Main_HddMod").prop('disabled', false);

                    $("#Main_TxtCodBarra").prop('disabled', false);

                    $("#Main_CmdIva").prop('disabled', false);
                    $("#Main_cmbIbb").prop('disabled', false);
                    $('#Main_cmbMoneda').prop('disabled', false);
                    $("#Main_CmbIvaCompra").prop('disabled', false);
                    $("#Main_CmbVtas").prop('disabled', false);
                    $('#Main_CmbCompras').prop('disabled', false);
                    $("#Main_TxtNeto").prop('disabled', false);
                    //$("#Main_TxtFinal").prop('disabled', false);

                    $('#Main_TxtL1Neto').prop('disabled', false);
                    $('#Main_TxtL2Neto').prop('disabled', false);
                    $('#Main_TxtL3Neto').prop('disabled', false);
                    $('#Main_TxtL4Neto').prop('disabled', false);
                    $('#Main_TxtL5Neto').prop('disabled', false);
                    $('#Main_TxtL1Final').prop('disabled', false);
                    $('#Main_TxtL2Final').prop('disabled', false);
                    $('#Main_TxtL3Final').prop('disabled', false);
                    $('#Main_TxtL4Final').prop('disabled', false);
                    $('#Main_TxtL5Final').prop('disabled', false);

                    $('#Main_TxtL1Mar').prop('disabled', false);
                    $('#Main_TxtL2Mar').prop('disabled', false);
                    $('#Main_TxtL3Mar').prop('disabled', false);
                    $('#Main_TxtL4Mar').prop('disabled', false);
                    $('#Main_TxtL5Mar').prop('disabled', false);

                    $('#cmbDep').prop('disabled', false);
                    $('#Main_TxtStockMin').prop('disabled', false);
                    $('#Main_TxtStockMax').prop('disabled', false);
                    $('#Main_TxtPtoPedido').prop('disabled', false);
                    $('#Main_TxtPasillo').prop('disabled', false);
                    $('#Main_TxtEstanteria').prop('disabled', false);
                    $('#Main_TxtNivel').prop('disabled', false);
                    $('#BtnDep').prop('disabled', false);
                    $('#ResultadoRep').prop('disabled',false);
                    $('.tooltipsArt').show();



            }


            function deshabilitarPrecios() {
              

                $("#tabs").tabs("disable", 1);

                 $('#Main_CmbVtas').prop('disabled', true);
                $('#Main_CmbCompras').prop('disabled', true);
 $('#Main_CmdIva').prop('disabled', true);
 $('#Main_cmbIbb').prop('disabled', true);
 $('#Main_cmbMoneda').prop('disabled', true);
 $('#Main_CmbIvaCompra').prop('disabled', true);
 $('#Main_TxtNeto').prop('disabled', true);
 $('#Main_TxtFinalVta').prop('disabled', true);
 $('#Main_TxtL1Mar').prop('disabled', true);
 $('#Main_TxtL1Neto').prop('disabled', true);
 $('#Main_TxtL1Final').prop('disabled', true);
 $('#Main_TxtL2Mar').prop('disabled', true);
 $('#Main_TxtL2Neto').prop('disabled', true);
 $('#Main_TxtL2Final').prop('disabled', true);
 $('#Main_TxtL3Mar').prop('disabled', true);
 $('#Main_TxtL3Neto').prop('disabled', true);
 $('#Main_TxtL3Final').prop('disabled', true);
 $('#Main_TxtL4Mar').prop('disabled', true);
 $('#Main_TxtL4Neto').prop('disabled', true);
 $('#Main_TxtL4Final').prop('disabled', true);
 $('#Main_TxtL5Mar').prop('disabled', true);
 $('#Main_TxtL5Neto').prop('disabled', true);
 $('#Main_TxtL5Final').prop('disabled', true);
            }
                function setSelectByText(eID, text) { //Loop through sequentially//
                    var ele = document.getElementById(eID);
                    for (var ii = 0; ii < ele.length; ii++)
                        if (ele.options[ii].text == text) { //Found!
                            ele.options[ii].selected = true;
                            return true;
                        }
                    return false;
                }

                function      lotesXdep(obj,  id_articulo, id_deposito, esLote ){
                    if ($(obj).hasClass('active')) {
                        $(obj).removeClass('active');
                    } else {
                        $(obj).addClass('active').siblings().removeClass('active');
                    }
                    console.log(esLote);
                    if (esLote == '0') {
                        return;
                    }


                    var json = JSON.stringify
({
    "v_id": id_articulo,
    "v_dep": id_deposito
});

                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WmGrillaLoteXdep",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) { 
                                var Tabla_Titulo = "";
                                var Tabla_Datos = "";
                                var Tabla_Fin = "";
                                if (result.d != null) {
                                    $("#ResultadoLote").show();
                                    $("#ResultadoLote").empty();
                                    var Pacientes = result.d;
                                    Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr>  <th>LOTE</th> <th>FECHA VTO</th>  <th>CANT</th>   </tr></thead><tbody  style='text-align: center;'>";
                                    $.each(Pacientes, function (index, pacientes) {

                                        var arrayDeCadenas = pacientes.Fecha_vto.split("/");
                                        var f_dia = arrayDeCadenas[0];
                                        var f_mes = arrayDeCadenas[1];
                                        var f_anio = arrayDeCadenas[2]; 
                                        // Please pay attention to the month (parts[1]); JavaScript counts months from 0:
                                        // January - 0, February - 1, etc.
                                        var fvto = new Date(f_anio, f_mes - 1, f_dia);

                                        var today = new Date();
  
                                        var color = "";
                                        if (today > fvto  ) {
                                            color = "color:red";

                                        }
                                        Tabla_Datos = Tabla_Datos + "<tr > <td>" + pacientes.Cod_Lot + "</td><td style="+color+">" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td> </tr>";

                                    });

                                    Tabla_Fin = "</tbody></table>";
                                    $("#ResultadoLote").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                                }
                        },

                        error: errores
                    });


                
                            }


                function RowArt(obj, ids, op) {
                    $("#btnModificar2").show();
                    $("#Main_TxtTipo").val(ids);
                    LimpiarArt();

                    deshabilitarArt();


                    if ($(obj).hasClass('active')) {
                        $(obj).removeClass('active');
                    } else {
                        $(obj).addClass('active').siblings().removeClass('active');
                    }


                    $("#Main_TxtId").val(ids);
                    var json = JSON.stringify
        ({
            "v_id": ids

        });

                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WsListarArticuloId",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {

                            if (result.d != null) {

                                var Tabla_Titulo = "";
                                var Tabla_Datos = "";
                                var Tabla_Fin = "";
                                if (result.d.Proveedores !=null) {
                                    $("#ResultadoProv").show();
                                    $("#ResultadoProv").empty();
                                    var proveedores = result.d.Proveedores;
                                    Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th>  <th>Id</th> <th>Nombre</th>  <th>Cuit</th> </tr></thead><tbody  style='text-align: center;'>";
                                    $.each(proveedores, function (index, proveedores) {
                                        Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvProDel(" + proveedores.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + proveedores.Id + "</td><td>" + proveedores.Denominacion + "</td><td>" + proveedores.Cuit + "</td></tr>";
                                    });

                                    Tabla_Fin = "</tbody></table>";
                                    $("#ResultadoProv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                                }

                                if (result.d.Depositos != null) {

                                    var Pacientes = result.d.Depositos;
                                    var Tabla_TituloRep = "";
                                    var Tabla_TituloUbi = "";
                                    var Tabla_DatosRep = "";
                                    var Tabla_DatosUbi = "";
                                    var Tabla_Fin = "";

                                    $("#ResultadoRep").show();
                                    $("#ResultadoRep").empty();
                                    Tabla_TituloRep = "<table  id='trep'   class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Depósito</th> <th>S.Mínimo</th><th>S.Máximo</th><th>P.Pedido</th></tr></thead><tbody style='text-align: center;'>";

                                    $("#ResultadoUbi").show();
                                    $("#ResultadoUbi").empty();

                                    Tabla_TituloUbi = "<table  id='tubi'   class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Depósito</th> <th>Pasillo</th><th>Estantería</th><th>Nivel</th></tr></thead><tbody style='text-align: center;'>";

                                    $.each(Pacientes, function (index, pacientes) {
                                        Tabla_DatosRep = Tabla_DatosRep + "<tr onclick='BuscarRep(" + pacientes.id_deposito + ");'  style='cursor:pointer;' ><td>" + pacientes.deposito_nombre + "</td><td>" + pacientes.stock_minimo + "</td><td>" + pacientes.stock_maximo + "</td><td>" + pacientes.punto_pedido + "</td></tr>";
                                        Tabla_DatosUbi = Tabla_DatosUbi + "<tr ><td>" + pacientes.deposito_nombre + "</td><td>" + pacientes.pasillo + "</td><td>" + pacientes.estanteria + "</td><td>" + pacientes.nivel + "</td></tr>";

                                    });

                                    Tabla_Fin = "</tbody></table>";
                                    $("#ResultadoRep").html(Tabla_TituloRep + Tabla_DatosRep + Tabla_Fin);
                                    $("#ResultadoUbi").html(Tabla_TituloUbi + Tabla_DatosUbi + Tabla_Fin);

                                }
                                $("#Main_CmbTipoArticulo").val(result.d.Tipo_Art).change();
                                $("#Main_TxtNombre").val(result.d.Nombre);
                                $('#Main_TxtCod_Manual').val(result.d.Cod_Manual);
                                $("#Main_TxtIdRu").val(result.d.Rubro);
                                $("#Main_TxtIdRuSub").val(result.d.Sub_Rubro);
                            
                                //  $("#cmbUnidad").val(result.d.Unidad);
                          
                                setSelectByText("cmbUnidad", result.d.Unidad);

                                $("#Main_TxtRubro").val(result.d.RubroNombre);
                                $("#Main_TxtSubRubro").val(result.d.Sub_RubroNombre);

                                $("#Main_TxtMk").val(result.d.MarcaNombre);
                                $("#Main_TxtMod").val(result.d.ModeloNombre);

                                $('#Main_HddMk').val(result.d.Marca);
                                $("#Main_HddMod").val(result.d.Modelo);

                                $("#Main_TxtCodBarra").val(result.d.Barra_Proveedor);

                                $("#Main_CmdIva").val(result.d.Iva_Venta).change();
                                $("#Main_cmbIbb").val(result.d.IIBB).change();
                                $('#Main_cmbMoneda').val(result.d.Moneda).change();

                                $("#Main_CmbIvaCompra").val(result.d.Iva_Compra).change();
                                 

                                if (result.d.Cont_Compra == 'COMPRAS') { // por defecto antes
                                    $('#Main_CmbCompras').val('103').trigger('change');
                                } else {
                                    $("#Main_CmbCompras").val(result.d.Cont_Compra).change();
                                }


                                   if (result.d.Cont_Venta == 'VENTAS') {
                                   $('#Main_CmbVtas').val('72').trigger('change');
                                } else {
                              $("#Main_CmbVtas").val(result.d.Cont_Venta).change();
                                }



                                $("#Main_TxtNeto").val(parseFloat(result.d.P_Neto.replace(',', '.')).toFixed(2));
                                $("#Main_TxtFinal").val(parseFloat(result.d.P_Final.replace(',', '.')).toFixed(2));

                                $('#Main_TxtL1Neto').val(parseFloat(result.d.P_NetoL1.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL2Neto').val(parseFloat(result.d.P_NetoL2.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL3Neto').val(parseFloat(result.d.P_NetoL3.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL4Neto').val(parseFloat(result.d.P_NetoL4.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL5Neto').val(parseFloat(result.d.P_NetoL5.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL1Final').val(parseFloat(result.d.P_FinalL1.replace(',', '.')).toFixed(2));
                                   $('#Main_TxtFinalVta').val(parseFloat(result.d.P_FinalL1.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL2Final').val(parseFloat(result.d.P_FinalL2.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL3Final').val(parseFloat(result.d.P_FinalL3.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL4Final').val(parseFloat(result.d.P_FinalL4.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL5Final').val(parseFloat(result.d.P_FinalL5.replace(',', '.')).toFixed(2));

                                $('#Main_TxtL1Mar').val(parseFloat(result.d.Util1.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL2Mar').val(parseFloat(result.d.Util2.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL3Mar').val(parseFloat(result.d.Util3.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL4Mar').val(parseFloat(result.d.Util4.replace(',', '.')).toFixed(2));
                                $('#Main_TxtL5Mar').val(parseFloat(result.d.Util5.replace(',', '.')).toFixed(2));
                          
                                //$("#btnModificar1").show();
                                $("#btnGuardar1").hide();
                                //if (op == 1) {

                                //    deshabilitarArt();
                                //    $("#btnModificar1").hide();
                                //} else {
                                //    habilitarArt();
                                //}
                            
                                if (result.d.Lote == "SI") {                                
                                    $("#Cklote").prop("checked", true);
                                } else {
                                    $("#Cklote").prop("checked", false);
                                }
                                if (result.d.es_Stock == "SI") {
                                    $("#Ckstock").prop("checked", true);
                                }   else {
                                    $("#Ckstock").prop("checked",false);
                                }
                            
                                desaStk();
                                $("#MArt").show();
                                $("#Modaladd").modal();
                            }
                        },

                        error: errores
                    });

                }
                function LimpiarLotepop() {
                    $("#ResultadoLt").empty();
                    $("#ResultadoLt").empty();
                    $("#ResultadoLt").empty();
 
                    $("#Main_TxtCodSisLt").val('0');
                    $("#Main_TxtCodLt").val('0');
                    $("#Main_TxtFechaCobro").val('');
                    $("#Main_TxtCantLt").val('0');
                    $("#Main_TxtProvLt").val('');
                    $("#Main_TxtProvIdLt").val('0');

                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WsLimpiarSelecLote",
                        data: '',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: '',
                        error: errores
                    });


                }
                function LimpiarArt() { 
                    $("#ResultadoProv").empty();
                    $("#ResultadoRep").empty();
                    $("#ResultadoUbi").empty();


                    $("#tabs").tabs({ active: 0 });
                
                    $("#cmbUnidad").val('7').change();
                    $("#Main_CmbTipoArticulo").val('ARTICULO').change();
                    $("#Main_TxtNombre").val('');
                    $('#Main_TxtCod_Manual').val('');
                    $("#Main_TxtIdRu").val('');
                    $("#Main_TxtIdRuSub").val('');
                    $("#Main_TxtRubro").val('');
                    $("#Main_TxtSubRubro").val('');
                 $("#Main_TxtFinalVta").val('0');
                    $("#Main_TxtMk").val('');
                    $("#Main_TxtMod").val('');
                    $("#Main_TxtId").val('');
                    $('#Main_HddMk').val('');
                    $("#Main_HddMod").val('');
                    $("#Main_TxtCodBarra").val('');

                    $("#Main_CmdIva").val('0.21').change();
                    $("#Main_cmbIbb").val('0').change();
                    $('#Main_cmbMoneda').val('PESO').change();
                    $("#Main_CmbIvaCompra").val('0.21').change();

                         $('#Main_CmbVtas').val('72').trigger('change');
                         $('#Main_CmbCompras').val('103').trigger('change');


                    $("#Main_TxtNeto").val('0');
                    $("#Main_TxtFinal").val('0');
           
                    $('#Main_TxtL1Neto').val('0');
                    $('#Main_TxtL2Neto').val('0');
                    $('#Main_TxtL3Neto').val('0');
                    $('#Main_TxtL4Neto').val('0');
                    $('#Main_TxtL5Neto').val('0');
                    $('#Main_TxtL1Final').val('0');
                    $('#Main_TxtL2Final').val('0');
                    $('#Main_TxtL3Final').val('0');
                    $('#Main_TxtL4Final').val('0');
                    $('#Main_TxtL5Final').val('0');

                    $('#Main_TxtStockMin').val('');
                    $('#Main_TxtStockMax').val('');
                    $('#Main_TxtPtoPedido').val('');
                    $('#Main_TxtPasillo').val('');
                    $('#Main_TxtEstanteria').val('');
                    $('#Main_TxtNivel').val('');
                    $("#Cklote").prop("checked", false);

           
                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WsLimpiarSelecProv",
                        data: '',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: '',
                        error: errores
                    });


                }

                function BuscarSub(sub) {

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
                            success: resultadoSub,
                            error: errores
                        });

                    } catch (e) {
                        alert(e.message);
                    }
                }

                function resultadoSub(Resultado) {
                    var Pacientes2 = Resultado.d;
                    var Tabla_Titulo = "";
                    var Tabla_Datos = "";
                    var Tabla_Fin = "";

                    $("#Resultado2").show();
                    $("#Resultado2").empty();
                    Tabla_Titulo = "<table   id='grilla2' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>Codigo</th><th>Sub Rubro</th><th>Anulado</th></tr></thead><tbody>";
                    $.each(Pacientes2, function (index, pacientes) {
                        Tabla_Datos = Tabla_Datos + "<tr onclick='llenarSub2(this ," + pacientes.Id + " );'   style='cursor:pointer;'><td>" + pacientes.Id + "</td><td>" + pacientes.NombreSubRubro + "</td><td>" + pacientes.Anulado + "</td></tr>";
                    });

                    Tabla_Fin = "</tbody></table>";
                    $("#Resultado2").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

               
                    var obj = $("#grilla2 tr").eq(1);

                    if ($(obj).hasClass('active')) {
                        $(obj).removeClass('active');
                    } else {
                        $(obj).addClass('active').siblings().removeClass('active');
                    }
                    table2 = document.getElementById("grilla2");
                    $("#Main_TxtSubRubro").val('');
                    $("#Main_TxtIdRuSub").val('');
                    if (table2 != null) {
                        for (var i = 1; i < table2.rows.length; i++) {

                            if ($(table2.rows[i]).hasClass('active')) {


                               
                                $("#Main_TxtSubRubro").val($(table2.rows[i]).find('td:eq(1)').text());
                                $("#Main_TxtIdRuSub").val($(table2.rows[i]).find('td:eq(0)').text());
                            };
                        }
                    }
                
                }


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
                    $('#cmbDep2').empty();
                    $('#cmbDepLt').empty();
                    $('#cmbDep').append(
                            $('<option></option>').html('--')
                          );
                    $.each(Especialidad, function (index, especialidades) {
                        $('#cmbDep').append(
                              $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                            );
                        $('#cmbDep2').append(
                           $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                         );
                        $('#cmbDepLt').append(
                        $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                      );
                    });

 
                }
    

                // solapas
          
                $('#tabs2').tabs({
                    activate: function (event, ui) {
                   
                        var activeTabId = $(this).tabs('option', 'active');
                        if (activeTabId == 1){
                            CargarRUbros();                    
                        }
                        if (activeTabId == 2) {
                            CargarMarca();
                        }
                    }
                });
          

                //$("#cmbRubro").change(function () { 
              
                //});
                //$("#cmbSubRubro").change(function () { 
                //    BuscarXSubrubro();
                //});

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
                                                    $('<option></option>').val(especialidades.Id).html(especialidades.NombreRubro)
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
                function CargarSub(sub)
                {

                    try {

                        //select un item  para select2
                        //  $("#cmbSubRubro").val("0").trigger("change");
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

              //$("#Main_TxtCod_Manual").on("keydown", function (event) {
              //    if (event.which == 13) {

              //        ExisteArticulo("2", $("#Main_TxtCod_Manual").val(), $("#Main_TxtCod_Manual"));
              //    }
              //});


            $("#Main_TxtCod_Manual").change(function () {
       ExisteArticulo("2", $("#Main_TxtCod_Manual").val(),  $("#Main_TxtCod_Manual"));
             
           });
       
      function ExisteArticulo(tipo, valor, obj) { 
          try {

              if (valor =="") {
                  return;
              }
                        var json = JSON.stringify
                          ({
                                "v_tipo": tipo,
                                   "v_valor": valor
                          });
                        $.ajax({
                            type: "POST",
                            url: "Articulo.aspx/WsExisteArticulo",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Resultado) {
                                if (Resultado.d=="SI") {
                                    alert("EL ARTICULO YA SE ENCUENTRA INGRESADO.");
                                    obj.val("");
                                      obj.focus();
                                }
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
                                $('#cmbModelo').html('');;
                                $('#cmbModelo').empty();
                                $('#cmbModelo').append('<option value="0" selected="selected">- -</option>');
                                $.each(Especialidad, function (index, especialidades) {
                                    $('#cmbModelo').append(
                                             $('<option  selected></option>').val(especialidades.Id).html(especialidades.Nombre)
                                           );
                                });

                              $('#cmbModelo').append('<option value="0" selected="selected">Todos</option>');
                            }),
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


         
  


    </div>
    
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


         $('#Cklote').change(function () {

             if ($("#Cklote").is(':checked')) {
                 $("#Ckstock").prop("checked", false);
             }
         });

         $('#Ckstock').change(function () {

             if ($("#Ckstock").is(':checked')) {
                 $("#Cklote").prop("checked", false);
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
     </script>
        
          <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
     

</asp:Content>

