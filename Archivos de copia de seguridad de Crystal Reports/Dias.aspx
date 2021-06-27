<%@ Page Title="" Language="C#" Culture="Auto" UICulture="Auto"  MasterPageFile="~/App/Master/HomeOnPersonal.Master" AutoEventWireup="true" CodeBehind="Dias.aspx.cs" Inherits="HardSoft.App.Personal.Dias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

     <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

   <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
 
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
    </style>

     <div class=" container" style="margin-top: 36px;">  
         
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Ver Feriados        </li>
                                </ol>
        </nav>
 
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
       <strong>  Días no laborables</strong> 
            </div>


          <div class="">
       
  <div   style="margin-top:5px; background-color:#333; color:white; font-weight:800; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >
     FERIADOS
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

                 
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
          
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

   <button id="btnnuevo" type="button" class="btn2  btn-primary  "  onclick="ver()" >
      Nuevo <span class=" glyphicon "></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />
    </div>





        </div>

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

                  <div  class="row" style="padding:20px;
 
margin-top:15px;
color: #333;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;">

 


<div class="row">
          <div class="col-md-12" >


         <div class="form-horizontal" role="form" style=" font-size:20px">
       
             
 
         <div class="form-group">
         <label for="inputName" class="control-label col-xs-4"  >Descripción</label>
         <div class="col-xs-4">
         
             <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control"></asp:TextBox>
              
              </div>
        <div class="col-xs-4">
    
     </div>
     </div>

 
                   <div class="form-group">
         <label for="Fax" class="control-label col-xs-4">Fecha </label>
         <div class="col-xs-8">
           
                  <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtFechaIngreso" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="https://arquivirtual.quilmes.gov.ar/municipal/img/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaIngreso"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 

         </div>          
     </div> 
 

             

 
         </div>



          </div>
</div>
  
    <div style="display:none">
             <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
                    

                     <asp:Button ID="BtnCanc" runat="server" Text="btnCan" OnClick="BtnCanc_Click" />
        <asp:Button ID="btnAlta" runat="server" Text="btnCan" OnClick="BtnAlta_Click" />

             </div>
            

 <div class="row">
              <asp:Label ID="Msg1" runat="server" Text="" CssClass="alert-danger"></asp:Label>

          </div>

  </div>

    
<div class="row">

<div  id="LblError" class="alert alert"> </div>
</div>

                    <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
           

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>


        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

        
    
               

              <br />
               


               </div>

            </div></div></div></div>


     

      <script>
          $(document).ready(function () {


              $(".campoFecha").mask("99/99/9999");
              Buscar();
          });

          function ver() {
              $("#ModalCat").modal();


          }

          function PopMod(ids) {

              if (confirm("Esta seguro que desea eliminar la fecha?")) {
                  $("#Main_TxtId").val(ids);
                  $("#Main_BtnCanc").click();
              }

          }


          function AltaJs() {
              if ($("#Main_txtDesc").val() != '') {
                  $("#Main_btnAlta").click();
              } else {
                  alert('Ingrese la descripcion.');
              }
          }
          function Buscar() {

              try {


                  //   alert( $('#cmbTipoOp').val() );


                  var json = JSON.stringify
                    ({



                    });
                  $.ajax({
                      type: "POST",
                      url: "dias.aspx/WsListar",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: resultado01,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
              function errores(msg) {
                  var jsonObj = JSON.parse(msg.responseText);
                  alert('Error: ' + jsonObj.Message);
              }

              function resultado01(Resultado) {
                  var Pacientes = Resultado.d;
                  var Tabla_Titulo = "";

                  var Tabla_Datos = "";
                  var Tabla_Fin = "";

                  $("#Resultado").show();
                  $("#Resultado").empty();
                  Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th></th><th>Fecha</th><th>Descripcion</th> </tr></thead><tbody>";
                  $.each(Pacientes, function (index, pacientes) {
                      Tabla_Datos = Tabla_Datos + "<tr > <td style='width:30px'> <a class='tooltips' onclick='PopMod(" + pacientes.id + ");' > <img src='https://arquivirtual.quilmes.gov.ar/municipal/img/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.fecha + "</td><td>" + pacientes.NOMBRE + "</td> </tr>";

                  });

                  Tabla_Fin = "</tbody></table>";
                  $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                  fn_cantidad();

              }
              function fn_cantidad() {
                  cantidad = $("#grilla tbody").find("tr").length;
                  $("#span_cantidad").html(cantidad);
              };



          }


          var today = new Date();
          var dd = today.getDate();
          var mm = today.getMonth() + 1; //January is 0!

          var yyyy = today.getFullYear();
          if (dd < 10) {
              dd = '0' + dd;
          }
          if (mm < 10) {
              mm = '0' + mm;
          }
          var today = dd + '/' + mm + '/' + yyyy;
          document.getElementById("Main_TxtFechaIngreso").value = today;

          $(document).ready(function () {


              $(".campoFecha").mask("99/99/9999");

          });



          function aceptar2() {
              var isValid = false;
              Page_ClientValidate("grupo");

              if ($('#Main_txtMail').val() != '' || $('#Main_txtMail2').val() != '') {


                  if (Page_IsValid) {


                      if ($('#Main_txtMail').val() == $('#Main_txtMail2').val()) {


                          var isValid = true;
                          $('#myModal').modal('hide');

                      } else {

                          alert('Los Mails no coiciden');



                      }






                  }
                  else {
                      alert('Mail no valido');


                  }
              } else { alert('Los campos son obligatorios'); }


              if (isValid) {

                  $("#Main_BtnMail").click();
              }


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
