<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="HardSoft.App.Ralkal.Personal"  enableEventValidation="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/App/Ralkal/CtrlFrm/Puestos.ascx" TagPrefix="uc1" TagName="Puestos" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
         <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="http://www.hardsoft.com.ar/css/jquery-ui.css">
          
    <script src="http://www.hardsoft.com.ar/js/jquery.maskedinput.js"></script>
    <script src="http://www.hardsoft.com.ar/Scripts/jquery-ui.js"></script>
     

    <script language="JavaScript" type="text/javascript">
         
        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        } 
    </script>


    
       
    <div class=" container">
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                    Personal             </li>
                                </ol>
        </nav>
       
        
    <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
           Información del Personal   
            </div>

      <div id="tabs" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs-1"> Datos</a></li>
      <li><a href="#tabs-2"> Trabajo</a></li>
    <li><a href="#tabs-3">Contacto</a></li>
      
  </ul>


  <div id="tabs-1">

      <div class="row">
      <div class="col-md-6">
      <div class="form-horizontal">

              <div class="form-group">
         <div class="col-xs-offset-4 col-xs-8">
         <div class="alert alert-success"> Información </div>
         </div>
     </div>


       <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Nombre:</label>
         <div class="col-xs-8">
           
           
             <asp:TextBox ID="TxtNombre" runat="server" class="form-control" placeholder="Nombre"></asp:TextBox>

              </div>
        
     </div>
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Apellido:</label>
         <div class="col-xs-8">
            
             <asp:TextBox ID="TxtApellido" runat="server" class="form-control" placeholder="Apellido" ></asp:TextBox>
         </div>
        
     </div>
    
          <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Tipo Doc : </label>
         <div class="col-xs-8">

   <asp:DropDownList ID="cmbTipoDoc" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem>DNI</asp:ListItem>
                                            <asp:ListItem>LE</asp:ListItem>
                                            <asp:ListItem>LC</asp:ListItem>
                                            <asp:ListItem>LDI</asp:ListItem>
                                            <asp:ListItem>CI</asp:ListItem>
                                            <asp:ListItem>DOC(OTRO)</asp:ListItem>
                                             
                                        </asp:DropDownList>
      
         </div>
           
     </div>
            <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4">N° Documento:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtNunDoc" runat="server"  onKeyPress="return acceptNum(event)"   placeholder="N° Documento"  CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>

           <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"> Nacimiento:</label>
         <div class="col-xs-8">
           
              

     <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup" runat="server" TargetControlID="TxtDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 

             
             
               </div>
          
     </div>
     <div class="form-group">
         <label for="TxtLugarNac" class="control-label col-xs-4">Lugar Nacimiento</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtLugarNac" runat="server"    CssClass="form-control"   placeholder="Lugar de Nacimiento"  ></asp:TextBox>
         </div>
          
     </div>
          <div class="form-group">
         <label for="TxtEstadoCivil" class="control-label col-xs-4">Estado Civil:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtEstadoCivil" runat="server"   placeholder="Estado Civil"  CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>
          
          
         
      </div>

   </div>


    <div class="col-md-6">
      <div class="form-horizontal">

              <div class="form-group">
         <div class="col-xs-offset-4 col-xs-8">
  <div class="alert alert-success">   Dirección Particular </div>
         </div>
     </div>
           
             <div class="form-group">
         <label for="TxtDomiParticular" class="control-label col-xs-4">Calle:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtDomiParticular" runat="server"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>
             <div class="form-group">
         <label for="TxtEntreParticular" class="control-label col-xs-4">Entre:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtEntreParticular" runat="server"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>

               <div class="form-group">
         <label for="TxtPuertaParticular" class="control-label col-xs-4">Puerta:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtPuertaParticular" runat="server" onKeyPress="return acceptNum(event)"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>
                 <div class="form-group">
         <label for="TxtDepParticular" class="control-label col-xs-4">Departamento:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtDepParticular" runat="server"      CssClass="form-control" ></asp:TextBox>
         </div>          
     </div>

 <div class="form-group">
         <label for="TxtCPParticular" class="control-label col-xs-4">Código Postal:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtCPParticular" runat="server"      CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>

       <div class="form-group">
         <label for="TxtLocalidadParticular" class="control-label col-xs-4">Localidad:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtLocalidadParticular" runat="server"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>
                <div class="form-group">
         <label for="TxtDomiParticular" class="control-label col-xs-4">Provincia:</label>
         <div class="col-xs-8">
           
               <asp:DropDownList ID="cmProvParticular" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem Value="0" >Buenos Aires</asp:ListItem>
                                            <asp:ListItem Value="1">Catamarca</asp:ListItem>
                                            <asp:ListItem Value="2">Chaco</asp:ListItem>
                                            <asp:ListItem Value="3">Chubut</asp:ListItem>
                                            <asp:ListItem Value="4">Cordoba</asp:ListItem>
                                            <asp:ListItem Value="5">Corrientes</asp:ListItem>
                                            <asp:ListItem Value="6">Entre Rios</asp:ListItem>
                                            <asp:ListItem Value="7">Formosa</asp:ListItem>
                                            <asp:ListItem Value="8">Jujuy</asp:ListItem>
                                            <asp:ListItem Value="9">La Pampa</asp:ListItem>
                                            <asp:ListItem Value="10">La Rioja</asp:ListItem>
                                            <asp:ListItem Value="11">Mendoza</asp:ListItem>
                                            <asp:ListItem Value="12">Misiones</asp:ListItem>
                                            <asp:ListItem Value="13">Neuquen</asp:ListItem>
                                            <asp:ListItem Value="14">Rio Negro</asp:ListItem>
                                            <asp:ListItem Value="15">Salta</asp:ListItem>
                                            <asp:ListItem Value="16">San Juan</asp:ListItem>
                                            <asp:ListItem Value="17">San Luis</asp:ListItem>
                                            <asp:ListItem Value="18">Santa Cruz</asp:ListItem>
                                            <asp:ListItem Value="19">Santa Fe</asp:ListItem>
                                            <asp:ListItem Value="20">Santiago del Estero</asp:ListItem>
                                            <asp:ListItem Value="21">Tierra del Fuego</asp:ListItem>
                                            <asp:ListItem Value="22">Tucuman</asp:ListItem>
                                        </asp:DropDownList>
         </div>
          
     </div>



      </div>

   </div>

      </div>

 </div>
 
