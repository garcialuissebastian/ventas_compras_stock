<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="ListaPreciosRp.aspx.cs" Inherits="HardSoft.App.Kardex.ListaPreciosRp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

          <link href="../../css/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    
       <script language="JavaScript" type="text/javascript">

           function acceptNum(e) {
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               return ((tecla > 47 && tecla < 58) || tecla == 8);
           }

           $(document).keypress(function (event) {
               // para q no haga submit cuando pressiono enter en alguna parte
               var keycode = event.keyCode || event.which;
               if (keycode == '13') {
                   return false;
               }
           });


         </script>
     <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

    <style>

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
        .modal-header {
    padding: 7px !important;
    
}
        .modal-body {
    position: relative;
     padding: 0px  !important;
}
    </style>

     <div class=" container"  style="margin-top: 36px;">   
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong> LISTA DE PRECIOS REDUCIDA </strong> 
            </div>
         
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     
       </div>
  <div class="col-xs-3" >
    
      
     
      </div>
    
    <div class="col-xs-3" >
 
        </div>
     <div class="col-xs-3"  style="text-align:left">
         <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad1">0</span></div>
       

         </div>
       </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />

</div> 
   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla1'></table>

</div>
              </div>
     </div>

        </div>


       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default  pull-left  " onclick="PopAlta()" >
    <span class=" glyphicon glyphicon-plus"></span> Agregar Articulo
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

            
              <button id="btnAgregar33" type="button" class="btn2 btn-default  pull-right  " onclick="Rp()" >
    <span class=" glyphicon glyphicon-print"></span> Imprimir
 </button> 
    
         
               </div> <br />
   </div>

    
           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"   style="background-color: rgb(241, 241, 241);">
      <div class="row" >
              <div class=" col-xs-6 " id="TituloPop"   style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;" >
      
       </div>     
         <div class=" col-xs-6 "  >
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
          </div>
        </div>
        <div class="modal-body">
            <div >
                <div  style="padding:5px" >
              <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-1"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
            <select id="cmbPrecio" class="form-control"> 
      </select>
     
      </div>
  <div class="col-xs-5" >
     
<asp:TextBox ID="TxtBuscarArt" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina1" type="button" class="btn2  btn-default "  onclick="BuscarArt()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>

         </div>
       </div> 
</div>
</div>
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />

</div> 
   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoB' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla'></table>

