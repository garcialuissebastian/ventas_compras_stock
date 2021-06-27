<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="Nota_vta_ver.aspx.cs" Inherits="HardSoft.App.Ralkal.Nota_vta_ver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
  
    <link href="../../css/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    
       <script language="JavaScript" type="text/javascript">

         function acceptNum(e) {
             var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
             return ((tecla > 47 && tecla < 58) || tecla == 8);
         }
         </script>
    <div style="display:none">
    <asp:HiddenField ID="Hdcliente" runat="server" />
           <asp:HiddenField ID="HdNota" runat="server" />
    <asp:Button ID="BtnRp" runat="server" Text="rp" OnClick="BtnRp_Click" />
           <asp:Button ID="BtnCouta" runat="server" Text="rpC" OnClick="BtnCouta_Click" />
    </div>
 
     <div class=" container">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                   Ver Notas de ventas          </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
       <strong>    Notas de ventas </strong> 
            </div>


        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOp" class="form-control">
          <option value="0">Numero Nota</option>
          <option value="1">Nombre</option>
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscar" runat="server"  class="form-control"></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina1" type="button" class="btn2  btn-default "  onclick="Buscar()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>

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
  

</div>
              </div>
     </div>

        </div>

       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick=" window.location.href='Nota_vta.aspx';" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
    
               </div>
      
           <!-- Modal  cliente -->
  <div class="modal fade" id="ModalC" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       <h3>ASIGNAR COBRADOR</h3>
        </div>
        <div class="modal-body">
         
         <div   style="margin-top:5px;  padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
    
  <div class="col-xs-3" >
    
      
     
      COBRADOR
       
      </div>
    
    <div class="col-xs-3" >
 
  <select id="cmbCobra" class="form-control">
         

      </select>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnc" type="button" class="btn2  btn-primary "  onclick="Asignacion()">
    <span class=" glyphicon "></span> ASIGNAR
  </button>

         </div>
       </div> 
</div>
</div>
         
     

              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>

  
         
           <!-- Modal  cliente -->
  <div class="modal fade" id="ModalR" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       <h3>REGISTRAR CUOTAS</h3>
        </div>
        <div class="modal-body">
         
         <div   style="margin-top:5px;  padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
    
  <div class="col-xs-3" >
    
      
     
      CUOTAS
       
      </div>
    
    <div class="col-xs-5" >
 
  <select id="cmbCuotas" class="form-control">
         

      </select>
        </div>
     <div class="col-xs-2"  style="text-align:left">       
      
         <button id="btnR" type="button" class="btn2  btn-primary "  onclick="PagarCuota()">
    <span class=" glyphicon "></span> Pagar $
  </button>

         </div>
          <div class="col-xs-2"  style="text-align:left">
          <button id="btnREP" type="button" class="btn2  btn-success "  onclick="RpCuota()">
    <span class=" glyphicon "></span> Imprimir
  </button>

         </div>
       </div> 
