<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true"   enableEventValidation="false" CodeBehind="verPedidosFarmacia.aspx.cs" Inherits="HardSoft.App.Kardex.verPedidosFarmacia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
     
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
    
      <script type="text/javascript" src="/js/formError.js"></script>

    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    <script src="../../js/jquery.maskedinput.js"></script>
   
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
    

      <div class=" container"  style="margin-top: 16px;">
         
      
 <div class='row'>   


          <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
         Ver Pedidos       </li>
                                </ol>
        </nav>



      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
 <%--      <div style='color:white;text-align:right; padding-top: 5px;' class='col-xs-3'>   
    Buscar  
    </div> 
  
       <div class='col-xs-3' >  


           <asp:TextBox ID='TxtBuscar' runat='server'  class='form-control'></asp:TextBox>   
   </div>  
--%>


         <div class='col-xs-2' >  
                    <select id='cmbTipoOp' class='form-control'>   
                         <option value='1'>Fechas</option> 
                   <option value='0'>Usuario</option> 
                        
                       </select>      
   </div>

             <div class='col-xs-3 hidden' >  


           <asp:TextBox ID='TxtBuscar' runat='server'  class='form-control'></asp:TextBox>   
   </div>  

         <label for="TxtNunDoc" class=" col-xs-2"  style="color:white;text-align:right; padding-top: 5px;"   > Desde</label>
         <div class="col-xs-2"> 

     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
     
    </div> 

         <label for="TxtNunDoc" class=" col-xs-1"  style="color:white;text-align:right; padding-top: 5px;"   >Hasta</label>
         <div class="col-xs-2"> 

     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaHasta" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup" runat="server" TargetControlID="TxtFechaHasta"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
     
    </div>   
 
   <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_pedidos()'> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_pedidos' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillakx_pedidos'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_kx_pedidos()' >     
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
    <div style="display:none">  
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
 <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
    <asp:TextBox ID="TxtIds" runat="server"></asp:TextBox>
         <asp:TextBox ID="TxtIds2" runat="server"></asp:TextBox>
    </div>  
 <%--   modal--%>  


  <div class='modal fade' id='Modalkx_pedidos' role='dialog' style='display:none'  >  
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




              <div id='ResultadoLt' style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color: floralwhite;">
      <img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px; display:none' id="wait" />
</div>
     </div> 

 </div>  

        </div> 

  </div>   
      </div>  
 </div>  


    <script>

        function PopAlta_kx_pedidos() {
            window.location = 'PedidosFarmacia.aspx';
        }

         function Buscar_kx_pedidos() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        'v_tipo': $('#cmbTipoOp').val(),
            'v_valor': $('#Main_TxtBuscar').val(),
       'v_desde': $('#Main_TxtFechaDesde').val(),
       'v_hasta': $('#Main_TxtFechaHasta').val()
   });
