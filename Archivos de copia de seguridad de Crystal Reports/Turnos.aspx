

<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnPersonal.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="HardSoft.App.Personal.Turnos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       
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
      <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

     <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
 
    <style>
        
      tr:hover td{background:#c7c7c7;}
         .table-hover>tbody>tr.active:hover>td, .table-hover>tbody>tr.active:hover>th, .table-hover>tbody>tr:hover>.active, .table-hover>tbody>tr>td.active:hover, .table-hover>tbody>tr>th.active:hover {
    background-color: #fbced7;
} 
                .selectDeb {
    zoom: 1.6;
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

     <div class=" container" style="margin-top: 36px;">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Ver Turnos        </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
       <strong>   Turnos  </strong> 
            </div>

         
 

 
 

        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >

           <asp:HiddenField ID="HddDia" runat="server" />
           <asp:HiddenField ID="HddTurno" runat="server" />
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


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta2()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />
   </div>

                <!-- Modal -->
  <div class="modal fade" id="ModalNEW" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro"  >
      <span id="tur"></span>
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       <div class="col-xs-3">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>
       <div class="col-xs-6">
        <div class="form-horizontal">

         
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombreTur" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      
           <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >Fecha Inicio</label>
         <div class="col-xs-6"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtNac" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtNac"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-2">  </div>
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
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField4" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModTurJsWS()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar 
 </button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaTurJs()"  >
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
         <!-- Modal -->
  <div class="modal fade" id="ModalHoras"  role="dialog" style="display:none" >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">
   <div class="row alert alert-negro" style="    margin: 10px;">
&nbsp &nbsp  <span id="tur2"></span>
   </div>
          
        <div class="form-horizontal">

         
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-3"  style="font-weight: 800;">    NOMBRE DEL TURNO </label>
         <div class="col-xs-4">

 <asp:TextBox ID="nombre1" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
               <div class="col-xs-5"></div>
           
     </div>
            </div>

       <div class="row alert alert-negro" style="    margin: 10px;">
        <div  class="col-lg-6" >
         &nbsp &nbsp  HORARIOS  
       </div>   
            <div   class="col-lg-6"  style="text-align:right">
     
      <a class="tooltips" id="addHs"  > 
   <img src="../../images/turno_Negro.png"  style="background-position:50%; background-repeat:no-repeat;cursor:pointer"><span>Nuevo Horario</span></a>
                
                
                 </div>   
</div> 
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;">
 
      <div class="col-xs-6" style="  margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
       
       <div id='ResultadoHoras' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
   
           </div>
    </div>  
    <div class="col-xs-6" style="min-height:232px; margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
        
         <div id='ResultadoDias' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
   
           </div>
    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <span class="alert-danger" id="Msg"></span>
    </div>
    
      <asp:HiddenField ID="HiddenField3" runat="server"   />
    <div style="display:none">
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1b" type="button" class="btn2 btn-default " onclick="ModificarJs('0')"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar</button>

       
  <button id="btnAgregar2b" type="button" class="btn2 btn-default " onclick="AltaTurJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar</button>

        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

        
    
               

              <br />
               


               </div>
         
</div> 
              </div>
        
      </div>
      
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

  
        <div onclick='Ver_det()' style="  background-color: aliceblue;
    text-align: left;
    font-weight: 600;">    <span id='idatr_cor'  class=' glyphicon glyphicon-plus' style="  margin-right: 5px;cursor:pointer;float:left"></span>
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

                 

       <button id="btnGuardar1b" type="button" class="btn2 btn-default " onclick="AltaJsHs('','')"  >
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
              $(".campoFecha").mask("99/99/9999"); 
              $(".campoHora").mask("99:99");
              BuscaHorarios();
              BuscaDias();
              $("#Msg").text("");
              Cfg();
          });
         
          function AltaJsHs(ids, name) {
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
                              "schName": $("#Main_TxtNombre").val(),
                              "StartTime": $("#Main_TxtEntrada").val(),
                              "EndTime": $("#Main_TxtSalida").val(),
                              "LateMinutes": $("#Main_TxtTarde").val(),
                              "EarlyMinutes": $("#Main_TxtTemprano").val(),
                              "CheckInTime1": $("#Main_TxtComienzoEntrada").val(),
                              "CheckInTime2": $("#Main_TxtFinEntrada").val(),
                              "CheckOutTime1": $("#Main_TxtComienzoFin").val(),
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
                          success: (function () {
                              BuscaHorarios();
                              alert('Horario Creado.!');
                              PopMod(ids, name);


                              $("#ModalCat").modal('hide');
                          }),
                          error: errores
                      });
                  } else {
                      $("#Main_TxtNombre").focus();
                      alert('Ingrese un Nombre para el horario.');

                  }
              } catch (e) {
                  alert('Verifique que los horarios sean los corretos, ' + e.message);
              }
           
          }

          $('#addHs').attr('onclick', 'PopAltaHs("","")');
          function PopMod(id, name) {
              $("#Msg").text("");
            

              if (id != 0) {
                  $("#tur2").text('MODIFICAR TURNO');
              $("#Main_nombre1").val(name);
              $("#btnAgregar1b").show();
              $("#btnAgregar2b").hide();
          }
             // document.getElementById('addHs').onclick = 'PopAltaHs(' + ids + ',\"' + name + '\")';
              $('#addHs').attr('onclick', 'PopAltaHs(' + id + ',\"' + name+ '\")');
              $('#btnGuardar1b').attr('onclick', 'AltaJsHs(' + id + ',\"' + name + '\")');
               
             
              cantidad = $("#grillaHs tbody").find("tr").length;
              
             
              for (var ei = 1; ei < cantidad +1 ; ei++) {
              
                  $("#" + ei).prop('checked', false);
              }
              
              for (var i = 1; i < 7 + 1; i++) {
                  
                  $("#d" + i).prop('checked', false);
              }

              $("#Main_HddTurno").val(id);
              var json = JSON.stringify
        ({
            "v_ids": id

        });

              $.ajax({
                  type: "POST",
                  url: "Turnos.aspx/WsListarDeil",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (result) {

                      if (result.d != null) {
                          var Pacientes = result.d;
                          $("#ModalHoras").modal();

                          var cant = 0;
                          $.each(Pacientes, function (index, pacientes) {
                              var mIds = 0;
                              for (var ei = 1; ei < cantidad + 1 ; ei++) {
                                  if ($("#" + ei).val() == pacientes.SCHCLASSID) {
                                      mIds = ei;
                                  }
                              }
                             
                              $("#" + mIds).prop('checked', true);
                              cant++;
                          });
                          if (cant>0) {
                              $("#ResultadoDias").hide();                          
                          }
                          
                         
                      }
                  },

                  error: errores
              });


          }

          function PopAlta2() {
            //  $("#ModalCat").modal('hide');
              //$("#ModalHoras").modal('hide');
              //$("#ResultadoDias").empty();
              //$("#ResultadoDias").show();
              BuscaDias();
              $("#Msg").text("");
              $("#tur2").text('ALTA TURNO');
              $("#ModalHoras").modal();
              $("#Main_nombre1").val('');
              
              $("#btnAgregar1b").hide();
              $("#btnAgregar2b").show();

              $('#addHs').attr('onclick', 'PopAltaHs(0,\"\")');

            //  $('#btnGuardar1b').attr('onclick', 'AltaJsHs(0,\"\")');

              cantidad = $("#grillaHs tbody").find("tr").length;

            
              for (var ei = 1; ei < cantidad + 1 ; ei++) {
              
                  $("#" + ei).prop('checked', false);
              }

              for (var i = 1; i < 7 + 1; i++) {

                  $("#d" + i).prop('checked', false);
              }
              
              var json = JSON.stringify
      ({
          "v_ids": 0

      });

              $.ajax({
                  type: "POST",
                  url: "Turnos.aspx/WsListarDeil",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (result) {

                      if (result.d != null) {
                          var Pacientes = result.d;
                          $("#ModalHoras").modal();

                          var cant = 0;
                          $.each(Pacientes, function (index, pacientes) {

                              $("#" + pacientes.SCHCLASSID).prop('checked', true);
                              cant++;
                          });
                          if (cant > 0) {
                              $("#ResultadoDias").hide();
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
    
          function BuscaHorarios() {

              try {


                  //   alert( $('#cmbTipoOp').val() );

                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                        "v_tipo":'0',
                        "v_valor": ''
                    });
                  $.ajax({
                      type: "POST",
                      url: "Turnos.aspx/WsListarHorarios",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {
                          var Pacientes = Resultado.d;
                          var Tabla_Titulo = "";
                          var Tabla_Datos = "";
                          var Tabla_Fin = "";
                          var ckHs = 0;
                          $("#ResultadoHoras").show();
                          $("#ResultadoHoras").empty();
                          Tabla_Titulo = "<table   id='grillaHs' class='   table-hover table-striped' style='width: 100%;    text-align: left;'><thead><tr><th></th>  <th>Nombre Horario</th></tr></thead><tbody>";
                          $.each(Pacientes, function (index, pacientes) {
                              ckHs++;
                              Tabla_Datos = Tabla_Datos + "<tr onclick='Popllenar(this," + pacientes.schClassid + ",\"" + pacientes.schName + "\")'  style=' cursor:pointer'>    <td>&nbsp  &nbsp <input type='checkbox' id='" + ckHs + "'    value='" + pacientes.schClassid + "'    class='selectDeb'    /></td><td>" + pacientes.schName + " (" + pacientes.StartTime + " - " + pacientes.EndTime + ")</td></tr>";
                          });

                          Tabla_Fin = "</tbody></table>";
                          $("#ResultadoHoras").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                         

                      }),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }

         
          function Popllenar(obj, ids, nom) {
              $("#Msg").text("");
              if ($(obj).hasClass('active')) {
                  $(obj).removeClass('active');
              } else {
                  $(obj).addClass('active').siblings().removeClass('active');
              }
              $("#Main_HddDia").val(ids);
              $("#diaTitulo").text('- ' + nom);
              
              for (var i = 1; i < 7+1; i++) {
                  $("#d" + i).prop('checked',false);
              }
              
              var json = JSON.stringify
                ({
                    "v_id": ids,
                   
                });
              $.ajax({
                  type: "POST",
                  url: "Turnos.aspx/WsListarHSck",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: (function(result){       
                      Pacientes = result.d;
                      var cant = 0;
                    

                      $.each(Pacientes.Dias, function (index, pacientes) {
                        
                          $("#d" + pacientes).prop('checked', true);

                         
                          cant++;
                      });
                      $("#ResultadoDias").show();
                      
                      cantidad = $("#grillaHs tbody").find("tr").length;

                      var mIds = 0;
                      for (var ei = 1; ei < cantidad + 1 ; ei++) { 
                          if ($("#" + ei).val() == ids) {
                              mIds = ei;
                          }
                      }


                      if ($("#"+mIds).is(':checked')) {
                          $("#ResultadoDias").show();
                      } else {
                          if(cant==0){
                      $("#ResultadoDias").hide();
                          } 
                      }

                  
                  }),
                  error: errores
              });

         

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

          function BuscaDias() {

              try { 
                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                         
                    });
                  $.ajax({
                      type: "POST",
                      url: "Turnos.aspx/WsListarDias",
                      data: '',
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {
                          var Pacientes = Resultado.d;
                          var Tabla_Titulo = "";
                          var Tabla_Datos = "";
                          var Tabla_Fin = "";

                          $("#ResultadoDias").show();
                          $("#ResultadoDias").empty();
                          Tabla_Titulo = "<table   id='grillaDia' class='   table-hover table-striped' style='width: 100%;    text-align: left;'><thead><tr><th></th>  <th>Día <span id='diaTitulo'></span></th></tr></thead><tbody>";
                          $.each(Pacientes, function (index, pacientes) {
                              Tabla_Datos = Tabla_Datos + "<tr >    <td>&nbsp  &nbsp <input type='checkbox' id='d" + pacientes.valor + "' value='" + pacientes.valor + "'    class='selectDeb'  onclick='cargarDia(" + pacientes.valor + ")'   /></td><td>" + pacientes.descripcion + "</td></tr>";
                          });

                          Tabla_Fin = "</tbody></table>";
                          $("#ResultadoDias").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                      }),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
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
                      url: "Turnos.aspx/WsListar",
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
              Tabla_Titulo = "<table   id='grillaTurnos' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th> <th>Nombre turno</th><th>Fecha comienzo</th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr >   <td style='width:30px'> <a class='tooltips' onclick='PopMod(" + pacientes.NUM_RUNID + ",\"" + pacientes.NAME + "\");' > <img src='/images/despertador.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td>  <td style='width:30px'> <a class='tooltips' onclick='gvProDel(" + pacientes.NUM_RUNID + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td><td>" + pacientes.NAME + "</td><td>" + pacientes.STARTDATE + "</td></tr>";
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
              cantidad = $("#grillaTurnos tbody").find("tr").length;
              $("#span_cantidad").html(cantidad);
          };
        
          var table = document.getElementById("grillaHs");
          var tableD = document.getElementById("grillaDia");
        
    
       
          function ModificarJs(ids) {
              try {
                  var json = JSON.stringify
                      ({
                          "v_ids": ids,
                          "v_name": $("#Main_nombre1").val()
                      });
                  $.ajax({
                      type: "POST",
                      url: "Turnos.aspx/WmModificar2",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (rr) {
                          Buscar();
                          $("#Msg").text("GUARDADO");
                      }),
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

          function gvProDel(ids) {
              try {
                  if (confirm("Esta seguro que desea eliminar el turnos ?")) {
                      var json = JSON.stringify
                       ({
                           "v_id": ids,

                       });
                      $.ajax({
                          type: "POST",
                          url: "Turnos.aspx/WmEliminar2",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function (rr) {

                              Buscar();
                          }),
                          error: errores
                      });
                  }
              } catch (e) {
                  alert(e.message);
              }
          }
          function Modificado_Completo() {
              Buscar();
              $("#ModalCat").modal('hide');
          }
          function cargarDia(ids) {
              var tt="restar";
              if ($("#d"+ids).is(':checked')) {
                  tt="sumar";
              }

              var json = JSON.stringify
                  ({
                      "v_hora": $("#Main_HddDia").val(), // hora
                      "v_dia": ids ,
                      "v_tipo":tt
                  });
              $.ajax({
                  type: "POST",
                  url: "Turnos.aspx/WsAddHSck",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: '',
                  error: errores
              });
          }

          function PopAlta() {
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
              
              $("#tur").text('NUEVO TURNO');
              $("#ModalNEW").modal();
              $("#btnAgregar1a").hide();

              $("#Main_TxtNombreTur").val('');
              $("#Main_TxtNac").val(today);

          }

          function ModTurJs(ids,NOM,FECHA) {
              try {
                  $("#Main_HddTurno").val(ids);
                  $("#tur").text('MODICAR TURNO');
                  $("#ModalNEW").modal();
                  $("#btnAgregar1a").show();                  
                  $("#btnGuardar1a").hide();
                  $("#Main_TxtNombreTur").val(NOM);
                  $("#Main_TxtNac").val(FECHA);

                
                  
              } catch (e) {
                  alert(e.message);
              }

          }
          function ModTurJsWS() {
              try {
                 
                  if ($("#Main_TxtNombreTur").val() != "") {
                      var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                      ({
                          // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                          "v_obj": {
                              "NUM_RUNID": $("#Main_HddTurno").val(),
                              "OLDID": '-1',
                              "NAME": $("#Main_TxtNombreTur").val(),
                              "STARTDATE": $("#Main_TxtNac").val(),
                              "ENDDATE": '22/12/2022',
                              "CYLE": '1',
                              "UNITS": '1'
                          }
                      });

                      $.ajax({
                          type: "POST",
                          url: "Turnos.aspx/WsModTur",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function () {
                              $("#ModalNEW").modal('hide');
                              Buscar();
                          }),
                          error: errores
                      });
                  } else {
                      alert('El nombre del turno es obligatorio');
                  }
              } catch (e) {
                  alert(e.message);
              }

          }
          function AltaTurJs() {
              try {

                  if ($("#Main_nombre1").val() != "") {
                      var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                      ({
                          // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                          "v_obj": {

                              "OLDID": '-1',
                              "NAME": $("#Main_nombre1").val(),
                              "STARTDATE": '22/12/1999',
                              "ENDDATE": '22/12/2042',
                              "CYLE": '1',
                              "UNITS": '1'
                          }
                      });

                      $.ajax({
                          type: "POST",
                          url: "Turnos.aspx/WsAltaTur",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function (result) {
                           //   $("#ModalNEW").modal('hide');
                              var ids = result.d;
                              ModificarJs(ids);
                              $("#ModalHoras").modal('hide');
                              
                          }),
                          error: errores
                      });
                  } else {
                      alert('El nombre del turno es obligatorio');
                  }
              } catch (e) {
                  alert(e.message);
              }

          }

          function PopAltaHs() { 
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

                  tomorrow.setMinutes(today.getMinutes() - parseInt($("#Main_TxtComienzoEntrada1").val().substr(3, 2)));
                  tomorrow.setHours(today.getHours() - parseInt($("#Main_TxtComienzoEntrada1").val().substr(0, 2)));

                  var s_s = 0;
                  var s_h = 0;

                  s_s = parseInt($("#Main_TxtFinEntrada1").val().substr(3, 2));
                  s_h = parseInt($("#Main_TxtFinEntrada1").val().substr(0, 2));

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
