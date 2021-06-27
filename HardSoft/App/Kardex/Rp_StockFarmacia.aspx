<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="Rp_StockFarmacia.aspx.cs" Inherits="HardSoft.App.Kardex.Rp_Mov_StockFarmacia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       <script type="text/javascript" src="/js/jquery.js"></script>
    
      <script type="text/javascript" src="/js/formError.js"></script>

    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    <script src="../../js/jquery.maskedinput.js"></script>
   
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
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
      INFORME DE STOCK
            </div>
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
       <div style='color:white;text-align:right;  ' class='col-xs-3'>   
<select id="cmbDepLt" class="form-control"></select>
    </div> 
  <div class='col-xs-2' >  
                    <select id='cmbTipoOp' class='form-control'>       
                   <option value='0'>Nombre articulo</option>   
                         <option value="2">Cod MS</option> 
                        <option value="1">CodBarra Sistema</option>   
                      <%--  <option value="3">CodBarra Proveedor</option>--%>
                         
                         
                       </select>      
   </div> 
       <div class='col-xs-2' >  
           <asp:TextBox ID='TxtBuscar' runat='server' onkeydown="if (event.keyCode == 13) {  return false;} "  class='form-control'></asp:TextBox>   
   </div>  
 
         
         <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_stockRP() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
    
         
     
          <div class='col-xs-2' >  
                    <select id='cmbTipoOpRp' class='form-control'>       
                   <option value='0'>Detallado</option>   
                         <option value="1">Totales</option> 
                      
                         
                         
                       </select>      
   </div>    
  </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;    border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_stock' style='overflow: auto;  height: 220px; width: 100%; '>    
      
     <table   id='grillakx_stock'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px;margin-bottom: 10px; ' class='MarcoMio' > 
              <div style="display:none">
              <asp:Button ID="BtnRp" runat="server" Text="Button" OnClick="BtnRp_Click" />
                   <asp:Button ID="BtnRp2" runat="server" Text="Button" OnClick="BtnRp2_Click" />
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
            if ($("#cmbTipoOpRp").val() == "0") {
   BuscarRp();
  }
     if ($("#cmbTipoOpRp").val() == "1") {
  BuscarRpTotal() 
  }
        })  
        // barcod


        function Buscar_kx_stockRP() {
           
                       $("#Main_TxtBuscar").removeClass("valid");
             if ($("#cmbTipoOp").val() != "0") {

            if ($("#Main_TxtBuscar").val() == "") {
               $("#Main_TxtBuscar").addClass("valid");
                return;
            }
 }

            if ($("#cmbTipoOpRp").val() == "0") {
   BuscarRp();
  }
     if ($("#cmbTipoOpRp").val() == "1") {
  BuscarRpTotal() 
  }
         
        }

        $("#cmbTipoOpRp").change(function () {
            Buscar_kx_stockRP(); 
        });

        $("#Main_TxtBuscar").on("keydown", function (event) {
            if (event.which == 13) {
                Buscar_kx_stock();
                $("#Main_TxtBuscar").val('');
            }
        });
        ////
        function Rp() {

                   if ($("#cmbTipoOpRp").val() == "0") {
    $("#Main_BtnRp").click();
  }
     if ($("#cmbTipoOpRp").val() == "1") {
  $("#Main_BtnRp2").click();
  }

           



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

        
         
        function erroresJs(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }
            function ListarDeposito() {
            try {


                //  var v_buscar = $('#cmbTipoOp').val();
                //  var json = JSON.stringify
                //    ({
                //        "v_tipo": $('#cmbTipoOp').val(),
                //        "v_valor": $('#Main_TxtBuscar').val()

                //    });
                //  $.ajax({
                //      type: "POST",
                //      url: "Deposito.aspx/WsListar",
                //      data: json,
                //       async: false,
                //      contentType: "application/json; charset=utf-8",
                //      dataType: "json",
                //      success: CargarDep,
                //      error: errores
                //});



                           var json = JSON.stringify
        ({
            "v_tipo": '88',
            "v_valor": ''
        });

                $.ajax({
                    type: "POST",
                    url: "Deposito.aspx/WsListarFarmacia",
                    data: json,
                    contentType: "application/json; charset=utf-8",

                    async: false,
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


             function BuscarRpTotal() {

            try {


                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": $('#cmbTipoOp').val(),
                      "v_valor": $('#Main_TxtBuscar').val(),
                      "v_dep": $('#cmbDepLt').val()
                      
                  });
                $.ajax({
                    type: "POST",
                    url: "Rp_StockFarmacia.aspx/WsListar_kx_stockTotal",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                             var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#Resultado_kx_stock").show();
            $("#Resultado_kx_stock").empty();
            Tabla_Titulo = "<table   id='grillaArt' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th> Cod_Manual</th>   <th>Articulo</th> <th>  Saldo</th>   </tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {

                var sin = pacientes.desc_Art;
                if (pacientes.desc_Art.trim().length > 280) {

                    sin = pacientes.desc_Art.substr(0, 250) + '.... (Ver más)';
                }
   
                  
 
                    Tabla_Datos = Tabla_Datos + "<tr    >    <td>" + pacientes.Cod_Manual+ "</td> <td style='text-align: justify;'>" + sin + "</td>  <td>" + pacientes.Cant + "</td>   </tr>";
         

            });


            Tabla_Fin = "</tbody></table>";
            $("#Resultado_kx_stock").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();
            
            if (Pacientes.length < 1) {
                $("#Resultado_kx_stock").html("   <div class='alert alert-danger'> No se encuentra stock para el insumo buscado.  </div> ");
            }

                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }


      
             function BuscarRp() {

            try {


                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": $('#cmbTipoOp').val(),
                      "v_valor": $('#Main_TxtBuscar').val(),
                      "v_dep": $('#cmbDepLt').val()
                      
                  });
                $.ajax({
                    type: "POST",
                    url: "EgresosFarmacia.aspx/WsListarArticuloSkFarmacia",
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

            $("#Resultado_kx_stock").show();
            $("#Resultado_kx_stock").empty();
            Tabla_Titulo = "<table   id='grillaArt' class='table   table-hover table-striped' style='width: 100%;'><thead><tr>  <th>Articulo</th><th>Lote</th><th>   Vto </th> <th>  Saldo</th> <th>  Laboratorio</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {

                var sin = pacientes.desc_Art;
                if (pacientes.desc_Art.trim().length > 280) {

                    sin = pacientes.desc_Art.substr(0, 250) + '.... (Ver más)';
                }
 

                var v_lote = 0;
                if (pacientes.Lote == 'SI') {
                    v_lote = 1;
                }
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


                if (pacientes.Anulado != 'SI') {
                    Tabla_Datos = Tabla_Datos + "<tr    >  <td style='text-align: justify;'>" + sin + "</td><td style='text-align: justify;'>" + pacientes.Cod_Lot + "</td><td style='" + color + "'>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td><td>" + pacientes.desc_Lab + "</td>   </tr>";
                }

            });


            Tabla_Fin = "</tbody></table>";
            $("#Resultado_kx_stock").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad2();
            
            if (Pacientes.length < 1) {
                $("#Resultado_kx_stock").html("   <div class='alert alert-danger'> No se encuentra stock para el insumo buscado.  </div> ");
            }
            //   esValido2('ADM_KARDEX');


        }

          function  fn_cantidad2() {
      
                cantidad = $("#grillaArt tbody").find("tr").length;
                $("#span_cantidad").html(cantidad);
            };
    </script>
</asp:Content>
