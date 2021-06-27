<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master"  enableEventValidation="false" AutoEventWireup="true" CodeBehind="Ctacta_vtas.aspx.cs" Inherits="HardSoft.App.Kardex.Ctacta_vtas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
      
      <script type="text/javascript" src="/js/formError.js"></script>

    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    <script src="../../js/jquery.maskedinput.js"></script>
   
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
       <script language="JavaScript" type="text/javascript"></script>

 <script type="text/javascript" src="/Scripts/jquery.dataTables.min.js" ></script>
    <link href="../../css/jquery.dataTables.css" rel="stylesheet" />
           
  <script>
    
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

           Sys.UI.Point = function Sys$UI$Point(x, y) {

            x = Math.round(x);
            y = Math.round(y);

            var e = Function._validateParams(arguments, [
                { name: "x", type: Number, integer: true },
                { name: "y", type: Number, integer: true }
            ]);
            if (e) throw e;
            this.x = x;
            this.y = y;
        } 
        Sys.UI.Bounds = function Sys$UI$Bounds(x, y, width, height) {
            x = Math.round(x);
            y = Math.round(y);

            var e = Function._validateParams(arguments, [
                { name: "x", type: Number, integer: true },
                { name: "y", type: Number, integer: true },
                { name: "width", type: Number, integer: true },
                { name: "height", type: Number, integer: true }
            ]);
            if (e) throw e;
            this.x = x;
            this.y = y;
            this.height = height;
            this.width = width;
        }

         </script>


 
