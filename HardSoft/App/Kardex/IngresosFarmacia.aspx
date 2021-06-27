<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="IngresosFarmacia.aspx.cs" Inherits="HardSoft.App.Kardex.IngresosFarmacia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

    <style>
        tr:hover td {
    background: #abccd2;
}
    </style>
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
       <script language="JavaScript" type="text/javascript">

           $(document).keypress(function (event) {
               // para q no haga submit cuando pressiono enter en alguna parte
               var keycode = event.keyCode || event.which;
               if (keycode == '13') {
                   return false;
               }
           });

           function acceptNum(e) {
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               return ((tecla > 47 && tecla < 58) || tecla == 8);
           }
         </script>
  
         <script type="text/javascript" src="/js/jquery.js"></script>
    
      <script type="text/javascript" src="/js/formError.js"></script>

    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    <script src="../../js/jquery.maskedinput.js"></script>
   
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
    
       <div class=" container"  style="margin-top: 36px;">
         
            <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
            Ingreso       </li>
                                </ol>
        </nav>




<div class="row">


      <div class="">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro"  >
      Stock Lote - Ingreso de Articulos  
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       
       <div class="col-xs-12">
        <div class="form-horizontal">
      
        
               <div class="form-group">
         <label for="TxtNombreSk" class="control-label col-xs-2">Motivo:   </label>
         <div class="col-xs-3">
             <div style="display:none">
  <asp:TextBox ID="TxtCodSisLt" runat="server" class="form-control"  ></asp:TextBox>
      </div>


             <select id="ddlListadoMotivo" name="ddlListadoMotivo" class="form-control  text-uppercase">
                 <option value="-1" >[Seleccione]</option>
<option value="4">Ingreso por adquisición</option>
<option value="5">Ingreso por donación</option>
                 <option value="6">Otros</option>
</select>

         </div>

            <label for="TxtNombre" class="control-label col-xs-1">Deposito </label>
         <div class="col-xs-4">

<select id="cmbDepLt" class="form-control"></select>
      
         </div>
       
                <div class="col-xs-2">  </div>
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
      <hr />

         
            
         <div class="form-group"> 
                       <label for="TxtNombre" class="control-label col-xs-2" >Insumo</label>
         <div class="col-xs-5">
      <asp:TextBox ID="TxtInsumo" runat="server" class="form-control"  onkeypress="return acceptNum(event)" TextMode="MultiLine" ></asp:TextBox>
      <div style="display:none">
          
      </div>
         </div>
                <div class="col-xs-1" style="text-align:left">
              <a class="tooltips tooltipsArt" style="cursor: pointer;" onclick="VerInsumo()"> 
        
       <img src="/images/ver.png"  >    
                    
<span>Buscar Insumo </span>   </a> &nbsp;

  </div>
        <label for="TxtNombre" class="control-label col-xs-1" >Laboratorio</label>
        
          
         <div class="col-xs-3">
                <select id="cmbLab" class="cmbBuscar form-control" style="width: 100%"  >
            

                       <option value="-1"  selected="selected">[Seleccione]</option>
      </select>

         </div>
           
     </div>
        
      
      <div class="form-group">
           <label for="TxtNombre" class="control-label col-xs-2" >Cod Lote</label>
         <div class="col-xs-2">
  <asp:TextBox ID="TxtCodLt" runat="server" class="form-control"  onkeypress="return acceptNum(event)"  ></asp:TextBox>
      
         </div>

            <label for="TxtNombre" class="control-label col-xs-2" >Fecha Vto</label>
         <div class="col-xs-2">
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
  <asp:TextBox ID="TxtCantLt" runat="server" class="form-control"  placeholder="0" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" 
 onblur="onBlur(this)" ></asp:TextBox>
      
         </div>

        
           
     </div>
      
              
              </div>



      <div style="text-align: center;
    border-top: solid;
    padding: 4px;">      <button id="btnAgregar1Sk" type="button" class="btn2 btn-danger " onclick="AddLtJs()">
     + Agregar al stock
 </button>

      </div>
  
      
              <div id='ResultadoLt' style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color: floralwhite;">
      <img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px; display:none' id="wait" />
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

                  <button id="btnguardatSk" type="button" class="btn2 btn-default " onclick="AddGuardarJs()">
    Guardar
 </button>
             
     
                  <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
       
              <br />
                
               </div> 
