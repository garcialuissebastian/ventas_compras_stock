<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Puestos.ascx.cs" Inherits="HardSoft.App.Ralkal.CtrlFrm.Puestos" %>
     
     
      <link rel="stylesheet" href="http://www.hardsoft.com.ar/css/jquery-ui.css"/>
            <script type="text/javascript" src="../../js/bootstrap-datepicker.js" ></script>
 
    <script src="../../js/jquery.maskedinput.js"></script>
    <script src="http://www.hardsoft.com.ar/Scripts/jquery-ui.js"></script>
    <script language="JavaScript" type="text/javascript">

        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>
    <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-success">
          Administración de Puestos
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >


    <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control" placeholder="Categoria"></asp:TextBox>
      
         </div>
           
     </div>
      
         <div class="form-group">
         <label for="TxtDescripcion" class="control-label col-xs-4">Descripción </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtDescripcion" runat="server" class="form-control" placeholder="Descripción"></asp:TextBox>
      
         </div>
           
     </div>
  
        
        </div>
          </div>

     <div class="col-xs-6">

    </div>

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default   " onclick="BtnAgregar1a()" >
    <span class=" glyphicon glyphicon-save"></span> Agregar 
 </button>
    <button  id="btnModificar1a" type="button" class="btn2 btn-default  " onclick="BtnFnModificar1a()">
    <span class="  glyphicon  glyphicon-pencil"></span> Modificar
  </button>
 
  <button id="btnElimina1a" type="button" class="btn2  btn-default "  onclick="BtnFnEliminar1a()">
    <span class=" glyphicon glyphicon-trash"></span> Eliminar
  </button>
        
               <button id="btnCancelar1a" type="button" class="btn2  btn-default " onclick="BtnCancelar1a()">
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cancelar
  </button>
 
 <button id="btnGuardar1a" type="button" class="btn2 btn-primary"  onclick="BtnFnGuardar1a()" >
    <span class="   glyphicon glyphicon-floppy-disk"></span> Guardar
  </button>
 <button id="btnGuardarPopa" type="button" class="btn2 btn-danger"  onclick="BtnFnGuardarPop1a()" >
    <span class="   glyphicon glyphicon-floppy-disk"></span> Guardar
  </button>

        <button id="btnVolver1a" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
    
               

              <br />
 
                    


               </div>

      
        


</div>


          <script type="text/javascript">

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
              function LimpiarFrma() {


                  $('#Main_Puestos_TxtNombre').val('');
                  $('#Main_Puestos_TxtDescripcion').val('');

                  $('#btnGuardar1a').attr("class", "btn2 btn-primary");

              }
              function deshabilitarFrma() {

                  $('#Main_Puestos_TxtNombre').prop('disabled', true);
                  $('#Main_Puestos_TxtDescripcion').prop('disabled', true);

                  if ($("#Main_Puestos_HiddenField1").val() == 'Alta') {
                      LimpiarFrma();
                  }
              }


              function habilitarFrma() {

                  $('#Main_Puestos_TxtNombre').prop('disabled', false);
                  $('#Main_Puestos_TxtDescripcion').prop('disabled', false);


              }

              function deshabilitara() {

                  $('#btnAgregar1a').prop('disabled', true);
                  $('#btnModificar1a').prop('disabled', true);
                  $('#btnElimina1a').prop('disabled', true);
                  $('#btnGuardar1a').prop('disabled', true);
                  $('#btnCancelar1a').prop('disabled', true);




              }

              function habilitara() {

                  $('#btnAgregar1a').prop('disabled', false);
                  $('#btnModificar1a').prop('disabled', false);
                  $('#btnElimina1a').prop('disabled', false);
                  $('#btnGuardar1a').prop('disabled', false);
                  $('#btnCancelar1a').prop('disabled', false);
                  $("#Main_Puestos_HiddenField1").val('Cancelar');
              }

              function BtnAgregar1a() {
                  $("#Main_Puestos_LblMsg").text('')
                  LimpiarFrma();

                  $("#Main_Puestos_HiddenField1").val('Alta');

                  habilitarFrma();

                  $('#btnAgregar1a').prop('disabled', false);
                  $('#btnModificar1a').prop('disabled', true);
                  $('#btnElimina1a').prop('disabled', true);
                  $('#btnCancelar1a').prop('disabled', false);

                  $('#btnGuardar1a').prop('disabled', false);

                  $('#btnGuardar1a').attr("class", "btn2 btn-danger");

              }

              function BtnCancelar1a() {
                  $("#Main_Puestos_LblMsg").text('')
                  deshabilitarFrma();
                  $("#Main_Puestos_HiddenField1").val('Cancelar');

                  $('#btnAgregar1a').prop('disabled', false);
                  $('#btnModificar1a').prop('disabled', false);
                  $('#btnElimina1a').prop('disabled', false);
                  $('#btnCancelar1a').prop('disabled', false);

                  $('#btnGuardar1a').prop('disabled', false);

                  $('#btnGuardar1a').attr("class", "btn2 btn-primary");

              }

              function BtnFnModificar1a() {
                  if ($("#Main_Puestos_TxtId").val() != '') {
                      $("#Main_Puestos_LblMsg").text('')
                      $("#Main_Puestos_HiddenField1").val('Modificar');
                      habilitarFrma();

                      $('#btnAgregar1a').prop('disabled', true);
                      $('#btnModificar1a').prop('disabled', false);
                      $('#btnElimina1a').prop('disabled', true);
                      $('#btnCancelar1a').prop('disabled', false);
                      $('#btnGuardar1a').prop('disabled', false);

                      $('#btnGuardar1a').attr("class", "btn2 btn-danger");
                  }
              }
              function BtnFnEliminar1a() {

                  if ($("#Main_Puestos_TxtId").val() != '') {

                      $("#Main_Puestos_LblMsg").text('¿ Desea Eliminar ? Presione Guardar para confirmar.  Registro ' + $("#Main_Puestos_TxtId").val())

                      $("#Main_Puestos_HiddenField1").val('Eliminar');

                      $('#btnAgregar1a').prop('disabled', true);
                      $('#btnModificar1a').prop('disabled', true);
                      $('#btnElimina1a').prop('disabled', false);
                      $('#btnCancelar1a').prop('disabled', false);
                      $('#btnGuardar1a').prop('disabled', false);

                      $('#btnGuardar1a').attr("class", "btn2 btn-danger");

                  }


              }
              function Exitoa() {

                  $("#Main_Puestos_HiddenField1").val("Cancelar");
                  LimpiarFrma();

                  //    $("#Main_Puestos_LblMsg").text('Se completo con éxito la transacción');

                  deshabilitarFrma();



              }

              function BtnFnGuardarPop1a() {

                  if($("#Main_Puestos_HiddenField1").val()=='Alta'){

                      $("#Main_Puestos_HiddenField1").val("Cancelar");

                      AltaJsa();

                      $('#ModalCat').modal('hide');
                      // esta funcion no esta aca  es la q cargar el combo en la pagina original
                      ListarPuestos();
                  }
              }


              function BtnFnGuardar1a() {
                  $("#Main_Puestos_LblMsg").text('')
                  var Op = '';
                  Op = $("#Main_Puestos_HiddenField1").val();


                  switch (Op) {
                      case 'Alta':
                          $("#Main_Puestos_HiddenField1").val("Cancelar");

                          AltaJsa()

                          // $("#Main_Puestos_btnAgregar").click();

                          Exitoa();


                          break;

                      case 'Eliminar':
                          $("#Main_Puestos_HiddenField1").val("Cancelar");

                          EliminarJsa();

                          //$("#Main_Puestos_btnEliminar").click();

                          Exitoa();
                          break;
                      case 'Modificar':
                          $("#Main_Puestos_HiddenField1").val("Cancelar");

                          ModificarJsa();
                          // $("#Main_Puestos_btnModificar").click();
                          Exitoa();

                          break;
                      case 'Cancelar':

                          break;

                  }

              }

