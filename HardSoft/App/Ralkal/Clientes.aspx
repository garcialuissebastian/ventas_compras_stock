<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="HardSoft.App.Ralkal.Clientes"  enableEventValidation="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
                     Clientes             </li>
                                </ol>
        </nav>
       
        
    <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
           Información del cliente   
            </div>

      <div id="tabs" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs-1"> Particular</a></li>
    <li><a href="#tabs-2"> Comercial</a></li>
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
           
             
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtNombre"
                        ErrorMessage="Requerido" Display="Dynamic" CssClass="error"  ToolTip="" Style=" float:right"></asp:RequiredFieldValidator>
                
              </div>
        
     </div>
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Apellido:</label>
         <div class="col-xs-8">
            <input type="text" 
             <asp:TextBox ID="TxtApellido" runat="server" class="form-control" placeholder="Apellido"></asp:TextBox>
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
                                            <asp:ListItem>Buenos Aires</asp:ListItem>
                                            <asp:ListItem>Catamarca</asp:ListItem>
                                            <asp:ListItem>Chaco</asp:ListItem>
                                            <asp:ListItem>Chubut</asp:ListItem>
                                            <asp:ListItem>Cordoba</asp:ListItem>
                                            <asp:ListItem>Corrientes</asp:ListItem>
                                            <asp:ListItem>Entre Rios</asp:ListItem>
                                            <asp:ListItem>Formosa</asp:ListItem>
                                            <asp:ListItem>Jujuy</asp:ListItem>
                                            <asp:ListItem>La Pampa</asp:ListItem>
                                            <asp:ListItem>La Rioja</asp:ListItem>
                                            <asp:ListItem>Mendoza</asp:ListItem>
                                            <asp:ListItem>Misiones</asp:ListItem>
                                            <asp:ListItem>Neuquen</asp:ListItem>
                                            <asp:ListItem>Rio Negro</asp:ListItem>
                                            <asp:ListItem>Salta</asp:ListItem>
                                            <asp:ListItem>San Juan</asp:ListItem>
                                            <asp:ListItem>San Luis</asp:ListItem>
                                            <asp:ListItem>Santa Cruz</asp:ListItem>
                                            <asp:ListItem>Santa Fe</asp:ListItem>
                                            <asp:ListItem>Santiago del Estero</asp:ListItem>
                                            <asp:ListItem>Tierra del Fuego</asp:ListItem>
                                            <asp:ListItem>Tucuman</asp:ListItem>
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
      <div class="alert alert-success">     Información </div>
         </div>
     </div>
           
             <div class="form-group">
         <label for="TxtRazonComercial" class="control-label col-xs-4">Razón Social:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtRazonComercial" runat="server"   placeholder="Razón Social"  CssClass="form-control" ></asp:TextBox> 
           
         </div>
          
     </div>
             <div class="form-group">
         <label for="TxtCuit" class="control-label col-xs-4">CUIT:</label>
         <div class="col-xs-4">
    
             
               <asp:TextBox ID="TxtCuit" runat="server"  class="form-control"   maxlength="11" placeholder="20111111112"   onKeyPress="return acceptNum(event)" ></asp:TextBox>
             
             
               </div> <div class="col-xs-4">
             
                <input type="button" value="Verificar" class="btn-primary btn"    onclick="Cuit()"/>
               </div>
          
     </div>

               <div class="form-group">
         <label for="TxtRamo" class="control-label col-xs-4">Ramo:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtRamo" runat="server"   placeholder="Ramo"  CssClass="form-control" ></asp:TextBox> 
           
         </div>
          
     </div>
               

      </div>
 </div>

      <div class="col-md-6">
      <div class="form-horizontal">

              <div class="form-group">
         <div class="col-xs-offset-4 col-xs-8">
      <div class="alert alert-success">       Dirección Comercial </div>
         </div>
     </div>
           
             <div class="form-group">
         <label for="TxtDomiComercial" class="control-label col-xs-4">Calle:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtDomiComercial" runat="server"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>
             <div class="form-group">
         <label for="TxtEntreComercial" class="control-label col-xs-4">Entre:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtEntreComercial" runat="server"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>

               <div class="form-group">
         <label for="TxtPuertaComercial" class="control-label col-xs-4">Puerta:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtPuertaComercial" runat="server" onKeyPress="return acceptNum(event)"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>
                 <div class="form-group">
         <label for="TxtDepComercial" class="control-label col-xs-4">Departamento:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtDepComercial" runat="server"      CssClass="form-control" ></asp:TextBox>
         </div>          
     </div>

 <div class="form-group">
         <label for="TxtCPComercial" class="control-label col-xs-4">Código Postal:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtCPComercial" runat="server"      CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>

       <div class="form-group">
         <label for="TxtLocalidadComercial" class="control-label col-xs-4">Localidad:</label>
         <div class="col-xs-8">
           
              <asp:TextBox ID="TxtLocalidadComercial" runat="server"    CssClass="form-control" ></asp:TextBox>
         </div>
          
     </div>
                <div class="form-group">
         <label for="TxtDomiComercial" class="control-label col-xs-4">Provincia:</label>
         <div class="col-xs-8">
           
               <asp:DropDownList ID="cmbProvComercial" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                            <asp:ListItem>Buenos Aires</asp:ListItem>
                                            <asp:ListItem>Catamarca</asp:ListItem>
                                            <asp:ListItem>Chaco</asp:ListItem>
                                            <asp:ListItem>Chubut</asp:ListItem>
                                            <asp:ListItem>Cordoba</asp:ListItem>
                                            <asp:ListItem>Corrientes</asp:ListItem>
                                            <asp:ListItem>Entre Rios</asp:ListItem>
                                            <asp:ListItem>Formosa</asp:ListItem>
                                            <asp:ListItem>Jujuy</asp:ListItem>
                                            <asp:ListItem>La Pampa</asp:ListItem>
                                            <asp:ListItem>La Rioja</asp:ListItem>
                                            <asp:ListItem>Mendoza</asp:ListItem>
                                            <asp:ListItem>Misiones</asp:ListItem>
                                            <asp:ListItem>Neuquen</asp:ListItem>
                                            <asp:ListItem>Rio Negro</asp:ListItem>
                                            <asp:ListItem>Salta</asp:ListItem>
                                            <asp:ListItem>San Juan</asp:ListItem>
                                            <asp:ListItem>San Luis</asp:ListItem>
                                            <asp:ListItem>Santa Cruz</asp:ListItem>
                                            <asp:ListItem>Santa Fe</asp:ListItem>
                                            <asp:ListItem>Santiago del Estero</asp:ListItem>
                                            <asp:ListItem>Tierra del Fuego</asp:ListItem>
                                            <asp:ListItem>Tucuman</asp:ListItem>
                                        </asp:DropDownList>
         </div>
          
     </div>



      </div>

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
        <br />
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

                  $('#Main_TxtRazonComercial').val('');
                  $('#Main_TxtCuit').val('');
                  $('#Main_TxtRamo').val('');
                  $('#Main_TxtDomiComercial').val('');
                  $('#Main_TxtEntreComercial').val('');
                  $('#Main_TxtPuertaComercial').val('');
                  $('#Main_TxtDepComercial').val('');
                  $('#Main_TxtCPComercial').val('');
                  $('#Main_TxtLocalidadComercial').val('');
                  

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


                  $('#Main_TxtRazonComercial').prop('disabled', true);
                  $('#Main_TxtCuit').prop('disabled', true);
                  $('#Main_TxtRamo').prop('disabled', true);
                  $('#Main_TxtDomiComercial').prop('disabled', true);
                  $('#Main_TxtEntreComercial').prop('disabled', true);
                  $('#Main_TxtPuertaComercial').prop('disabled', true);
                  $('#Main_TxtDepComercial').prop('disabled', true);
                  $('#Main_TxtCPComercial').prop('disabled', true);
                  $('#Main_TxtLocalidadComercial').prop('disabled', true);
                  $('#Main_cmbProvComercial').prop('disabled', true);

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


                  $('#Main_TxtRazonComercial').prop('disabled', false);
                  $('#Main_TxtCuit').prop('disabled', false);
                  $('#Main_TxtRamo').prop('disabled', false);
                  $('#Main_TxtDomiComercial').prop('disabled', false);
                  $('#Main_TxtEntreComercial').prop('disabled', false);
                  $('#Main_TxtPuertaComercial').prop('disabled', false);
                  $('#Main_TxtDepComercial').prop('disabled', false);
                  $('#Main_TxtCPComercial').prop('disabled', false);
                  $('#Main_TxtLocalidadComercial').prop('disabled', false);
                  $('#Main_cmbProvComercial').prop('disabled', false);

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

            function Cuit() {
              
                if ($("#cuit").val() == '') { alert('Campo Vacio'); } else {
                    $.ajax({
                        url: "https://soa.afip.gob.ar/sr-padron/v2/persona/" + $("#Main_TxtCuit").val(),
                        responseType: "json",
                        timeout: 20000,
                        cache: true,
                        success: function (result) {




                            if (result.data != null) {

                                alert(result.data.nombre + "\n" + result.data.domicilioFiscal.direccion + " - Cod Postal:" + result.data.domicilioFiscal.codPostal);


                            } else {
                                alert('Cuit/Cuil no existente.');

                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        }
                    });
                }
            }

            function Dni() {
                if ($("#dni").val() == '') { alert('Campo Vacio'); } else {
                    $.ajax({
                        url: "https://soa.afip.gob.ar/sr-padron/v2/personas/" + $("#dni").val(),
                        responseType: "json",
                        timeout: 20000,
                        cache: true,
                        success: function (result) {




                            if (result.data != null) {

                                alert('CUIT: ' + result.data);


                            } else {
                                alert('N° Doc no existente.');

                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        }
                    });
                }
            }
 
        </script>


         
    
   
 

    </div>
    </div>
   
     

 


</asp:Content>
