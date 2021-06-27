<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" enableEventValidation="false"  CodeBehind="Producto_categoria.aspx.cs" Inherits="HardSoft.App.Ralkal.Producto_categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
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


    
       
    <div class=" container" style="margin-top:0px;text-transform:uppercase" >
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                     Categoria de productos             </li>
                                </ol>
        </nav>
       
        
        <div class="alert alert-success">
          Administración de categoria de productos
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


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="BtnAgregar1()" >
    <span class=" glyphicon glyphicon-save"></span> Agregar 
 </button>
    <button  id="btnModificar1" type="button" class="btn2 btn-default  " onclick="BtnFnModificar1()">
    <span class="  glyphicon  glyphicon-pencil"></span> Modificar
  </button>
 
  <button id="btnElimina1" type="button" class="btn2  btn-default "  onclick="BtnFnEliminar1()">
    <span class=" glyphicon glyphicon-trash"></span> Eliminar
  </button>
        
               <button id="btnCancelar1" type="button" class="btn2  btn-default " onclick="BtnCancelar1()">
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cancelar
  </button>
 
 <button id="btnGuardar1" type="button" class="btn2 btn-primary"  onclick="BtnFnGuardar1()" >
    <span class="   glyphicon glyphicon-floppy-disk"></span> Guardar
  </button>

        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
    
               

              <br />
 
<div style="display:none">

             
         <asp:Button ID="btnAgregar" runat="server" Text="Agregar" onclick="bntAgregar_Click" CssClass="ImageButton1"  />
                                         
                                       
                                         
                                       
                                           <asp:Button ID="btnModificar" runat="server"    
                                             Text=" Modificar" onclick="btnModificar_Click"    />
                                                                                 
                                         
                                         <asp:Button ID="btnEliminar" runat="server"   
                                             Text="Baja" onclick="btnEliminar_Click" />

    <asp:Button ID="btnCancelar" runat="server"   Text="Cancelar" onclick="bntCancelar_Click" />
                                    
                                    
                                        <asp:Button ID="btnGuardar" runat="server"       Text="Guardar"   
                                             CssClass= "der" onclick="btnGuardar_Click"/>
                                 
                       </div>          
                      


               </div>

         <asp:updatepanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">
   <ContentTemplate>
<fieldset>      
    
 
     </fieldset>