$.ajax({
    type: 'POST',
    url: 'verPedidosFarmacia.aspx/WsListar_kx_pedidos',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_pedidos,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }

  function resultado_kx_pedidos(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_kx_pedidos').show();
   $('#Resultado_kx_pedidos').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_pedidos' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th><th></th> <th>ID</th><th>DEPOSITO_ORIGEN</th><th>DEPOSITO_DESTINO</th><th>COMENTARIO</th><th>USUARIO</th><th>FECHA</th> <th>ESTADO</th></tr></thead><tbody> "; 
   
      $.each(v_obj, function (index, obj) {   
             var resol = "";
      if (obj.MOTIVO == "ABIERTO") {
          resol = "<a class='tooltips' onclick='gvDel_resolver(" + obj.ID + "," + obj.REMITO + ");'> <img src='/images/factura-aprobada.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Resolver</span></a>";

          
          if (obj.OBS != "FARMACIA") { // SI NO ES FARMACIO QUIEN RESUELVE
   resol = "<a class='tooltips' onclick='gvDel_pedido(" + obj.ID + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a>";

          } 

      } else {

       resol = "<a class='tooltips' onclick='PopVer_kx_pdffinal(" + obj.ID + ", "+ obj.ORIGEN + " );'> <img src='/images/CHECK.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>PDF EGRESO</span></a>";
    
          }
         

          
   Tabla_Datos = Tabla_Datos + " <tr > <td style='width:30px'> <a class='tooltips' onclick='PopVer_kx_pdf("+ obj.ID + ");' > <img src='/images/pdf_icon.jpg' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>PDF Pedido</span></a></td>   <td style='width:30px'> <a class='tooltips' onclick='PopVer_kx_pedidos("+ obj.ID + ");' > <img src='/images/ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Articulos</span></a></td><td style='width:30px'> "+resol+" </td>   <td>" + obj.ID + " </td> <td>" + obj.DEPOSITO  + " </td> <td>" + obj.DEPOSITO_DESTINO + " </td> <td>" + obj.COMENTARIO + " </td> <td>" + obj.ID_USUARIO + " </td> <td>" + obj.AUD + " </td>  <td>" + obj.MOTIVO + " </td></tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_pedidos').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     fn_cantidad_kx_pedidos();
        }

        function gvDel_pedido(ids) {
            try {   
                 if (!confirm("Esta seguro que desea eliminar el pedido ?")) {

                     return;
                        }
     
    var json = JSON.stringify
   ({
        'v_id':  ids

   });
$.ajax({
    type: 'POST',
    url: 'verPedidosFarmacia.aspx/WsEliminarPedido',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: (function (resultado) {
        Buscar_kx_pedidos();
    }
        ),
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
        }

    function fn_cantidad_kx_pedidos() {
     cantidad = $('#grillakx_pedidos tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
        };

        function gvDel_resolver(ids, Des) {
            window.location.href ='EgresosFarmacia.aspx?TipoOp=pedido&Nro='+ids+'&Des='+Des+'&Mot=5';
            };
        function PopVer_kx_pdf(ids) {
            $("#Main_TxtIds").val(ids);
            $("#Main_Button1").click();
        }

           function PopVer_kx_pdffinal(ids,CBTE) {
               $("#Main_TxtIds").val(ids);
                 $("#Main_TxtIds2").val( CBTE);
            $("#Main_Button2").click();
        }
          function PopVer_kx_pedidos(ids) {
              Buscar_kx_pedidosDet(ids);
    //LimpiarPop();
    //$("#btnModificar1b").hide();
    //$("#btnGuardar1b").show();
    $("#TituloPop").text('Articulos Pedidos');
    $("#Modalkx_pedidos").modal();
    //$("#Main_TxtId").val('0');
    //$("#Main_TxtId").prop('disabled', true);
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
    success: llenarGrilla,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
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
                Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr>   <th>Cod_Ms </th> <th>Insumo</th>    <th>CANT</th>  </tr></thead><tbody  style='text-align: center;'>";
                $.each(Pacientes, function (index, pacientes) {

                  

                    Tabla_Datos = Tabla_Datos + "<tr   > <td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.desc_Art + "</td><td>" + pacientes.Cant + "</td></tr>";



                });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoLt").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

            }


        }


          $(function () {
              $(".campoFecha").mask("99/99/9999");
              Buscar_kx_pedidos();
        });


            var date = new Date();
          var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
          var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);

          var dd = primerDia.getDate();
          var mm = primerDia.getMonth() + 1; //January is 0!

          var yyyy = primerDia.getFullYear();
          if (dd < 10) {
              dd = '0' + dd;
          }
          if (mm < 10) {
              mm = '0' + mm;
          }
          var today = dd + '/' + mm + '/' + yyyy;

          $('#Main_TxtFechaDesde').val(today);
           
          dd = ultimoDia.getDate();
          mm = ultimoDia.getMonth() + 1; //January is 0!

          yyyy = ultimoDia.getFullYear();
          if (dd < 10) {
              dd = '0' + dd;
          }
          if (mm < 10) {
              mm = '0' + mm;
          }
          today = dd + '/' + mm + '/' + yyyy;
          $('#Main_TxtFechaHasta').val(today);

    </script>

</asp:Content>
