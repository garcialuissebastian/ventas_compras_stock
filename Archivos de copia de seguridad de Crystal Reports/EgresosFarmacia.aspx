<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="EgresosFarmacia.aspx.cs" Inherits="HardSoft.App.Kardex.EgresosFarmacia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

    <style>
        tr:hover td {
    background: #abccd2;
}
    </style>     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
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
    

    
    <a href="/Scripts/web/VisorPdf.aspx" class="html5lightbox" id="Visor"  data-width="960" data-height="750"> </a>


    
         
    
    <script src="/Scripts/html5lightbox/html5lightbox.js"></script>
         <script>

             jQuery(".html5lightbox").html5lightbox(); 

        </script>
 


       <div class=" container"  style="margin-top: 36px;">
         
            <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
           Egreso       </li>
                                </ol>
        </nav>




<div class="row">


      <div class="">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
             
        
        <div class="alert alert-negro"  >
      Stock Lote - Egreso de Articulos  
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       
       <div class="col-xs-12">
        <div class="form-horizontal">
      
        
               <div class="form-group">

                   
            <label for="TxtNombre" class="control-label col-xs-1">Origen: </label>
       
           <div class="col-xs-3">

<select id="cmbDepLt" class="form-control"></select>
      
         </div>
     


         <label for="TxtNombreSk" class="control-label col-xs-1">Motivo:   </label>
         <div class="col-xs-3">
             <div style="display:none">
  <asp:TextBox ID="TxtCodSisLt" runat="server" class="form-control"  ></asp:TextBox>
                  <asp:Button ID="BtnRp" runat="server" Text="Button" OnClick="BtnRp_Click" />
      </div>


             <select id="ddlListadoMotivo" name="ddlListadoMotivo" class="form-control  text-uppercase">
                 <option value="9">Asignación de insumos</option>
      <option value="2">Devolución por no uso</option>
<option value="3">Devolución por vencimiento</option>
                 <option value="5">Pedidos</option>
<option value="4">Otros</option>

                   </select>
         </div>
                 

            <label for="TxtNombre" class="control-label col-xs-1">Destino: </label>
         <div class="col-xs-3">

<select id="cmbDepLtdes" class="form-control cmbBuscar">
          <option value="-1" >[Seleccione]</option>
</select>
      
         </div>
               
     </div>
      
   <div class="form-group">

                <label for="TxtNombreSk" class="control-label col-xs-2">Remito </label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtRemitoLt" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
         <label for="TxtNombreSk" class="control-label col-xs-1">Comentario </label>
         <div class="col-xs-7">

 <asp:TextBox ID="TxtOrigenLt" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>
           
     </div>
  
               <div class="form-group hidden" id="Estados">

                <label for="TxtNombreSk" class="control-label col-xs-2">Estados </label>
         <div class="col-xs-2">

  <select id="ddlListadoEstados"  class="form-control  text-uppercase  ">
                 <option value="FINALIZADO">Finalizado</option>
      <option value="PARCIALMENTE FINALIZADO">Parcialmente Finaliado</option> 
                   </select>
      
         </div>


                      <div class="col-xs-8">   </div>
         </div>
            
            <hr />

          <div  id="tituloPedido" class="alert alert-danger"  onclick="PopVer_kx_pedidos()" style="cursor:pointer;display:none"> CLICK EN LA LUPA PARA VER LOS ARTICULOS PEDIDOS.</div>    
            
         <div class="form-group"> 
                       <label for="TxtNombre" class="control-label col-xs-2" >Insumo</label>
         <div class="col-xs-5">
      <asp:TextBox ID="TxtInsumo" runat="server" class="form-control"  onkeypress="return acceptNum(event)" TextMode="MultiLine" Height="100"></asp:TextBox>
      <div style="display:none">
          
      </div>
         </div>
                <div class="col-xs-1" style="text-align:left">
              <a class="tooltips tooltipsArt" style="cursor: pointer;" onclick="VerInsumo()" id="bsq"> 
        
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
    runat="server"   Width="16px" Height="16px"   Enabled="false"/>
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup2" runat="server" TargetControlID="TxtFechaCobro"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div> 


