<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="Caja_ver.aspx.cs" Inherits="HardSoft.App.Kardex.Caja_ver" %>
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
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> id</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> fecha</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtfecha' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> caja</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtcaja' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 

        <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> tipo</label>  
   <div class='col-xs-4'>  
       <select class="form-control" id="cmbTipo">
           <option value="INGRESO DE EFECTIVO">INGRESO DE EFECTIVO</option>
             <option value="EGRESO DE EFECTIVO">EGRESO DE EFECTIVO</option>
       </select>
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
      <script>
          $("#cmbTipo").change(function () {

          
              if ($("#cmbTipo").val() == "EGRESO DE EFECTIVO") {
                    
                   $("#egre_ver").css("display", "block");
                  $("#ingre_ver").css("display", "none");
                   $("#Main_Txtagreso").val('0');

              } else {

                  $("#egre_ver").css("display", "none");
                    $("#Main_Txtingreso").val("0");
                  $("#ingre_ver").css("display", "block");
                    
              }

              //   if ($("#cmbTipo").val() == "INGRESO DE EFECTIVO") {
                   
              //         $("#ingre_ver").show();
              //   } else {
              //       $("#egre_ver").hide();
              //}

          }
          );

      </script>

  <div class='form-group' id="ingre_ver">  
    <label for='inputName' class='control-label col-xs-4'> ingreso</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtingreso' runat='server' CssClass='form-control' placeholder="$" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" 
 onblur="onBlur(this)"></asp:TextBox>
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
      <div style="display:none">
               <asp:TextBox ID="valorFoco" runat="server"    CssClass="form-control" ></asp:TextBox>
          
        </div>

      <script>
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
      </script>
  <div class='form-group' id="egre_ver" style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Egreso</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtagreso' runat='server' CssClass='form-control'  placeholder="$" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" 
 onblur="onBlur(this)"></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 

 
      <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> id_usuario</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid_usuario' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group' style="display:none">  
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
    <label for='inputName' class='control-label col-xs-4'> Observación</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtdestino_cbte' runat='server' CssClass='form-control' TextMode="MultiLine"></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> monto_conteo</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtmonto_conteo' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> id_aper</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid_aper' runat='server' CssClass='form-control'></asp:TextBox> 
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
       <strong> FLUJO DE CAJAS  </strong> 
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
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_cajas_mov() '> 
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
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_kx_cajas_mov()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo Movimiento   
  </button>  
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
      </div>  
   
              </div>
    <script>
        


  function Buscar_kx_cajas_mov() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
      'v_mes': $('#cmbTipoOp').val(),
       'v_anio': $('#cmbAnio').val()

   });
$.ajax({
    type: 'POST',
    url: 'Caja_ver.aspx/WsListar_kx_cajas_mov',
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
   Tabla_Titulo =  "  <table    id='grillakx_cajas_mov' class='table   table-hover table-striped' style='width: 100%;'><thead style='text-transform: uppercase;'><tr><th>fecha</th><th>caja</th><th>ingreso</th><th>Egreso</th><th>tipo</th><th>nro_cbte</th><th>Observacion</th> </tr></thead><tbody> "; 
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
        url: 'Caja_ver.aspx/WmGvDel_kx_cajas_mov',
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
      url: 'Caja_ver.aspx/WsListar_kx_cajas_mov',
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
          $('#Main_Txtmonto_conteo').val(obj.monto_conteo);
          $('#Main_Txtid_aper').val(obj.id_aper);
         
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
          'destino_cbte': $('#Main_Txtdestino_cbte').val(),
          'monto_conteo': $('#Main_Txtmonto_conteo').val(),
          'id_aper': $('#Main_Txtid_aper').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'Caja_ver.aspx/WmGvMod_kx_cajas_mov',
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
          $('#Main_Txtmonto_conteo').val('');
          $('#Main_Txtid_aper').val('');
      }



        function PopAlta_kx_cajas_mov() {
         $("#btnGuardar1b").prop('disabled', false);
        TieneCaja();
    LimpiarPop();
    $("#btnModificar1b").hide();
    $("#btnGuardar1b").show();
    $("#TituloPop").text('Nuevo Movimiento');
    $("#Modalkx_cajas_mov").modal();
    $("#Main_TxtId").val('0');
    $("#Main_TxtId").prop('disabled', true);
        $("#Main_Txtingreso").val('0');
        $("#Main_Txtagreso").val('0');

        
        
        
    }



    function AltaPopJs() {
        try {

             $("#btnGuardar1b").prop('disabled', true);
          var json = JSON.stringify
          ({
            'v_obj': {
          'id': $('#Main_Txtid').val(),
          'fecha': $('#Main_Txtfecha').val(),
          'caja': $('#Main_Txtcaja').val(),
          'ingreso': $('#Main_Txtingreso').val(),
          'agreso': $('#Main_Txtagreso').val(),
          'tipo': $('#cmbTipo').val(),
          'id_usuario': $('#Main_Txtid_usuario').val(),
          'id_config': $('#Main_Txtid_config').val(),
          'nro_cbte': $('#Main_Txtnro_cbte').val(),
          'destino_cbte': $('#Main_Txtdestino_cbte').val(),
          'monto_conteo': $('#Main_Txtmonto_conteo').val(),
          'id_aper': $('#Main_Txtid_aper').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'Caja_ver.aspx/WmGvAlta_kx_cajas_mov',
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

              Buscar_kx_cajas_mov();
        }

            
         );

    </script>
</asp:Content>