</div>
</div>
         
     

              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>

   
         
            <br />
         <asp:Label ID="Msg" runat="server" Text="" CssClass="alert-danger"></asp:Label>


         <br />
   </div>
       <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script>

        function RpCuota() {
            $("#Main_BtnCouta").click();

        }

        function PagarCuota() {

            try {

                var vcobra = $('#cmbCuotas').val();
                var json = JSON.stringify
                  ({

                      "v_couta": vcobra,
                      "v_nota": $("#Main_HdNota").val()

                  });
                $.ajax({
                    type: "POST",
                    url: "Nota_vta_ver.aspx/WsPagar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: ok2,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }
        function ok2() {
            $("#ModalR").modal('hide');
            CargarCobra1($("#Main_HdNota").val());
            alert('Transacción exitosa');
            
        }

        function    Asignacion() {
        
            try { 

                var vcobra = $('#cmbCobra').val();
                var json = JSON.stringify
                  ({

                      "v_cobra": vcobra,
                      "v_nota":    $("#Main_HdNota").val()

                  });
                $.ajax({
                    type: "POST",
                    url: "Nota_vta_ver.aspx/WsAsignar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: ok,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }
        function ok() {
            $("#ModalC").modal('hide');
       
            alert('Transacción exitosa');
            Buscar();
        }
        
        function Buscar() {

            try {
                

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                  
                      "v_valor": ''
                 
                  });
                $.ajax({
                    type: "POST",
                    url: "Nota_vta_ver.aspx/WsListar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultado,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }



            function CargarVer(Ids, Id_nota) {

           
            
                $("#Main_HdNota").val(Id_nota);
                $("#Main_Hdcliente").val(Ids);
                $("#Main_BtnRp").click();
          
            }

            function resultado(Resultado) {
                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

                $("#Resultado").show();
                $("#Resultado").empty();
                Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>VER</th><th>COBRADOR</th><th>PAGOS</th><th>NOTA</th><th>NOMBRE COBRADOR</th><th>VENDEDOR</th><th>CLIENTE_NOMBRE</th><th>RAZON SOCIAL</th><th>MONTO</th><th>ESTADO</th></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                    Tabla_Datos = Tabla_Datos + "<tr ><td onclick='CargarVer(" + pacientes.ID_CLIENTE + "," + pacientes.ID_NOTA + ");'  style='cursor:pointer; background-image:url(/images/ver.png); background-position:50%; background-repeat:no-repeat;'> </td> <td > <a class='tooltips' href='#'  onclick='CargarCobra(" + pacientes.ID_NOTA + ")'>  <img src='../../../images/factura-aprobada2.png' />  <span>Asignar cobrador</span></a> </td><td > <a class='tooltips' href='#'  onclick=' CargarCobra2(" + pacientes.ID_NOTA + ")'>  <img src='../../../images/comprobar.png' />  <span>Registrar $</span></a> </td><td>" + pacientes.ID_NOTA + "</td><td>" + pacientes.COBRADOR + "</td><td>" + pacientes.VENDEDOR + "</td><td>" + pacientes.CLIENTE_NOMBRE + "</td><td>" + pacientes.CLIENTE_NOMBRE_RAZON + "</td><td>" + parseFloat(pacientes.MONTO).toFixed(2) + "</td><td>" + pacientes.ESTADO + "</td></tr>";
                });
            
                Tabla_Fin = "</tbody></table>";
                $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            }

            function errores(msg) {
                var jsonObj = JSON.parse(msg.responseText);
                alert('Error: ' + jsonObj.Message);
            }


            function CargarCobra(Id_nota) {

                try {
                    $("#Main_HdNota").val(Id_nota);
                    $("#ModalC").modal();
  
                    var json = JSON.stringify
                      ({

                          "v_valor": ''

                      });
                    $.ajax({
                        type: "POST",
                        url: "Nota_vta_ver.aspx/WsListarCobrador",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarC,
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarC(Resultado) {

                var Especialidad = Resultado.d;
                $('#cmbCobra').empty();

                $('#cmbCobra').append('<option value="0">Seleccione un cliente</option>');

                $.each(Especialidad, function (index, especialidades) {
                    $('#cmbCobra').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.Nombre + ' ' + especialidades.Apellido)
                        );
                });


            }

            function CargarCobra2(Id_nota) {
                $('#ModalR').modal();
                CargarCobra1(Id_nota);
            }
            function CargarCobra1(Id_nota) {

                    try {

                     
                        $("#Main_HdNota").val(Id_nota);
                        

                        var json = JSON.stringify
                          ({

                              "v_valor": Id_nota

                          });
                        $.ajax({
                            type: "POST",
                            url: "Nota_vta_ver.aspx/WsListarCoutas",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: CargarR,
                            error: errores
                        });

                    } catch (e) {
                        alert(e.message);
                    }
                }
                function CargarR(Resultado) {

                    var Especialidad = Resultado.d;
                    $('#cmbCuotas').empty();

                    $('#cmbCuotas').append('<option value="0">Seleccione una cuota</option>');

                    $.each(Especialidad, function (index, especialidades) {
                        $('#cmbCuotas').append(
                              $('<option></option>').val(especialidades.Cuota).html('Cuota: ' + especialidades.Cuota + ' -' + ' $' + parseFloat(especialidades.Monto).toFixed(2) + ' Vto: ' + especialidades.Vto)
                            );
                    });

                }

            

    </script>

      <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
         
</asp:Content>