</div>  
               </div>    
         </div>

     

               <label for="TxtCantLtu" class="control-label col-xs-1" >Cantidad</label>
         <div class="col-xs-1" >
  <asp:TextBox ID="TxtCantLt" runat="server" class="form-control"  placeholder="0" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" 
 onblur="onBlur(this)"></asp:TextBox>
      
         </div>
            <div class="col-xs-1  "       style="margin-top:8px"  >
    <div id="saldo"  style="color:red;font-weight:700; " class="label"></div> 
                
                  <div    style="color:red;font-weight:700; " class="label">Disponible</div>
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

          <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
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



     <%--   modal pedidos--%>  


  <div class='modal fade' id='Modalkx_pedidos' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-lg'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 

   <button type='button' class='close' data-dismiss='modal'>&times;</button>

 </div> 

 <div class='modal-body'> 

 <div   style='margin-top:0px;text-transform:uppercase' > 


 <div class='MarcoMio' id='TituloPopp' style='margin-bottom: 5px;'> </div>  

 
 <div class='row'  style='margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>  

      
              <div id='ResultadoLtp' style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color: floralwhite;">
    <%--  <img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px; display:none' id="wait" />--%>
</div>
     </div> 


      <div class='MarcoMio'   style='margin-bottom: 5px;margin-top: 10px;'> Stock Disponible</div>  

 
 <div class='row'  style='margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>  

      
              <div id='ResultadoLtstk' style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color: floralwhite;">
    <%--  <img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px; display:none' id="wait" />--%>
