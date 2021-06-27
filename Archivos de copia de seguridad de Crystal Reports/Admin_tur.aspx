﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Admin_tur.aspx.cs" Inherits="HardSoft.App.ORL.Admin_tur" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      
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
         
     <div style="display:none">
                  <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button4_Click" />
                </div>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
       <strong>    Administración</strong> 
            </div>

          <div class="row">
    
  



&nbsp;<asp:UpdatePanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">


  <ContentTemplate>
<fieldset>


     <div class="col-md-6">
            
              <div   style="  
    background-color:#fbffff;
    padding: 3px;
    border-radius: 10px 10px 10px 10px;
    border: 1px solid;
    /* box-shadow: 0 4px 5px #555; */
    /* border: 1px solid; */
    margin-bottom: 3px;
    height: 40px;
   
 "> 
              <div class="col-sm-2">  </div>   
            <div  class="col-sm-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 16px;
    text-transform: uppercase;
    padding: 5px;
    "> Listados de turnos</div> 
              </div>
         
         
          <div style="  
background-color:  #e1e1e1;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
  margin-bottom:5px;
     border: 1px solid;
    
 ">
            

     <div class="form-horizontal" >
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Especialidad</label>
         <div class="col-xs-6">   
             <asp:DropDownList ID="CmbEspecialidad" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="CmbEspecialidad_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-3"> </div>
           
     </div>
           
         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3">Profesional</label>
    <div class="col-xs-6">   
             <asp:DropDownList ID="cmbProf" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbProf_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-3">

                                    <div class=" " style="font-size: 13px;"> 
               <asp:CheckBox ID="ck1" runat="server"  value="M"    onclick="ckin()"  Text="&nbsp Mañana"/> <br />
               <asp:CheckBox ID="ck2" runat="server"  value="T"   onclick="ckin1()"  Text="&nbsp Tarde"/> 
                                       
</div>
                        </div>
      
         </div>
  



         
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Día</label>
    <div class="col-xs-6">   
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
                        <div class="col-xs-3"> </div>
      
         </div>
       
                      <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-8">   
             <button id="btnGuardar" type="button" class="btn btn-danger " onclick="buscarJs()"  >
    <span class=" glyphicon  glyphicon-print"> </span>  &nbsp Imprimir Turnos</button>

        <br />
         <asp:Label ID="lblimp" runat="server" Text="" CssClass="alert-danger"></asp:Label>
         </div>
                        
                
                <script>


                    function ckin11() {
                        if ($("#Main_ck11").is(':checked')) {
                            $("#Main_ck22").prop("checked", false);
                        }

                    }
                    function ckin22() {

                        if ($("#Main_ck22").is(':checked')) {
                            $("#Main_ck11").prop("checked", false);
                        }
                    }
                    function ckin() {
                        if ($("#Main_ck1").is(':checked')) {
                            $("#Main_ck2").prop("checked", false);
                        }

                    }
                    function ckin1() {

                        if ($("#Main_ck2").is(':checked')) {
                            $("#Main_ck1").prop("checked", false);
                        }
                    }
                    function buscarJs() {
                        var tur ="";
                        if ($("#Main_ck2").is(':checked')) {
                            tur="T";
                        }
                        if ($("#Main_ck1").is(':checked')) {
                            tur="M";
                        }
                        if (tur != "") {
                            if ($("#Main_TxtFechaHasta").val() != "") {
                                $("#Main_Button4").click();
                            } else {
                                alert('Seleccione una fecha');
                            }
                        } else {
                            alert('Es a la mañana o a la tarde?, seleccione una opción.');
                        }
                    }

                </script>
                        <div class="col-xs-1"> </div>
      
         </div>
            </div>


          </div>
              


                

     
                
                                    
 </div>
    <div class="col-md-6">
        
              <div   style="  
    background-color:#fbffff;
    padding: 3px;
    border-radius: 10px 10px 10px 10px;
    border: 1px solid;
    /* box-shadow: 0 4px 5px #555; */
    /* border: 1px solid; */
    margin-bottom: 3px;
    height: 40px;
   
 "> 
              <div class="col-sm-2">  </div>   
            <div  class="col-sm-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 16px;
    text-transform: uppercase;
    padding: 5px;
    ">   Cancelar Turnos</div> 
              </div>
         
         
          <div style="  
