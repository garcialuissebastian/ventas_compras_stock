<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnPersonal.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Horarios.aspx.cs" Inherits="HardSoft.App.Personal.Horarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       <link href="../../css/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
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
    </style>

     <div class=" container" style="margin-top: 36px;">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Ver Horarios        </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
       <strong>     Horarios </strong> 
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
          <option value="0">Nombre</option>
           
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


       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                   <ContentTemplate> 
           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      
       </div>     
        
     <style>
         .textColor {
             background-color: azure;
         }
     </style>

<div class="row"  style="margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       
    <div class="col-xs-12">
        <div class="form-horizontal">   
            
                 
           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> <strong>Nombre Horario</strong></label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control  textColor"  Width="100%" ></asp:TextBox>
      
         </div>
           
     </div>   
    
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"><strong> Hora Entrada</strong></label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtEntrada" runat="server" class="campoHora required form-control textColor"  Width="62" ></asp:TextBox>
      
         </div>
     
         <label for="TxtNombre" class="control-label col-xs-4"><strong>Hora Salida</strong></label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtSalida" runat="server" class="campoHora required form-control textColor"  Width="62" ></asp:TextBox>
      
         </div>
           
     </div>  

  
        <div style="  background-color: aliceblue;
    text-align: left;
    font-weight: 600;">    <span id='idatr_cor' onclick='Ver_det()' class=' glyphicon glyphicon-plus' style="  margin-right: 5px;cursor:pointer;float:left"></span>
         Ver detalle
             </div> 
            <hr />
            <script>
                function Ver_det() {
                    if ($("#idatr_cor").hasClass("glyphicon-plus")) {
                        $("#idatr_cor").removeClass("glyphicon-plus");
                        $("#idatr_cor").addClass("glyphicon-minus");
                        $("#detVer").show('fade');
                    } else {
                        $("#idatr_cor").removeClass("glyphicon-minus");
                        $("#idatr_cor").addClass("glyphicon-plus");

                        $("#detVer").hide('fade');
                    }
                }
            </script>
            <div id="detVer" style="display:none">
             <div class="form-group">


         <label for="TxtNombre" class="control-label col-xs-4">MARGEN LLEGA 
TARDE (MINS)</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtTarde" runat="server" class="form-control required2"  Width="62"  onKeyPress="return acceptNum(event)"  ></asp:TextBox>
      
             <div  style="display:none">
                 <asp:TextBox ID="TxtTarde1" runat="server" class="form-control "  ></asp:TextBox>
  
             </div>
         </div>


                     <label for="TxtNombre" class="control-label col-xs-4">MARGEN LLEGA 
TEMPRANO (MINS)</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtTemprano" runat="server" class="  form-control required2" Width="62" onKeyPress="return acceptNum(event)"   ></asp:TextBox>
      
             <div  style="display:none">
                 <asp:TextBox ID="TxtTemprano1" runat="server" class="form-control "  ></asp:TextBox>
  
             </div>
         </div>
           
     </div>  
    
  
    <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">COMIENZO 
ENTRADA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtComienzoEntrada" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
         <div  style="display:none">
                 <asp:TextBox ID="TxtComienzoEntrada1" runat="server" class="form-control "  ></asp:TextBox>
  
             </div>
         </div>
           
     
         <label for="TxtNombre" class="control-label col-xs-4">FIN 
ENTRADA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtFinEntrada" runat="server" class="campoHora required form-control"  Width="62"    ></asp:TextBox>
        <div  style="display:none">
                 <asp:TextBox ID="TxtFinEntrada1" runat="server" class="form-control "  ></asp:TextBox>
  
             </div>
         </div>
           
     </div>   
  
           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">COMIENZO 
SALIDA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtComienzoFin" runat="server" class="campoHora required form-control"  Width="62"  ></asp:TextBox>
         <div  style="display:none">
                 <asp:TextBox ID="TxtComienzoFin1" runat="server" class="form-control "  ></asp:TextBox>
  
             </div>
         </div>
           
     
         <label for="TxtNombre" class="control-label col-xs-4">FIN 