<div id="tabs-2">
       <div class="row">
      <div class="col-md-6">
      <div class="form-horizontal">

              <div class="form-group">
         <div class="col-xs-offset-4 col-xs-8">
      <strong>         </strong> 
         </div>
     </div>
           
             <div class="form-group">
         <label for="TxtRazonComercial" class="control-label col-xs-4">Puesto que ocupa:</label>
         <div class="col-xs-7">
           
              <asp:DropDownList ID="cmbPuesto" runat="server" CssClass="form-control " Width="100%"  >                                         
                                            
                                        </asp:DropDownList>
         </div>

  <div class="col-xs-1">
     
          <div style="cursor:pointer" onclick="PopCat()" id="Pop">    <img src="../../images/anadir2.png" /></div> 
           
     </div>

          
     </div>
      <div class="form-group">
         <label for="Fax" class="control-label col-xs-4">Fecha Ingreso</label>
         <div class="col-xs-8">
           
                  <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtFechaIngreso" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaIngreso"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 

         </div>          
     </div> 
                
      </div>

        </div>

      <div class="col-md-6">
          </div>

        </div>
 </div>
    


 <div id="tabs-3">
       <div class="row">
      <div class="col-md-6">
      <div class="form-horizontal">

              <div class="form-group">
         <div class="col-xs-offset-4 col-xs-8">
      <strong>         </strong> 
         </div>
     </div>
           
             <div class="form-group">
         <label for="TxtRazonComercial" class="control-label col-xs-4">Télefono:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtTelefono" runat="server"   placeholder="Télefono"  CssClass="form-control" ></asp:TextBox> 
           
         </div>
          
     </div>
      <div class="form-group">
         <label for="Fax" class="control-label col-xs-4">Fax:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtFax" runat="server"   placeholder="Fax"  CssClass="form-control" ></asp:TextBox> 
           
         </div>          
     </div> 
               <div class="form-group">
         <label for="TxtCel" class="control-label col-xs-4">Celular:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtCel" runat="server"   placeholder="Celular"  CssClass="form-control" ></asp:TextBox> 
           
         </div>
          
     </div>
               
          <div class="form-group">
         <label for="txtMail" class="control-label col-xs-4">Mail:</label>
         <div class="col-xs-8">
                                 <asp:TextBox ID="txtMail" runat="server"   placeholder="e-Mail" CssClass="form-control"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="retxtMail" runat="server" ControlToValidate="txtMail"
                                                ValidationExpression=".*@.*\..*" ErrorMessage="No valido" Display="Dynamic" ToolTip="Debe ingresar una dirección de mail valida" ForeColor="Red"></asp:RegularExpressionValidator>
         </div>          
     </div> 
      </div>

        </div>

      <div class="col-md-6">
          </div>

        </div>
 </div>
        
          
          
            </div>


        
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
        <asp:TextBox ID="TxtPuesto" runat="server"></asp:TextBox>
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

        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.location.href='Personal_ver.aspx';" >
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
 
        <br />

               <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


            <uc1:Puestos runat="server" ID="Puestos" />




              </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
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
              function LimpiarFrm() {
              

                  $('#Main_TxtNombre').val('');
                  $('#Main_TxtApellido').val('');
                 
                  $('#Main_TxtNunDoc').val('');
                  $('#Main_TxtDesde').val('');
                  $('#Main_TxtLugarNac').val('');
                  $('#Main_TxtEstadoCivil').val('');
                  $('#Main_TxtDomiParticular').val('');
                  $('#Main_TxtEntreParticular').val('');
                  $('#Main_TxtPuertaParticular').val('');
                  $('#Main_TxtDepParticular').val('');
                  $('#Main_TxtCPParticular').val('');
                  $('#Main_TxtLocalidadParticular').val('');

               
                  

                  $('#Main_TxtTelefono').val('');
                  $('#Main_TxtFax').val('');
                  $('#Main_TxtCel').val('');
                  $('#Main_txtMail').val('');



              }
              function deshabilitarFrm() {
                   
                  $('#Main_TxtNombre').prop('disabled', true);
                  $('#Main_TxtApellido').prop('disabled', true);
                  $('#Main_cmbTipoDoc').prop('disabled', true);
                  $('#Main_TxtNunDoc').prop('disabled', true);
                  $('#Main_TxtDesde').prop('disabled', true);
                  $('#Main_TxtLugarNac').prop('disabled', true);
                  $('#Main_TxtEstadoCivil').prop('disabled', true);
                  $('#Main_TxtDomiParticular').prop('disabled', true);
                  $('#Main_TxtEntreParticular').prop('disabled', true);
                  $('#Main_TxtPuertaParticular').prop('disabled', true);
                  $('#Main_TxtDepParticular').prop('disabled', true);
                  $('#Main_TxtCPParticular').prop('disabled', true);
                  $('#Main_TxtLocalidadParticular').prop('disabled', true);
                  $('#Main_cmProvParticular').prop('disabled', true);
 
             
                  $('#Main_cmbPuesto').prop('disabled', true);
                  $('#Main_TxtFechaIngreso').prop('disabled', true);
                  $('#Pop').hide();

                  $('#Main_TxtTelefono').prop('disabled', true);
                  $('#Main_TxtFax').prop('disabled', true);
                  $('#Main_TxtCel').prop('disabled', true);
                  $('#Main_txtMail').prop('disabled', true);


                   
                  if ($("#Main_HiddenField1").val() == 'Alta') {
                      LimpiarFrm();
                  }
              }


              function  habilitarFrm() {

                  $('#Main_TxtNombre').prop('disabled', false);
                  $('#Main_TxtApellido').prop('disabled', false);
                  $('#Main_cmbTipoDoc').prop('disabled', false);
                  $('#Main_TxtNunDoc').prop('disabled', false);
                  $('#Main_TxtDesde').prop('disabled', false);
                  $('#Main_TxtLugarNac').prop('disabled', false);
                  $('#Main_TxtEstadoCivil').prop('disabled', false);
                  $('#Main_TxtDomiParticular').prop('disabled', false);
                  $('#Main_TxtEntreParticular').prop('disabled', false);
                  $('#Main_TxtPuertaParticular').prop('disabled', false);
                  $('#Main_TxtDepParticular').prop('disabled', false);
                  $('#Main_TxtCPParticular').prop('disabled', false);
                  $('#Main_TxtLocalidadParticular').prop('disabled', false);
                  $('#Main_cmProvParticular').prop('disabled', false);

 
                  $('#Main_cmbPuesto').prop('disabled', false);
                  $('#Main_TxtFechaIngreso').prop('disabled', false);

                  $('#Pop').show();


                  $('#Main_TxtTelefono').prop('disabled', false);
                  $('#Main_TxtFax').prop('disabled', false);
                  $('#Main_TxtCel').prop('disabled', false);
                  $('#Main_txtMail').prop('disabled', false);

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

                  $('#btnGuardar1').attr("class", "btn2 btn-danger");

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

                  $('#btnGuardar1').attr("class", "btn2 btn-primary");

              }
               
              function BtnFnModificar1() {
                  $("#Main_LblMsg").text('')
                  $("#Main_HiddenField1").val('Modificar');
                  habilitarFrm();

                  $('#btnAgregar1').prop('disabled', true);
                  $('#btnModificar1').prop('disabled', false);
                  $('#btnElimina1').prop('disabled', true);
                  $('#btnCancelar1').prop('disabled', false);
                  $('#btnGuardar1').prop('disabled', false);

                  $('#btnGuardar1').attr("class", "btn2 btn-danger");

              }
              function BtnFnEliminar1() {
                  $("#Main_LblMsg").text('¿ Desea Eliminar ? Presione Guardar para confirmar. ')

                  $("#Main_HiddenField1").val('Eliminar');

                  $('#btnAgregar1').prop('disabled', true);
                  $('#btnModificar1').prop('disabled', true);
                  $('#btnElimina1').prop('disabled', false);
                  $('#btnCancelar1').prop('disabled', false);
                  $('#btnGuardar1').prop('disabled', false);

                  $('#btnGuardar1').attr("class", "btn btn-danger");

              }
              function Exito() {

                  $("#Main_HiddenField1").val("Cancelar");
                  LimpiarFrm();
               
             //    $("#Main_LblMsg").text('Se completo con éxito la transacción');
                 
                  deshabilitarFrm();
                  deshabilitar();

              }
              function BtnFnGuardar1() {
                  $("#Main_LblMsg").text('')
                  var Op = '';
                    Op = $("#Main_HiddenField1").val();

                   
                  switch (Op) {
                      case 'Alta':
                        
                          $("#Main_btnAgregar").click();

                          Exito();
                      

                          break;

                      case 'Eliminar':
                          $("#Main_btnEliminar").click();

                          Exito();
                          break;
                      case 'Modificar':

                          $("#Main_btnModificar").click();
                          Exito();

                          break;
                      case 'Cancelar':
                        
                          break;
                     
                  }
                   
              }

