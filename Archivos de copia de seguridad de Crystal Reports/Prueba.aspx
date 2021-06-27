<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnPersonal.Master" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="HardSoft.App.Personal.Prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
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


    <div class=" container"  style="margin-top: 36px;">


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
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_hosp_dias() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_hosp_dias' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillahosp_dias'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_hosp_dias()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
  </button>  
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
      </div>   
        <br />





     <%--   modal--%>
   
  <div class='modal fade' id='Modalhosp_dias' role='dialog' style='display:none'  >  
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
    <label for='inputName' class='control-label col-xs-4'> Id</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtId' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Nombre</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtNombre' runat='server' CssClass='form-control text-uppercase '></asp:TextBox> 
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
    </div>



    <script>

        // $("#Modalhosp_dias").modal();


        function Buscar_hosp_dias() {
            try {

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
               ({
                   'v_tipo': $('#cmbTipoOp').val(),
                   'v_valor': $('#Main_TxtBuscar').val()

               });
                $.ajax({
                    type: 'POST',
                    url: 'Prueba.aspx/WsListar_hosp_dias',
                    data: json,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: resultado_hosp_dias,
                    error: erroresJs
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function resultado_hosp_dias(Resultado) {
            var v_obj = Resultado.d;
            var Tabla_Titulo = '';
            var Tabla_Datos = '';
            var Tabla_Fin = '';
            $('#Resultado_hosp_dias').show();
            $('#Resultado_hosp_dias').empty();
            Tabla_Titulo = "  <table    id='grillahosp_dias' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th> <th>Id</th><th>Nombre</th> </tr></thead><tbody> ";
            $.each(v_obj, function (index, obj) {
                Tabla_Datos = Tabla_Datos + " <tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod_hosp_dias(" + obj.Id + ");' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td style='width:30px'> <a class='tooltips' onclick='gvDel_hosp_dias(" + obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Id + " </td> <td>" + obj.Nombre + " </td> </tr>";
            });
            Tabla_Fin = " </tbody></table>";
            $('#Resultado_hosp_dias').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();
        }

        function fn_cantidad() {
            cantidad = $('#grillahosp_dias tbody').find('tr').length;
            $('#span_cantidad').html(cantidad);
        };


        function gvDel_hosp_dias(ids) {
            try {
                if (confirm('Esta seguro que desea eliminar el registro ?')) {
                    var json = JSON.stringify
                        ({
                            'v_Id': ids
                        });

                    $.ajax({
                        type: 'POST',
                        url: 'Prueba.aspx/WmGvDel_hosp_dias',
                        data: json, contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: (function (Result) {
                            Buscar_hosp_dias();
                        }),
                        error: erroresJs
                    });
                }
            }
            catch (e) {
                alert(e);
            }
        }

       

        function PopAlta_hosp_dias() {

            LimpiarPop();
            $("#btnModificar1b").hide();
            $("#btnGuardar1b").show();
            $("#TituloPop").text('Alta');
            $("#Modalhosp_dias").modal();
            $("#Main_TxtId").val('0');
            $("#Main_TxtId").prop('disabled', true);
        }


        function PopMod_hosp_dias(id) {
            try {
                $("#btnModificar1b").show();
                $("#btnGuardar1b").hide();
                $("#TituloPop").text('Modificar');
                $('#Modalhosp_dias').modal();
                $('#Main_TxtId').val(id);


                var json = JSON.stringify
                    ({
                        'v_tipo': '99',
                        'v_valor': id
                    });
                $.ajax({
                    type: 'POST',
                    url: 'Prueba.aspx/WsListar_hosp_dias',
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Resultado) {
                        var v_obj = Resultado.d;
                        $.each(v_obj, function (index, obj) {
                            $('#Main_TxtId').val(obj.Id);
                            $('#Main_TxtNombre').val(obj.Nombre);

                        });
                    },
                    error: erroresJs
                });
            } catch (e) {
                alert(e.message);
            }
        }

        
       // Prueba.aspx

        function AltaPopJs() {
            try {
                var json = JSON.stringify
                ({
                    'v_obj': {
                        'Id': $('#Main_TxtId').val(),
                        'Nombre': $('#Main_TxtNombre').val()
                    }
                });
                $.ajax({
                    type: "POST",
                    url: 'Prueba.aspx/WmGvAlta_hosp_dias',
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: (function (Result) {
                        $('#Modalhosp_dias').modal('hide');
                        Buscar_hosp_dias();
                        LimpiarPop();
                    }),
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
                        'Id': $('#Main_TxtId').val(),
                        'Nombre': $('#Main_TxtNombre').val()
                    }
                });
                $.ajax({
                    type: "POST",
                    url: 'Prueba.aspx/WmGvMod_hosp_dias',
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: (function (Result) {
                        $('#Modalhosp_dias').modal('hide');
                        Buscar_hosp_dias();
                        LimpiarPop();
                    }),
                    error: erroresJs
                });
            } catch (e) {
                alert(e.message);
            }
        }

        function LimpiarPop() {

            $('#Main_TxtId').val('');
            $('#Main_TxtNombre').val('');
        }


    </script>

</asp:Content>