SALIDA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtFinSalida" runat="server" class="campoHora required form-control"  Width="62"   ></asp:TextBox>
        <div  style="display:none">
                 <asp:TextBox ID="TxtFinSalida1" runat="server" class="form-control "  ></asp:TextBox>
  
             </div>
         </div>
           
     </div>   
   
         
                    <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">¿MARCA ENTRADA?
</label>
         <div class="col-xs-2">

 
             <asp:CheckBox ID="CkMkEnt" runat="server"  CssClass=" form-control"/>
         </div>
           
     
         <label for="TxtNombre" class="control-label col-xs-4">¿MARCA SALIDA?
 </label>
         <div class="col-xs-2">

  <asp:CheckBox ID="CkMkSal" runat="server"  CssClass=" form-control"/>
      
         </div>
           
     </div> 
                  </div>
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
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:TextBox ID="TxtIds" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar</button>

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
    
    
    </ContentTemplate></asp:UpdatePanel>
    
      <script>
          $(function () {
              Cfg();
          });
         
        

          function PopMod(id) {
            
               
              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();

              $("#TituloPop").text('Modificar Horario');
              $("#ModalCat").modal();
              
              $("#Main_TxtIds").val(id);
              var json = JSON.stringify
        ({
            "v_Id": id

        });

              $.ajax({
                  type: "POST",
                  url: "Horarios.aspx/WsBuscarP",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (result) {

                      if (result.d != null) {

                          $("#Main_TxtNombre").val(result.d.schName);
                          $("#Main_TxtEntrada").val(result.d.StartTime);
                          $("#Main_TxtSalida").val(result.d.EndTime);

                          $("#Main_TxtTarde").val(result.d.LateMinutes);
                          $("#Main_TxtTemprano").val(result.d.EarlyMinutes);
 
                          $("#Main_TxtComienzoEntrada").val(result.d.CheckInTime1);
                          $("#Main_TxtFinEntrada").val(result.d.CheckInTime2);

                          $("#Main_TxtComienzoFin").val(result.d.CheckOutTime1);
                          $("#Main_TxtFinSalida").val(result.d.CheckOutTime2);
                          $("#Main_CkMkEnt").prop("checked", false);
                          $("#Main_CkMkSal").prop("checked", false);
                          if (result.d.CheckIn == '1') {
                              $("#Main_CkMkEnt").prop("checked", true);
                          }
                          if (result.d.CheckOut == '1') {
                              $("#Main_CkMkSal").prop("checked", true);
                          } 
                          
                      }
                  },

                  error: errores
              });


          }

         
          function PopCat() {
             
              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();
              
              $("#TituloPop").text('Modificar Rubro');
              $("#ModalCat").modal();
          }

     
          Date.prototype.addHours = function (h) {
              this.setHours(this.getHours() + h);
              return this;
          }
 

          $("#Main_TxtEntrada").change(function () {

              if ($("#Main_TxtEntrada").val() == '') {
                  $("#Main_TxtComienzoEntrada").val('00:00');
                  $("#Main_TxtFinEntrada").val('00:00');
              } else {
                  var today = new Date();
                  var todayS = new Date();

                  today.setHours($("#Main_TxtEntrada").val().substr(0, 2));
                  today.setMinutes($("#Main_TxtEntrada").val().substr(3, 2));

                  todayS.setHours($("#Main_TxtEntrada").val().substr(0, 2));
                  todayS.setMinutes($("#Main_TxtEntrada").val().substr(3, 2));


                  var tomorrow = new Date();
                  var EntSal = new Date();

                  tomorrow.setMinutes(today.getMinutes() - parseInt( $("#Main_TxtComienzoEntrada1").val().substr(3, 2)));
                  tomorrow.setHours(today.getHours() -  parseInt($("#Main_TxtComienzoEntrada1").val().substr(0, 2)));

               var   s_s = 0;
               var   s_h = 0;

               s_s = parseInt( $("#Main_TxtFinEntrada1").val().substr(3, 2));
               s_h =parseInt(  $("#Main_TxtFinEntrada1").val().substr(0, 2));

               EntSal.setMinutes(todayS.getMinutes() + s_s);
               EntSal.setHours(todayS.getHours() + s_h);
 

                  $("#Main_TxtComienzoEntrada").val(lpad(tomorrow.getHours(), 2) + ':' + lpad(tomorrow.getMinutes(), 2));
                  $("#Main_TxtFinEntrada").val(lpad(EntSal.getHours(), 2) + ':' + lpad(EntSal.getMinutes(), 2));

                  if (parseInt($("#Main_TxtEntrada").val().substr(0, 2)) >= 24) {
                      $("#Main_TxtEntrada").val('00:00');
                      $("#Main_TxtComienzoEntrada").val('00:00');
                      $("#Main_TxtFinEntrada").val('00:00');
                  }


              }
              
              
          })


          $("#Main_TxtSalida").change(function () {

              if ($("#Main_TxtSalida").val() == '') {

                  $("#Main_TxtComienzoFin").val('00:00');
                  $("#Main_TxtFinSalida").val('00:00');

              } else {
                  var today = new Date();
                  var todayS = new Date();

                  today.setHours($("#Main_TxtSalida").val().substr(0, 2));
                  today.setMinutes($("#Main_TxtSalida").val().substr(3, 2));

                  todayS.setHours($("#Main_TxtSalida").val().substr(0, 2));
                  todayS.setMinutes($("#Main_TxtSalida").val().substr(3, 2));


                  var tomorrow = new Date();
                  var EntSal = new Date();

                  // si es '00:00' empieza cuando termina la entrada

                  if ($("#Main_TxtComienzoFin1").val() != '00:00') { 
                      tomorrow.setMinutes(today.getMinutes() - parseInt($("#Main_TxtComienzoFin1").val().substr(3, 2)));
                      tomorrow.setHours(today.getHours() - parseInt($("#Main_TxtComienzoFin1").val().substr(0, 2)));
                      $("#Main_TxtComienzoFin").val(lpad(tomorrow.getHours(), 2) + ':' + lpad(tomorrow.getMinutes(), 2));
                  } else {
                      $("#Main_TxtComienzoFin").val($("#Main_TxtFinEntrada").val());
                  }

                  var s_s = 0;
                  var s_h = 0;

                  s_s = parseInt($("#Main_TxtFinSalida1").val().substr(3, 2));
                  s_h = parseInt($("#Main_TxtFinSalida1").val().substr(0, 2));

                  EntSal.setMinutes(todayS.getMinutes() + s_s);
                  EntSal.setHours(todayS.getHours() + s_h);


                 
                  $("#Main_TxtFinSalida").val(lpad(EntSal.getHours(), 2) + ':' + lpad(EntSal.getMinutes(), 2));

                  if (parseInt($("#Main_TxtSalida").val().substr(0, 2)) >= 24) {
                      $("#Main_TxtFinSalida").val('00:00');
                      $("#Main_TxtSalida").val('00:00');                      
                  }


              }


          })

          function PopAlta() {

             
              $("#Main_TxtEntrada").val('00:00');


          
            



              $("#Main_CkMkSal").prop("checked", true);
              $("#Main_CkMkEnt").prop("checked", true);
          
              $("#Main_TxtNombre").val('');
              $("#Main_TxtEntrada").val('00:00');
              $("#Main_TxtSalida").val('00:00');

              $("#Main_TxtTarde").val($("#Main_TxtTarde1").val());
              $("#Main_TxtTemprano").val($("#Main_TxtTemprano1").val());

              $("#Main_TxtComienzoEntrada").val('00:00');
              $("#Main_TxtFinEntrada").val('00:00');

              $("#Main_TxtComienzoFin").val('00:00');
              $("#Main_TxtFinSalida").val('00:00');


 
              $("#btnAgregar1a").hide();
              $("#btnGuardar1a").show();

              $("#TituloPop").text('Alta de Horario');
              $("#ModalCat").modal();

          }



          function Buscar() {

              try {


                  //   alert( $('#cmbTipoOp').val() );

                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                        "v_tipo": $('#cmbTipoOp').val(),
                        "v_valor": $('#Main_TxtBuscar').val()

                    });
                  $.ajax({
                      type: "POST",
                      url: "Horarios.aspx/WsListar",
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



          function CargarVer(Ids) {
              $(location).attr("href", "Personal.aspx?Idsp=" + Ids);
          }

          function resultado(Resultado) {
              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = "";

              $("#Resultado").show();
              $("#Resultado").empty();
              Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th> <th>Nombre Horario</th><th>Hora Entrada</th><th>Hora Salida</th><th>Margen llega <br/>Tarde (Mins)</th><th>Margen llega <br/>Temprano (Mins)</th><th>Comienzo <br/> Entrada</th><th>Fin <br/> Entrada</th><th>Comienzo <br/> Salida</th><th>Fin <br/> Salida</th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod(" + pacientes.schClassid + ");' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td><td style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.schClassid + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td><td>" + pacientes.schName + "</td><td>" + pacientes.StartTime + "</td><td>" + pacientes.EndTime + "</td><td>" + pacientes.LateMinutes + "</td><td>" + pacientes.EarlyMinutes + "</td><td>" + pacientes.CheckInTime1 + "</td><td>" + pacientes.CheckInTime2 + "</td><td>" + pacientes.CheckOutTime1 + "</td><td>" + pacientes.CheckOutTime2 + "</td></tr>";
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


          $(function () {
              $(".campoHora").mask("99:99");
          });
          var table = document.getElementById("grilla");

          function gvProDel(ids) {

              $("#Main_TxtIds").val(ids);
              if (confirm("Esta seguro que desea eliminar un horario ?")) {
                  $("#Main_Button1").click();
                  Buscar();
              }
          }
          function gvDel(ids) {
              try {
                  if (confirm("Esta seguro que desea eliminar el registro ?")) {

                      var json = JSON.stringify
                        ({
                            "v_Id": ids
                        });
                      $.ajax({
                          type: "POST",
                          url: "MiPage.aspx/WmGvDel",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function (Result) {
                              Buscar();
                          }),
                          error: erroresJs
                      });
                  } 
              } catch (e) {
                  alert(e);
              } 
          }
    
          function AltaJs() {
              try {


                  $('input.required').each(function () {                     

                      if ($(this).val() == '') {
                          $(this).val('00:00');
                      }
                  });
                  $('input.required2').each(function () {

                      if ($(this).val() == '') {
                          $(this).val('0');
                      }
                  });
                  var ent = '0';
                  var sal = '0';
                  if ($("#Main_CkMkEnt").is(':checked')) {
                      ent = '1'
                  }
                  if ($("#Main_CkMkSal").is(':checked')) {
                      sal = '1';
                  }

                  if ($("#Main_TxtNombre").val() != '') {

                      var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                      ({
                          // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                          "v_obj": {
                              "Id": '0',
                              "schName":$("#Main_TxtNombre").val(),
                              "StartTime":$("#Main_TxtEntrada").val(),
                              "EndTime": $("#Main_TxtSalida").val(),
                              "LateMinutes":  $("#Main_TxtTarde").val(),
                              "EarlyMinutes":$("#Main_TxtTemprano").val(), 
                              "CheckInTime1":  $("#Main_TxtComienzoEntrada").val(),
                              "CheckInTime2":  $("#Main_TxtFinEntrada").val(),
                              "CheckOutTime1" :$("#Main_TxtComienzoFin").val(),
                              "CheckOutTime2": $("#Main_TxtFinSalida").val(),
                              "WorkMins": "0",
                              "WorkDay": "0.5",
                              "AutoBind": "1",
                              "Color": "8404992",
                              "CheckIn": ent,
                              "CheckOut": sal,
                          }
                      });

                      $.ajax({
                          type: "POST",
                          url: "Horarios.aspx/WmAlta2",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: Modificado_Completo,
                          error: errores
                      });
                  } else {
                      $("#Main_TxtNombre").focus();
                      alert('Ingrese un Nombre para el horario.');

                  }
              } catch (e) {
                  alert('Verifique que los horarios sean los corretos, '+e.message);
              }
          }



          function Cfg() {

              try {

                  var json = JSON.stringify
                    ({

                    });
                  //$.ajax({
                  //    type: "POST",
                  //    url: "Turnos.aspx/WsCfg",
                  //    data: '',
                  //    contentType: "application/json; charset=utf-8",
                  //    dataType: "json",
                  //    success: (function (Resultado) {
                  //        var Pacientes = Resultado.d;


                  //        $.each(Pacientes, function (index, pacientes) {


                  //            if (pacientes.descripcion == 'margenTarde') {
                  //                $("#Main_TxtTarde").val(pacientes.valor);
                  //            }
                  //            if (pacientes.descripcion == 'margenTemprana') {
                  //                $("#Main_TxtTemprano").val(pacientes.valor);
                  //            }


                  //        });

                  //    }),


                      $.ajax({
                          type: "GET",
                          url: "Config.json",
                          data: '',
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function (Resultado) {
                              var Pacientes = Resultado;

                             
                              $.each(Pacientes, function (index, pacientes) {
                                  
                                  //if (pacientes.descripcion == 'margenTarde') {
                                  //    $("#Main_TxtTarde").val(pacientes.valor);
                                  //}
                                  //if (pacientes.descripcion == 'margenTemprana') {
                                  //    $("#Main_TxtTemprano").val(pacientes.valor);
                                  //}

                                  
                                  if (pacientes.id == '1') {
                                   
                                      $("#Main_TxtTarde1").val(pacientes.valor);
                                  }
                                  if (pacientes.id == '2') {
                                      
                                      $("#Main_TxtTemprano1").val(pacientes.valor);
                                  }


                                  if (pacientes.id == '3') {
                                      $("#Main_TxtComienzoEntrada1").val(pacientes.valor);
                                  }
                                  if (pacientes.id == '4') {
                                      $("#Main_TxtFinEntrada1").val(pacientes.valor);
                                  }
                                  if (pacientes.id == '5') {
                                      $("#Main_TxtComienzoFin1").val(pacientes.valor);
                                  }
                                  if (pacientes.id == '6') {
                                      $("#Main_TxtFinSalida1").val(pacientes.valor);
                                  }


                              });

                          }),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }


          function ModificarJs() {
              try {
                  var ent = '0';
                  var sal = '0';
                  if ($("#Main_CkMkEnt").is(':checked')) {
                      ent = '1'
                  }
                  if ($("#Main_CkMkSal").is(':checked')) {
                      sal = '1';
                  }
                  
                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": {

                          "schClassid": $("#Main_TxtIds").val(),
                          "schName": $("#Main_TxtNombre").val(),
                          "StartTime": $("#Main_TxtEntrada").val(),
                          "EndTime": $("#Main_TxtSalida").val(),
                          "LateMinutes": $("#Main_TxtTarde").val(),
                          "EarlyMinutes": $("#Main_TxtTemprano").val(),
                          "CheckInTime1": $("#Main_TxtComienzoEntrada").val(),
                          "CheckInTime2": $("#Main_TxtFinEntrada").val(),
                          "CheckOutTime1": $("#Main_TxtComienzoFin").val(),
                          "CheckOutTime2": $("#Main_TxtFinSalida").val(),

                          "CheckIn": ent,
                          "CheckOut": sal,

                          "Color": '8404992',
                          "AutoBind": '1',
                          "WorkDay": '0.5',
                          "WorkMins": '0'
                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Horarios.aspx/WmModificar2",
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

         

          function lpad(n, width, z) {
              z = z || '0';
              n = n + '';
              return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
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
                          window.location.href = "../../Login_hosp.aspx";
                          
                      }
                  });


              });




              function VerifySessionState(result) {
                  $("#miLoader").show();
                  if (!result.d) {

                      window.location.href = "../../Login_hosp.aspx";
                  }
              }

              //fin de ready

          });

      </script>
   
</asp:Content>