</script>


        <script type="text/javascript">
            $(function () {
                $(".campoFecha").mask("99/99/9999");
                $('#tabs').tabs();

                ListarPuestos();

                habilitar();
                deshabilitarFrm();
               
                var TipoOp = getUrlParameter('TipoOp');
                var Idsp = getUrlParameter('Idsp');
                if (Idsp > 0) {
                    $("#Main_TxtId").val(Idsp);
                    Cargar(Idsp);
                }

              


                if (TipoOp == "Add") {
                    $('#btnModificar1').hide();
                    $('#btnElimina1').hide();
                } else {
                    $('#btnModificar1').show();
                    $('#btnElimina1').show();

                }



            });

            $("#Main_cmbPuesto").change(function () {
              //  var text = $("#Main_cmbPuesto option:selected").text();
                var value = $("#Main_cmbPuesto option:selected").val();
                $("#Main_TxtPuesto").val(value);
                
            });



            function Cargar(v_id) {
                try {

                    var json = JSON.stringify
              ({
                  
                  "Ids": v_id
              });

                    $.ajax({
                        type: "POST",
                        url: "Personal.aspx/WsPersona",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarP,
                        error: errores
                    });



                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarP(Resultado) {
                try {

                    
                var obj = Resultado.d;
               
                if (obj.Nombre != '') {



                    $('#Main_TxtNombre').val(obj.Nombre);
                    $('#Main_TxtApellido').val(obj.Apellido);

                    $('#Main_TxtNunDoc').val(obj.Doc_no);



                    $('#Main_TxtDesde').val(obj.Fecha_nac);


                    $('#Main_TxtFechaIngreso').val(obj.Fecha_ing);

                    $('#Main_TxtLugarNac').val(obj.Lugar_nac);







                    $('#Main_TxtEstadoCivil').val(obj.Estado_civil);
                    $('#Main_TxtDomiParticular').val(obj.Domi_particular);
                    $('#Main_TxtEntreParticular').val(obj.entre_particular);
                    $('#Main_TxtPuertaParticular').val(obj.Puerta_particular);
                    $('#Main_TxtDepParticular').val(obj.Dep_particular);
                    $('#Main_TxtCPParticular').val(obj.Cp_particular);
                    $('#Main_TxtLocalidadParticular').val(obj.Loc_particular);

                    $('#Main_TxtId').val(obj.Id);
                    $('#Main_TxtPuesto').val(obj.Puesto);


                    $('#Main_TxtTelefono').val(obj.Tel);
                    $('#Main_TxtFax').val(obj.Fax);
                    $('#Main_TxtCel').val(obj.Cel);
                    $('#Main_txtMail').val(obj.Mail);


                  

                    $('#Main_cmbTipoDoc').attr('selected', false);
                    $("#Main_cmbTipoDoc option[value=" + obj.Doc_tipo + "]").attr("selected", true);

                    $('#Main_cmProvParticular').attr('selected', false);
                    $("#Main_cmProvParticular option[value=" + obj.Prov_particular + "]").attr("selected", true);

                    $('#Main_cmbPuesto').attr('selected', false);
                    $("#Main_cmbPuesto option[value=" + obj.Puesto + "]").attr("selected", true);

                }
                } catch (e) {

                }


            }
 

            function ListarPuestos() {
                try {

                    var json = JSON.stringify
              ({
                  "v_tipo":'',
                  "v_valor":''
              });

                    $.ajax({
                        type: "POST",
                        url: "Personal.aspx/WsListarPuestos",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarCat,
                        error: errores
                    });


                     
                } catch (e) {
                    alert(e.message);
                } 
            }
            function CargarCat(Resultado) {

                var Especialidad = Resultado.d;
                $('#Main_cmbPuesto').empty();

                $('#Main_cmbPuesto').append('<option value="0">Seleccione una Categoria</option>');

                $.each(Especialidad, function (index, especialidades) {
                    $('#Main_cmbPuesto').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                        );
                });
            }
            function errores(msg) {
                var jsonObj = JSON.parse(msg.responseText);
                alert('Error: ' + jsonObj.Message);
            }
            function PopCat() {

                $('#Main_Puestos_TxtNombre').val('');
                $('#Main_Puestos_TxtDescripcion').val('');
                $("#ModalCat").modal();
            }

        </script>


         
  


    </div>
    </div>
    


</asp:Content>
