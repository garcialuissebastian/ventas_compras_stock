<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master"  enableEventValidation="false" AutoEventWireup="true" CodeBehind="Asiento_diario.aspx.cs" Inherits="HardSoft.App.OAA.Asiento_diario" %>

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
       .doc{
           color: blue;cursor:pointer;    font-weight: 500;
       }
       tr.group,
tr.group:hover {
       background-color: #f9dede !important;
   
    font-weight: 700;
}
       .IdVer {
           display:none ;
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


 <div class='MarcoMio ' id='TituloPop' style='margin-bottom: 5px;'> </div>  

 
 <div class='row'  style='margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>  

   <div class='col-xs-12'> 

  <div class='form-horizontal'>   
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Id</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtId_Cbte' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Nro</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtNro' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
 
      
      <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-3'> Fecha</label>  
     <div class="col-xs-3"> 
          <input type="date" id="TxtFecha" date-format="DD/MM/YYYY"  class="form-control" style=" width: 150px;   height: 30px;    margin-top: 7px; "
                                            >
     
    </div> 
<div class='col-xs-6'>
</div> 
</div> 
  
      
      <div class='form-group' >  
    <label for='inputName' class='control-label col-xs-3'> Documento / Concepto</label>  
   <div class='col-xs-8'>  
    <asp:TextBox ID='TxtDocumento_concepto' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 

          <div class='col-xs-1'>
</div> 
</div> 
 
      
 </div>  

 </div>   

  </div> 

      <div class=" col-xs-12 IdVer MarcoMio"  style='margin-bottom: 5px;'> 
           <div class="form-group">   
       <div style="color:white;text-align: center; " class="col-xs-4">   
         CUENTA
             
    </div> 
  <div class="col-xs-2" style="color:white;text-align: center; ">  
                 DEBE
   </div> 
          <div class="col-xs-2" style="color:white;text-align: center; ">  
                HABER
   </div> 
       <div class="col-xs-4" style="color:white;text-align: center; ">  
            ORGANIZACIÓN
       
   </div>  
           
               </div>  

     <div class="form-group">   
       <div style="color:white;text-align:center; " class="col-xs-4">   
         <select id="Main_CmbDebe" class="cmbBuscar form-control"  style="width: 100%">  </select> 
             
    </div> 
  <div class="col-xs-2" style="text-align:center; ">  
                  <input   type="text" id="Main_Txtdebe" class="form-control" onfocus="onFocus(this)" 
 onblur="onBlur(this)"  value="0.00" placeholder="Debe" style="text-align:center" onkeypress="return acceptNum2(event, this.value)">    
   </div> 
          <div class="col-xs-2"  style="text-align:center; ">  
                  <input   type="text" id="Main_Txthaber" class="form-control" onfocus="onFocus(this)" 
 onblur="onBlur(this)"  value="0.00" placeholder="Haber" style="text-align:center" onkeypress="return acceptNum2(event, this.value)">    
   </div> 
       <div class="col-xs-4">  
            <select id="Main_org" class="cmbBuscar form-control"  style="width: 100%">  </select> 
       
   </div>  
   <div class="col-xs-12" style="text-align:center; margin-top:5px">   
  <button id="btnBuscarFrm1" type="button" class=" btn2  btn-info   " onclick="AgregarAsiento() "> 
          + Agregar   
   </button>   
     </div>  
            </div>    
 </div>
     <hr />
     <div id="Resultado_kx_asiento_det" style="overflow: auto; min-height: 220px; width: 100%;  ">
         </div>





  <div   style='margin-top: 5px; text-align: center; height: 47px;' class='MarcoMio' >  

      <button id="btnModificar24" type="button" class="btn2 btn-info   pull-left" onclick="habPop()">
    <span class="  glyphicon  glyphicon-pencil"></span>  
  </button>

  <button id='btnModificar1b' type='button' class='btn2 btn-default ' onclick='ModPopJs()'  >  

 <span class=' glyphicon glyphicon-save'></span> 
Modificar
 </button>  

  <button id='btnGuardar1b' type='button' class='btn2 btn-default ' onclick='AltaPopJs()'  >  

 <span class=' glyphicon glyphicon-save'></span> 
Guardar
 </button>  

 
         <label for="TxtHaber1" class="control-label   pull-right" style=" color:white; padding: 10px;     font-size: 16px;" >
             <strong> HABER :  <span id="TxtHaber1" >0.00</span> </strong></label>

  <label for="TxtDebe1" class="control-label   pull-right" style="  padding: 10px;  color:white;   font-size: 16px;" >
             <strong>  DEBE :  <span id="TxtDebe1"   >0.00</span> </strong></label> 
 </div> 

   
 </div>  

       <div class="row" style="text-align:center; margin-top:10px">
         <button type='button' class='btn2 btn-danger' data-dismiss='modal' >  

 <span class=' glyphicon glyphicon-floppy-remove'></span> 
Cerrar
 </button> 
     </div>
        </div> 

  </div>   
      </div>  
 </div>  


     <%-- -------------------------------------------- formulario principal ----------------------------------- --%>
   <div class=" container" style="margin-top: 36px; min-height:600px"> 
          <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Ver Asientos       </li>
                                </ol>
        </nav>
           
       
        
        <div class="alert alert-cab"  >
       <strong>   Libro Diario </strong> 
            </div>


 <div >   
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 

        <div  class="form-group" > 
             <div class='col-xs-1' ></div>
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
            
              <div class='col-xs-2'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_asiento_diario() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  


</div>

     <%--  <select id='cmbTipoOp' class='form-control'>       
                   <option value='0'>Nombre</option>      
                       </select>      --%>

      
 </div>  
 </div> 
     
     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_asiento_diario' style="overflow : auto;   height: 410px; width: 100%; " >    
      <div >    
     </div>   
     <table   id='grillakx_asiento_diario'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
            
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
     
      



 </div>  
   </div>


        <div style="display:none">
        <asp:TextBox ID="TxtRpid" runat="server"></asp:TextBox>
         <asp:TextBox ID="TxtTipoRep" runat="server"></asp:TextBox>
                  <asp:TextBox ID="TxtTipo" runat="server"></asp:TextBox>
                <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
    </div>

 
<script src="https://cdn.datatables.net/buttons/1.6.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.colVis.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js'></script>
 
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.18/pdfmake.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.18/vfs_fonts.js'></script>
<script src='https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js'></script>
<script src='https://cdn.datatables.net/responsive/2.2.6/js/responsive.bootstrap.min.js'></script>
 
    <script>

        $(document).ready(function() {
            Buscar_kx_asiento_diario();
} );



  function Buscar_kx_asiento_diario() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        'v_tipo': '0',
            'v_valor': $('#Main_TxtFechaDesde').val(),
        'v_valor1': $('#Main_TxtFechaHasta').val()

        }); 