</script>


        <script type="text/javascript">
            $(function () {
                //$(".campoFecha").mask("99/99/9999");
                //$('#tabs').tabs();

                habilitara();
                deshabilitarFrma();
              //  LimpiarFrma();

                $('#btnGuardarPopa').hide();

                var TipoOp = getUrlParameter('TipoOpA');
                
                if (TipoOp == "Add") {
                    $('#btnModificar1a').hide();
                    $('#btnElimina1a').hide();

                    

                } else {
                    $('#btnModificar1a').show();
                    $('#btnElimina1a').show();
                    // para pop up
                    $('#btnGuardarPopa').show();
                    $('#btnGuardar1a').hide();
                    $('#btnVolver1a').hide();
                }


                if (TipoOp == "Ver") {
                    $('#btnAgregar1a').hide();
                    $('#btnVolver1a').show();
                    
                }

                if ($("#Main_Puestos_TxtId").val() == '') {

                    $('#btnModificar1a').hide();
                    $('#btnElimina1a').hide();

                } else {
                    $('#btnModificar1a').show();
                    $('#btnElimina1a').show();

                    $('#btnGuardarPopa').hide();
                    $('#btnGuardar1a').show();
                }

            });

            function ModificarJsa() {
                try {
                   
                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {
                            "Id": $("#Main_Puestos_TxtId").val(),
                            "Nombre": $("#Main_Puestos_TxtNombre").val(),
                            "Descripcion": $("#Main_Puestos_TxtDescripcion").val()
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Puesto_per.aspx/WmModificar2P",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: Modificado_Completoa,
                        error: erroresA
                    });

                } catch (e) {
                    alert(e.message);
                }
            }
            function AltaJsa() {
               
                var json = JSON.stringify
                ({

                    "V_nombre": $("#Main_Puestos_TxtNombre").val(),
                    "V_Descripcion": $("#Main_Puestos_TxtDescripcion").val()
                });

                $.ajax({
                    type: "POST",
                    url: "Puesto_per.aspx/WmAltaP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Alta_Completoa,
                    error: erroresA
                });

            }
            function EliminarJsa() {

                var json = JSON.stringify
                ({
                    "Ids": $("#Main_Puestos_TxtId").val()

                });

                $.ajax({
                    type: "POST",
                    url: "Puesto_per.aspx/WmEliminarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Quitar_Completoa,
                    error: erroresA
                });

            }

            function Alta_Completoa() {
                alert("Registro dado de alta");
            }

            function Modificado_Completoa() {
                alert("Registro completo");
            }
            function Quitar_Completoa() {
                alert("Registro Eliminado");
            }

            function erroresA(msg) {
                var jsonObj = JSON.parse(msg.responseText);
                alert('Error: ' + jsonObj.Message);
            }


        </script>