</div> 
       
</div>




          </div>



                <!-- Modal -->
  <div class="modal fade" id="ModalInsumo" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="background-color: #efefef; text-shadow: #969696 0.1em 0.1em 0.2em;  ">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
         
       <strong>Buscar Insumos </strong> 
             
        </div>
        <div class="modal-body">
     <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOp" class="form-control">
              <%--  <option value="3">CodBarra Proveedor</option>--%>
           <option value="0">Nombre</option>
           <option value="2">Cod MS</option>
           <option value="8">CodBarra Sistema</option>      
         
         <%--   <option value="1">Cod Sistema</option>--%>
         
           
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscarA" runat="server"  class="form-control" onkeydown="if (event.keyCode == 13) {  return false;} "></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina1R" type="button" class="btn2  btn-default "  onclick="Buscar()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>
         
        
          </div>
       </div> 
</div>
</div>
  
   <div id="ResultadoB" style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; "> </div>


            
         </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>
    <script>

        function AddGuardarJs() {

            try {
                  $("#ddlListadoMotivo").removeClass("valid");
            if ($("#ddlListadoMotivo").val() < 1) {
                $("#ddlListadoMotivo").addClass("valid");
                alert("Falta agregar el motivo del ingreso. ");
                return;
            }

                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_motivo": $("#ddlListadoMotivo option:selected").text(),
                      "v_dep": $("#cmbDepLt").val(),
                      "v_remito": $("#Main_TxtRemitoLt").val(),
                      "v_origen": $("#Main_TxtOrigenLt").val()

                  });
                $.ajax({
                    type: "POST",
                    url: "IngresosFarmacia.aspx/WmAddGuardar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (result) {
                        alert("** Ingreso Exitoso.");
                        window.location.href = "IngresosFarmacia.aspx";

                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }


        }

        function Buscar() {

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
                    url: "ArticuloFarmacia.aspx/WsListarArticulo",
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
            Tabla_Titulo = "<table   id='grillaArt' class='table   table-hover table-striped' style='width: 100%;'><thead><tr>  <th>Cod_MS</th><th>Nombre Generico</th><th>  Info complementaria </th> <th>Otra Información</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {

                var sin = pacientes.Nombre + ' (' + pacientes.DescripcionPrincipal+')';
                if (pacientes.Nombre.trim().length > 230) {

                    sin = pacientes.Nombre.substr(0, 200) + '.... (Ver más)';
                }

                var desc = pacientes.DescripcionPrincipal;
                if (pacientes.DescripcionPrincipal.trim().length > 230) {

                    desc = pacientes.DescripcionPrincipal.substr(0, 200) + '.... (Ver más)';
                }

                var v_lote = 0;
                if (pacientes.Lote == 'SI') {
                    v_lote = 1;
                }
                if (pacientes.Anulado != 'SI') {
                    Tabla_Datos = Tabla_Datos + "<tr    onclick='setInsumo(" + pacientes.Id + ", \"" + pacientes.Cod_Manual.replace(/\s/g,' ') + " - " + sin.replace(/\s/g,' ') + "\");' style='cursor:pointer;'>   <td>" + pacientes.Cod_Manual + "</td><td style='text-align: justify;'>" + pacientes.Nombre + "</td><td>" + desc + "</td><td>" + pacientes.DescripcionSecundaria + "</td>   </tr>";
                }

            });

            Tabla_Fin = "</tbody></table>";
            $("#ResultadoB").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();

            //   esValido2('ADM_KARDEX');


        }


        function setInsumo(id,nom) {
            $("#Main_TxtInsumo").val(nom);
            $("#Main_TxtCodSisLt").val(id);

            $("#ModalInsumo").modal('hide');
            $("#ResultadoB").empty();
            $("#Main_TxtBuscarA").val('');
            
        }
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

        function AddLtJs() {
 
            //$("#ContentPlaceHolder1_TxtEmpresa3").addClass("valid");
            //$("#ContentPlaceHolder1_TxtFecha_Ini3").removeClass("valid");

            $("#Main_TxtCantLt").removeClass("valid");
            if ($("#Main_TxtCantLt").val() < 1) {
                $("#Main_TxtCantLt").addClass("valid");
                return;
            }

            $("#Main_TxtFechaCobro").removeClass("valid");
            if ($("#Main_TxtFechaCobro").val() == "") {
                $("#Main_TxtFechaCobro").addClass("valid");
                return;
            }

            $("#Main_TxtInsumo").removeClass("valid");
            if ($("#Main_TxtInsumo").val() == "") {
                $("#Main_TxtInsumo").addClass("valid");
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
                       "v_motivo": "INGRESO DE INSUMO",
                       "v_remito": $("#Main_TxtRemitoLt").val(),
                       "v_origen": $("#Main_TxtOrigenLt").val(),
                       "v_proveedor": '',
                       "v_comentario": '',
                       "v_tipo_ingreso": "LOTE",
                       "v_lote": $("#Main_TxtCodLt").val(),
                       "v_vto": $("#Main_TxtFechaCobro").val(),
                       "v_lab": $("#cmbLab").val(),
                       "v_desclab": $("#cmbLab option:selected").text(),
                       "v_descArt": $("#Main_TxtInsumo").val()
                   });
                    $.ajax({
                        type: "POST",
                        url: "IngresosFarmacia.aspx/WmAddLote",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {

                           // actualizarStk($("#Main_TxtNombreSk").val());
                            llenarGrilla(result);

                          
                        },
                        
                        error: errores
                    });

                   
                    $("#Main_TxtCodLt").val('0');
                    $("#Main_TxtFechaCobro").val('');
                    $("#Main_TxtCantLt").val('0');
                    $("#Main_TxtProvLt").val('');
                    $("#Main_TxtProvIdLt").val('0');
                    $("#Main_TxtInsumo").val('');
                    $('#cmbLab').val('1').trigger('change');
                } catch (e) {
                    alert(e.message);
                }
            }
        }

        function llenarGrilla(result) {
            if (result.d != null) {
                var Pacientes = result.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

                $("#ResultadoLt").show();
                $("#ResultadoLt").empty();
                Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th> <th>Insumo</th>  <th>LOTE</th> <th>FECHA VTO</th>  <th>CANT</th>  <th>LABORATORIO</th></tr></thead><tbody  style='text-align: center;'>";
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

                    Tabla_Datos = Tabla_Datos + "<tr   ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvLotDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.desc_Art + "</td><td>" + pacientes.Cod_Lot + "</td><td  style='" + color + "'>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td><td>" + pacientes.desc_Lab + "</td></tr>";

                });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoLt").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

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
                    url: "IngresosFarmacia.aspx/gvLab_del",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {

                        llenarGrilla(result);
                    },
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }


        function ListarLab() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "IngresosFarmacia.aspx/WsListarLab",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                    
                        var Especialidad = Resultado.d;

                        $('#cmbLab').empty();

                        $.each(Especialidad, function (index, especialidades) {

                            $('#cmbLab').append(
                            $('<option></option>').val(especialidades.valor).html(especialidades.descripcion)
                          );
                        });
                    
                        $('#cmbLab').val('1').trigger('change');

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
              "v_tipo": '89',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Deposito.aspx/WsListarFarmacia",
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
 
            $('#cmbDepLt').empty();
           
            $.each(Especialidad, function (index, especialidades) {
               
                $('#cmbDepLt').append(
                $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
              );
            });


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
                url: "ArticuloFarmacia.aspx/WsListarDep_IdArt",
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


        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

        function VerInsumo() {

            $("#ModalInsumo").modal();
        }
        $('#Main_TxtInsumo').prop('disabled', true);


        $(function () {
            ListarDeposito();
            ListarLab();
            $(".cmbBuscar").select2();
        });

        $(".campoFecha").mask("99/99/9999");

        
           $(this).everyTime(15000, function () {

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

                
                  if (!result.d) {
                      
                   window.location.href = "../../Login_hosp.aspx";
                  }
              }

    </script>


         <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
