<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="UsuariosFarmacia.aspx.cs" Inherits="HardSoft.App.Kardex.UsuariosFarmacia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
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
     <div class=" container" style="margin-top: 36px;">
   
    
 <div class='row'>   
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
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
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_mysql_usuarios() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_mysql_usuarios' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillamysql_usuarios'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_mysql_usuarios()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
  </button>  
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
      </div>  
   



   </div >

 <%--   modal--%>  


  <div class='modal fade' id='Modalmysql_usuarios' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-lg'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 

   <button type='button' class='close' data-dismiss='modal'>&times;</button>

 </div> 

 <div class='modal-body'> 

 <div   style='margin-top:0px;text-transform:uppercase' > 


 <div class='MarcoMio' id='TituloPop' style='margin-bottom: 5px;'> </div>  

 
 <div class='row'  style='margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>  

   <div class='col-xs-12'> 

  <div class='form-horizontal'>   
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> ID_USUARIO</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtID_USUARIO' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> USUARIO</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtUSUARIO' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> CLAVE</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtCLAVE' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> TOKEN</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtTOKEN' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> HABILITADO</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtHABILITADO' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> AUD</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtAUD' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> ROL</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtROL' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> INTENTOS</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtINTENTOS' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
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
 </div>  



    

 <%--   modal--%>  


  <div class='modal fade' id='Modalmysql_usuarios' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-lg'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 

   <button type='button' class='close' data-dismiss='modal'>&times;</button>

 </div> 

 <div class='modal-body'> 

 <div   style='margin-top:0px;text-transform:uppercase' > 


 <div class='MarcoMio' id='TituloPop' style='margin-bottom: 5px;'> </div>  

 
 <div class='row'  style='margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>  

   <div class='col-xs-12'> 

  <div class='form-horizontal'>   
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> ID_USUARIO</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox1' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> USUARIO</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox2' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> CLAVE</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox3' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> TOKEN</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox4' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> HABILITADO</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox5' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> AUD</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox6' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> ROL</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox7' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> INTENTOS</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TextBox8' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
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
 </div>  


    <script>
        

  function Buscar_mysql_usuarios() { 
try {    

    var v_buscar = $('#cmbTipoOp').val(); 
    var json = JSON.stringify 
   ({ 
        'v_tipo': $('#cmbTipoOp').val(), 
       'v_valor': $('#Main_TxtBuscar').val() 

   }); 
$.ajax({ 
    type: 'POST', 
    url: 'UsuariosFarmacia.aspx/WsListar_mysql_usuarios', 
    data: json, 
    contentType: 'application/json; charset=utf-8', 
    dataType: 'json', 
    success: resultado_mysql_usuarios, 
    error: erroresJs 
  }); 

    } catch (e) { 
      alert(e.message);
    }
    }

  function resultado_mysql_usuarios(Resultado) { 
   var v_obj = Resultado.d; 
   var Tabla_Titulo = ''; 
   var Tabla_Datos = ''; 
   var Tabla_Fin = ''; 
   $('#Resultado_mysql_usuarios').show(); 
   $('#Resultado_mysql_usuarios').empty();   
   Tabla_Titulo =  "  <table    id='grillamysql_usuarios' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th> <th>ID_USUARIO</th><th>USUARIO</th><th>CLAVE</th><th>TOKEN</th><th>HABILITADO</th><th>AUD</th><th>ROL</th><th>INTENTOS</th> </tr></thead><tbody> "; 
   $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod_mysql_usuarios("+ obj.ID_USUARIO + ");' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td style='width:30px'> <a class='tooltips' onclick='gvDel_mysql_usuarios("+ obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.ID_USUARIO + " </td> <td>" + obj.USUARIO + " </td> <td>" + obj.CLAVE + " </td> <td>" + obj.TOKEN + " </td> <td>" + obj.HABILITADO + " </td> <td>" + obj.AUD + " </td> <td>" + obj.ROL + " </td> <td>" + obj.INTENTOS + " </td> </tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_mysql_usuarios').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin); 
     fn_cantidad_mysql_usuarios(); 
     } 

    function fn_cantidad_mysql_usuarios() { 
     cantidad = $('#grillamysql_usuarios tbody').find('tr').length; 
     $('#span_cantidad').html(cantidad); 
     }; 
    

    function gvDel_mysql_usuarios(ids) { 
      try { 
    if (confirm('Esta seguro que desea eliminar el registro ?')) { 
    var json = JSON.stringify 
        ({ 
        'v_Id': ids 
        }); 
    
    $.ajax({ 
        type: 'POST', 
        url: 'UsuariosFarmacia.aspx/WmGvDel_mysql_usuarios', 
        data: json, contentType: 'application/json; charset=utf-8', 
        dataType: 'json', 
        success: (function (Result) { 
    Buscar_mysql_usuarios() ; 
          }), 
    error: erroresJs 
    }); 
      } 
    } 
    catch (e) 
    { 
      alert(e); 
    } 
  } 

    function PopMod_mysql_usuarios(id) { 
      try { 
    $("#btnModificar1b").show(); 
    $("#btnGuardar1b").hide(); 
    $("#TituloPop").text('Modificar'); 
    $('#Modalmysql_usuarios').modal(); 
    $('#Main_TxtId').val(id); 
    

    var json = JSON.stringify 
        ({ 
          'v_tipo':'99', 
          'v_valor': id 
        }); 
      $.ajax({ 
      type: 'POST', 
      url: 'UsuariosFarmacia.aspx/WsListar_mysql_usuarios', 
      data: json, 
      contentType: "application/json; charset=utf-8", 
      dataType: "json", 
      success: function (Resultado) { 
          var v_obj = Resultado.d; 
          $.each(v_obj, function (index, obj) {           
          $('#Main_TxtID_USUARIO').val(obj.ID_USUARIO); 
          $('#Main_TxtUSUARIO').val(obj.USUARIO); 
          $('#Main_TxtCLAVE').val(obj.CLAVE); 
          $('#Main_TxtTOKEN').val(obj.TOKEN); 
          $('#Main_TxtHABILITADO').val(obj.HABILITADO); 
          $('#Main_TxtAUD').val(obj.AUD); 
          $('#Main_TxtROL').val(obj.ROL); 
          $('#Main_TxtINTENTOS').val(obj.INTENTOS); 
          
        }); 
      }, 
      error: erroresJs 
    }); 
    } catch (e) { 
    alert(e.message);
    } 
  } 
 
  

    function ModPopJs() { 
      try { 
          var json = JSON.stringify 
          ({ 
            'v_obj': { 
          'ID_USUARIO': $('#Main_TxtID_USUARIO').val(), 
          'USUARIO': $('#Main_TxtUSUARIO').val(), 
          'CLAVE': $('#Main_TxtCLAVE').val(), 
          'TOKEN': $('#Main_TxtTOKEN').val(), 
          'HABILITADO': $('#Main_TxtHABILITADO').val(), 
          'AUD': $('#Main_TxtAUD').val(), 
          'ROL': $('#Main_TxtROL').val(), 
          'INTENTOS': $('#Main_TxtINTENTOS').val() 
            } 
          }); 
          $.ajax({ 
        type: "POST", 
        url: 'UsuariosFarmacia.aspx/WmGvMod_mysql_usuarios', 
        data: json, 
        contentType:"application/json; charset=utf-8", 
        dataType: 'json', 
        success: (function (Result) { 
        $('#Modalmysql_usuarios').modal('hide'); 
        Buscar_mysql_usuarios(); 
        LimpiarPop(); 
    }), 
        error: erroresJs 
    }); 
      } catch (e) { 
        alert(e.message); 
      } 
    } 
    
      function LimpiarPop() { 
        
          $('#Main_TxtID_USUARIO').val(''); 
          $('#Main_TxtUSUARIO').val(''); 
          $('#Main_TxtCLAVE').val(''); 
          $('#Main_TxtTOKEN').val(''); 
          $('#Main_TxtHABILITADO').val(''); 
          $('#Main_TxtAUD').val(''); 
          $('#Main_TxtROL').val(''); 
          $('#Main_TxtINTENTOS').val(''); 
      } 



    function PopAlta_mysql_usuarios() { 
      
    LimpiarPop(); 
    $("#btnModificar1b").hide(); 
    $("#btnGuardar1b").show(); 
    $("#TituloPop").text('Alta'); 
    $("#Modalmysql_usuarios").modal(); 
    $("#Main_TxtId").val('0'); 
    $("#Main_TxtId").prop('disabled', true); 
      } 



    function AltaPopJs() { 
      try { 
          var json = JSON.stringify 
          ({ 
            'v_obj': { 
          'ID_USUARIO': $('#Main_TxtID_USUARIO').val(), 
          'USUARIO': $('#Main_TxtUSUARIO').val(), 
          'CLAVE': $('#Main_TxtCLAVE').val(), 
          'TOKEN': $('#Main_TxtTOKEN').val(), 
          'HABILITADO': $('#Main_TxtHABILITADO').val(), 
          'AUD': $('#Main_TxtAUD').val(), 
          'ROL': $('#Main_TxtROL').val(), 
          'INTENTOS': $('#Main_TxtINTENTOS').val() 
            } 
          }); 
          $.ajax({ 
        type: "POST", 
        url: 'UsuariosFarmacia.aspx/WmGvAlta_mysql_usuarios', 
        data: json, 
        contentType:"application/json; charset=utf-8", 
        dataType: 'json', 
        success: (function (Result) { 
        $('#Modalmysql_usuarios').modal('hide'); 
        Buscar_mysql_usuarios(); 
        LimpiarPop(); 
    }), 
        error: erroresJs 
    }); 
      } catch (e) { 
        alert(e.message); 
      } 
    } 
    
      

    </script>
</asp:Content>