background-color:  #e1e1e1;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
  margin-bottom:5px;
     border: 1px solid;
    
 ">
            

     <div class="form-horizontal" >
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Especialidad</label>
         <div class="col-xs-6">   
             <asp:DropDownList ID="CmbEspecialidad1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="CmbEspecialidad_SelectedIndexChanged1"></asp:DropDownList>      
         </div>
                        <div class="col-xs-3"> </div>
           
     </div>
           
         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3">Profesional</label>
    <div class="col-xs-6">   
             <asp:DropDownList ID="cmbProf1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbProf_SelectedIndexChanged1"></asp:DropDownList>      
         </div>
                           <div class="col-xs-3">
<%-- si habilito aca tambien tengo q mostrar los turnos disponibles mañana y tarde--%>
                                    <div class=" " style="font-size: 13px;display:none" > 
               <asp:CheckBox ID="ck11" runat="server"  value="M"    onclick="ckin11()"  Text="&nbsp Mañana"/> <br />
               <asp:CheckBox ID="ck22" runat="server"  value="T"   onclick="ckin22()"  Text="&nbsp Tarde"/> 
                                       
</div>
                        </div>
      
         </div>
  
         
                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Día</label>
    <div class="col-xs-6">   
               <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="Txtdia1" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="Txtdia1"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
    
    </div>
                        <div class="col-xs-3"> </div>
      
         </div>
       
                      <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-8">   
             <button id="btnGuardar1" type="button" class="btn btn-info " onclick="CancelarJs()"  >
    <span class=" glyphicon  "> </span>  &nbsp Cancelar Turnos</button><br />
        <asp:Label ID="lblcanc" runat="server" Text="" CssClass="alert-danger"></asp:Label>
         </div>
 
                <div style="display:none">
               <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click1"   />
                </div>
                <script>
                    function CancelarJs() {
                        if ($("#Main_Txtdia1").val() == "") {
                            alert("Ingrese una fecha");
                        } else {
                            if (confirm("Esta seguro que desea cancelar los turnos ?")) {
                                $("#Main_Button2").click();
                            }
                        }
                    }

                </script>
                        <div class="col-xs-1"> </div>
      
         </div>
            </div>


          </div>
              
  
         </div>
    
    

    </fieldset>
      </ContentTemplate>
    </asp:UpdatePanel>

     </div> 






        </div>

        
   </div>


     
      <script>
         
          $(".campoFecha").mask("99/99/9999");
          function ListarTipo() {
              try {

                  var json = JSON.stringify
            ({


            });

                  $.ajax({
                      type: "POST",
                      url: "Cbtes.aspx/WsListarTipo",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
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

              $('#cmbTipoCbate').append('<option value="0">- -</option>');
              $.each(Especialidad, function (index, especialidades) {


                  $('#cmbTipoCbate').append(
                           $('<option  selected></option>').val(especialidades.id_pais).html(especialidades.nombre)
                         );

              });


              //select un item  para select2
              $("#cmbTipoCbate").val(0).change();
          }


          function Buscar() {
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

                      if (val1 != '') {

                          var json = JSON.stringify
                            ({
                                "v_tipoCbate": $('#cmbTipoCbate').val(),
                                "v_tipo": $('#cmbTipoOp').val(),
                                "v_valor1": val1,
                                "v_valor2": val2,

                            });
                          $.ajax({
                              type: "POST",
                              url: "Cbtes_Ver.aspx/WsListar",
                              data: json,
                              contentType: "application/json; charset=utf-8",
                              dataType: "json",
                              success: resultado,
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

          function PopVer(ids) {
              try { 
                 
                  $("#Main_TxtTipoRep").val($("#cmbTipoCbate").val());
                  $("#Main_TxtRpid").val(ids);
                  $("#Main_BtnImp").click();

              } catch (e) {
                  alert(e);
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
              Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Fecha</th><th>Resultado</th><th>CbteTipo</th> <th>Observaciones</th><th>DocNro</th><th>ImpNeto$</th><th>ImpIVA$</th> <th>ImpTotal$</th> </tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr     ><td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.Id + ");' > <img src='/images/Ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Cbte</span></a></td><td>" + pacientes.Fecha + "</td><td>" + pacientes.Resultado + "</td><td>" + pacientes.CbteTipo + "</td><td>" + pacientes.Observaciones + "</td><td>" + pacientes.DocNro + "</td><td>" + pacientes.ImpNeto + "</td><td>" + pacientes.ImpIVA + "</td><td>" + pacientes.ImpTotal + "</td></tr>";
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
              $(".campoFecha").mask("99/99/9999");
              $('#cmbTipoCbate').val('1');
              $('#cmbTipoOp').val('1');
              ListarTipo();
          });
         

    </script>
   
          <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
     
   

</asp:Content>
