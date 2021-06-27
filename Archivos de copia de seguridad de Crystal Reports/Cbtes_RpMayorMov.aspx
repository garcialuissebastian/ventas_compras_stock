 <%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Cbtes_RpMayorMov.aspx.cs" Inherits="HardSoft.App.OAA.Cbtes_RpMayorMov" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
    
<style type="text/css" media="print">
    @page {
  size: landscape;
}
 /* ISO Paper Size */
@page {
  size: A4 landscape;
}

/* Size in mm */    
@page {
  size: 100mm 200mm landscape;
}

/* Size in inches */    
@page {
  size: 4in 6in landscape;
}
</style>
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

    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script> 

     <script type="text/javascript" src="/Scripts/jquery.dataTables.min.js" ></script>
    <link href="/css/jquery.dataTables.css" rel="stylesheet" />


     <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>


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
<script src='/Scripts/responsive.bootstrap.min.js'></script>



<style>
        .ajax__calendar .ajax__calendar_day {
    border: 1px solid #dcdbdb;
}
            .ajax__calendar .ajax__calendar_hover .ajax__calendar_day {
    background-color: #0ba1ec;
    border-color: #daf2fc;
    color: #0066cc;
}


        .alert-negro{
    color: #f1f3f5;
    background-color: #333; 
  border: 1px solid;
    box-shadow: 0 4px 5px #555;
    border-radius: 10px 10px 10px 10px;
 
}
        .alert-cab {
   color: #fff;
background-color: #222222;
border: 1px solid;
box-shadow: 0 4px 5px #555;
   
}
    </style>

     <div class=" container" style="margin-top: 36px;">  
         
     
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
       <strong> Registro de Movimientos</strong> 
            </div>

         
 

 
 

        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
        <label for="TxtNunDoc" class=" col-xs-2"  style="color:white;text-align:right; padding-top: 5px;"   > Desde CUenta</label>
  <div class="col-xs-4" >
    
      
      <select id="cmbTipoCbate" class="form-control cmbBuscar">
               
      </select>
      
       
      </div>

        
        <label for="TxtNunDoc" class=" col-xs-2"  style="color:white;text-align:right; padding-top: 5px;"   > Hasta Cuenta</label>
  <div class="col-xs-4" >
    
      
      <select id="cmbTipoCbate2" class="form-control cmbBuscar">
               
      </select>
      
       
      </div>
        
  <div class="col-xs-2" >
    
      
      <select id="cmbTipoOp" class="form-control" style="display:none">
      <%-- <option value="1">N°Comprobante</option> --%>
     <option value="2">Fechas</option>    
 
             
      </select>
      
       
      </div>
     
  
       </div> 
    </div>
            <div class="row"  style="margin-top:10px">
   
      <div class="form-group" >
           <div class="col-xs-3" ></div>
          <div class="col-xs-6" style="border: solid;
    border-color: white;
    padding: 10px;" >

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
     <div class="col-xs-3" ></div>
    </div>
</div>
<div class="row" >

            <div class="form-group" >


                 <div class="col-xs-1" style="margin-top:10px;padding-left: 63px;">
             <input id="ChPrioridad" type="checkbox"   class="form-control" onclick="Buscar()" style=" display:none;  float:left; zoom: 135%;"/>   
        
                     </div>
                 <div class="col-xs-3" style="margin-top:10px; color:white; text-align:left">
             
                 
         </div>
                 <div class="col-xs-1" style="margin-top:10px;padding-left: 63px;">
           
         </div>
                <div class="col-md-1" style="text-align:center; margin:auto; margin-top:10px">

                       <button id="btnElimina1" type="button" class="btn2  btn-info "  onclick="Buscar()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>
                     
                </div>

    <div class="col-xs-6" style="margin-top:10px;padding-left: 63px;">
           
         </div>

</div></div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />

</div>




   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div  style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow : auto;   height: 320px; width: 100%; background-color:white ">
        
        <div   >


        </div>
  <table   id='grilla'></table>

