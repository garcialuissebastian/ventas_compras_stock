<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master" AutoEventWireup="true" CodeBehind="CancelarPersona.aspx.cs" Inherits="HardSoft.App.ORL.CancelarPersona" %>

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

     <div class=" container"  style="margin-top: 36px;">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                 Turnos por Paciente         </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
       <div style="display:none">
         <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>   Turnos por Paciente</strong> 
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
          <option value="0">DNI</option>
        
          
           
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
      <asp:HiddenField ID="HddId" runat="server"   />

</div> 
   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla'></table>

</div>
              </div>
     </div>

        </div>


       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />
   </div>



    
         <script>
          var v_pro = '';
          $('#Main_TxtCodSistema').prop('disabled', true);
          function PopVer(id) {
              $('#Main_HddId').val(id);
              $('#Main_Button1').click();
              

          }
          function PopMod(id) {
              habilitarFrm();
              limpiar();
              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();

              $("#TituloPop").text('Modificar Cliente');
              $("#ModalCat").modal();



              var json = JSON.stringify
        ({
            "v_Id": id

        });

              $.ajax({
                  type: "POST",
                  url: "Clientes.aspx/WsBuscarP",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (result) {

                      if (result.d != null) {

                          $("#Main_TxtCodSistema").val(result.d.Id);
                          $("#Main_TxtCodMunual").val(result.d.Cod_Manual);
                          $("#Main_TxtCuit").val(result.d.Doc_No);
                          $("#CmbTipoDoc").val(result.d.Tipo_Doc);
                          // $("#cmbAfip").removeAttr('selected');
                          $("#cmbAfip").val(result.d.Iva);
                          // $("#cmbAfip option[value=" + result.d.Iva + "]").attr("selected", true);
                          $("#Main_TxtObservacion").val(result.d.Observacion);

                          $("#Main_TxtNombre").val(result.d.Nombre);
                          $("#Main_TxtApellido").val(result.d.Apellido);

                          $("#cmbCtaContable").val(result.d.Cta_contable);
                          $("#Main_TxtCalle").val(result.d.Calle);
                          $("#Main_TxtNum").val(result.d.Numero);
                          $("#Main_TxtDpto").val(result.d.Dpto);

                          $("#HddProv").val(result.d.Provincia);
                          $("#HddDep").val(result.d.Departamento);
                          $("#HddDis").val(result.d.Distrito);


                          $("#cmbPais").val(result.d.Pais);
                          $("#Main_TxtCp").val(result.d.Cp);
                          v_pro = result.d.Pais;
                          ListarProvincia(result.d.Pais);
                          ListarDepartamento(result.d.Provincia);
                          ListarDistrito(result.d.Departamento);


                          $("#Main_TxtContactoNom").val(result.d.Contac_Nomb);
                          $("#Main_TxtContacTel").val(result.d.Contac_Tel);
                          $("#Main_TxtContactCel").val(result.d.Contac_Cel);
                          $("#Main_TxtContacMail").val(result.d.Contac_Mail);
                          $("#Main_TxtEmpTel").val(result.d.Emp_Tel);
                          $("#Main_TxtEmpCel").val(result.d.Emp_Cel);
                          $("#Main_TxtEmpMail").val(result.d.Emp_Mail);
                          $("#Main_TxtEmpWeb").val(result.d.Emp_Web);

                          $("#cmbProv").val(result.d.Provincia);
                          $("#cmbDepartamento").val(result.d.Departamento);
                          $("#cmbDistrito").val(result.d.Distrito);


                      }
                  },

                  error: errores
              });


          }
   
          function gvDel2(ids) {

              try {

                  if (confirm("Esta seguro que desea cancelar los turnos ?")) {

                      var json = JSON.stringify
       ({
           "v_id": ids

       });
                      $.ajax({
                          type: "POST",
                          url: "CancelarPersona.aspx/WsCancelar",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function () {
                              Buscar();
                          }),
                          error: errores
                      });
                  }
                  } catch (e) {
                      alert(e.message);
                  }
          }

          function Buscar() {

              try { 
                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                        "v_tipo": $('#cmbTipoOp').val(),
                        "v_valor": $('#Main_TxtBuscar').val()

                    });
                  $.ajax({
                      type: "POST",
                      url: "CancelarPersona.aspx/WsListar",
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


          $("#Main_TxtCuit").keyup(function (e) {
              if (e.keyCode == 13) {

                  $("#Main_TxtNombre").focus();
              }
          });

         
       
     

          function resultado(Resultado) {
              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = "";

              $("#Resultado").show();
              $("#Resultado").empty();
              Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th><th>fecha</th> <th>hora</th><th>APELLIDO</th><th>NOMBRE</th><th>DOCUMENTO</th><th>TEL</th><th>MAIL</th><th>SERVICIO</th><th> OBRASOCIAL</th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips' onclick='gvDel2(" + pacientes.id + ");' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Cancelar</span></a></td><td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.id + ");' > <img src='/images/Ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Más</span></a></td><td>" + pacientes.fecha + "</td><td>" + pacientes.hora + "</td><td>" + pacientes.APELLIDO + "</td><td>" + pacientes.NOMBRE + "</td><td>" + pacientes.DOCUMENTO + "</td><td>" + pacientes.TEL + "</td><td>" + pacientes.MAIL + "</td><td>" + pacientes.SERVICIO + "</td><td>" + pacientes.OBRASOCIAL + "</td></tr>";
              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              fn_cantidad();

          }

          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }


          function fn_cantidad() {
              cantidad = $("#grilla tbody").find("tr").length;
              $("#span_cantidad").html(cantidad);
          };
          $(document).ajaxStart(function () {
              $(".spinner-wrapper").css("display", "block");
              $(".loader").css("display", "block");
          });
          $(document).ajaxComplete(function () {
              $(".spinner-wrapper").css("display", "none");
              $(".loader").css("display", "none");

          });
          $(function () {



              $("#Main_TxtCodSistema").prop('disabled', true);

              $('#tabs').tabs();

              $("#Main_TxtCuit").blur(function () {
                  Cuit();
              });

              $("#Main_TxtContacMail").blur(function () {
                  validarEmail($("#Main_TxtContacMail").val());
              });

              $("#Main_TxtEmpMail").blur(function () {
                  validarEmail($("#Main_TxtEmpMail").val());
              });
          //    ListarPais();



          });


          $("#cmbPais").change(function () {
              ListarProvincia($("#cmbPais").val());
              $("#cmbDepartamento").val(0).change();
              $("#cmbDistrito").val(0).change();

          })

          $("#cmbProv").change(function () {
              ListarDepartamento($("#cmbProv").val());
              $("#cmbDistrito").val(0).change();
          })

          $("#cmbDepartamento").change(function () {
              ListarDistrito($("#cmbDepartamento").val());
          })

     
          function ModificarJs() {
              try {

                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": {

                          "Id": $("#Main_TxtCodSistema").val(),

                          "Cod_Manual": $("#Main_TxtCodMunual").val(),
                          "Tipo_Doc": $("#CmbTipoDoc").val(),
                          "Doc_No": $("#Main_TxtCuit").val(),
                          "Iva": $("#cmbAfip").val(),
                          "Nombre": $("#Main_TxtNombre").val(),
                          "Apellido": $("#Main_TxtApellido").val(),
                          "Observacion": $("#Main_TxtObservacion").val(),
                          "Cta_contable": $("#cmbCtaContable").val(),
                          "Calle": $("#Main_TxtCalle").val(),
                          "Numero": $("#Main_TxtNum").val(),
                          "Dpto": $("#Main_TxtDpto").val(),
                          "Pais": $("#cmbPais").val(),
                          "Cp": $("#Main_TxtCp").val(),
                          "Provincia": $("#cmbProv").val(),
                          "Departamento": $("#cmbDepartamento").val(),
                          "Distrito": $("#cmbDistrito").val(),


                          "Contac_Nomb": $("#Main_TxtContactoNom").val(),
                          "Contac_Tel": $("#Main_TxtContacTel").val(),
                          "Contac_Cel": $("#Main_TxtContactCel").val(),
                          "Contac_Mail": $("#Main_TxtContacMail").val(),
                          "Emp_Tel": $("#Main_TxtEmpTel").val(),
                          "Emp_Cel": $("#Main_TxtEmpCel").val(),
                          "Emp_Mail": $("#Main_TxtEmpMail").val(),
                          "Emp_Web": $("#Main_TxtEmpWeb").val()

                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Clientes.aspx/WmMod2",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: Modificado_Completo,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }

        
          function Modificado_Completo() {
              Buscar();

              $("#ModalCat").modal('hide');
          }

          function ListarPais() {
              try {

                  var json = JSON.stringify
            ({
                "v_tipo": '',
                "v_valor": ''
            });

                  $.ajax({
                      type: "POST",
                      url: "Proveedores.aspx/WsListarP",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: CargarPais,
                      error: errores
                  });


              } catch (e) {
                  alert(e.message);
              }
          }
          function CargarPais(Resultado) {

              var Especialidad = Resultado.d;

              $('#cmbPais').empty();

              $('#cmbPais').append('<option value="0">- -</option>');

              $.each(Especialidad, function (index, especialidades) {
                  $('#cmbPais').append(
                        $('<option></option>').val(especialidades.Id).html(especialidades.nombre)
                      );
              });


              //select un item  para select2
              //   $("#cmbPais").val(0).change();


          }

          function ListarProvincia(ids, sel) {
              try {

                  var json = JSON.stringify
            ({

                "v_valor": ids
            });

                  $.ajax({
                      type: "POST",
                      url: "Proveedores.aspx/WsListarProvincia",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: CargarProv,
                      error: errores
                  });


              } catch (e) {
                  alert(e.message);
              }
          }
          function CargarProv(Resultado) {

              var Especialidad = Resultado.d;

              $('#cmbProv').empty();

              $('#cmbProv').append('<option value="0">- -</option>');


              $.each(Especialidad, function (index, especialidades) {
                  if ($("#HddProv").val() == especialidades.Id) {


                      $('#cmbProv').append(
                           $('<option  selected></option>').val(especialidades.Id).html(especialidades.Provincia)
                         );
                  } else {
                      $('#cmbProv').append(
                        $('<option></option>').val(especialidades.Id).html(especialidades.Provincia)
                      );
                  }
              });


              //select un item  para select2
              //  $("#cmbProv").val(1).change();
          }

    
 
          </script>
   
    
</asp:Content>

