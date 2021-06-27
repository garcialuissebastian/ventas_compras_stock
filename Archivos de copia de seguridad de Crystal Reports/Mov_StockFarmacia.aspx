<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="Mov_StockFarmacia.aspx.cs" Inherits="HardSoft.App.Kardex.Mov_StockFarmacia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      <script type="text/javascript" src="/js/jquery.js"></script>
    
      <script type="text/javascript" src="/js/formError.js"></script>

    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    <script src="../../js/jquery.maskedinput.js"></script>
   
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

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
    <div class=" container">
       
    <div class='row' style="margin-top: 35px;">   
         <div class="alert alert-cab">
       MOVIMIENTO DE STOCK
            </div>
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
       <div style='color:white;text-align:right;  ' class='col-xs-3'>   
<select id="cmbDepLt" class="form-control"></select>
    </div> 
  <div class='col-xs-3' >  
                    <select id='cmbTipoOp' class='form-control'>       
                   <option value='0'>Nombre articulo</option>   
                         <option value="5">Cod MS</option>
                       
                        <option value="1">CodBarra Sistema</option>   
                      <%--  <option value="3">CodBarra Proveedor</option>--%>
                         
                         
                       </select>      
   </div> 
       <div class='col-xs-3' >  
           <asp:TextBox ID='TxtBuscar' runat='server' onkeydown="if (event.keyCode == 13) {  return false;} "  class='form-control'></asp:TextBox>   
   </div>  
   <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_stock() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_stock' style='overflow: auto;  height: 220px; width: 100%; '>    
      
     <table   id='grillakx_stock'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px;margin-bottom: 10px; ' class='MarcoMio' > 
              <div style="display:none">
              <asp:Button ID="BtnRp" runat="server" Text="Button" OnClick="BtnRp_Click" />
                  </div> 
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='Rp()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span>Descargar</button>  
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
            
            ListarDeposito();
               Buscar_kx_stock();
        })  
        // barcod
     
        $("#Main_TxtBuscar").on("keydown", function (event) {
            if (event.which == 13) {
                Buscar_kx_stock();
                $("#Main_TxtBuscar").val('');
            }
        });
        ////
        function Rp() {
            $("#Main_BtnRp").click();
        }
        function Buscar_kx_stock() {
            try {

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
               ({
                   'v_tipo': $('#cmbTipoOp').val(),
                        'v_valor': $('#Main_TxtBuscar').val(),
                    'v_dep': $('#cmbDepLt').val()

               });
                $.ajax({
                    type: 'POST',
                    url: 'Mov_StockFarmacia.aspx/WsListar_kx_stock',
                    data: json,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                       async: false,
                    success: resultado_kx_stock,
                    error: erroresJs
                });
                
            } catch (e) {
                alert(e.message);
            }
        }

        function resultado_kx_stock(Resultado) {
            var v_obj = Resultado.d;
            var Tabla_Titulo = '';
            var Tabla_Datos = '';
            var Tabla_Fin = '';
            $('#Resultado_kx_stock').show();
            $('#Resultado_kx_stock').empty();
            Tabla_Titulo = "  <table    id='grillakx_stock' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Articulo</th><th>Deposito</th><th>Fecha</th><th>Entrada</th><th>Salida</th><th>Motivo</th><th>Saldo</th> </tr></thead><tbody style='font-size: 11px;'> ";
            $.each(v_obj, function (index, obj) {
                Tabla_Datos = Tabla_Datos + " <tr >     <td style='text-align: justify'>" + obj.Id_Articulo + " </td> <td>" + obj.Id_Deposito + " </td> <td>" + obj.Fecha + " </td> <td>" + obj.Entrada + " </td> <td>" + obj.Salida + " </td> <td>" + obj.Motivo + " </td> <td>" + obj.Saldo + " </td> </tr>";
            });
            Tabla_Fin = " </tbody></table>";
            $('#Resultado_kx_stock').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            cantidad = $('#grillakx_stock tbody').find('tr').length;
            $('#span_cantidad').html(cantidad);
        }

        var table = document.getElementById("grillakx_stock");

        


        function gvDel_kx_stock(ids) {
            try {
                if (confirm('Esta seguro que desea eliminar el registro ?')) {
                    var json = JSON.stringify
                        ({
                            'v_Id': ids
                        });

                    $.ajax({
                        type: 'POST',
                        url: 'Mov_Stock.aspx/WmGvDel_kx_stock',
                        data: json, contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: (function (Result) {
                            Buscar_kx_stock();
                        }),
                        error: erroresJs
                    });
                }
            }
            catch (e) {
                alert(e);
            }
        }

        function PopMod_kx_stock(id) {
            try {
                $("#btnModificar1b").show();
                $("#btnGuardar1b").hide();
                $("#TituloPop").text('Modificar');
                $('#Modalkx_stock').modal();
                $('#Main_TxtId').val(id);


                var json = JSON.stringify
                    ({
                        'v_tipo': '99',
                        'v_valor': id
                    });
                $.ajax({
                    type: 'POST',
                    url: 'Mov_Stock.aspx/WsListar_kx_stock',
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Resultado) {
                        var v_obj = Resultado.d;
                        $.each(v_obj, function (index, obj) {
                            $('#Main_TxtId').val(obj.Id);
                            $('#Main_TxtId_Articulo').val(obj.Id_Articulo);
                            $('#Main_TxtId_Deposito').val(obj.Id_Deposito);
                            $('#Main_TxtFecha').val(obj.Fecha);
                            $('#Main_TxtEntrada').val(obj.Entrada);
                            $('#Main_TxtSalida').val(obj.Salida);
                            $('#Main_TxtMotivo').val(obj.Motivo);
                            $('#Main_TxtSaldo').val(obj.Saldo);

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
                        'Id': $('#Main_TxtId').val(),
                        'Id_Articulo': $('#Main_TxtId_Articulo').val(),
                        'Id_Deposito': $('#Main_TxtId_Deposito').val(),
                        'Fecha': $('#Main_TxtFecha').val(),
                        'Entrada': $('#Main_TxtEntrada').val(),
                        'Salida': $('#Main_TxtSalida').val(),
                        'Motivo': $('#Main_TxtMotivo').val(),
                        'Saldo': $('#Main_TxtSaldo').val()
                    }
                });
                $.ajax({
                    type: "POST",
                    url: 'Mov_Stock.aspx/WmGvMod_kx_stock',
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: (function (Result) {
                        $('#Modalkx_stock').modal('hide');
                        Buscar_kx_stock();
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
            $('#Main_TxtId_Articulo').val('');
            $('#Main_TxtId_Deposito').val('');
            $('#Main_TxtFecha').val('');
            $('#Main_TxtEntrada').val('');
            $('#Main_TxtSalida').val('');
            $('#Main_TxtMotivo').val('');
            $('#Main_TxtSaldo').val('');
        }



        function PopAlta_kx_stock() {

            LimpiarPop();
            $("#btnModificar1b").hide();
            $("#btnGuardar1b").show();
            $("#TituloPop").text('Alta');
            $("#Modalhosp_dias").modal();
            $("#Main_TxtId").val('0');
            $("#Main_TxtId").prop('disabled', true);
        }



        function AltaPopJs() {
            try {
                var json = JSON.stringify
                ({
                    'v_obj': {
                        'Id': $('#Main_TxtId').val(),
                        'Id_Articulo': $('#Main_TxtId_Articulo').val(),
                        'Id_Deposito': $('#Main_TxtId_Deposito').val(),
                        'Fecha': $('#Main_TxtFecha').val(),
                        'Entrada': $('#Main_TxtEntrada').val(),
                        'Salida': $('#Main_TxtSalida').val(),
                        'Motivo': $('#Main_TxtMotivo').val(),
                        'Saldo': $('#Main_TxtSaldo').val()
                    }
                });
                $.ajax({
                    type: "POST",
                    url: 'Mov_Stock.aspx/WmGvAlta_kx_stock',
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: (function (Result) {
                        $('#Modalkx_stock').modal('hide');
                        Buscar_hosp_dias();
                        LimpiarPop();
                    }),
                    error: erroresJs
                });
            } catch (e) {
                alert(e.message);
            }
        }

        function erroresJs(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }
            function ListarDeposito() {
            try {

                var json = JSON.stringify
        ({
            "v_tipo": '89',
            "v_valor": ''
        });

                $.ajax({
                    type: "POST",
                    url: "Deposito.aspx/WsListarFarmacia",
                    data: json,
                       async: false,
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
 
            $('#cmbDepLt').empty();
           
            $.each(Especialidad, function (index, especialidades) {
               
                $('#cmbDepLt').append(
                $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
              );
            });


        }


        $(this).everyTime(15000, function () {

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
               window.location.href = "../../Login_hosp.aspx";

                }
            });

        });

        function VerifySessionState(result) {
            $("#miLoader").show();
            if (!result.d) {
 window.location.href = "../../Login_hosp.aspx";
            }
        }

    </script>
</asp:Content>
