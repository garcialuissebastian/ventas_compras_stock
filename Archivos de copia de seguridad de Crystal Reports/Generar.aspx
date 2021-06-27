<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master"   Culture="Auto" UICulture="Auto" AutoEventWireup="true" CodeBehind="Generar.aspx.cs" Inherits="HardSoft.App.ORL.Generar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager> 
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
                .ajax__calendar .ajax__calendar_day {
    border: 1px solid #dcdbdb;
}
            .ajax__calendar .ajax__calendar_hover .ajax__calendar_day {
    background-color: #0ba1ec;
    border-color: #daf2fc;
    color: #0066cc;
}

        input[type=checkbox], input[type=radio] {
    margin: 0px 0 0;
    
}
        label {
  
    margin-bottom: 0px;
    
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

     <div class=" container" style="margin-top: 36px;">  
         
 
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
     
   
                  </div>


          <div class="col-md-12">
       
  <div   style="margin-top:5px; background-color:#333; color:white; font-weight:800; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >

    <div class="row">      
          <asp:UpdatePanel ID="UpdatePanel1" runat="server"   UpdateMode="Conditional">
              <ContentTemplate>
<fieldset>
    <div class="col-xs-12" >
         <div class="form-inline">
       
                <div class="form-group">       
         <div class="">   
             <asp:DropDownList ID="CmbEspecialidad1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="CmbEspecialidad1_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class=" "> </div>
           
     </div> 
                    <div class="form-group">
 
    <div class=" ">   
             <asp:DropDownList ID="cmbProf1" runat="server" CssClass="form-control"   ></asp:DropDownList>      
         </div>
                        <div class=" "> </div>
      
         </div> 
    
 
                         <div class="form-group">
        
                             
                             
    <div class=" ">   
       
    
    </div>
                        <div class=" "> </div>
      
         </div>
   
                      <div class="form-group">
         
    <div class=" ">   
                <button type="button" class="btn2 btn-danger" onclick="Buscar()" > 
    <span class="  glyphicon glyphicon-search"></span> Buscar</button> 

         </div>
                        <div class=" "> </div>
      
         </div> 
            
              </div>
 

         </div>
    </fieldset>
                  </ContentTemplate>
              </asp:UpdatePanel>
    
    
     </div>  



      </div>

        <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow: auto;  height: 220px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla'></table>

</div>
              </div>
     </div>

                 
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
          
            <input type="text" id="kwd_search" value="" placeholder="Buscar " class="form-control" style="width:150px;float:left"/>
         
           
        <button id="btnVolver1" type="button" class="btn  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

   <button id="btnnuevo" type="button" class="btn  btn-primary  "  onclick="ver()" >
     Generar Turnos <span class=" glyphicon "></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />
    </div>





        </div>

          </div>


       <!-- Modal -->
  <div class="modal fade" id="ModalMod" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
                         
           <strong> Regenerar Turnos</strong>  
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">

                  <div  class="row" style="padding:20px;
 
margin-top:5px;
color: #333;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;">
 
<div class="row">
          <div class="col-md-12" >

<div class="form-horizontal" role="form" style=" font-size:20px">
     <div class="form-group">

         <label for="Fax" class="control-label col-xs-4">Fecha Inicio</label>
         <div class="col-xs-8">
           
                  <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtF1" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopupF1" ImageUrl="/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender3"   PopupButtonID="imgPopupF1" runat="server" TargetControlID="TxtF1"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
 

        </div>              
     </div> 
       <div class="form-group">

         <label for="Fax" class="control-label col-xs-4">Fecha Fin</label>
         <div class="col-xs-8">
           
                  <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtF2" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopupF2" ImageUrl="https://arquivirtual.quilmes.gov.ar/municipal/img/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender4"   PopupButtonID="imgPopupF2" runat="server" TargetControlID="TxtF2"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
 

        </div>              
     </div> 
</div>

   </div></div>
        
                      
                      
                                  <div   style="margin-top:1px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
 
       <button id="btnGuardar2a" type="button" class="btn btn-default " onclick="AltaJs2()"  >
    <span class=" glyphicon glyphicon-save"></span> Generar 
 </button>


        <button type="button" class="btn btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 
                        
         </div>


</div></div>
     
          </div></div></div>
   
           <!-- Modal -->
  <div class="modal fade" id="ModalModFecha" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> 
                         
           <strong> Modificar Fecha Fin </strong>  
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">

                  <div  class="row" style="padding:20px;
 
margin-top:5px;
color: #333;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;">
 
<div class="row">
          <div class="col-md-12" >

<div class="form-horizontal" role="form" style=" font-size:20px">
     

    <div style="display:none">   
         <asp:TextBox ID="TxtIdFIn" runat="server"   CssClass=" form-control" ></asp:TextBox> 
    </div>
    
        <div class="form-group">

         <label for="Fax" class="control-label col-xs-4">Fecha Fin</label>
         <div class="col-xs-8">
           
                  <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtModFecha" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="ImageButton2" ImageUrl="https://arquivirtual.quilmes.gov.ar/municipal/img/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender6"   PopupButtonID="ImageButton2" runat="server" TargetControlID="TxtModFecha"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
 

        </div>              
     </div> 
</div>

   </div></div>
        
                      
                      
                                  <div   style="margin-top:1px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
 
       <button id="btnModFecha" type="button" class="btn btn-default " onclick="BtnModFin()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar fecha 
 </button>


        <button type="button" class="btn btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 
                        
         </div>


</div></div>
     
          </div></div></div>
   



           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
                    <div  id="Miload" style=" display:none; text-align:center; margin:auto;text-align: center;
    margin: auto;
    position: absolute;
    top: 460px; ">
                              <img src='/images/Loading_icon.gif'    width="150"/></div>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">

                  <div  class="row" style="padding:20px;
 
margin-top:5px;
color: #333;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;">

 


<div class="row">
          <div class="col-md-12" >


         <div class="form-horizontal" role="form" style=" font-size:20px">
       <asp:UpdatePanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">
              <ContentTemplate>
<fieldset>
             
           <div class="form-group">
         <label for="l" class="control-label col-xs-4">Especialidad</label>
         <div class="col-xs-4">   
             <asp:DropDownList ID="CmbEspecialidad" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="CmbEspecialidad_SelectedIndexChanged"></asp:DropDownList>      
         </div>
                        <div class="col-xs-4"> </div>
           
     </div>
           
         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-4">Profesional</label>
    <div class="col-xs-4">   
             <asp:DropDownList ID="cmbProf" runat="server" CssClass="form-control" AutoPostBack="True" ></asp:DropDownList>      
         </div>
                        <div class="col-xs-4"> </div>
      
         </div>
             

      <div class="form-group">
         <label for="l" class="control-label col-xs-4">Dia</label>
    <div class="col-xs-2">   
             <asp:DropDownList ID="CmbDia" runat="server" CssClass="form-control"   >
                 <asp:ListItem Value="0" Text="Lunes"></asp:ListItem>
                  <asp:ListItem Value="1" Text="Martes"></asp:ListItem>
                  <asp:ListItem Value="2" Text="Miercoles"></asp:ListItem>
                  <asp:ListItem Value="3" Text="Jueves"></asp:ListItem>
                  <asp:ListItem Value="4" Text="Viernes"></asp:ListItem>
                  <asp:ListItem Value="5" Text="Sabado"></asp:ListItem>
                   <asp:ListItem Value="6" Text="Domingo"></asp:ListItem>
                    <asp:ListItem Value="99" Text="Lunes a viernes"></asp:ListItem>

             </asp:DropDownList>      
         </div>
                        <div class="col-xs-2">
                             <div class=" " style="font-size: 13px;"> 
               <asp:CheckBox ID="ck1" runat="server"  value="M"    onclick="ckin()"  Text="&nbsp Mañana"/> <br />
               <asp:CheckBox ID="ck2" runat="server"  value="T"   onclick="ckin1()"  Text="&nbsp Tarde"/> 
</div>
                            <div class="col-xs-4"></div>
                        </div>
      
         </div>
       <div class="form-group">
         <label for="inputName" class="control-label col-xs-4"  >Horario de inicio</label>
         <div class="col-xs-1">
         
             <asp:TextBox ID="TxtHora" runat="server" CssClass="form-control" MaxLength="2"  onkeypress="return acceptNum(event)"  >00</asp:TextBox>
              
              </div>
                <div class="col-xs-1">
         
             <asp:TextBox ID="TxtMin" runat="server" CssClass="form-control" MaxLength="2"  onkeypress="return acceptNum(event)" >00</asp:TextBox>
              
              </div>
          
       <label for="inputName" class="control-label col-xs-6"   style="text-align:left">
   * Horario de comienzo de la atención ej: 9:00 hs
    </label>
     </div>
  
          <div class="form-group">
         <label for="inputName" class="control-label col-xs-4"  >¿Con que Fecuencia? ej: cada 15min</label>
         <div class="col-xs-2">
         
             <asp:TextBox ID="TxtCadaCuanto" runat="server" CssClass="form-control" onkeypress="return acceptNum(event)" >0</asp:TextBox>
              
              </div>
       <label for="inputName" class="control-label col-xs-6"   style="text-align:left">
   * Si es por orden de llegada, dejar en 0 (cero) y generará la cantidad de turnos establecida y todos con el horario de Inicio de la atención.
    </label>
     </div>
  
   
  
            <div class="form-group">
         <label for="inputName" class="control-label col-xs-4"  >Cantidad de turnos</label>
         <div class="col-xs-2">
         
             <asp:TextBox ID="TxtCant" runat="server" CssClass="form-control" onkeypress="return acceptNum(event)" >0</asp:TextBox>
              
              </div>
       
              <div class="col-xs-6">
    <div id="cantTur" style=" padding-top: 5px;"></div>
                  <div style="display:none">
                         <asp:TextBox ID="CantTur2" runat="server"></asp:TextBox>
                  </div>
               
     </div>
     </div>
       

   
    
        <div class="form-group">

         <label for="Fax" class="control-label col-xs-4">Fecha Inicio </label>
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


      <div class="form-group">

         <label for="Fax" class="control-label col-xs-4">Fecha Fin</label>
         <div class="col-xs-8">
           
                  <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtFin" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup11" ImageUrl="https://arquivirtual.quilmes.gov.ar/municipal/img/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="imgPopup11" runat="server" TargetControlID="TxtFin"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
 

        </div>              
     </div> 
         <div class="form-group">
         <label for="inputName" class="control-label col-xs-4"  >Observación</label>
         <div class="col-xs-8">
         
             <asp:TextBox ID="txtObs" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
              
              </div>
       
     </div>

 (no anda el calculador de hora fin js pq cuando cambio algunos de las combos .net deja de funcar. hay q pasarlo los cmb html)
           <asp:Label ID="Msg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
   
      <asp:CheckBox ID="ckforzar" runat="server"     Text="" /> 
        
 </fieldset>

              </ContentTemplate>

       </asp:UpdatePanel>

             

 
         </div>



          </div>
</div>
  
    <div style="display:none">
             <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
                    

                     <asp:Button ID="BtnCanc" runat="server" Text="btnCan" OnClick="BtnCanc_Click" />
        <asp:Button ID="btnAlta" runat="server" Text="btnCan" OnClick="BtnAlta_Click" />
          <asp:Button ID="btnAlta2" runat="server" Text="btnCan" OnClick="btnAlta2_Click"  />
             </div>
      
  </div>

   
                    <div   style="margin-top:1px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
 
       <button id="btnGuardar1a" type="button" class="btn btn-default " onclick="AltaJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Generar</button>


        <button type="button" class="btn btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 
                        
         </div>  
  
         

               </div>

            </div></div></div>





 
    
       <script>
          $(document).ready(function () { 
              $(".campoFecha").mask("99/99/9999");
              //Buscar();
              $("#Main_ckforzar").hide();
          });


           
           function ModFin(idgen, fecha) {
               $("#Main_TxtIdFIn").val(idgen);
               $("#Main_TxtModFecha").val(fecha);
               $("#ModalModFecha").modal(); 

           }

           function BtnModFin() {

               if (confirm("Esta seguro que desea modificar la fecha de fin?")) {

                   var json = JSON.stringify
                                   ({
                                       "idgen": $("#Main_TxtIdFIn").val(),
                                       "fecha": $("#Main_TxtModFecha").val(),
                                   });
                   $.ajax({
                       type: "POST",
                       url: "Generar.aspx/ModFechafinGenVar",
                       data: json,
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: (function (Resultado) {
                           Buscar();
                           $("#ModalModFecha").modal('hide');
                       }),
                       error: errores
                   });
               }
           }


          function horas() {

              $("#cantTur").text('');
              var tm1 = (parseInt($("#Main_TxtHora").val() * 60)) + parseInt($("#Main_TxtMin").val());

            var time = (parseInt($("#Main_TxtCadaCuanto").val()) * (parseInt($("#Main_TxtCant").val())-1)   ) + tm1;
               var minutes = Math.floor(time / 60);
              var seconds = time % 60;

              //Anteponiendo un 0 a los minutos si son menos de 10 
              minutes = minutes < 10 ? '0' + minutes : minutes;

              //Anteponiendo un 0 a los segundos si son menos de 10 
              seconds = seconds < 10 ? '0' + seconds : seconds;

              var result = minutes + ":" + seconds;  // 161:30
            
              $("#cantTur").text(' Último turno a las : ' + result);
              $("#Main_CantTur2").val(result);
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

          function ver1(ids, fecha1) {
            
              $("#ModalMod").modal();


          }
          var table = document.getElementById("grilla");

          function row(ids) {
              $("#ModalMod").modal();
              $('#Main_TxtId').val(ids);
              table = document.getElementById("grilla");
              if (table != null) {
                  for (var i = 1; i < table.rows.length; i++) {

                      table.rows[i].onclick = function () {
                       
                          var from = (this).cells[9].innerHTML.split("/");
                          var today = new Date(from[2], from[1] - 1, from[0]);

                        
                          var numberOfDaysToAdd = 1; // sumo 1 dia
                          today.setDate(today.getDate() + numberOfDaysToAdd);


                          var dd = today.getDate() ;
                          var mm = today.getMonth() + 1; //January is 0!

                          var yyyy = today.getFullYear();
                          if (dd < 10) {
                              dd = '0' + dd;
                          }
                          if (mm < 10) {
                              mm = '0' + mm;
                          }  
                          var today2 = dd + '/' + mm + '/' + yyyy;
                          $('#Main_TxtF1').val(today2);

                           
                       
                          today.setMonth(today.getMonth() + 6);

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
                          document.getElementById("Main_TxtF2").value = today;
                       
 


                      };
                  }
              }
          }

          function ver() {
              $("#ModalCat").modal();
              $("#Main_cmbProf").val($("#Main_cmbProf1").val());

          }

          function PopMod(ids) {

              if (confirm("Esta seguro que desea eliminar la fecha?")) {
                  $("#Main_TxtId").val(ids);
                  $("#Main_BtnCanc").click();
              }

          }

          

          $("#Main_TxtCadaCuanto").blur(function () {
              if ($("#Main_TxtCant").val() == "") {
                  $("#Main_TxtCant").val('0');
              } else {
                  horas();
              }
          });

          $("#Main_TxtCant").blur(function () {
              if ($("#Main_TxtCant").val() == "") {
                  $("#Main_TxtCant").val('0');
              } else {
                  horas();
              }
          });

          $("#Main_TxtHora").focus(function () {
              $("#Main_TxtHora").val("") ;
          });


          $("#Main_TxtMin").focus(function () {
              $("#Main_TxtMin").val("");
          });
          $("#Main_TxtCadaCuanto").focus(function () {
              $("#Main_TxtCadaCuanto").val("");
          });

          $("#Main_TxtCant").focus(function () {
              $("#Main_TxtCant").val("");
          });

          $("#Main_TxtHora").blur(function () {
              if ($("#Main_TxtHora").val() == "") {
                  $("#Main_TxtHora").val('00');
              } 
              if ($("#Main_ck1").is(':checked')) {
                  if (parseInt($("#Main_TxtHora").val()) > 12) {
                      $("#Main_Msg").text("* El horario de inicio, para la mañana, tiene que ser hasta las 13 hs");
                  } else {
                      $("#Main_Msg").text("");
                  }

              } if ($("#Main_ck2").is(':checked')) {
                  if (parseInt($("#Main_TxtHora").val()) < 13) {
                    
                      $("#Main_Msg").text("* El horario de inicio, para la tarde, tiene que ser apartir de las 13 hs");
                  } else {
                      $("#Main_Msg").text("");
                  }
              }
          });

          $("#Main_TxtMin").blur(function () {
              if ($("#Main_TxtMin").val() == "") {
                  $("#Main_TxtMin").val('00');
              }
          });

          $("#Main_TxtCadaCuanto").blur(function () {
              if ($("#Main_TxtCadaCuanto").val() == "") {
                  $("#Main_TxtCadaCuanto").val('0');
              } else {
                  horas();
              }
          });

          function PopMod(ids) {

              if (confirm("Esta seguro que desea eliminar los turnos generados ?")) {

                  var json = JSON.stringify
                                  ({
                                      "ids": ids
                                  });
                  $.ajax({
                      type: "POST",
                      url: "Generar.aspx/WsEliminar",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {
                          Buscar();
                      }),
                      error: errores
                  });
              }
          }

          function AltaJs2() { 
             
              var json = JSON.stringify
                              ({
                                  "ids": $('#Main_TxtId').val(),
                                  "fecha_ini": $('#Main_TxtF1').val(),
                                  "fecha_fin": $('#Main_TxtF2').val()                                  
                              });
              $.ajax({
                  type: "POST",
                  url: "Generar.aspx/WsReg",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: (function (Resultado) {
                      var ver = Resultado.d;
                      alert(ver);
                      if (ver == '* Se generaron nuevos turnos con exito.') {
                          Buscar();
                          $("#ModalMod").modal('hide');

                      }
                  }),
                  error: errores
              });

          }
          function AltaJs() {
              horas();
              
              
            
              $("#btnGuardar1a").attr("disabled", true);
            //  document.getElementById("btngen").disabled = true;
              var m_t = "";
              var no = "";
              if ($("#Main_ck1").is(':checked')) {
                  m_t = "M";
                  if (parseInt($("#Main_TxtHora").val()) > 12) {
                      $("#Main_Msg").text("* El horario de inicio, para la mañana, tiene que ser hasta las 13 hs");
                      no = "N";
                  }
              } if ($("#Main_ck2").is(':checked')) {
                  m_t = "T";
                  if (parseInt($("#Main_TxtHora").val()) < 13) {
                      no = "N";
                      $("#Main_Msg").text("* El horario de inicio, para la tarde, tiene que ser apartir de las 13 hs");
                  }
              } 
              if ($("#Main_TxtCant").val() != "0") {
                  if ($("#Main_TxtHora").val() != "00") {

                      if (m_t != "") {
                          if (no == "") {
                              var json = JSON.stringify
                                ({
                                    "id_prof": $('#Main_cmbProf').val(),
                                    "id_serv": $('#Main_CmbEspecialidad').val(),
                                    "id_dia": $('#Main_CmbDia').val(),
                                    "fecha_ini": $('#Main_TxtFechaIngreso').val(),
                                    "Turno": m_t
                                });
                              $.ajax({
                                  type: "POST",
                                  url: "Generar.aspx/Wsexiste_gen",
                                  data: json,
                                  contentType: "application/json; charset=utf-8",
                                  dataType: "json",
                                  success: (function (Resultado) {
                                      var ver = Resultado.d;
                                      if (ver != "0" && !$("#Main_ckforzar").is(':checked')) {
                                          $("#Main_ckforzar").show();
                                          $("#Main_Msg").text("* Existen turnos generados para el rango de fechas (Fecha_Fin >= Fecha_Ini), dia, servicio y profesional seleccionado. Forzar la generacion -->");

                                      } else {
                                          $("#btnGuardar1a").prop('disabled', false);
                                          $("#Miload").show();
                                          $("#Main_btnAlta").click();
                                          Buscar();
                                         
                                      }

                                  }),
                                  error: errores
                              });
                          }
                      //  
                      } else {
                          $("#Main_Msg").text("* ¿Los turnos son por la mañana o de tarde ? - Seleccione una de las opciones.");
                      }

                  } else {
                      $("#Main_Msg").text("* EL Horario de inicio debe ser distinto a Cero");
                  }

              } else {
                  $("#Main_Msg").text("* La cantidad de turnos debe ser distinto a Cero");
              }
            
              $("#btnGuardar1a").attr("disabled", false);
          }
          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }
          function Buscar() {

              try {


                  //   alert( $('#cmbTipoOp').val() );


                  var json = JSON.stringify
                    ({ 
                        "v_serv": $("#Main_CmbEspecialidad1").val(),
                        "v_prof": $("#Main_cmbProf1").val()
                    });
                  $.ajax({
                      type: "POST",
                      url: "Generar.aspx/WsListar",
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
                  Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th></th><th></th><th>Servicio</th><th>Cada_Cuanto</th><th>Primer_turno</th><th>Ultimo_turno</th><th>Días</th><th>Cantidad</th><th>Fecha_Inicio</th><th>Fecha_Fin</th><th> </th><th>Observaciones</th>   </tr></thead><tbody>";
                  $.each(Pacientes, function (index, pacientes) {
                      var  cc = '';
                      if (pacientes.Cada_Cuanto == '0') {
                          cc = 'X orden de llegada';
                      } else {
                          cc = pacientes.Cada_Cuanto;
                      }
                      var tt = '';
                      if (pacientes.Turno == 'T') {
                          tt = 'Tarde';
                      } else {
                         tt ='Mañana';
                      }
                       

                      var dateParts = pacientes.Fecha_Fin.split("/");

                      
                      var sf = new String('fds');
                      Tabla_Datos = Tabla_Datos + "<tr >  <td style='width:30px'> <a class='tooltips' onclick='row(" + pacientes.Id + ")' > <img src='/images/ajustes.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Regenerar Turnos</span></a></td><td style='width:30px'> <a class='tooltips' onclick='PopMod(" + pacientes.Id + ");' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td style='text-align: left;'>" + pacientes.Id_Servicio + " - " + pacientes.Id_Profesional + " - " + tt + "</td><td>" + cc + "</td><td>" + pacientes.Hora_Ini + "</td><td>" + pacientes.Hora_Fin + "</td><td>" + pacientes.Id_Dias + "</td><td>" + pacientes.DE + "</td><td>" + pacientes.Fecha_Inicio + "</td><td >" + pacientes.Fecha_Fin + " </td><td><a class='tooltips' onclick='ModFin(" + pacientes.Id + ",\"" + pacientes.Fecha_Fin + "\")' > <img src='/images/calendarioAjuste.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Modificar Fin</span></a></td><td>" + pacientes.Obs + "</td>  </tr>";

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
          var today2 = dd + '/' + mm + '/' + yyyy;
          document.getElementById("Main_TxtFechaIngreso").value = today2;


          today.setMonth(today.getMonth() + 6);

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
          document.getElementById("Main_TxtFin").value = today;

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



          // Write on keyup event of keyword input element
          $("#kwd_search").keyup(function () {

              // When value of the input is not blank
              if ($(this).val() != "") {
                  // Show only matching TR, hide rest of them
                  $("#grilla tbody>tr").hide();
                  $("#grilla td:contains-ci('" + $(this).val() + "')").parent("tr").show();
              }
              else {
                  // When there is no input or clean again, show everything back
                  $("#grilla tbody>tr").show();
              }
          });

          // jQuery expression for case-insensitive filter
          $.extend($.expr[":"],
          {
              "contains-ci": function (elem, i, match, array) {
                  return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
              }

          });



          $(document).ajaxStart(function () {
              $(".spinner-wrapper").css("display", "block");
              $(".loader").css("display", "block");

          });
          $(document).ajaxComplete(function () {
              $(".spinner-wrapper").css("display", "none");
              $(".loader").css("display", "none");
            
          });
       </script>

               


</asp:Content>