</ContentTemplate>
 <Triggers>
     </Triggers>
 </asp:updatepanel> 
        


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
              function LimpiarFrm() {


                  $('#Main_TxtNombre').val('');
                  $('#Main_TxtDescripcion').val('');

                  $('#btnGuardar1').attr("class", "btn btn-primary");

              }
              function deshabilitarFrm() {

                  $('#Main_TxtNombre').prop('disabled', true);
                  $('#Main_TxtDescripcion').prop('disabled', true);
                   
                  if ($("#Main_HiddenField1").val() == 'Alta') {
                      LimpiarFrm();
                  }
              }


              function habilitarFrm() {

                  $('#Main_TxtNombre').prop('disabled', false);
                  $('#Main_TxtDescripcion').prop('disabled', false);
                  

              }

              function deshabilitar() {

                  $('#btnAgregar1').prop('disabled', true);
                  $('#btnModificar1').prop('disabled', true);
                  $('#btnElimina1').prop('disabled', true);
                  $('#btnGuardar1').prop('disabled', true);
                  $('#btnCancelar1').prop('disabled', true);




              }

              function habilitar() {

                  $('#btnAgregar1').prop('disabled', false);
                  $('#btnModificar1').prop('disabled', false);
                  $('#btnElimina1').prop('disabled', false);
                  $('#btnGuardar1').prop('disabled', false);
                  $('#btnCancelar1').prop('disabled', false);
                  $("#Main_HiddenField1").val('Cancelar');
              }
               
              function BtnAgregar1() {
                  $("#Main_LblMsg").text('')
                  LimpiarFrm();

                  $("#Main_HiddenField1").val('Alta');

                  habilitarFrm();

                  $('#btnAgregar1').prop('disabled', false);
                  $('#btnModificar1').prop('disabled', true);
                  $('#btnElimina1').prop('disabled', true);
                  $('#btnCancelar1').prop('disabled', false);

                  $('#btnGuardar1').prop('disabled', false);

                  $('#btnGuardar1').attr("class", "btn btn-danger");

              }

              function BtnCancelar1() {
                  $("#Main_LblMsg").text('')
                  deshabilitarFrm();
                  $("#Main_HiddenField1").val('Cancelar');

                  $('#btnAgregar1').prop('disabled', false);
                  $('#btnModificar1').prop('disabled', false);
                  $('#btnElimina1').prop('disabled', false);
                  $('#btnCancelar1').prop('disabled', false);

                  $('#btnGuardar1').prop('disabled', false);

                  $('#btnGuardar1').attr("class", "btn btn-primary");

              }

              function BtnFnModificar1() {
                  if ($("#Main_TxtId").val() != '') {
                      $("#Main_LblMsg").text('')
                      $("#Main_HiddenField1").val('Modificar');
                      habilitarFrm();

                      $('#btnAgregar1').prop('disabled', true);
                      $('#btnModificar1').prop('disabled', false);
                      $('#btnElimina1').prop('disabled', true);
                      $('#btnCancelar1').prop('disabled', false);
                      $('#btnGuardar1').prop('disabled', false);

                      $('#btnGuardar1').attr("class", "btn btn-danger");
                  }
              }
              function BtnFnEliminar1() {

                  if ($("#Main_TxtId").val() != '') {

                      $("#Main_LblMsg").text('¿ Desea Eliminar ? Presione Guardar para confirmar.  Registro ' + $("#Main_TxtId").val())

                      $("#Main_HiddenField1").val('Eliminar');

                      $('#btnAgregar1').prop('disabled', true);
                      $('#btnModificar1').prop('disabled', true);
                      $('#btnElimina1').prop('disabled', false);
                      $('#btnCancelar1').prop('disabled', false);
                      $('#btnGuardar1').prop('disabled', false);

                      $('#btnGuardar1').attr("class", "btn btn-danger");

                  }


              }
              function Exito() {

                  $("#Main_HiddenField1").val("Cancelar");
                  LimpiarFrm();

                  //    $("#Main_LblMsg").text('Se completo con éxito la transacción');

                  deshabilitarFrm();
                  

              }
              function BtnFnGuardar1() {
                  $("#Main_LblMsg").text('')
                  var Op = '';
                  Op = $("#Main_HiddenField1").val();


                  switch (Op) {
                      case 'Alta':
                          $("#Main_HiddenField1").val("Cancelar");

                          AltaJs();

                          // $("#Main_btnAgregar").click();

                          Exito();


                          break;

                      case 'Eliminar':
                          $("#Main_HiddenField1").val("Cancelar");

                          EliminarJs();

                          //$("#Main_btnEliminar").click();

                          Exito();
                          break;
                      case 'Modificar':
                          $("#Main_HiddenField1").val("Cancelar");

                          ModificarJs();
                          // $("#Main_btnModificar").click();
                          Exito();

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

                habilitar();
                deshabilitarFrm();

                var TipoOp = getUrlParameter('TipoOp');
                if (TipoOp == "Add") {
                    $('#btnModificar1').hide();
                    $('#btnElimina1').hide();
                } else {
                    $('#btnModificar1').show();
                    $('#btnElimina1').show();

                }



            });

            function ModificarJs() {
                try {                 

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                    // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                    "v_obj": {
                        "Id": $("#Main_TxtId").val(),
                        "Nombre": $("#Main_TxtNombre").val(),
                        "Descripcion": $("#Main_TxtDescripcion").val()
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "Producto_categoria.aspx/WmModificar2",
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
            function AltaJs() {

                var json = JSON.stringify
                ({
                   
                    "V_nombre": $("#Main_TxtNombre").val(),
                    "V_Descripcion": $("#Main_TxtDescripcion").val()
                });

                $.ajax({
                    type: "POST",
                    url: "Producto_categoria.aspx/WmAlta",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Alta_Completo,
                    error: errores
                });

            }
            function EliminarJs() {
               
                var json = JSON.stringify
                ({
                    "Ids": $("#Main_TxtId").val()
                    
                });

                $.ajax({
                    type: "POST",
                    url: "Producto_categoria.aspx/WmEliminar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Quitar_Completo,
                    error: errores
                });

            }

            function Alta_Completo() {
                alert("Registro dado de alta");
            }

            function Modificado_Completo() {
                alert("Registro completo");
            }
            function Quitar_Completo() {
                alert("Registro Eliminado");
            }

            function errores(msg) {
                var jsonObj = JSON.parse(msg.responseText);
                alert('Error: ' + jsonObj.Message);
            }

     
        </script>


         
  
      <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   

   
     
   
     

 


</asp:Content>