</div>
     </div> 

 </div>  

        </div> 

  </div>   
      </div>  
 </div>  


    <script>

        function PopVer_kx_pedidos() {

            $("#ResultadoLtp").empty();
              $("#ResultadoLtstk").empty();
            
            $("#saldo").text("0");
                var ids = getUrlParameter('Nro');
              Buscar_kx_pedidosDet(ids);
   
    $("#TituloPopp").text('Articulos Pedidos ');
    $("#Modalkx_pedidos").modal();
    
        }


               function Buscar_kx_pedidosDet(ids) {
try {   
     
    var json = JSON.stringify
   ({
        'v_ids':  ids

   });
$.ajax({
    type: 'POST',
    url: 'verPedidosFarmacia.aspx/WsListar_kx_pedidosDet',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: llenarGrillaPedidos,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }
           var table = document.getElementById("ResultadoLtg");
            function llenarGrillaPedidos(result) {
            if (result.d != null) {
                var Pacientes = result.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

              
                $("#ResultadoLtp").show();
                $("#ResultadoLtp").empty();
                Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr>   <th>Cod_Ms </th> <th>Insumo</th>    <th>CANT</th>  </tr></thead><tbody  style='text-align: center;'>";
                $.each(Pacientes, function (index, pacientes)  {

                  

                    Tabla_Datos = Tabla_Datos + "<tr id='" + pacientes.Id_Art + "' style='cursor:pointer' onclick='BuscarParaPedidos(" + pacientes.Id_Art + "," + pacientes.Cant + ")'> <td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.desc_Art + "</td><td>" + pacientes.Cant + "</td></tr>";
                     
                });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoLtp").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);



                    table = document.getElementById("ResultadoLtg");

                    
                    if (table != null) {
                        for (var i = 1; i < table.rows.length; i++) {

                           
                             //   console.log( $(table.rows[i]).find('td:eq(6)').text());
                            $("#" + $(table.rows[i]).find('td:eq(6)').text()).hide();
                        }
                    }
            }


        }


        function AddGuardarJs() {

            try {

                
                  $("#cmbDepLtdes").removeClass("valid");
         
                if ($("#cmbDepLtdes").val()== -1) {
                    alert("Seleccione un Destino.");
                    $("#cmbDepLtdes").addClass("valid");
                    return;
                }
                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();

                
                if (getUrlParameter('TipoOp') == "pedido") { // egreso por pedidos

                      var json = JSON.stringify
                  ({
                      "v_motivo": $("#ddlListadoMotivo option:selected").text(),
                      "v_dep_origen": $("#cmbDepLt").val(),
                      "v_dep_destino": $("#cmbDepLtdes").val(),
                       "v_remito": $("#Main_TxtRemitoLt").val(),
                              "v_comentario": $("#Main_TxtOrigenLt").val(),
                              "v_pedido": getUrlParameter('Nro'),
                               "v_estado":  $("#ddlListadoEstados").val()
                              
                  });
                $.ajax({
                    type: "POST",
                    url: "EgresosFarmacia.aspx/WmAddGuardarPedido",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (result) {
                        $("#Main_TxtOrigenLt").val('');
                      //  window.location.href = "EgresosFarmacia.aspx";
                        $("#Main_BtnRp").click();   
                    }),
                    error: errores
                    });


                } else{  // egreso normal
                var json = JSON.stringify
                  ({
                      "v_motivo": $("#ddlListadoMotivo option:selected").text(),
                      "v_dep_origen": $("#cmbDepLt").val(),
                      "v_dep_destino": $("#cmbDepLtdes").val(),
                       "v_remito": $("#Main_TxtRemitoLt").val(),
                        "v_comentario": $("#Main_TxtOrigenLt").val()
                  });
                $.ajax({
                    type: "POST",
                    url: "EgresosFarmacia.aspx/WmAddGuardar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (result) {
                           $("#Main_TxtOrigenLt").val('');
                      //  window.location.href = "EgresosFarmacia.aspx";
                        $("#Main_BtnRp").click();   
                    }),
                    error: errores
                });
 }
            } catch (e) {
                alert(e.message);
            }


        }

           function BuscarParaPedidos(ids,cantPedida) {

            try {
                 
                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": '1', // x id
                      "v_valor":ids,
                      "v_dep": $('#cmbDepLt').val()
                      
                  });
                $.ajax({
                    type: "POST",
                    url: "EgresosFarmacia.aspx/WsListarArticuloSkFarmacia",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                          var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#ResultadoLtstk").show();
            $("#ResultadoLtstk").empty();
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
                    Tabla_Datos = Tabla_Datos + "<tr    onclick='setInsumo(" + pacientes.Id_Art + ", \"" +  sin.replace(/\s/g,' ')+' - Cantidad Pedida :'+cantPedida + "\", \"" + pacientes.Cod_Lot + "\", \"" + pacientes.Fecha_vto + "\", \"" + pacientes.Id_Lab + "\"," + pacientes.Cant + ", " +cantPedida + " ) ' style='cursor:pointer;'>  <td style='text-align: justify;'>" + sin + "</td><td style='text-align: justify;'>" + pacientes.Cod_Lot + "</td><td style='" + color + "'>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td><td>" + pacientes.desc_Lab + "</td>   </tr>";
                }
                 });
            Tabla_Fin = "</tbody></table>";
            $("#ResultadoLtstk").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
      
            
            if (Pacientes.length < 1) {
                $("#ResultadoLtstk").html("   <div class='alert alert-danger'> No se encuentra stock para el insumo buscado.  </div> ");
                }

                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }


        function Buscar() {

            try {

                $("#saldo").text("0");
                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": $('#cmbTipoOp').val(),
                      "v_valor": $('#Main_TxtBuscarA').val(),
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

            $("#ResultadoB").show();
            $("#ResultadoB").empty();
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
                    Tabla_Datos = Tabla_Datos + "<tr    onclick='setInsumo(" + pacientes.Id_Art + ", \"" +  sin.replace(/\s/g,' ') + "\", \"" + pacientes.Cod_Lot + "\", \"" + pacientes.Fecha_vto + "\", \"" + pacientes.Id_Lab + "\"," + pacientes.Cant + ",0) ' style='cursor:pointer;'>  <td style='text-align: justify;'>" + sin + "</td><td style='text-align: justify;'>" + pacientes.Cod_Lot + "</td><td style='" + color + "'>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td><td>" + pacientes.desc_Lab + "</td>   </tr>";
                }

            });


            Tabla_Fin = "</tbody></table>";
            $("#ResultadoB").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();
            
            if (Pacientes.length < 1) {
                $("#ResultadoB").html("   <div class='alert alert-danger'> No se encuentra stock para el insumo buscado.  </div> ");
            }
            //   esValido2('ADM_KARDEX');


        }
        function setSelectByText(eID,text)
{ //Loop through sequentially//
  var ele=document.getElementById(eID);
  for(var ii=0; ii<ele.length; ii++)
    if(ele.options[ii].text==text) { //Found!
      ele.options[ii].selected=true;
      return true;
    }
  return false;
}

        function setInsumo(id, nom, lote, vto, lab, cant, pedida) {

            if (cant < 1) {
                alert("**** No se posee Stock del insumo seleccionado. ");
                return;
            }
            
           
            $("#saldo").text(cant);

            $("#Main_TxtInsumo").val(nom);
            $("#Main_TxtCodSisLt").val(id);
              $("#Main_TxtCantLt").val(pedida);
            
             $("#Main_TxtCodLt").val(lote);
             $("#Main_TxtFechaCobro").val(vto);
            $("#ModalInsumo").modal('hide');
             $("#Modalkx_pedidos").modal('hide');
            $("#ResultadoB").empty();
            $("#Main_TxtBuscarA").val('');
            
            
             $("#cmbLab").val(lab).trigger('change');
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



            if ( parseInt($("#Main_TxtCantLt").val()) > parseInt($("#saldo").text())  ) {
                alert("*** El saldo disponible es : " + $("#saldo").text());
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
                       "v_motivo": "EGRESO DE INSUMO "  ,
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
                        url: "EgresosFarmacia.aspx/WmAddLote",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {

                           // actualizarStk($("#Main_TxtNombreSk").val());
                            llenarGrilla(result);

                            $("#saldo").text("");
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
                Tabla_Titulo = "<table   id='ResultadoLtg'  class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th> <th>Insumo</th>  <th>LOTE</th> <th>FECHA VTO</th>  <th>CANT</th>  <th>LABORATORIO</th></tr></thead><tbody  style='text-align: center;'>";
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

                    Tabla_Datos = Tabla_Datos + "<tr   ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvLotDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td>   <td>" + pacientes.desc_Art + "</td><td>" + pacientes.Cod_Lot + "</td><td  style='" + color + "'>" + pacientes.Fecha_vto + "</td><td>" + pacientes.Cant + "</td> <td>" + pacientes.desc_Lab + "</td> <td style='display:none'>" + pacientes.Id_Art + "</td>     </tr>";

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


        function ListarDepositoDestino() {
            try {

                var json = JSON.stringify
        ({
             
        });

                $.ajax({
                    type: "POST",
                    url: "Deposito.aspx/ListarFarmaciaDestino",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: CargarDepDestino,
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }


        function CargarDepDestino(Resultado) {
          
            var Especialidad = Resultado.d;

          
            $.each(Especialidad, function (index, especialidades) {

                $('#cmbDepLtdes').append(
                $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
              );
            });


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

        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

        function VerInsumo() {

            $("#ModalInsumo").modal();
        }
        $('#Main_TxtInsumo').prop('disabled', true);
           $('#cmbLab').prop('disabled', true);
        $('#Main_TxtFechaCobro').prop('disabled', true);

             $('#Main_TxtCodLt').prop('disabled', true);
        $(function () {
            ListarDeposito(); // origen
            ListarDepositoDestino();
            ListarLab();
            $(".cmbBuscar").select2();


            // si viene de pedidos
              var TipoOp = getUrlParameter('TipoOp');
                if (TipoOp == "pedido") {
                    
                    $("#tituloPedido").show();
                    $('#bsq').attr("onclick","PopVer_kx_pedidos()");
                    $("#cmbDepLtdes").val(getUrlParameter('Des')).trigger('change');
                    $("#ddlListadoMotivo").val(getUrlParameter('Mot'));
                    $("#Estados").removeClass("hidden");
                    
                } 


        });

        $(".campoFecha").mask("99/99/9999");




         function mostrar() {
              $('#Visor').click();

          }



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

    </script>


         <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