</div>
              </div>
     </div>
            </div> </div>
        </div>
        
      </div>
      
    </div>
      <div style="display:none">
      <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
          </div>
 </div>
  
    <script>


        $(function () {
            ListaPrecios();
            Buscar();
        }
        );

        function Rp() {
            $('#Main_Button1').click();
        }
          function Buscar() {

                try { 
                    
                    var v_buscar = $('#cmbTipoOp').val();
                    var json = JSON.stringify
                      ({
                          "v_tipo": "9",
                          "v_valor": $('#Main_TxtBuscarArt').val()

                      });
                    $.ajax({
                        type: "POST",
                        url: "ListaPreciosRp.aspx/WsListar",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: resultado1,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
        }
            function BuscarArt() {

                try { 
                    
                    var v_buscar = $('#cmbTipoOp').val();
                    var json = JSON.stringify
                      ({
                          "v_tipo": "9",
                          "v_valor": $('#Main_TxtBuscarArt').val()

                      });
                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WsListarArticulo",
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
            function ListaPrecios() {

            // LISTA de precio del usuario 1  

            try {
                var json = JSON.stringify
                  ({
                      "v_id": '1'
                  });
                $.ajax({
                    type: "POST",
                    url: "Articulo.aspx/WsListarPrecios",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        if (result.d != null) {
                            var Pacientes = result.d;

                            $('#cmbPrecio').empty();

                            $('#cmbPrecio').append(
                                      $('<option></option>').val('1').html('Lista1 -' + Pacientes.l1_desc)
                                    );
                            $('#cmbPrecio').append(
                                   $('<option></option>').val('2').html('Lista2 -' + Pacientes.l2_desc)
                                 );
                            $('#cmbPrecio').append(
                                   $('<option></option>').val('3').html('Lista3 -' + Pacientes.l3_desc)
                                 );
                            $('#cmbPrecio').append(
                                   $('<option></option>').val('4').html('Lista4 -' + Pacientes.l4_desc)
                                 );

                            $('#cmbPrecio').append(
                                   $('<option></option>').val('5').html('Lista5 -' + Pacientes.l5_desc)
                                 );
                             


                        }
                    },
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
                Tabla_Titulo = "<table   id='grillaArt2' class='table   table-hover table-striped' style='width: 100%;'><thead><tr>  <th>Cod_Sistema</th><th>Cod_Manual</th><th>Descripción</th> <th>Alic</th><th>PRECIO $</th> </tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                
                    var sin = pacientes.Nombre ;
                    if (pacientes.Nombre.trim().length > 230) {
                        sin = pacientes.Nombre.substr(0, 200) + '.... (Ver más)';
                    }

                    var precioL = 0.00;
                   

                      if ("1" == $("#cmbPrecio").val()) { // si esta seleccionada la lista 1
                           precioL = parseFloat(pacientes.P_FinalL1.replace(',', '.').replace(" ", "")).toFixed(2);
                    }

                          if ("2" == $("#cmbPrecio").val()) { // si esta seleccionada la lista 2
                           precioL = parseFloat(pacientes.P_FinalL2.replace(',', '.').replace(" ", "")).toFixed(2);
                    }

                         if ("3" == $("#cmbPrecio").val()) {  
                           precioL = parseFloat(pacientes.P_FinalL3.replace(',', '.').replace(" ", "")).toFixed(2);
                    }

                         if ("4" == $("#cmbPrecio").val()) {  
                           precioL = parseFloat(pacientes.P_FinalL4.replace(',', '.').replace(" ", "")).toFixed(2);
                    }
                         if ("5" == $("#cmbPrecio").val()) {  
                           precioL = parseFloat(pacientes.P_FinalL5.replace(',', '.').replace(" ", "")).toFixed(2);
                    }




                    if (pacientes.Anulado != 'SI') {
                        Tabla_Datos = Tabla_Datos + "<tr    onclick='agregar(" + pacientes.Id + ");' style='cursor:pointer;'>   <td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td style='text-align: justify;'>" + sin + "</td> <td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + precioL + "</td>   </tr>";
                    }

                    });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoB").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                fn_cantidad1();
                
             //   esValido2('ADM_KARDEX');


        }
          function fn_cantidad1() {
                cantidad = $("#grillaArt tbody").find("tr").length;
                $("#span_cantidad1").html(cantidad);
            };
              function resultado1(Resultado) {
                  var Pacientes = Resultado.d;
                  $("#ModalCat").modal('hide');
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";
            
                $("#Resultado").show();
                $("#Resultado").empty();
                Tabla_Titulo = "<table   id='grillaArt' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th>  <th>Cod_Sistema</th><th>Cod_Manual</th><th>Descripción</th> <th>Alic</th><th>PRECIO $</th> <th>LISTA</th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                
                    var sin = pacientes.Nombre ;
                    if (pacientes.Nombre.trim().length > 230) {
                        sin = pacientes.Nombre.substr(0, 200) + '.... (Ver más)';
                    }

                    var precioL = 0.00;
                   

                      if ("1" == $("#cmbPrecio").val()) { // si esta seleccionada la lista 1
                           precioL = parseFloat(pacientes.P_FinalL1.replace(',', '.').replace(" ", "")).toFixed(2);
                    }

                          if ("2" == $("#cmbPrecio").val()) { // si esta seleccionada la lista 2
                           precioL = parseFloat(pacientes.P_FinalL2.replace(',', '.').replace(" ", "")).toFixed(2);
                    }

                         if ("3" == $("#cmbPrecio").val()) {  
                           precioL = parseFloat(pacientes.P_FinalL3.replace(',', '.').replace(" ", "")).toFixed(2);
                    }

                         if ("4" == $("#cmbPrecio").val()) {  
                           precioL = parseFloat(pacientes.P_FinalL4.replace(',', '.').replace(" ", "")).toFixed(2);
                    }
                         if ("5" == $("#cmbPrecio").val()) {  
                           precioL = parseFloat(pacientes.P_FinalL5.replace(',', '.').replace(" ", "")).toFixed(2);
                    }

                     precioL = parseFloat(pacientes.Cont_Compra.replace(',', '.').replace(" ", "")).toFixed(2);
                    
                    
                    if (pacientes.Anulado != 'SI') {
                        Tabla_Datos = Tabla_Datos + "<tr     style='cursor:pointer;'>  <td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='eliminar(" + pacientes.Id + ");' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td> <td>" + pacientes.Id + "</td><td>" + pacientes.Cod_Manual + "</td><td style='text-align: justify;'>" + sin + "</td> <td>" + parseFloat(pacientes.Iva_Venta) * 100 + "%</td><td>" + precioL + "</td> <td>" + pacientes.Cont_Venta + "</td>  </tr>";
                    }

                    });

                Tabla_Fin = "</tbody></table>";
                $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                fn_cantidad1();
                
             //   esValido2('ADM_KARDEX');


        }


        function CargarDep(Resultado) {

            var Especialidad = Resultado.d;

            $('#cmbDep').empty();


            $.each(Especialidad, function (index, especialidades) {
                $('#cmbDep').append(
                      $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                    );
            });


        }
  function ListarDeposito() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Deposito.aspx/WsListar",
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

        function agregar(art) {

               var json = JSON.stringify
                      ({
                          "v_lista":  $('#cmbPrecio').val(),
                          "v_art": art

                      });
                    $.ajax({
                        type: "POST",
                        url: "ListaPreciosRp.aspx/WsAgregarArticulo",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: Buscar,
                        error: errores
                    });
        }

           function eliminar(art) {

                if (!confirm("Esta seguro que desea eliminarlo ?")) {
                    return;
                        }
               var json = JSON.stringify
                      ({
                          
                          "v_art": art

                      });
                    $.ajax({
                        type: "POST",
                        url: "ListaPreciosRp.aspx/Wseliminar",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: Buscar,
                        error: errores
                    });
        }

        function PopAlta() {
            $("#ModalCat").modal();
        }




         $(document).ready(function () {

             $(this).everyTime(25000, function () {
                 $("#miLoader").hide();
                 $.ajax({
                     type: "POST",
                     url: "../ActiveSession.aspx/KeepActiveSession",
                     data: {},
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     async: true,
                     success: VerifySessionState,
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                         window.location.href = "/";

                     }
                 });


             });




             function VerifySessionState(result) {
                
                 if (!result.d) {

                     window.location.href = "/";
                 }
             }

             //fin de ready

        });


        
               $("#Main_TxtBuscarArt").on("keydown", function (event) {
                  if (event.which == 13) {
                     BuscarArt();
                      $("#Main_TxtBuscarArt").val('');
                  }
              });
    </script>



</asp:Content>
