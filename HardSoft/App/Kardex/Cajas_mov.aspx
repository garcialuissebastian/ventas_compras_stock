<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="Cajas_mov.aspx.cs" Inherits="HardSoft.App.Kardex.Cajas_mov" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

          <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
   <script type="text/javascript" src="/js/formError.js"></script>
   <script src="/js/kardex.js?v=01"></script>



    <script>
         function Buscar_kx_cajas_mov2() {
             try {   
    
                              $('#Resultado_kx_cajas_mov').empty();   
              $('#Resultado_kx_cajas_mov').append("<img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px' />")

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        'v_mes': $('#cmbTipoOp').val(),
       'v_anio': $('#cmbAnio').val()

   });
$.ajax({
    type: 'POST',
    url: 'Cajas_mov.aspx/WsListar_kx_cajas_mov2',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_cajas_mov2,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }

    function Buscar_kx_cajas_mov() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        'v_tipo': $('#cmbTipoOp').val(),
       'v_valor': $('#Main_TxtBuscar').val()

   });
$.ajax({
    type: 'POST',
    url: 'Cajas_mov.aspx/WsListar_kx_cajas_mov',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_cajas_mov,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }

  function resultado_kx_cajas_mov(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_kx_cajas_mov').show();
   $('#Resultado_kx_cajas_mov').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_cajas_mov' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th> <th>id</th><th>fecha</th><th>caja</th><th>ingreso</th><th>agreso</th><th>tipo</th><th>id_usuario</th><th>id_config</th><th>nro_cbte</th><th>destino_cbte</th> </tr></thead><tbody> "; 
   $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod_kx_cajas_mov("+ obj.id + ");' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td style='width:30px'> <a class='tooltips' onclick='gvDel_kx_cajas_mov("+ obj.id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.id + " </td> <td>" + obj.fecha + " </td> <td>" + obj.caja + " </td> <td>" + obj.ingreso + " </td> <td>" + obj.agreso + " </td> <td>" + obj.tipo + " </td> <td>" + obj.id_usuario + " </td> <td>" + obj.id_config + " </td> <td>" + obj.nro_cbte + " </td> <td>" + obj.destino_cbte + " </td> </tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_cajas_mov').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     fn_cantidad_kx_cajas_mov();
     }

         function resultado_kx_cajas_mov2(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_kx_cajas_mov').show();
             $('#Resultado_kx_cajas_mov').empty();   
 
   Tabla_Titulo =  "  <table    id='grillakx_cajas_mov' class='table   table-hover table-striped' style='width: 100%;'><thead><tr>  <th>USUARIO</th><th>CAJA</th><th>APERTURA</th><th>CIERRE</th><th>EFECTIVO_APERTURA  <br/> (MONTO INICIAL $) </th><th>EFECTIVO_AL_CIERRE <br/> (Conteo $)  </th><th>Pago_Tarjetas</th><th>Pago_Efectivo</th><th>Pago_Cheques</th><th>Pago_Ctacte</th> </tr></thead><tbody> "; 
             $.each(v_obj, function (index, obj) { 

                 var arqueo = obj.EFECTIVO_AL_CIERRE;
                    var v_costo =  parseFloat( parseFloat(obj.EFECTIVO_APERTURA.replace(',', '.').replace(" ", "") ) +   parseFloat( obj.Pago_Efectivo.replace(',', '.').replace(" ", "") )  ).toFixed(2) ;

                 if (v_costo != parseFloat(obj.EFECTIVO_AL_CIERRE.replace(',', '.').replace(" ", "")).toFixed(2)) {


                     arqueo += "   <a class='tooltips ' onclick='Verpop(" + obj.id+ ")' > <img src='/images/cruz.png' style='background-position: 50 %; background-repeat: no-repeat; cursor: pointer'> <span>Arqueo ("+v_costo+" $)</span></a> ";
                 }

   Tabla_Datos = Tabla_Datos + " <tr >    <td>" + obj.USUARIO+ " </td> <td>" + obj.CAJA+ " </td> <td>" + obj.APERTURA + " </td> <td>" + obj.CIERRE + " </td> <td>" + obj.EFECTIVO_APERTURA + " </td> <td>" + arqueo  + " </td> <td>" + obj.Pago_Tarjetas + " </td> <td>" + obj.Pago_Efectivo+ " </td> <td>" + obj.Pago_Cheques + " </td> <td>" + obj.Pago_Ctacte + " </td></tr>"; 


             });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_cajas_mov').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     fn_cantidad_kx_cajas_mov();
     }


      
    function fn_cantidad_kx_cajas_mov() {
     cantidad = $('#grillakx_cajas_mov tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
     };
   

    function gvDel_kx_cajas_mov(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_Id': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'Cajas_mov.aspx/WmGvDel_kx_cajas_mov',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: (function (Result) {
    Buscar_kx_cajas_mov() ;
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

    function PopMod_kx_cajas_mov(id) {
      try {
    $("#btnModificar1b").show();
    $("#btnGuardar1b").hide();
    $("#TituloPop").text('Modificar');
    $('#Modalkx_cajas_mov').modal();
    $('#Main_TxtId').val(id);
   

    var json = JSON.stringify
        ({
          'v_tipo':'99',
          'v_valor': id
        });
      $.ajax({
      type: 'POST',
      url: 'Cajas_mov.aspx/WsListar_kx_cajas_mov',
      data: json,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (Resultado) {
          var v_obj = Resultado.d;
          $.each(v_obj, function (index, obj) {          
          $('#Main_Txtid').val(obj.id);
          $('#Main_Txtfecha').val(obj.fecha);
          $('#Main_Txtcaja').val(obj.caja);
          $('#Main_Txtingreso').val(obj.ingreso);
          $('#Main_Txtagreso').val(obj.agreso);
          $('#Main_Txttipo').val(obj.tipo);
          $('#Main_Txtid_usuario').val(obj.id_usuario);
          $('#Main_Txtid_config').val(obj.id_config);
          $('#Main_Txtnro_cbte').val(obj.nro_cbte);
          $('#Main_Txtdestino_cbte').val(obj.destino_cbte);
         
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
          'id': $('#Main_Txtid').val(),
          'fecha': $('#Main_Txtfecha').val(),
          'caja': $('#Main_Txtcaja').val(),
          'ingreso': $('#Main_Txtingreso').val(),
          'agreso': $('#Main_Txtagreso').val(),
          'tipo': $('#Main_Txttipo').val(),
          'id_usuario': $('#Main_Txtid_usuario').val(),
          'id_config': $('#Main_Txtid_config').val(),
          'nro_cbte': $('#Main_Txtnro_cbte').val(),
          'destino_cbte': $('#Main_Txtdestino_cbte').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'Cajas_mov.aspx/WmGvMod_kx_cajas_mov',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_cajas_mov').modal('hide');
        Buscar_kx_cajas_mov();
        LimpiarPop();
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
    }
   
      function LimpiarPop() {
       
          $('#Main_Txtid').val('');
          $('#Main_Txtfecha').val('');
          $('#Main_Txtcaja').val('');
          $('#Main_Txtingreso').val('');
          $('#Main_Txtagreso').val('');
          $('#Main_Txttipo').val('');
          $('#Main_Txtid_usuario').val('');
          $('#Main_Txtid_config').val('');
          $('#Main_Txtnro_cbte').val('');
          $('#Main_Txtdestino_cbte').val('');
      }



    function PopAlta_kx_cajas_mov() {
     
    LimpiarPop();
    $("#btnModificar1b").hide();
    $("#btnGuardar1b").show();
    $("#TituloPop").text('Alta');
    $("#Modalkx_cajas_mov").modal();
    $("#Main_TxtId").val('0');
    $("#Main_TxtId").prop('disabled', true);
      }



    function AltaPopJs() {
      try {
          var json = JSON.stringify
          ({
            'v_obj': {
          'id': $('#Main_Txtid').val(),
          'fecha': $('#Main_Txtfecha').val(),
          'caja': $('#Main_Txtcaja').val(),
          'ingreso': $('#Main_Txtingreso').val(),
          'agreso': $('#Main_Txtagreso').val(),
          'tipo': $('#Main_Txttipo').val(),
          'id_usuario': $('#Main_Txtid_usuario').val(),
          'id_config': $('#Main_Txtid_config').val(),
          'nro_cbte': $('#Main_Txtnro_cbte').val(),
          'destino_cbte': $('#Main_Txtdestino_cbte').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'Cajas_mov.aspx/WmGvAlta_kx_cajas_mov',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_cajas_mov').modal('hide');
        Buscar_kx_cajas_mov();
        LimpiarPop();
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
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



 
 <%--   modal--%>  


  <div class='modal fade' id='Modalkx_cajas_mov' role='dialog' style='display:none'  >  
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
    <label for='inputName' class='control-label col-xs-4'> id</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> fecha</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtfecha' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> caja</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtcaja' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> ingreso</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtingreso' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> agreso</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtagreso' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> tipo</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txttipo' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> id_usuario</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid_usuario' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> id_config</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid_config' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> nro_cbte</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtnro_cbte' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> destino_cbte</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtdestino_cbte' runat='server' CssClass='form-control'></asp:TextBox> 
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

      
    <div  class="container">  
          <div class="row">
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; ">
       <strong> MOVIMIENTO DE CAJAS  </strong> 
            </div>
         </div>

 <div class='row'>   
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
       <div style='color:white;text-align:right; padding-top: 5px;' class='col-xs-3'>   
    Buscar  
    </div> 
  <div class='col-xs-3' >  
                    <select id='cmbTipoOp' class='form-control'>       
                   <option value='01'>Enero</option>   
                        <option value='02'>Febrero</option>  
                        <option value='03'>Marzo</option>   
                    
                         <option value='04'>Abril</option>   
                         <option value='05'>Marzo</option>   
                         <option value='06'>Junio</option>   
                         <option value='07'>Julio</option>   
                         <option value='08'>Agosto</option>   
                         <option value='09'>Septiembre</option>   
                         <option value='10'>Octubre</option>   
                         <option value='11'>Noviembre</option>   
                         <option value='12'>Diciembre</option>   
                       </select>      
   </div> 
       <div class='col-xs-3' >  
             <select id='cmbAnio' class='form-control'>       
                    
                       </select>   
   </div>  
   <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_cajas_mov2() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>    
     
     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_cajas_mov' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillakx_cajas_mov'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
       <%--       <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_kx_cajas_mov()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
  </button>  --%>
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
      </div>  
   </div>





      <div class='modal fade' id='Modalkx_ver' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-lg'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 
            <strong>     FLUJO DE CAJA</strong>
   <button type='button' class='close' data-dismiss='modal'>&times;</button>

 </div> 

 <div class='modal-body'> 
<!-- Modal cuerpo--> 

          <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_cajas_mov2' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillakx_cajas_mov2'></table>   
   </div>   
   </div>    
    </div> 

 </div> 

  </div>   
      </div>  
 </div>  
     <script>

           function Verpop(id) {
                Buscar_kx_cajas_mov4(id);
               $('#Modalkx_ver').modal();
        }

          function Buscar_kx_cajas_mov4(id) {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
      'v_id':id
       

   });
$.ajax({
    type: 'POST',
    url: 'Caja_ver.aspx/WsListar_kx_cajas_id',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_cajas_mov4,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }

         

        function resultado_kx_cajas_mov4(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_kx_cajas_mov2').show();
   $('#Resultado_kx_cajas_mov2').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_cajas_mov2' class='table   table-hover table-striped' style='width: 100%;'><thead style='text-transform: uppercase;'><tr><th>fecha</th><th>caja</th><th>ingreso</th><th>Egreso</th><th>tipo</th><th>nro_cbte</th><th>Observacion</th> </tr></thead><tbody> "; 
            $.each(v_obj, function (index, obj) { 
                var sty= '';
                if (obj.tipo=='APERTURA DE CAJA') {
                    sty= ' font-weight: 700 ; color:red ';
                }

                  if (obj.tipo=='CIERRE DE CAJA') {
                    sty= ' font-weight: 700 ; color:blue ';
                }
   Tabla_Datos = Tabla_Datos + " <tr  style='"+ sty +"' >    <td>" + obj.fecha + " </td> <td>" + obj.caja + " </td> <td>" + obj.ingreso + " </td> <td>" + obj.agreso + " </td> <td>" + obj.tipo + " </td><td>" + obj.nro_cbte + " </td> <td>" + obj.destino_cbte + " </td>  </tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_cajas_mov2').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     
     }

        $(function () { 

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
           


     for (var i = 2018; i < yyyy + 1; i++) {
                    $("#cmbAnio").append($('<option>',
         {
             value: i,
             text: i
         }));
         }
          $("#cmbTipoOp").val(mm);

             $("#cmbAnio").val(yyyy);

              Buscar_kx_cajas_mov2();
        }

            
         );

    </script>



</asp:Content>
