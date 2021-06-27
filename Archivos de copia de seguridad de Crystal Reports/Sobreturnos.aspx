<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master" Culture="Auto" UICulture="Auto" AutoEventWireup="true" CodeBehind="Sobreturnos.aspx.cs" Inherits="HardSoft.App.ORL.Sobreturnos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>

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
             .ajax__calendar .ajax__calendar_day {
    border: 1px solid #dcdbdb;
}
            .ajax__calendar .ajax__calendar_hover .ajax__calendar_day {
    background-color: #0ba1ec;
    border-color: #daf2fc;
    color: #0066cc;
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
           SobreTurno        </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
       
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>  SobreTurno</strong> 
            </div>
        <div class="row">

             <div class="form-horizontal">
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
           
             <asp:HiddenField ID="Hddexiste" runat="server" />
                    <div class="form-group">
         <label for="l" class="control-label col-xs-4">Profesional</label>
    <div class="col-xs-4">   
             <asp:DropDownList ID="cmbProf" runat="server" CssClass="form-control" AutoPostBack="True" ></asp:DropDownList>      
         </div>
                        <div class="col-xs-4"> </div>
      
         </div>
             

                         <div class="form-group">
        
                             
                              <label for="l" class="control-label  col-xs-3 col-md-4">Día</label>
    <div class="col-xs-6 col-md-4">   
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
                        <div class="col-xs-2 col-md-4"> </div>
      
         </div>
            
           
                 <div class="form-group">
         <label for="inputName" class="control-label col-xs-4"  >Horario del turno</label>
         <div class="col-xs-1">
         
             <asp:TextBox ID="TxtHora" runat="server" CssClass="form-control" MaxLength="2"  onkeypress="return acceptNum(event)"  >00</asp:TextBox>
              
              </div>
                <div class="col-xs-1">
         
             <asp:TextBox ID="TxtMin" runat="server" CssClass="form-control" MaxLength="2"  onkeypress="return acceptNum(event)" >00</asp:TextBox>
              
              </div>
          
       <label for="inputName" class="control-label col-xs-6"   style="text-align:left">
   * hh:mm - ej: 16:00 hs
    </label>
     </div>
            <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"   >Documento</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtDoc" runat="server" class="form-control"  onKeyPress="return acceptNum(event)" ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1w" ControlToValidate="TxtDoc" CssClass=" alert-danger"
                                                 Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
         
     
                  <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4" id="Apellido">Nombre</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
         <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="TxtNombre" CssClass=" alert-danger"
                                                Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>

                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Apellido</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtApellido" runat="server" class="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="TxtApellido" CssClass=" alert-danger"
                                                 Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
                    
           
                <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >Fecha Nac.</label>
         <div class="col-xs-3"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtNac" runat="server"  placeholder="dia/mes/año"   CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtNac"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-5"> 

               

           </div>
     </div>

                     <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Obra Social</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:DropDownList ID="cmbObraSocial" runat="server" CssClass="form-control"> 
              
             </asp:DropDownList>
              </div>
        <div class="col-xs-2 col-md-4">            
    
     </div>
     </div>

                          <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Nro OS</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtNroOS" runat="server" class="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">            
     
     </div>
     </div>
              <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Tel</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtCel" runat="server" class="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">            
               
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TxtCel" CssClass=" alert-danger"
                                                SetFocusOnError="true" Display="Dynamic" ErrorMessage="Requerido" ToolTip="*" />

     </div>
     </div>
              <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >E-Mail</label>
         <div class="col-xs-6 col-md-4">
            
                  <asp:TextBox ID="txtMail" runat="server"   CssClass="form-control" ></asp:TextBox>
                                       
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        
              <div class="wait"  style="display:none; text-align:center; margin:auto;  float:left"><img src='/images/Loading_icon.gif'    width="65"/></div>
               
                                            <asp:RegularExpressionValidator ID="retxtMail" runat="server" ControlToValidate="txtMail" CssClass="  alert-danger"
                                                ValidationExpression=".*@.*\..*" ErrorMessage="No valido" Display="Dynamic" ToolTip="Debe ingresar una dirección de mail valida"></asp:RegularExpressionValidator>
                                       
     </div>
     </div>
        <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Observación HC</label>
         <div class="col-xs-6 col-md-4">
            
                  <asp:TextBox ID="txtObsHC" runat="server"   CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                       
        
              
              </div>
        <div class="col-xs-2 col-md-4">
                                  
     </div>
     </div>
             <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Observación Turno</label>
         <div class="col-xs-6 col-md-4">
            
                  <asp:TextBox ID="txtObs" runat="server"   CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                       
        
              
              </div>
        <div class="col-xs-2 col-md-4">
                                  
     </div>
     </div>
                  <div class="form-group">
                      <div class="col-md-8"> 
  <asp:Label ID="lblmsg2" runat="server" Text="" CssClass=" alert-danger" ></asp:Label>
        
    


     </div >  
                       <div class="col-md-4"> 
                  
</div>
                  </div>
 
 </fieldset>
                  </ContentTemplate>
                 </asp:UpdatePanel>
</div>

         <div   style="margin-top:5px; margin-bottom:5px;  padding:5px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >

             <div style="display:none">
          
        </div>

             <asp:Button ID="BtnReservar" runat="server" Text="Reservar" CssClass="btn btn-primary " OnClick="BtnReservar_Click" />  
 
        <button type="button" class="btn btn-danger" onclick="SalirJs()" > 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar</button>
 

              <br />
               


               </div>
      

            </div>
        </div>
         </div>


          <asp:Panel ID="Pnl" runat="server"  Visible="false" >
              <!-- Modal -->
  <div class="modal fade" id="ModalCat" data-toggle="modal" data-backdrop="static" data-keyboard="false"   role="dialog" style="display:none; background-color: rgba(33, 33, 31, 0.68);    margin-top: 120px;"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
          
              <div class="modal-header" style="    font-weight: 700;
    font-size: 17px;
    color: #47a89d;">
      
       Reserva Exitosa    -   <asp:Label ID="lblEsp" runat="server" Text=""></asp:Label>
        </div>
       
        
        <div class="modal-body">

   <div class="form-horizontal">
            
                <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4 "  id="A">Turno</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtTurno" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
     
     </div>
     </div>
            <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4 " >Nombre</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtNombreR" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
      
     </div>
     </div>

                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Apellido</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtApellidoR" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
       
     </div>
     </div>
                    
                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"   >Documento</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtDocumentoR" runat="server"  CssClass="form-control"  onKeyPress="return acceptNum(event)" ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
       
     </div>
     </div>
        
                   <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Obra Social</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:DropDownList ID="CmbOSR" runat="server" CssClass="form-control"> 
                  
      
             </asp:DropDownList>
              </div>
        <div class="col-xs-2 col-md-4">            
    
     </div>
     </div>
     
                     <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Tel</label>
         <div class="col-xs-6 col-md-4">
            
             <asp:TextBox ID="TxtTelR" runat="server" CssClass="form-control"  ></asp:TextBox>
        
              
              </div>
        <div class="col-xs-2 col-md-4">
       
     </div>
     </div>
              <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >E-Mail</label>
         <div class="col-xs-6 col-md-4">
            
                  <asp:TextBox ID="TxtMailR" runat="server"   CssClass="form-control" ></asp:TextBox>
                                       
        
              
              </div>
        <div class="col-xs-2 col-md-4">
        
                
     </div>
     </div> 
               <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4" id="Apel">Comprobante</label>
         <div class="col-xs-6 col-md-4">
            
          
        
                             <asp:ImageButton ID="ImageButton1" CausesValidation="false" runat="server" Height="55px" ImageUrl="https://arquivirtual.quilmes.gov.ar/municipal/img/pdf.png" OnClick="ImageButton1_Click" Width="59px" />
              
              </div>
        <div class="col-xs-2 col-md-4">
        
     </div>
     </div>

</div>

         <div   style="margin-top:5px; margin-bottom:5px;  padding:5px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
              <asp:Label ID="Label1" runat="server" Text="" CssClass=" alert-danger" ></asp:Label>
  
             <div style="display:none">
           <%--  <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />--%>
        </div>

      

        <button type="button" class="btn btn-danger" onclick="SalirPopJs()"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

              <br />
               
           

               </div>
             
      
   </div>
        
      </div>
      
    </div>
   
 </div>
             </asp:Panel>
   
     <script>
        $("#Main_TxtHora").blur(function () {
            if ($("#Main_TxtHora").val() == "") {
                $("#Main_TxtHora").val('00');
            }

            if (parseInt($("#Main_TxtHora").val()) > 22) {

                alert('Error en el Horario');
                $("#Main_TxtHora").val('00');
            }

        });

        $("#Main_TxtMin").blur(function () {
            if ($("#Main_TxtMin").val() == "") {
                $("#Main_TxtMin").val('00');
            }
        });

        $(document).ready(function () {
            $("#Main_TxtDoc").blur(function () {

                existe();
            });

            $(".campoFecha").mask("99/99/9999");
          //  Buscar();

        });


       
        //$("#TxtDoc").keyup(function (e) {
        //    if (e.keyCode == 13) {
        //        existe()
        //    }
        //});

        function existe() {
            try {
                if ($("#Main_TxtDoc").val() != '') {
                    var json = JSON.stringify
                ({
                    "v_valor": $("#Main_TxtDoc").val()
                });
                    $.ajax({
                        type: "POST",
                        url: "Reservar.aspx/WsExiste",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Resultado) {
                            var tur = Resultado.d;
                            if (tur != null) {

                                $("#Main_TxtNombre").val(tur.NOMBRE);
                                $("#Main_TxtApellido").val(tur.APELLIDO);
                                $("#Main_TxtNac").val(tur.Fecha_Nac);
                                $("#Main_cmbObraSocial").val(tur.OBRASOCIAL);
                                $("#Main_TxtCel").val(tur.TEL);
                                $("#Main_txtMail").val(tur.MAIL);
                                $("#Main_TxtNac").val(tur.Fecha_Nac);
                                $("#Main_txtObsHC").val(tur.OBS_Pac);
                                $("#Main_TxtNroOS").val(tur.NroOS);
                                //$("#Main_TxtNombre").prop('disabled', true);
                                //$("#Main_TxtApellido").prop('disabled', true);
                                //$("#Main_TxtNac").prop('disabled', true);
                                //$("#Main_cmbObraSocial").prop('disabled', true);
                                //$("#Main_TxtCel").prop('disabled', true);
                                //$("#Main_txtMail").prop('disabled', true);


                                $("#Main_Hddexiste").val(tur.id);
                            } else {
                                 
                                $("#Main_Hddexiste").val('0');

                                $("#Main_TxtNombre").val('');
                                $("#Main_TxtApellido").val('');
                                $("#Main_TxtNac").val('');
                                $("#Main_cmbObraSocial").val('');
                                $("#Main_TxtCel").val('');
                                $("#Main_txtMail").val('');
                                $("#Main_TxtNac").val('');
                                $("#Main_txtObsHC").val('');
                                $("#Main_txtObs").val('');

                                //$("#TxtNombre").val('');
                                //$("#TxtApellido").val('');
                                //$("#TxtNac").val('');

                                //$("#TxtCel").val('');
                                //$("#txtMail").val('');

                                //$("#TxtNombre").prop('disabled', false);
                                //$("#TxtApellido").prop('disabled', false);
                                //$("#TxtNac").prop('disabled', false);
                                //$("#cmbObraSocial").prop('disabled', false);
                                //$("#TxtCel").prop('disabled', false);
                                //$("#txtMail").prop('disabled', false);
                            }
                        }),
                        error: errores
                    });
                } else {
                    //alert('debe seleccionar un paciente');
                 

                }
            } catch (e) {
                alert(e.message);

            }
        }

        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }
        function SalirPopJs() {
            window.location.href = "Sobreturnos.aspx";
        }
    </script>
    
       <script language="javascript">
           Sys.UI.Point = function Sys$UI$Point(x, y) {

               x = Math.round(x);
               y = Math.round(y);

               var e = Function._validateParams(arguments, [
                   { name: "x", type: Number, integer: true },
                   { name: "y", type: Number, integer: true }
               ]);
               if (e) throw e;
               this.x = x;
               this.y = y;
           }
           Sys.UI.Bounds = function Sys$UI$Bounds(x, y, width, height) {
               x = Math.round(x);
               y = Math.round(y);

               var e = Function._validateParams(arguments, [
                   { name: "x", type: Number, integer: true },
                   { name: "y", type: Number, integer: true },
                   { name: "width", type: Number, integer: true },
                   { name: "height", type: Number, integer: true }
               ]);
               if (e) throw e;
               this.x = x;
               this.y = y;
               this.height = height;
               this.width = width;
           }
           $(document).ready(function () {
               $("#ModalCat").modal();
               //  $(".campoFecha").mask("99/99/9999");

           });
</script>

</asp:Content>