$.ajax({
    type: 'POST',
    url: 'Asiento_diario.aspx/WsListar_kx_asiento_diario',
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

  function resultado_kx_asiento_diario(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
      $('#Resultado_kx_asiento_diario').show();
      var Nroold = '';
       var FechaOld ;
      var doc = '';
      var cant = 0;
      var v_debe1 = 0;
      var v_haber1 = 0;
   $('#Resultado_kx_asiento_diario').empty();   
   Tabla_Titulo =  "  <table    id='grillakx_asiento_diario' class='display  ' style='width: 100%;text-align: left'><thead><tr >  <th>Nro</th><th>Fecha</th><th>Documento/Concepto</th><th>Codigo</th><th>Cuenta</th><th>Anio</th><th>mes</th><th>Debe</th><th>Haber</th> <th></th> </tr></thead><tbody> "; 
      $.each(v_obj, function (index, obj) {  
          
          if (obj.Id_Cbte==null) {
              obj.Id_Cbte = 1;
          }
           if (obj.Id_Cbte=="") {
              obj.Id_Cbte = 1;
          }
          var v_debe = '';
          if (obj.Debe !='0,00') {
              v_debe = obj.Debe;
          }

          var v_Haber= '';
          if (obj.Haber != '0,00') {
              v_Haber= obj.Haber;
          }
          var borde = '';
          var edit = "<a   onclick='BuscarNro(" + obj.Nro + " );' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> </a>";
           

          if (cant == 0) {
                doc = obj.Documento_concepto;
              Nroold = obj.Nro;
              FechaOld = obj.Fecha;
                 cant = 1;
          }

        

         
          if (Nroold != obj.Nro) {
              doc = obj.Documento_concepto;
                    borde = 'border-top-color: #080808; border-top: 1px solid;'; 
         
              Tabla_Datos = Tabla_Datos + " <tr  style='    background-color: #ebf6fb;' >      <td > " + Nroold + " </td> <td>  &nbsp &nbsp  &nbsp &nbsp  &nbsp  &nbsp " + FechaOld + "   </td> <td  >   </td>  <td  > </td> <td   >  </td> <td   >  </td> <td  style='font-weight: 700;  text-align: center;'  >Total: </td> <td style='border-left: 1px solid #dddddd;  text-align: center;font-weight: 700; '> "+parseFloat( v_debe1).toFixed(2).replace('.', ',') +" </td>  <td style='border-right: 1px solid #dddddd; text-align: center;font-weight: 700; '>"+parseFloat(v_haber1).toFixed(2).replace('.', ',') +" </td> <td  > </td></tr>"; 

              v_debe1 = 0;
               v_haber1 = 0;
          } else {
                edit = "";
          }

              v_debe1 = parseFloat(parseFloat(obj.Debe.replace('.', '').replace(',', '.')  ) +  parseFloat( v_debe1 )   ).toFixed(2);
    

      v_haber1 = parseFloat(parseFloat(obj.Haber.replace('.', '').replace(',', '.')   ) +  parseFloat(v_haber1)   ).toFixed(2);

 


          Tabla_Datos = Tabla_Datos + " <tr style='" + borde + "' >      <td  style='" + borde + "'>" + obj.Nro + " </td> <td style='" + borde + "'>  &nbsp &nbsp  &nbsp &nbsp  &nbsp  &nbsp " + obj.Fecha + " </td> <td style='" + borde + "'  onclick='Vercbte( " + obj.Id_Cbte + ",\"" + obj.Tipo + "\", " + obj.Nro + " );' class='doc'> " + doc + " </td>  <td  style='" + borde + "'>" + obj.Codigo + " </td> <td  style='" + borde + "'>" + obj.Id_cta + " </td> <td  style='" + borde + "'>" + obj.Anio + " </td> <td  style='" + borde + "   '>" + obj.mes + " </td> <td  style='" + borde + "      border-left: 1px solid #dddddd;    text-align: center; '>" + v_debe + " </td> <td  style='" + borde +" border-right: 1px solid #dddddd;     text-align: center; ' >" + v_Haber + " </td> <td  style='" + borde + "'> "+edit+"</td></tr>"; 
            FechaOld = obj.Fecha;
          Nroold = obj.Nro;


      });   
          Tabla_Datos = Tabla_Datos + " <tr  style='    background-color: #ebf6fb;' >      <td > " + Nroold + " </td> <td>  &nbsp &nbsp  &nbsp &nbsp  &nbsp  &nbsp " + FechaOld + "   </td> <td  >   </td>  <td  > </td> <td   >  </td> <td   >  </td> <td  style='font-weight: 700;  text-align: center;'  >Total: </td> <td style='border-left: 1px solid #dddddd;  text-align: center;font-weight: 700; '> "+ parseFloat( v_debe1).toFixed(2).replace('.', ',') +" </td>  <td style='border-right: 1px solid #dddddd; text-align: center;font-weight: 700; '>"+parseFloat(v_haber1).toFixed(2).replace('.', ',') +" </td> <td  > </td></tr>"; 

 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_asiento_diario').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
      fn_cantidad_kx_asiento_diario();

    var groupColumn = 1;
    var table = $('#grillakx_asiento_diario').DataTable({
        "columnDefs": [
            { "visible": false, "targets": groupColumn }
        ],
        "paging": false,
      // "order": [[ groupColumn, 'asc' ]],
         "ordering": false,
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
               'pdf', 
        'excel' 
    ],


        "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="9">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        }
    } );
 
    // Order by the grouping
    $('#Resultado_kx_asiento_diario tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === groupColumn && currentOrder[1] === 'asc' ) {
            table.order( [ groupColumn, 'desc' ] ).draw();
        }
        else {
            table.order( [ groupColumn, 'asc' ] ).draw();
        }
    } );



     }

        function habPop() {
            
            $('.IdVer').show();
            $('#btnModificar1b').show();
            
        }
        
         $(document).ready(function() {
        document.title = 'Libro Diario'; // para cuando imprimo salga con el nombre  q quiero
    });

    function fn_cantidad_kx_asiento_diario() {
     cantidad = $('#grillakx_asiento_diario tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
     };

        function Vercbte(ids,tipo,nro) {
            try {
                
                if (ids=='') {
                    return;
                }
                if (ids==null) {
                    return;
                }
               
                if (tipo=='COMPRAS') {
                    window.location.href = 'CbtesComprasV2.aspx?Cbte=' + ids;
                    return;
                }
                if (tipo == 'MANUAL') {
                    
                    window.location.href = 'kx_asiento_manual.aspx?Cbte=' + nro;
                    return;
                }

                $("#Main_TxtRpid").val(ids);
                 $("#Main_TxtTipoRep").val(tipo);
                
              $("#Main_BtnImp").click();

          } catch (e) {
              alert(e);
          }
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
              function gvDel_kx_percepciones(ids) {
    try {

         if (!confirm("Esta seguro que desea eliminar el regitro ?")) {
             return;  
                        }
          var json = JSON.stringify
          ({ 
              'v_id': ids 
          });
          $.ajax({
        type: "POST",
        url: 'kx_asiento_manual.aspx/gvPerc_del',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success:resultado_kx_percepciones,
        error: erroresJs
          });
      } catch (e) {
        alert(e.message);
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
          'Fecha': $('#TxtFecha').val(),
          'Codigo': $('#Main_TxtCodigo').val(),
          'Id_cta': $('#Main_TxtId_cta').val(),
          'Anio': $('#Main_TxtAnio').val(),
          'mes': $('#Main_Txtmes').val(),
          'Documento_concepto': $('#Main_TxtDocumento_concepto').val() ,
          'Debe': $('#Main_TxtDebe').val(),
          'Haber': $('#Main_TxtHaber').val(),
          'Config': $('#Main_TxtConfig').val(),
          'Id_Cbte': $('#Main_TxtId_Cbte').val(),
          'Tipo': $('#Main_TxtTipo').val()
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

          function AgregarAsiento(){
            try {
           
                 if (  $("#Main_Txtdebe").val() == '0.00' &&  $("#Main_Txthaber").val() == '0.00')  {
                     return ;
                        
                }

                   if (   $("#Main_Txtdebe").val() =='' &&  $("#Main_Txthaber").val()  == '')  {
                     return ;
                        
                }

           var ffds = '';
                var org = '';
                var orgtipo = '';
               
                if ($("#Main_org").val() !=null) {
                        ffds =  $("#Main_org").val().length; 
             org = $("#Main_org").val().substr(2,ffds);
             orgtipo=  $("#Main_org").val().substr(0,1);
                }
               
            var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({  
                               "Id_cta": $("#Main_CmbDebe").val(),
                                  "cta": $("#Main_CmbDebe option:selected").text(), 
                              "debe":  $("#Main_Txtdebe").val(),
                                  "haber":  $("#Main_Txthaber").val(), 
                              "Id_org": org, 
                              "org": $("#Main_org option:selected").text(),
                               "Tipo":orgtipo

                          });

                        $.ajax({
                            type: "POST",
                            url: "kx_asiento_manual.aspx/WsAddasiento",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success:  resultado_kx_percepciones,
                            error: errores
                        });

                } catch (e) {
                      alert(e.message);
                }
        }

           function resultado_kx_percepciones(Resultado) { 
                $("#Main_Txtdebe").val('0.00');
                                   $("#Main_Txthaber").val('0.00');
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
                var Tabla_Fin = '';
             var v_debe = 0;
               var v_haber = 0;   
   $('#Resultado_kx_asiento_det').show(); 
   $('#Resultado_kx_asiento_det').empty();   
   Tabla_Titulo =  "  <table     class='table   table-hover table-striped' style='width: 100%;text-align: center;'><thead><tr> <th></th> <th>Cuenta</th><th>Debe $</th><th>Haber $</th> <th>Organizacion</th> </tr></thead><tbody> "; 
  
  $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'> <a class='tooltips' onclick='gvDel_kx_percepciones("+ obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Codigo + " </td> <td>" + obj.Debe.replace(',', '.')  + " </td> <td>" + obj.Haber.replace(',', '.') + " </td> <td>" + obj.Config+ " </td></tr>"; 
      
        v_debe= parseFloat(parseFloat(obj.Debe.replace(',', '.')  ) +  parseFloat( v_debe )   ).toFixed(2);
      $("#TxtDebe1").text(parseFloat(v_debe).toFixed(2));

    

      v_haber = parseFloat(parseFloat(obj.Haber.replace(',', '.')) + parseFloat(v_haber)).toFixed(2);

                      $("#TxtHaber1").text(parseFloat(v_haber).toFixed(2));
              
   });     
 Tabla_Fin = " </tbody></table>" ; 
   $('#Resultado_kx_asiento_det').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                 
               

            
     }

           function LimpiarPopAsi() {
       
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
          $('#Main_TxtId_Cbte').val('');
          $('#Main_TxtTipo').val('');

            $('#Resultado_kx_asiento_det').empty();  
          $("#TxtDebe1").text('0.00');
          $("#TxtHaber1").text('0.00');

            $.ajax({
                            type: "POST",
                            url: "kx_asiento_manual.aspx/WsLimpiarItem",
                            data: '',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success:  '',
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

          function BuscarNro(ids) {

              LimpiarPopAsi();
              $(".IdVer").hide();

    $("#btnModificar1b").hide();
    $("#btnGuardar1b").hide();
    $("#TituloPop").text('Ver Asiento');
    $("#Modalkx_asiento_diario").modal(); 
    $("#Main_TxtId").prop('disabled', true);


            try {
                  var json = JSON.stringify
        ({
            'Id_nro': ids 

   });
                $.ajax({
                            type: "POST",
                            url: "kx_asiento_manual.aspx/WsBuscar_asiento",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado_kx_percepcionesNro,
                            error: errores
                        });

                } catch (e) {
                      alert(e.message);
                }
        }
            function resultado_kx_percepcionesNro(Resultado) { 
                $("#Main_Txtdebe").val('0.00');
                                   $("#Main_Txthaber").val('0.00');
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
                var docu = '';
   var Tabla_Datos = '';
                var Tabla_Fin = '';
             var v_debe = 0;
               var v_haber = 0;   
   $('#Resultado_kx_asiento_det').show(); 
   $('#Resultado_kx_asiento_det').empty();   
   Tabla_Titulo =  "  <table     class='table   table-hover table-striped' style='width: 100%;text-align: center;'><thead><tr class='MarcoMio '> <th></th> <th>Cuenta</th><th>Debe $</th><th>Haber $</th> <th>Organizacion</th> </tr></thead><tbody> "; 

               var cant = 0;
                $.each(v_obj, function (index, obj) {     
      
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'><div class='  IdVer' > <a class='tooltips IdVer' onclick='gvDel_kx_percepciones("+ obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a> </div></td>   <td>" + obj.Codigo + " </td> <td>" + obj.Debe.replace(',', '.')  + " </td> <td>" + obj.Haber.replace(',', '.') + " </td> <td>" + obj.Config+ " </td></tr>"; 
      if (cant==0) {
          docu = obj.Documento_concepto;
          var ff = obj.Fecha.split("/");
          console.log(ff);
          var mes = parseInt(ff[1]) - 1;
          document.getElementById("TxtFecha").value = new Date(ff[2],  mes,ff[0]).toISOString().substring(0, 10);
                    }
                    
                    $("#Main_TxtNro").val(obj.Nro); 
                   
                     $("#Main_TxtId_Cbte").val(obj.Cbte); 
                  
                    $('#Main_TxtTipo').val(obj.CbteTipo); 

                    $("#Main_org").val(obj.Tipo+"_"+ obj.Id_Cbte).change(); 

                   


      if (obj.Documento_concepto !=null  ) {
          docu = obj.Documento_concepto;
          if (obj.Documento_concepto !="") {
 $("#Main_TxtDocumento_concepto").val(docu).change(); 
          }
            
      }

     
      cant ++;
        v_debe= parseFloat(parseFloat(obj.Debe.replace(',', '.')  ) +  parseFloat( v_debe )   ).toFixed(2);
      $("#TxtDebe1").text(parseFloat(v_debe).toFixed(2));

      v_haber = parseFloat(parseFloat(obj.Haber.replace(',', '.')) + parseFloat(v_haber)).toFixed(2);

                      $("#TxtHaber1").text(parseFloat(v_haber).toFixed(2));
              
   });     
 Tabla_Fin = " </tbody></table>" ; 
               $('#Resultado_kx_asiento_det').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              
             
               

            
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



           function ListarContables() {

            try {
 
                $.ajax({
                    type: "POST",
                    url: "CbtesOrden.aspx/WsListarCtas",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                    
                         $('#Main_CmbDebe').empty();
                       
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                         
                             $('#Main_CmbDebe').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre) 
                                );
                            
 
                         
                        });
            
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
              function ListarOrganizacion() {

            try {
 
                $.ajax({
                    type: "POST",
                    url: "kx_asiento_manual.aspx/WsListarOrg",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                    
                         $('#Main_org').empty();
                          $('#Main_org').append(
                        $('<option  data-tipo="" ></option>').val('').html('') );
                        $.each(Especialidad, function (index, especialidades) {
                         
                             $('#Main_org').append(
                                  $('<option  data-tipo="'+especialidades.Id+'" ></option>').val(especialidades.Id +"_"+especialidades.id_pais).html(especialidades.nombre) 
                            );

                         
                            
 
                         
                        });
            
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }

        $(function () {
            ListarContables();
            ListarOrganizacion();
            $(".campoFecha").mask("99/99/9999");
             $(".cmbBuscar").select2();
             
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
          var today = dd + '/01/' + yyyy;

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

      <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