<%-- ---------------------------------------------------------css ----------------------- --%>

   <style> 
            tr:hover td{background:#c7c7c7; !important}
         .table-hover>tbody>tr.active:hover>td, .table-hover>tbody>tr.active:hover>th, .table-hover>tbody>tr:hover>.active, .table-hover>tbody>tr>td.active:hover, .table-hover>tbody>tr>th.active:hover {
    background-color: #fbced7  !important;
} 

       tr.group,
tr.group:hover {
       background-color: #1d9db6 !important;
   
    font-weight: 700;
}
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
     .dt-buttons{
         float:left
     }
 </style> 




<%-- ---------------------------------------------------------pop modal ----------------------- --%>


 <%--   modal--%>  


  <div class='modal fade' id='Modalkx_asiento_diario' role='dialog' style='display:none'  >  
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
    <label for='inputName' class='control-label col-xs-4'> Nro</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtNro' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Fecha</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtFecha' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Codigo</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtCodigo' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Id_cta</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtId_cta' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Anio</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtAnio' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> mes</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='Txtmes' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Documento_concepto</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtDocumento_concepto' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Debe</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtDebe' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Haber</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtHaber' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-4'> Config</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtConfig' runat='server' CssClass='form-control'></asp:TextBox> 
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

     <%-- -------------------------------------------- formulario principal ----------------------------------- --%>
   <div class=" container" style="margin-top: 36px; min-height:600px"> 
      
       
        
        <div class="alert alert-cab"  >
       <strong>   CUENTA CORRIENTE DE CLIENTES </strong> 
            </div>


 <div >   
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 

       <div class="form-group" >
    
     
  <div class="col-xs-2" >
    
       
       
      </div>



    

       
  <div class="col-xs-2" >
    
      
      <select id="cmbTipoOp" class="form-control">
     <%--  <option value="1">N°Comprobante</option> --%>
     <option value="2"  >Fechas</option>       
                <option value="3">CUIT</option>   
           <option value="4">Razon Social</option>   
              
      </select>
      
       
      </div>
    




    <div class="col-xs-6" >

        <div id="B_Buscar" >
<asp:TextBox ID="TxtBuscar" runat="server"  class="form-control"></asp:TextBox>
       </div>
       
        
   <div id="B_Fechas" style="display:none"> 
         <label for="TxtNunDoc" class=" col-xs-2"  style="color:white;text-align:right; padding-top: 5px;"   > Desde</label>
         <div class="col-xs-4"> 

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

         <label for="TxtNunDoc" class=" col-xs-2"  style="color:white;text-align:right; padding-top: 5px;"   >Hasta</label>
         <div class="col-xs-4"> 

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


</div>

        <script>
            $("#cmbTipoOp").change(function () {
                if ($("#cmbTipoOp").val()=='1') {
                    $("#B_Buscar").show();
                    $("#B_Fechas").hide();
                }
                if ($("#cmbTipoOp").val() == '3') {
                    $("#B_Buscar").show();
                    $("#B_Fechas").hide();
                }

                  if ($("#cmbTipoOp").val() == '4') {
                    $("#B_Buscar").show();
                    $("#B_Fechas").hide();
                }
                  if ($("#cmbTipoOp").val() == '5') {
                    $("#B_Buscar").show();
                    $("#B_Fechas").hide();
                }

                if ($("#cmbTipoOp").val() == '2') {
                    $("#B_Buscar").hide();
                    $("#B_Fechas").show();
                }

            })
        </script>


         </div>
     <div class="col-xs-2"  style="text-align:left">
       
      
         <button id="btnElimina1" type="button" class="btn2  btn-default "  onclick="Buscar_kx_asiento_diario()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>

         </div>
       </div> 


      
 </div>  
 </div> 
     
     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_asiento_diario'  >    
      <div >    
     </div>   
     <table   id='grillakx_asiento_diario'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; padding-bottom: 15px; ' class='MarcoMio' >  
        <%--      <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_kx_asiento_diario()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
  </button>  --%>
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right; display:none'>Registros:    
      <span id='span_cantidad'>0</span></div> 
             
               
               <div  style='color:white;text-align:right;width:100px;float:right'>Haber:    
      <span id='span_haber'>0</span></div> 
              <div  style='color:white;text-align:right;width:100px;float:right'>Debe:    
      <span id='span_debe'>0</span></div> 
              

   </div>   
     
      



 </div>  
   </div>


        <div style="display:none">
        <asp:TextBox ID="TxtRpid" runat="server"></asp:TextBox>
         <asp:TextBox ID="TxtTipoRep" runat="server"></asp:TextBox>
                <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
    </div>

 
<script src="/Scripts/dataTables.buttons.min.js"></script>
<script src="/Scripts/buttons.colVis.min.js"></script>
<script src="/Scripts/buttons.print.min.js"></script>
<script src="/Scripts/dataTables.select.min.js"></script>
<script src='/Scripts/buttons.html5.min.js'></script>
 
<script src='/Scripts/buttons.bootstrap.min.js'></script>
<script src='/Scripts/jszip.min.js'></script>
<script src='/Scripts/pdfmake.min.js'></script>
<script src='/Scripts/vfs_fonts.js'></script>
<script src='/Scripts/dataTables.responsive.min.js'></script> 
    <script src="/Scripts/responsive.bootstrap.min.js"></script>
    <script>

        $(document).ready(function () {
             $('#cmbTipoOp').val(2).change();
            Buscar_kx_asiento_diario();
} );



  function Buscar_kx_asiento_diario() {
      try {    


             var val1 = '';
                      var val2 = '';
                      if ($('#cmbTipoOp').val() == '1') {
                          val1 = $('#Main_TxtBuscar').val();
                          val2 = '';
                      }
                      if ($('#cmbTipoOp').val() == '3') {
                          val1 = $('#Main_TxtBuscar').val();
                          val2 = '';
                      }
                      if ($('#cmbTipoOp').val() == '2') {
                          val1 = $('#Main_TxtFechaDesde').val();
                          val2 = $('#Main_TxtFechaHasta').val();
                      }

                        if ($('#cmbTipoOp').val() == '4') {
                          val1 = $('#Main_TxtBuscar').val();
                          val2 = '';
                      }
                        if ($('#cmbTipoOp').val() == '5') {
                          val1 = $('#Main_TxtBuscar').val();
                          val2 = '';
          }

          if (val1 == '') {
              return;
          }
    var json = JSON.stringify
   ({
        'v_tipo':   $('#cmbTipoOp').val() ,
        "v_valor": val1,
                                "v_valor1": val2

        }); 

$.ajax({
    type: 'POST',
    url: 'Ctacta_vtas.aspx/WsListar_kx_ctacte',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_asiento_diario,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
        }


      Number.prototype.format = function(n, x, s, c) {
          var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
              num = this.toFixed(Math.max(0, ~~n));

          return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
      };

  function resultado_kx_asiento_diario(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
      var Tabla_Fin = '';

      var pHaber = 0;
      var pDebe = 0;
       var pSaldo = 0;

   $('#Resultado_kx_asiento_diario').show();
   $('#Resultado_kx_asiento_diario').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_asiento_diario' class='display  ' style='width: 100%;text-align: left'><thead><tr> <th></th> <th></th> <th>Fecha</th><th>Cliente</th><th>Documento</th><th>Debe</th><th>Haber</th><th>Saldo</th>   </tr></thead><tbody> "; 


      $.each(v_obj, function (index, obj) {
          var ver1 = "display:block";
          if (obj.Documento=='Saldo Inicial') {
               ver1 = "display:none";
          }

           var ver2 = "display:block";
          if (obj.Tipo!='VENTAS') {
               ver2 = "display:none";
          }
 
                  
          Tabla_Datos = Tabla_Datos + " <tr     >   <td  style='width:30px'> <a class='tooltips'   onclick='Vercbte( " + obj.id_cbte + ",\"" + obj.Tipo + "\" );'  style='" + ver1 + "'> <img src='/images/Ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Cbte</span></a></td> <td> <a   style='" + ver2 + "' class='tooltips' onclick='gvDel3(" + obj.id_cbte + " );' > <img src='/images/divisa.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /><span>Cobrar</span>  </a></td>   <td>" + obj.Fecha + " </td> <td>    " + obj.Persona + " </td> <td  style='color: blue;cursor:pointer;    font-weight: 500;'> " + obj.Documento + " </td>  <td>" + obj.Debe.replace(',', '.') + " </td> <td>" +   obj.Haber.replace(',', '.') + " </td> <td>" + obj.Saldo.replace(',', '.') + " </td>   </tr>";
          pHaber = pHaber + parseFloat(obj.Haber.replace(',', '.'));
       
          // (parseFloat(parseFloat(pacientes.PrecioSelect.replace(',', '.')).toFixed(2) 
          pDebe = pDebe + parseFloat(obj.Debe.replace(',', '.'));
          pSaldo = pSaldo + parseFloat(obj.Saldo.replace(',', '.'));

          $('#span_debe').html(parseFloat(parseFloat(pDebe).toFixed(2)));
          $('#span_haber').html(parseFloat(parseFloat(pHaber).toFixed(2)));
         

      });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_asiento_diario').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
      fn_cantidad_kx_asiento_diario();

    var groupColumn = 3;
    var table = $('#grillakx_asiento_diario').DataTable({
        "columnDefs": [
            { "visible": false, "targets": groupColumn }
        ],
        "order": [[ groupColumn, 'asc' ]],
        "displayLength": 20 ,
            "language": {
                "search": "Buscar:",
                "zeroRecords": "No se encontró ningun padecimiento",
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior",
                    "print": "Imprimir"
                },
                  "select": {
                    "rows": " %d filas seleccionadas"
                },
                "loadingRecords": "Un momento, cargando...",
                "processing": "Procesando  ...",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "lengthMenu": "Mostrando _MENU_ registros",
            },
       dom: 'fBrtip',
           

           buttons: [
                 {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [ 2,3, 4, 5,6,7 ]
                    } 
            },
                 {
                    extend: 'excel',
                    exportOptions: {
                        columns: [2,3, 4, 5,6,7]
                    } 
            },

                   {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 2,3, 4, 5,6,7]
                    } 
            },
    ],


        "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="8">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        }
    });

        

    // Order by the grouping
    $('#Resultado_kx_asiento_diario tbody').on( 'click', 'tr.group', function () {
       
    } );



     }

        
         $(document).ready(function() {
        document.title = 'CUENTA CORRIENTE DE CLIENTES'; // para cuando imprimo salga con el nombre  q quiero
         });


        
      function  RowArt2(obj, ids) {
         
                    if ($(obj).hasClass('active')) {
                        $(obj).removeClass('active');
                    } else {
                        $(obj).addClass('active').siblings().removeClass('active');
                    }
      }

    function fn_cantidad_kx_asiento_diario() {
     cantidad = $('#grillakx_asiento_diario tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
     };

        function Vercbte(ids,tipo) {
            try {
                if (ids=='') {
                    return;
                }
                 if (tipo=='') {
                    return;
                }
                if (ids==null) {
                    return;
                }

                $("#Main_TxtRpid").val(ids);
                 $("#Main_TxtTipoRep").val(tipo);
                
              $("#Main_BtnImp").click();

          } catch (e) {
              alert(e);
          }
        }


          function gvDel3(ids) {

                window.location.href = 'CbtesCobro.aspx?CbteAnular=' + ids;
                
 

            }
    function gvDel_kx_asiento_diario(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_Id': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'Asiento_diario.aspx/WmGvDel_kx_asiento_diario',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: (function (Result) {
    Buscar_kx_asiento_diario() ;
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

    function PopMod_kx_asiento_diario(id) {
      try {
    $("#btnModificar1b").show();
    $("#btnGuardar1b").hide();
    $("#TituloPop").text('Modificar');
    $('#Modalkx_asiento_diario').modal();
    $('#Main_TxtId').val(id);
   

    var json = JSON.stringify
        ({
          'v_tipo':'99',
          'v_valor': id
        });
      $.ajax({
      type: 'POST',
      url: 'Asiento_diario.aspx/WsListar_kx_asiento_diario',
      data: json,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (Resultado) {
          var v_obj = Resultado.d;
          $.each(v_obj, function (index, obj) {          
          $('#Main_TxtId').val(obj.Id);
          $('#Main_TxtNro').val(obj.Nro);
          $('#Main_TxtFecha').val(obj.Fecha);
          $('#Main_TxtCodigo').val(obj.Codigo);
          $('#Main_TxtId_cta').val(obj.Id_cta);
          $('#Main_TxtAnio').val(obj.Anio);
          $('#Main_Txtmes').val(obj.mes);
          $('#Main_TxtDocumento_concepto').val(obj.Documento_concepto);
          $('#Main_TxtDebe').val(obj.Debe);
          $('#Main_TxtHaber').val(obj.Haber);
          $('#Main_TxtConfig').val(obj.Config);
         
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
          'Nro': $('#Main_TxtNro').val(),
          'Fecha': $('#Main_TxtFecha').val(),
          'Codigo': $('#Main_TxtCodigo').val(),
          'Id_cta': $('#Main_TxtId_cta').val(),
          'Anio': $('#Main_TxtAnio').val(),
          'mes': $('#Main_Txtmes').val(),
          'Documento_concepto': $('#Main_TxtDocumento_concepto').val(),
          'Debe': $('#Main_TxtDebe').val(),
          'Haber': $('#Main_TxtHaber').val(),
          'Config': $('#Main_TxtConfig').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'Asiento_diario.aspx/WmGvMod_kx_asiento_diario',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_asiento_diario').modal('hide');
        Buscar_kx_asiento_diario();
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
          $('#Main_TxtNro').val('');
          $('#Main_TxtFecha').val('');
          $('#Main_TxtCodigo').val('');
          $('#Main_TxtId_cta').val('');
          $('#Main_TxtAnio').val('');
          $('#Main_Txtmes').val('');
          $('#Main_TxtDocumento_concepto').val('');
          $('#Main_TxtDebe').val('');
          $('#Main_TxtHaber').val('');
          $('#Main_TxtConfig').val('');
      }



    function PopAlta_kx_asiento_diario() {
     
    LimpiarPop();
    $("#btnModificar1b").hide();
    $("#btnGuardar1b").show();
    $("#TituloPop").text('Alta');
    $("#Modalkx_asiento_diario").modal();
    $("#Main_TxtId").val('0');
    $("#Main_TxtId").prop('disabled', true);
      }



    function AltaPopJs() {
      try {
          var json = JSON.stringify
          ({
            'v_obj': {
          'Id': $('#Main_TxtId').val(),
          'Nro': $('#Main_TxtNro').val(),
          'Fecha': $('#Main_TxtFecha').val(),
          'Codigo': $('#Main_TxtCodigo').val(),
          'Id_cta': $('#Main_TxtId_cta').val(),
          'Anio': $('#Main_TxtAnio').val(),
          'mes': $('#Main_Txtmes').val(),
          'Documento_concepto': $('#Main_TxtDocumento_concepto').val(),
          'Debe': $('#Main_TxtDebe').val(),
          'Haber': $('#Main_TxtHaber').val(),
          'Config': $('#Main_TxtConfig').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'Asiento_diario.aspx/WmGvAlta_kx_asiento_diario',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_asiento_diario').modal('hide');
        Buscar_kx_asiento_diario();
        LimpiarPop();
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
    }

              $(function () {
              $(".campoFecha").mask("99/99/9999");
             
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

    
 
        $(this).everyTime(10000, function () {
           
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
                    window.location.href = "/Login_oaa.aspx";

                }
            });

        }); 

        function VerifySessionState(result) {
            $("#miLoader").show();
            if (!result.d) {

                window.location.href = "/Login_oaa.aspx";
            }
        }
     
    </script>
       
</asp:Content>
