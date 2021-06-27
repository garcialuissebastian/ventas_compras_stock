 <%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Cbtes_DeudaProveedor.aspx.cs" Inherits="HardSoft.App.OAA.Cbtes_DeudaProveedor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
     
    
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

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

       
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
       <strong>   Deuda Proveedores </strong> 
            </div>

         
 

 
 

        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
     
  <div class="col-xs-4" >
    
      
      <select id="cmbTipoCbate" class="form-control cmbBuscar">
               
      </select>
      
       
      </div>

        
  <div class="col-xs-2" >
    
      
      <select id="cmbTipoOp" class="form-control">
      <%-- <option value="1">N°Comprobante</option> --%>
     <option value="2">Fechas</option>    
           <option value="7">Fechas Vto</option>    
              <%--  <option value="3">CUIT</option>   
           <option value="4">Razon Social</option>   --%>
              
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
    
       </div> 
</div>
<div class="row" >

            <div class="form-group" >


                 <div class="col-xs-1" style="margin-top:10px;padding-left: 63px;">
             <input id="ChPrioridad" type="checkbox"   class="form-control" onclick="Buscar()" style="   float:left; zoom: 135%;"/>   
         </div>
                 <div class="col-xs-3" style="margin-top:10px; color:white; text-align:left">
             
                  <-- Ver solo con Prioridad.
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

        <button  type="button" class="btn2 btn-default   " onclick="window.location.href='CbtesPagov2.aspx'" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nueva OP
 </button>

              <button id="btnAgregar1" type="button" class="btn2 btn-default    " style="display:none" onclick="PopRp()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Descargar
 </button>
   
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>




           <div style="display:none"> 
           <asp:Button ID="BtnRp" runat="server" Text="Button" OnClick="BtnRp_Click" />
               </div>


           <div  style="    color: white;
    text-align: right;
    float: right;
    background-color: #0394bf;
    padding: 5px;
    font-weight: 500;"> 
            
              
               Saldo Final $ 
     <span id="txtTotal">0</span>


           </div>


               </div> <br />



   </div>


     
      <script>
         
          $(".campoFecha").mask("99/99/9999");

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
                      url: "Proveedores.aspx/WsListarCmbProveedor",
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

              //$('#cmbTipoCbate').append('<option value="0">- -</option>');
              $('#cmbTipoCbate').append('<option value="99">TODOS</option>');
              $.each(Especialidad, function (index, especialidades) {


                  $('#cmbTipoCbate').append(
                           $('<option   ></option>').val(especialidades.id_pais).html(especialidades.nombre)
                         );

              });


              //select un item  para select2
             // $("#cmbTipoCbate").val(99).change();
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

          $('#cmbTipoCbate').change(function () {
              if ($('#cmbTipoCbate').val() == "99") {
                  $('#btnCITTIVTA').show();

              } else {
                  $('#btnCITTIVTA').hide();
              }

          })
          function PopRp() {
              $("#Main_BtnRp").click();

          }
          function Buscar() {
              $('#kwd_search3').val('');
              $("#Resultado").html(" <div class='wait' style=' text-align:center; margin:auto;  padding:2px;'><img src='/images/Loading_icon.gif' width='150' /> </div> ");

              if ($('#cmbTipoCbate').val() != '0') {
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
                        if ($('#cmbTipoOp').val() == '7') {
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

                      var v_prio = "99";

                       if ($("#ChPrioridad").is(':checked')) {
                v_prio = "";
                      } 




                      if (val1 != '') {

                          var json = JSON.stringify
                            ({
                                "v_tipoCbate": $('#cmbTipoCbate').val(),
                                "v_tipo": $('#cmbTipoOp').val(),
                                "v_valor1": val1,
                                "v_valor2": val2,
                                "v_priori": v_prio
                            });
                          $.ajax({
                              type: "POST",
                              url: "Cbtes_DeudaProveedor.aspx/WsListar",
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
              $("#Resultado").html(" <div class='wait' style=' text-align:center; margin:auto;  padding:2px;'><img src='/images/Loading_icon.gif' width='150' /> </div> ");

              var ultimocbte = "";
              Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-bordered ' style='width: 100%;'><thead><tr style='background-color: #1ba0b5; font-weight: 700;'> <td style=' width: 100px;'  ></td> <td colspan='5' style='border-right: solid;'>Detalle de comprobante </td> <td colspan='4'>Detalle de aplicaciones </td> <td  >Saldo </td></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
              
               
                  var saldo = parseFloat(pacientes.Saldo.replace(',', '.')).format(2, 3, '.', ',');
                  var ver2 = "";
                  if (anterior == pacientes.Id_compra) {
                      saldo =  parseFloat(0);
                      pacientes.Saldo = "0";
                      ver2 = " display:none";
                  }
               //   
           
                  total = parseFloat(total) +  parseFloat(pacientes.Saldo.replace(',', '.')  );
                  $("#txtTotal").text(parseFloat(total).format(2, 3, '.', ','));

                  var priori = "<div class='  alert-danger'> (Prioridad)</div> ";
                  if (pacientes.Prioridad_compra !='X') {
                      priori = "";
                  }
                  var rojo = "";
                  if (parseFloat(pacientes.Saldo) < 1) {

                      ver2 = " display:none";
                      console.log(pacientes.Saldo);
                    
                  } else {
                      rojo = "color: red !important";
                  }
                  var linea = "";
                  if (ultimocbte !=pacientes.Cbte_compra ) {
                      linea = "border-top: 3px solid;    border-color: #adaaaa;";
                  }
                  ultimocbte = pacientes.Cbte_compra;
                  anterior = pacientes.Id_compra;

                    if ( saldo == "0,00") {
                           rojo = "color: blue !important";
                  }

                  var tipocbte = "1113"; 

                  if (pacientes.Letra_op =='NC_C') {
                      tipocbte = '\"COMPRAS\"';
                  }
                  
                  Tabla_Datos = Tabla_Datos + "<tr style='" + linea + "' ><td> <a   style='" + ver2 + "'   class='tooltips' onclick='gvDel3(" + pacientes.Id_compra + " );' > <img src='/images/divisa.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /><span>Pagar</span>  </a></td>  <td>" + pacientes.Letra_compra + "</td><td> <a class='tooltips' onclick='PopVer(" + pacientes.Id_compra + ",\"COMPRAS\");' style='cursor:pointer'> " + pacientes.Cbte_compra + priori + " <span>Ver Cbte</span></a></td><td>" + pacientes.Fecha_compra + "</td><td>" + pacientes.FechaVto_compra + "</td><td style='border-right: solid;'>" + parseFloat(pacientes.Monto_compra.replace(',', '.')).format(2, 3, '.', ',') + "</td>     <td>" + pacientes.Letra_op + "</td> <td>    <a class='tooltips' onclick='PopVer(" + pacientes.Id_op + ", " + tipocbte+");' style='cursor:pointer'> " + pacientes.Cbte_op + " <span>Ver OP</span></a></td> <td>" + pacientes.Fecha_op + "</td> <td>" + parseFloat(pacientes.Monto_op==''?'0':pacientes.Monto_op).format(2, 3, '.', ',') + "</td><td ><div style='" + rojo + "' > " + saldo  + "</div></td>  </tr>";


              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              //
              fn_cantidad();
              
          }



              Number.prototype.format = function(n, x, s, c) {
          var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
              num = this.toFixed(Math.max(0, ~~n));

          return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
      };
 
    
          
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

      </script>
   
          <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
     
   

</asp:Content>
