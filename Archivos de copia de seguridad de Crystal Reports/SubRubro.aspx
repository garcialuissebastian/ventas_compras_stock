<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="SubRubro.aspx.cs" Inherits="HardSoft.App.Kardex.SubRubros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       <link href="../../css/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    
       <script language="JavaScript" type="text/javascript">

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
         </script>
      <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    
     <div class=" container" style="margin-top: 36px;">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Ver Rubros         </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"   style="text-shadow: #969696 0.1em 0.1em 0.2em; ">
       <strong>  SUB  Rubros </strong> 
            </div>

          

        <div class="row" style="font-size:14px;">
        <div class="col-md-6">

   <div class="row" style="  margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:10px; margin-right: 0px;" > 
<div style="text-align:left" class="alert alert-info">RUBROS</div>

    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 280px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla'></table>

</div>
              </div>
     </div>
        </div>
    
        <div class="col-md-6">

   <div class="row" style="margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
         
        <div class="col-sm-12" style="margin-top:10px; margin-right: 0px;" > 
            <div style="text-align:left" class="alert alert-info">SUB RUBROS</div>
    <div id='Resultado2' style="overflow-y: auto; overflow-x: hidden; height: 280px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla2'></table>

</div>
              </div>
     </div>
        </div>
    </div>


        </div>


       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo SubRubro
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
          
               </div> <br />
   

         </div>

           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       <div class="col-xs-3">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>
       <div class="col-xs-6">
        <div class="form-horizontal">
         <div class="form-group" id="verId">
         <label for="TxtDescripcion" class="control-label col-xs-4">ID </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtIds" runat="server" class="form-control"    ></asp:TextBox>
      
         </div>
           
     </div>
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      
        
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Rubro </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtRubro" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>  
      
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Anulado</label>
         <div class="col-xs-8">

  <select id="cmbTipoAnulado" class="form-control">
          <option value="NO">NO</option>
          <option value="SI">SI</option>
       
      </select>
      
         </div>
           
     </div>
      
  
        
        </div>
          </div>
    <div class="col-xs-3">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>

      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar 
 </button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>


        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

        
    
               

              <br />
               


               </div>
             
      
        


</div>




              </div>
        
      </div>
      
    </div>
   
 </div>
      <script>
        
          $('#Main_TxtIds').prop('disabled', true);
          $('#Main_TxtRubro').prop('disabled', true);
          function PopCat() {
              $('#verId').show();
              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();
              
              $("#TituloPop").text('Modificar Sub Rubro ' + NombreR);
              $("#ModalCat").modal();
          }
          function PopAlta() {
              if ($("#Main_TxtRubro").val() != '') {
                  $('#verId').hide();
                  $('#Main_TxtIds').val('');
                  $('#Main_TxtNombre').val('');


                  $("#btnAgregar1a").hide();
                  $("#btnGuardar1a").show();

                  $("#TituloPop").text('Alta de Sub Rubro');
                  $("#ModalCat").modal();
              } else {
                  alert('Seleccione un Rubro');
              }

          }
          function Buscar() {

              try {
 
                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                        "v_tipo":'0',
                        "v_valor":''

                    });
                  $.ajax({
                      type: "POST",
                      url: "Rubros.aspx/WsListar",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: resultadoRubro,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }

          function BuscarSub(sub) {
           
              try {

                  
                  var json = JSON.stringify
                    ({
                        "v_sub": sub
                       

                    });
                  $.ajax({
                      type: "POST",
                      url: "SubRubro.aspx/WsListarSub",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: resultadoSub,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }




          function CargarVer(Ids) {
              $(location).attr("href", "Personal.aspx?Idsp=" + Ids);
          }

          function resultadoRubro(Resultado) {
              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = "";

              $("#Resultado").show();
              $("#Resultado").empty();
              Tabla_Titulo = "<table   id='grilla' class='table     table-striped' style='width: 100%;'><thead><tr><th>Id</th><th>Rubro</th><th>Tipo</th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr  onclick='llenarSub(this ," + pacientes.Id + " );'  style='cursor:pointer;'><td>" + pacientes.Id + "</td><td>" + pacientes.NombreRubro + "</td><td>" + pacientes.tipo_rubro + "</td></tr>";
                  
              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              
              
          }
          function resultadoSub(Resultado) {
              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = "";

              $("#Resultado2").show();
              $("#Resultado2").empty();
              Tabla_Titulo = "<table   id='grilla2' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>Codigo</th><th>Sub Rubro</th><th>Anulado</th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr onclick='row();'   style='cursor:pointer;'><td>" + pacientes.Id + "</td><td>" + pacientes.NombreSubRubro + "</td><td>" + pacientes.Anulado + "</td></tr>";
              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado2").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

            row('');
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
              Buscar();
              
          });
          var table = document.getElementById("grilla");
          var NombreR = '';
          function llenarSub( obj, sub ) {
              try {
                 
                  if ($(obj).hasClass('active')) {
                      $(obj).removeClass('active');
                  } else {
                      $(obj).addClass('active').siblings().removeClass('active');
                  }

                  $("#Main_TxtRubro").val(obj.cells[1].innerHTML);
                  $("#Main_TxtId").val(obj.cells[0].innerHTML);
                  
                  BuscarSub(sub);

              } catch (e) {

              }

          }
          function row() {
              
              table = document.getElementById("grilla2");
              if (table != null) {
                  for (var i = 1; i < table.rows.length; i++) {
                     
                          table.rows[i].onclick = function () {
                              //   alert((this).cells[0].innerHTML);
                              $('#Main_TxtIds').val((this).cells[0].innerHTML);
                              $('#Main_TxtIds').prop('disabled', true);
                              $('#Main_TxtNombre').val((this).cells[1].innerHTML);
                               
                              $('#cmbTipoAnulado').attr('selected', false);
                              $("#cmbTipoAnulado option[value=" + (this).cells[2].innerHTML + "]").attr("selected", true);

                              PopCat();
                          };
                  }
              }
          }
          function AltaJs() {
              try {

                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": {

                          "Id": '0',
                          "NombreSubRubro": $("#Main_TxtNombre").val(),
                          "Anulado": $("#cmbTipoAnulado").val(),
                          "Id_Rubro": $("#Main_TxtId").val()

                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "SubRubro.aspx/WmAlta2",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: Alta_Completo,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }
          function Alta_Completo() {
              BuscarSub($("#Main_TxtId").val());
              $("#ModalCat").modal('hide');
          }
          function ModificarJs() {
              try {

                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": {

                          "Id": $("#Main_TxtIds").val(),
                          "NombreSubRubro": $("#Main_TxtNombre").val(),
                          "Anulado": $("#cmbTipoAnulado").val(),
                          "Id_Rubro": ''
                        
                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "SubRubro.aspx/WmModificar2",
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
              BuscarSub($("#Main_TxtId").val());
              $("#ModalCat").modal('hide');
          }



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
                      window.location.href = "//www.hardsoft.com.ar/";

                  }
              });

          });

          function VerifySessionState(result) {
              $("#miLoader").show();
              if (!result.d) {

                  window.location.href = "//www.hardsoft.com.ar/";
              }
          }


    </script>
   
   
</asp:Content>
