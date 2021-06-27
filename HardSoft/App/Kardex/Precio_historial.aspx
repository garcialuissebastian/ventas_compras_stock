<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="Precio_historial.aspx.cs" Inherits="HardSoft.App.Kardex.Precio_historial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       
    <script language="JavaScript" type="text/javascript">

        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>

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

        <script type="text/javascript" src="/js/jquery.js"></script>
   
    <br /> <br />
       
    <div class=" container" style=" text-transform:uppercase" >
          
       
 
        
        <div class="alert alert-cab">
        Historial de Precios
       </div>     
        
    <div  >   
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
       <div style='color:white;text-align:right; padding-top: 5px;' class='col-xs-3'>   
    Buscar  
    </div> 
  <div class='col-xs-3' >  
                    <select id='cmbTipoOp' class='form-control'>       
                   <option value='0'>Nombre Articulo</option>      
                       </select>      
   </div> 
       <div class='col-xs-3' >  
           <asp:TextBox ID='TxtBuscar' runat='server'  class='form-control'></asp:TextBox>   
   </div>  
   <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_listas_precio_historial() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_listas_precio_historial' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillakx_listas_precio_historial'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_kx_listas_precio_historial()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
  </button>  
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
      </div>  
   
        <script>
            function Buscar_kx_listas_precio_historial() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        'v_tipo': $('#cmbTipoOp').val(),
       'v_valor': $('#Main_TxtBuscar').val()

   });
$.ajax({
    type: 'POST',
    url: 'Precio_historial.aspx/WsListar_kx_listas_precio_historial',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_listas_precio_historial,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }

  function resultado_kx_listas_precio_historial(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_kx_listas_precio_historial').show();
   $('#Resultado_kx_listas_precio_historial').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_listas_precio_historial' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Id Art</th> <th>Articulo</th><th>Precio L1</th><th>Precio L2</th><th>Precio L3</th><th>Precio L4</th><th>Precio L5</th> <th>Modificado</th> <th>Costo Final</th> <th>Costo Neto</th> <th>Iva_Venta</th><th>Util1</th><th>Util2</th><th>Util3</th><th>Util4</th><th>Util5</th><th>P_NetoL1</th><th>P_NetoL2</th><th>P_NetoL3</th><th>P_NetoL4</th><th>P_NetoL5</th></tr></thead><tbody> "; 
   $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >       <td>" + obj.Id + " </td>  <td>" + obj.Nombre + " </td> <td>" + parseFloat(obj.P_FinalL1.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_FinalL2.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_FinalL3.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_FinalL4.replace(",", ".")).toFixed(2) + " </td> <td >" + parseFloat(obj.P_FinalL5.replace(",", ".")).toFixed(2) + " </td>  <td >" + obj.Anulado+ " </td><td style='border-left: solid;'> " + parseFloat(obj.P_Final.replace(",", ".")).toFixed(2) + " </td><td > " + parseFloat(obj.P_Neto.replace(",", ".")).toFixed(2) + " </td>   <td style='border-left: solid;'>" + parseFloat( obj.Iva_Venta.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.Util1.replace(",", ".")).toFixed(2) + " </td> <td>" +parseFloat( obj.Util2.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.Util3.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.Util4.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.Util5.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_NetoL1.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_NetoL2.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_NetoL3.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_NetoL4.replace(",", ".")).toFixed(2) + " </td> <td>" + parseFloat(obj.P_NetoL5.replace(",", ".")).toFixed(2) + " </td>  </tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_listas_precio_historial').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     fn_cantidad_kx_listas_precio_historial();
     }

    function fn_cantidad_kx_listas_precio_historial() {
     cantidad = $('#grillakx_listas_precio_historial tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
     };
   

        </script>




         <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
   
        
          <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>


    </div>

</asp:Content>
