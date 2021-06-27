<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="kx_cajas.aspx.cs" Inherits="HardSoft.App.Kardex.kx_cajas" %>
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

        
  function Buscar_kx_cajas() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        'v_tipo': $('#cmbTipoOp').val(),
       'v_valor': $('#Main_TxtBuscar').val()

   });
$.ajax({
    type: 'POST',
    url: 'kx_cajas.aspx/WsListar_kx_cajas',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_cajas,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }

  function resultado_kx_cajas(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_kx_cajas').show();
   $('#Resultado_kx_cajas').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_cajas' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th> <th>id</th><th>nombre</th><th>id_config</th><th>habilitada</th> </tr></thead><tbody> "; 
   $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod_kx_cajas("+ obj.id + ");' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td style='width:30px'> <a class='tooltips' onclick='gvDel_kx_cajas("+ obj.id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.id + " </td> <td>" + obj.nombre + " </td> <td>" + obj.id_config + " </td> <td>" + obj.habilitada + " </td> </tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_cajas').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     fn_cantidad_kx_cajas();
     }

    function fn_cantidad_kx_cajas() {
     cantidad = $('#grillakx_cajas tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
     };
   

    function gvDel_kx_cajas(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_Id': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'kx_cajas.aspx/WmGvDel_kx_cajas',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: (function (Result) {
    Buscar_kx_cajas() ;
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

    function PopMod_kx_cajas(id) {
      try {
    $("#btnModificar1b").show();
    $("#btnGuardar1b").hide();
    $("#TituloPop").text('Modificar');
    $('#Modalkx_cajas').modal();
    $('#Main_TxtId').val(id);
   

    var json = JSON.stringify
        ({
          'v_tipo':'99',
          'v_valor': id
        });
      $.ajax({
      type: 'POST',
      url: 'kx_cajas.aspx/WsListar_kx_cajas',
      data: json,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (Resultado) {
          var v_obj = Resultado.d;
          $.each(v_obj, function (index, obj) {          
          $('#Main_Txtid').val(obj.id);
          $('#Main_Txtnombre').val(obj.nombre);
          $('#Main_Txtid_config').val(obj.id_config);
          $('#Main_Txthabilitada').val(obj.habilitada);
         
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
          'nombre': $('#Main_Txtnombre').val(),
          'id_config': $('#Main_Txtid_config').val(),
          'habilitada': $('#Main_Txthabilitada').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'kx_cajas.aspx/WmGvMod_kx_cajas',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_cajas').modal('hide');
        Buscar_kx_cajas();
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
          $('#Main_Txtnombre').val('');
          $('#Main_Txtid_config').val('');
          $('#Main_Txthabilitada').val('');
      }



    function PopAlta_kx_cajas() {
     
    LimpiarPop();
    $("#btnModificar1b").hide();
    $("#btnGuardar1b").show();
    $("#TituloPop").text('Alta');
    $("#Modalkx_cajas").modal();
    $("#Main_TxtId").val('0');
        $("#Main_TxtId").prop('disabled', true);
         $("#Main_Txthabilitada").val('S');
        

      }



    function AltaPopJs() {
        try {

            if ($('#Main_Txtnombre').val() == '') {
                alert("Escriba el nombre de la terminal - Caja.");
                return;
            }
          var json = JSON.stringify
          ({
            'v_obj': {
          'id': $('#Main_Txtid').val(),
          'nombre': $('#Main_Txtnombre').val(),
          'id_config': $('#Main_Txtid_config').val(),
          'habilitada': $('#Main_Txthabilitada').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'kx_cajas.aspx/WmGvAlta_kx_cajas',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_cajas').modal('hide');
        Buscar_kx_cajas();
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


  <div class='modal fade' id='Modalkx_cajas' role='dialog' style='display:none'  >  
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
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> nombre</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtnombre' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'  style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> id_config</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtid_config' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> habilitada</label>  
   <div class='col-xs-4'>  
   

       <select id="Main_Txthabilitada" class="form-control">
          <option value="N">NO</option>
          <option value="S">SI</option>
       
      </select>
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

    <div class="container">
        <div class="row">
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; ">
       <strong>  CAJAS  </strong> 
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
                   <option value='0'>Nombre</option>      
                       </select>      
   </div> 
       <div class='col-xs-3' >  
           <asp:TextBox ID='TxtBuscar' runat='server'  class='form-control'></asp:TextBox>   
   </div>  
   <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_cajas() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_cajas' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillakx_cajas'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_kx_cajas()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
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
        $(function () {

            Buscar_kx_cajas();
        }
            
            );
    </script>
</asp:Content>