</div>
              </div>
     </div>

        </div>

          <div style="display:none">
        <asp:TextBox ID="TxtRpid" runat="server"></asp:TextBox>
         <asp:TextBox ID="TxtTipoRep" runat="server"></asp:TextBox>
                <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
    </div>

       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; height: 80px;" >
            <input type="text" id="kwd_search3" placeholder="Filtrar" value="" class="form-control" style="width: 150px; float: left" />

       
              <button id="btnAgregar1" type="button" class="btn2 btn-default    " style="display:none" onclick="PopRp()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Descargar
 </button>
   
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>




           <div style="display:none"> 
           <asp:Button ID="BtnRp" runat="server" Text="Button" OnClick="BtnRp_Click" />
               </div>


          
             <button   type="button" class="btn2    pull-right "  onclick="printData()" >
     Imprimir <span class=" glyphicon glyphicon-print"></span>
  </button>

               </div> <br />



   </div>


     
      <script>
         
          $(".campoFecha").mask("99/99/9999");

           
            // jQuery expression for case-insensitive filter
            $.extend($.expr[":"],
            {
                "contains-ci": function (elem, i, match, array) {
                    return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                }

                });

          function ListarTipo() {
              try {

                  var json = JSON.stringify
            ({


            });

                  $.ajax({
                      type: "POST",
                      url: "Cbtes_RpMayorMov.aspx/WsListarCtas",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async:false ,
                      success: CargarTipo,
                      error: errores
                  });


              } catch (e) {
                  alert(e.message);
              }
          }
          function CargarTipo(Resultado) {

              var Especialidad = Resultado.d;

              $('#cmbTipoCbate').empty();
                  $('#cmbTipoCbate2').empty();
              
              //$('#cmbTipoCbate').append('<option value="">TODOS</option>');
              $.each(Especialidad, function (index, especialidades) {


                  $('#cmbTipoCbate').append(
                            $('<option></option>').val(especialidades.Id).html(especialidades.nombre) 
                  );
                         $('#cmbTipoCbate2').append(
                            $('<option></option>').val(especialidades.Id).html(especialidades.nombre) 
                         );

              });

               
          }


          function CITTIVTA() {
              try {
                  $('#btnCITTIVTA').prop('disabled', true);

               var   val1 = $('#Main_TxtFechaDesde').val();
            var      val2 = $('#Main_TxtFechaHasta').val();
                  var json = JSON.stringify
                          ({
                              "v_tipoCbate": $('#cmbTipoCbate').val(),
                              "v_tipo": $('#cmbTipoOp').val(),
                              "v_valor1": val1,
                              "v_valor2": val2,

                          });
                  $.ajax({
                      type: "POST",
                      url: "Cbtes_Ver.aspx/Wscttiventas",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function () {
                          window.location = "Report/VENTAS.zip";
                      }),
                      error: errores   ,
                      complete: (function () {                          
                          $('#btnCITTIVTA').prop('disabled',false);
                      })
                  });
              } catch (e) {
                  alert(e);
              }

          }

      
          function PopRp() {
              $("#Main_BtnRp").click();

          }
          function Buscar() {
              $('#kwd_search3').val('');

              if ($('#cmbTipoCbate').val() != '0') {
                  try {
 

                      if (true) {

                             $("#Resultado").show();
              $("#Resultado").empty();
               $("#Resultado").empty();
             
          $("#Resultado").html(" <div class='wait' style=' text-align:center; margin:auto;  padding:2px;'><img src='/images/Loading_icon.gif' width='150' /> </div> ");

                          var json = JSON.stringify
                            ({ 
                                "v_fecha1": $('#Main_TxtFechaDesde').val(),
                                "v_fecha2": $('#Main_TxtFechaHasta').val(),
                                "v_cta": $('#cmbTipoCbate').val(),
                                  "v_cta1": $('#cmbTipoCbate2').val() 
                            });
                          $.ajax({
                              type: "POST",
                              url: "Cbtes_RpMayorMov.aspx/WsListar",
                              data: json,
                              contentType: "application/json; charset=utf-8",
                              dataType: "json",
                              success: resultado3,
                              error: errores
                          });
                      }
                  } catch (e) {
                      alert(e.message);
                  }
              } else {
                  alert("Seleccione un tipo de comprobante.");
              }
          }

          function PopVer(ids, tipo) {
              try { 
                 
                  $("#Main_TxtTipoRep").val(tipo);
                  $("#Main_TxtRpid").val(ids);
                  $("#Main_BtnImp").click();

              } catch (e) {
                  alert(e);
              }
          }

          function CargarVer(Ids) {
              $(location).attr("href", "Personal.aspx?Idsp=" + Ids);
          }

          function resultado3(Re) {
              var Tabla_Datos = "";
            //1
              var Pacientes = Re.d;
              var Tabla_Titulo = "";
              var Tabla_Fin = "";

              var iva = 0;
              var neto = 0;
              var total = 0;
              var anterior = "";
              $("#Resultado").show();
              $("#Resultado").empty();
             
             


              Tabla_Titulo = "<table  id='grilla'  border='1'   cellspacing='0' cellpadding='0'   class='table   table-hover table-bordered ' style='width: 100%;'><thead>   ";

                      color = "    background-color: #7ebdda;font-weight: 700;    background-color: #dddddd; "; 
        Tabla_Titulo += "       </thead><tbody>";

              var cant = 0;
              var  Proveedor = "";
              $.each(Pacientes, function (index, pacientes) {
               
                  var color = ""; 

                  if (pacientes.Id == "0") {
                      color = "    background-color: #7ebdda;font-weight: 700; "; 
   Tabla_Datos = Tabla_Datos + "<tr style='"+color+"'> <td>  " + pacientes.Fecha+ " </td> <td style='text-align: left;'>" + pacientes.Asiento + "</td><td  style='text-align: right;'>" + pacientes.Detalle+ ":  </td><td>" + pacientes.Debe_Mes+ "</td> <td>" + pacientes.Haber_Mes+ "</td> <td>" + pacientes.Debe_Mes+ "</td> <td>" + pacientes.Haber_Mes+ "</td>  <td>" + pacientes.Saldo_Eje+ "</td>     </tr>";

                    
  
                  cant = 0;
                  } else {
                      if (cant == 0) {
                                            // cabecera
                            color = "    background-color: #7ebdda;font-weight: 700;    background-color: #dddddd; "; 
    Tabla_Datos = Tabla_Datos + "<tr style='"+color+"'> <td colspan='6' style='text-align: left;'> Codigo contable: " + pacientes.Cuenta+ " <br/> Descripción:  " + pacientes.Cuenta_Nombre + " </td>   <td colspan='3' style='text-align: left;'> Desde: "+$("#Main_TxtFechaDesde").val()+"<br/>  Hasta: "+$("#Main_TxtFechaHasta").val()+" </td>      </tr>";
                           
                          Tabla_Datos = Tabla_Datos + "   <tr style = 'background-color: #1ba0b5; font-weight: 700;' >  <td   >Fecha</td>  <td   > Asiento</td> <td >Detalle</td> <td colspan='2'  >Movimientos del Mes </td>   <td colspan='2'>Acumulado del Ejercicio</td>   <td  >Saldo </td></tr > ";
               Tabla_Datos = Tabla_Datos +    " <tr style='background-color: #1ba0b5; font-weight: 700;'> <td   > </td>  <td   >  </td> <td > </td> <td  >Debe </td> <td  >Haber </td> <td  >Debitos </td> <td  >Creditos </td> <td  ></td></tr>    ";
                            
                                        // saldo inicial
                      color = "  font-weight: 700; "; 
   Tabla_Datos = Tabla_Datos + "<tr style='"+color+"'> <td>  " + pacientes.Fecha+ " </td> <td style='text-align: left;'> </td><td  style='text-align: right;'> Estado Inicial  </td><td> </td> <td> </td> <td> </td> <td> </td>  <td>0.00</td>     </tr>";
 color = " "; 

                      }
                      cant = 1;
    Tabla_Datos = Tabla_Datos + "<tr style='"+color+"'> <td>  " + pacientes.Fecha+ " </td> <td style='text-align: left;'>" + pacientes.Asiento + "</td><td style='text-align: left;'>" + pacientes.Detalle+ "</td><td>" + pacientes.Debe_Mes+ "</td> <td>" + pacientes.Haber_Mes+ "</td> <td>" + pacientes.Debe_Mes+ "</td> <td>" + pacientes.Haber_Mes+ "</td>  <td>" + pacientes.Saldo_Eje+ "</td>     </tr>";
               
                  }
               
                
              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              //
              fn_cantidad();


                  document.title = 'Libro Mayor'; // para cuando imprimo salga con el nombre  q quiero

                      $('#grilla').DataTable({

                    "language": {
                "search": "Filtrar:",
                "zeroRecords": "No se encontró ningun registro",
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
                  dom: 'Bfrtip',
    "ordering": false,
     "paging": false,
        buttons: [
          //  'excel', 'pdf', 'print'

              
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [ 0,1,2,3,4,5,6,7 ]
                    } 
            },
                 {
                    extend: 'excel',
                    exportOptions: {
                        columns: [0,1,2,3,4,5,6,7]
                    } 
            },

              

                  ]

    } );

             
          }



              Number.prototype.format = function(n, x, s, c) {
          var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
              num = this.toFixed(Math.max(0, ~~n));

          return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
      };


          function printData()
{
   var divToPrint=document.getElementById("grilla");
             
              newWin = window.open('', '', 'height=500,width=900');
          newWin.document.write('<style>@page{size:landscape;}</style><html><head><title>Registración de Movimientos</title>');
             newWin.document.write('</head><body >');
              newWin.document.write(divToPrint.outerHTML);
             newWin.document.write('</body></html>');

   newWin.print();
              newWin.close();

            

}
    
          
          function gvDel3(ids) {

                window.location.href = 'CbtesPago.aspx?CbteAnular=' + ids;
                
 

          }



          function gvDel(ids) {
              if (confirm("Esta seguro que desea Anular el Comprobante ?")) {
                  window.location.href = 'CbtesOrden.aspx?CbteAnular=' + ids;
 }
                  
          }
          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }
      

          function fn_cantidad() {
              cantidad = $("#grilla tbody").find("tr").length;
              $("#span_cantidad").html(cantidad);
          };
          $(function () {
              $(".campoFecha").mask("99/99/9999");
              ListarTipo();
               $(".cmbBuscar").select2();
              $('#cmbTipoOp').val('2').trigger('change');
              Buscar();
          });

              function gvProDel(v_id) {

              try {
                     if (!confirm("¿Esta seguro que desea eliminar el registro?")) {
              
                         return;
              }
                  if (true) {


                      var json = JSON.stringify
                        ({
                            "v_id": v_id

                        })
                      $.ajax({
                          type: "POST",
                          url: "Cbtes_comprasVer.aspx/WmBaja2",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: Buscar,
                          error: errores
                      });
                  }
              } catch (e) {
                  alert(e.message);
              }
          }

          var date = new Date();
          var primerDia = new Date(date.getFullYear()-5, date.getMonth(), 1);
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

               $("#kwd_search3").keyup(function () {

                // When value of the input is not blank
                if ($(this).val() != "") {
                    // Show only matching TR, hide rest of them
                    $("#grilla tbody>tr").hide();
                    $("#grilla td:contains-ci('" + $(this).val() + "')").parent("tr").show();
                }
                else {
                   
                    // When there is no input or clean again, show everything back
                    $("#grilla tbody>tr").show();
                }
            });
      </script>
   
          <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
     
   

</asp:Content>
