
 <%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master"  Culture="Auto" UICulture="Auto"  AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="HardSoft.App.ORL.Pacientes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">

     </asp:ScriptManager>
 <%-- <script type="text/javascript" src="/js/jquery.js"></script>
    <link href="../../Scripts/viewer/viewer.css" rel="stylesheet" />
  
    <script src="/Scripts/jquery-3.3.1.slim.min.js"></script> 
  <script src="/Scripts/bootstrap.bundle.min.js"></script>
      
   <script src="../../Scripts/viewer/viewer.js"></script> --%>

    
    

    <style type="text/css">
        .webcam-container {
            padding: 0;
            margin: 0;
        }

        .size640x480 {
            width: 640px;
            height: 480px;
        }

        .webcam-container object {
            border: 1px solid #000;
        }

        .webcam-error {
            color: red;
            padding-top: 10px;
        }
    </style>

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
           <script src="/Scripts/jquery-ui.js"></script>
    <script src="/js/jquery.maskedinput.js"></script>
   

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

     <script type="text/javascript" src="jquery.webcam.js"></script>
    
<%--         <!-- jQuery -->
<script type="text/javascript" async="" src="/js/pen/ga.js"></script>
   
<script type="text/javascript" src="/js/pen/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="/js/pen/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="/js/pen/jquery.ui.mouse.min.js"></script>
<script type="text/javascript" src="/js/pen/jquery.ui.draggable.min.js"></script>

<!-- wColorPicker -->
<link rel="Stylesheet" type="text/css" href="/js/pen/wColorPicker.css">
<script type="text/javascript" src="/js/pen/wColorPicker.js"></script>

<!-- wPaint -->
<link rel="Stylesheet" type="text/css" href="/js/pen/wPaint.css">
<script type="text/javascript" src="/js/pen/wPaint.js"></script>
<link href="/js/pen/top.css" rel="stylesheet" type="text/css">--%>

    <style>
        .modal-lg {
    width: 1100px;
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
                Ver Pacientes        </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>   Pacientes </strong> 
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
          <option value="4">DNI</option>
          
           <option value="6">Apellido</option>
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
          
           
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />
   </div>



           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"   style="background-color: rgb(241, 241, 241);">
      <div class="row" >
           <div class=" col-xs-3 " style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;">
         <button id="btnModificar1" type="button" class="btn2 btn-info " onclick="habilitarFrm()">
    <span class="  glyphicon  glyphicon-pencil"></span> 
  </button>

              <div   id="TituloPop"  style="float:right  ;    padding-right: 40px;
    padding-top: 6px;"  >
      
       </div>   
               </div>   
                
                 
         <div class=" col-xs-9 "  >
                 <button type="button" class="close" data-dismiss="modal" id="close2">&times;</button>
           </div>
          </div>
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
       
     


    
      <div id="tabs" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs-1"> Datos</a></li>
     
      <li><a href="#tabs-3"> O.S</a></li>
       <li><a href="#tabs-2"> Contacto</a></li>
        <li><a href="#tabs-4" id="foto">Foto</a></li>
  </ul>


  <div id="tabs-1">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
 

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
               <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
 DATOS
         </div>
           
     </div>



    
       
           <div class="form-group">
      <div class="col-xs-4">

             <select id="CmbTipoDoc" class="form-control" style="width: 95px;float:right;height: 35px;">
                 <option value="DNI"> DNI </option>
                
             </select>

      </div>
         <div class="col-xs-4">
<asp:TextBox ID="TxtCuit" runat="server"  class="form-control"  Width="120px"     onKeyPress="return acceptNum(event)" ></asp:TextBox>
                 
         </div> <div class="col-xs-4">

      <a id="afip" class="tooltips" style="cursor:pointer ; display:none" href="#"   >        <img src="../../images/afip.jpeg" style="width:88px" />
           <span>Constancia</span></a>
         
         </div>
     </div>
           <div style="display:none">
            <asp:TextBox ID="TxtCodSistema" runat="server" class="form-control"  ></asp:TextBox>
               </div>
                  <div class="form-group">
         <label for="l" class="control-label col-xs-4">Nombre</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

       <div class="form-group">
         <label for="TxtApe" class="control-label col-xs-4">Apellido</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtApellido" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

                  <div class="form-group">
        
                             
                              <label for="l" class="control-label  col-xs-3 col-md-4">Fecha Nacimiento</label>
    <div class=" col-md-8">   
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
               
         </div>
            
 
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Observaciones</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtObservacion" runat="server" class="form-control"  Height="85"  TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>

      
     
        
        </div>
          </div>
       <div class="col-xs-6">
        <div class="form-horizontal">
                <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
DOMICILIO
         </div>
           
     </div>
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Calle </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtCalle" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Número </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtNum" runat="server" class="form-control"   onKeyPress="return acceptNum(event)" ></asp:TextBox>
      
         </div>

             <label for="TxtNombre" class="control-label col-xs-2">Dpto </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtDpto" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >País</label>
         <div class="col-xs-4">
              <input id="HddPais" type="hidden" />
  <select id="cmbPais" class="form-control">
          
      </select>
      
         </div>

                
             <label for="TxtNombre" class="control-label col-xs-1">CP</label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtCp"  onKeyPress="return acceptNum(event)" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Provincia</label>
         <div class="col-xs-8">
              <input id="HddProv" type="hidden" />
  <select id="cmbProv" class="form-control">
          
      </select>
      
         </div>
           
     </div>
      
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Departamento</label>
         <div class="col-xs-8">
             <input id="HddDep" type="hidden" />
  <select id="cmbDepartamento" class="form-control">
          
       
      </select>
      
         </div>
           
     </div>
      
     <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4" >Distrito</label>
         <div class="col-xs-8">
 <input id="HddDis" type="hidden" />
  <select id="cmbDistrito" class="form-control">
          
       
      </select>
      
         </div>
           
     </div>
         
        </div>
          </div>
 
</div>
      </div>


   <div id="tabs-2">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
     <div class="col-xs-8">
        <div class="form-horizontal">
                <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
Contacto
         </div>
           
     </div>
            
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Teléfono</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpTel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
     
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">E-mail</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpMail" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

  
        <div class="form-group">
         <div id="TxtMsj" class="col-xs-12  alert-danger"></div>
   
           
     </div>
   
      
        </div>
          </div>

       <div class="col-xs-4">
          
       <div class="form-horizontal" >
    
        </div>
          </div>
   
 
</div>
      </div>

    <div id="tabs-3">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
     <div class="col-xs-6">
        <div class="form-horizontal">
                <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
OBRA SOCIAL
         </div>
           
     </div>
             

          <div class="form-group">
         <label for="inputName" class="control-label col-xs-3 col-md-4"  >Obra Social</label>
         <div class="col-md-8">
            
             <asp:DropDownList ID="cmbObraSocial" runat="server" CssClass="form-control"> 
              
             </asp:DropDownList>
              </div>
    
     </div>

 
      
    
           
     
                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">N°</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNroOS" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
   
  
        <div class="form-group">
         <div id="TxtMsj" class="col-xs-12  alert-danger"></div>
   
           
     </div>
   
      
        </div>
        
         
           </div></div>

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
    
        </div>
          </div>
   
 
</div>
     
                  <div id="tabs-4" > 
   <div class="row">
       
         <div class="col-md-6">
               <div id="result" style="    margin: auto;
    text-align: center;" >
          <img id="myUploadedImg"    style="    width: 320px;" />   
    </div>
           

<%--         <asp:Image ID="imgCapture" runat="server" Style="visibility: hidden; width: 320px;
                height: 240px"  CssClass="img-rounded"/>--%>
  <br/>
            <button type="button" class="btn2 btn-danger"  id="btnfoto" onclick="foto()"> 
    <span class=" glyphicon glyphicon-camera"></span> Nueva Foto
  </button>      
             

   </div>


        <div class="col-md-6">
             <div id="verfoto" style="display:none">
  <table border="0" cellspacing="0" cellpadding="0" style=" margin:auto">
        <tr>
            <td class="webcam-container ">
                <div id="webcam"
                     data-swffile="sAS3Cam.swf"
                    >
                </div>
            </td>
        </tr>
        <tr>
            <td class="webcam-text">
                <div>
                    <select id="popup-webcam-cams"></select>
                </div>
                <div>
                    <input id="popup-webcam-take-photo"
                           type="button"
                           disabled="disabled"
                           value="Tomar foto"
                           style="display:none" />
                </div>
                <p class="webcam-error"></p>
            </td>
        </tr>
    </table>
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
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; margin-bottom:5px;background-color:#b9b9b9; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


                <asp:Button ID="BtnHc" runat="server" Text="Ver HC"  CssClass="pull-left btn btn-primary" OnClick="BtnHc_Click"/>

             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar</button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>
<button id="btnVolver" type="button" class="btn2   btn-danger " onclick="volverPop()">
      <span class=" glyphicon glyphicon-log-out"></span>Volver</button>

        <button type="button" class="btn2 btn-danger" data-dismiss="modal" id="btncerrarpop"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button>
 

        
    
               

              <br />
               


               </div>
             
      
        


</div>




              </div>
        
      </div>
      
    </div>
    
    
            <!-- Modal    hc  -->
  <div class="modal fade" id="ModalHc" role="dialog" style="display:none"  >
    <div class=" modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"   style="background-color:rgb(179, 179, 179);">
      <div class="row" >
              <div class=" col-xs-6 "     style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;" >
       <button  id="btnModificar11" type="button" class="btn2 btn-default " onclick="BtnFnModificar11()">
    <span class="  glyphicon  glyphicon-pencil"></span> 
  </button>

                   <button id="btnElimina11" type="button" class="btn2  btn-default "  onclick="BtnFnEliminar11()">
    <span class=" glyphicon glyphicon-trash"></span> 
  </button>

                  
                       <button id="btnCancelar11" type="button" class="btn2  btn-default " onclick="BtnCancelar11()">
    <span class=" glyphicon glyphicon-floppy-remove"></span>  
  </button>

                   <span style="    margin-left: 5px;color:red" id="lblos"></span>
<div class="row" style="    font-size: 15px;    line-height: 16px;">
                 
            
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-3"> </label>
         <div class="col-xs-9">

    <span style=" " id="lblPac"></span>
         </div>
           
     </div>
       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-3"> </label>
         <div class="col-xs-9">

    <span style=" " id="lblNac"></span>
         </div>
           
     </div>
    
                      <div class="form-group">
         
         <div class="col-xs-12">

    <span style="     margin-left: 137px;" id="lbltel"></span>
         </div>
           
     </div>

        <div class="form-group">
         
         <div class="col-xs-12">

    <span style="     margin-left: 137px;" id="lbldir"></span>
         </div>
           
     </div>

</div>

          

                       
       </div>     
         <div class=" col-xs-5 "  >

             <asp:TextBox ID="TxtDatos" runat="server" Height="94px"  TextMode="MultiLine" CssClass="form-control" Width="100%" ></asp:TextBox>
           </div>   <div class=" col-xs-1 "  >
                 <button type="button" class="close btn btn-info"  onclick="cerrarPop1()" style="background-color:red;     padding-right: 5px;
    padding-left: 5px;">&times;</button>
           </div>
          </div>
    <asp:HiddenField ID="HddId" runat="server"   />
        <div class="modal-body">

             
          <div   style="margin-top:0px;text-transform:uppercase; font-size: 10px;" >
          
                <div id='ResultadoHc' style="overflow-y: auto; overflow-x: hidden; height: 140px;  text-align: left; "></div>
                  
      <div id="tabs1" style="text-transform:uppercase">
  <ul>
       <li><a href="#tabs1-1"> 1</a></li>
    <li><a href="#tabs1-2"> 2</a></li>
      <li><a href="#tabs1-3">3</a></li>
      
  </ul>

 
          
            <div id="tabs1-2">
      <div class="row"  style="  padding-top:10px;  border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; ">
    
          <table>
<tbody>

<tr>
<td>

    
<div id="wPaintNo" style="position:relative; width:952px; height:303px; text-align:center "> 

    <img src="img/narizdeshabilitadas.png"  />
</div>

<div id="wPaint" style="position:relative; width:952px; height:303px; display:none">
<canvas width="952px" height="303px" style="position: absolute; left: 0px; top: 0px;"></canvas>
<canvas style="position: absolute; display: none;"></canvas>
<textarea class="_wPaint_textInput" spellcheck="false" style="display: none; position: absolute; color: rgb(255, 255, 255); font-size: 12px; line-height: 12px; font-family: Arial;"></textarea>
 
 
 

<td>
    <%--<img id="canvasImage" src="data:image/png;base64,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">--%>

</td>
</tr>
<tr>
<td colspan="2">
    <div> <a href="javascript:loadImage_base64('');">Nueva Imagen</a>  
 
</div>
 
</tr>
</tbody>

          </table>
          
          
          
          
          <div  style=" display:none;">
           <div class="col-xs-3">
        <div class="form-horizontal ">
            
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-8">Peso (Kg)</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtPeso" runat="server" class="form-control"  Width="70"  onkeypress="return acceptNum2(event, this.value)"></asp:TextBox>
      
         </div>
           
     </div>
                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-8">Temp.(°C)
         </label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtTemp" runat="server" class="form-control" Width="70" onkeypress="return acceptNum2(event, this.value)" ></asp:TextBox>
      
         </div>
           
     </div>
   
        </div>
          </div>

       <div class="col-xs-3">
          
       <div class="form-horizontal" >
                   <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-8">Presión Art. (mmHg) </label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtPreArt" runat="server" class="form-control" Width="70"  onkeypress="return acceptNum2(event, this.value)" ></asp:TextBox>
      
         </div>
           
     </div>
           
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-8">Sat.O2 (%)</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtSat" runat="server" class="form-control"   Width="70" onkeypress="return acceptNum2(event, this.value)" ></asp:TextBox>
      
         </div>
           
     </div>
            
        </div>
          </div>
   
   <div class="col-xs-3">
          
       <div class="form-horizontal" >
    
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-8">Frec.Cardiaca </label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtFrecCardiaca" runat="server" class="form-control" Width="70" onkeypress="return acceptNum2(event, this.value)"  ></asp:TextBox>
      
         </div>
           
     </div>
           
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-8">HGTN (mg/dl)</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtHGTN" runat="server" class="form-control"  Width="70"   onkeypress="return acceptNum2(event, this.value)"></asp:TextBox>
      
         </div>
           
     </div>
              
     
        
        </div>
          </div>

            <div class="col-xs-3">
          
       <div class="form-horizontal" >
    
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-8"> Frec.Resp. (mpm)</label>
         <div class="col-xs-4">

 <asp:TextBox ID="TxtFrecResp" runat="server" class="form-control" Width="70" onkeypress="return acceptNum2(event, this.value)"  ></asp:TextBox>
      
         </div>
           
     </div>
           
          
        
        </div>
          </div>

          </div>
</div>
      </div>

           <div id="tabs1-1"> 

                       <div class="row"  style="    padding-top: 5px;  border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; ">
 
       <div class="col-xs-12">
          
       <div class="form-horizontal" >
           
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="font-size: 11px;">Fecha HC</label>
         <div class="col-xs-3">
 

                      <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtFechaHc" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaHc"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
         </div>

                     <label id="Consultorio" class="control-label col-xs-7" style="font-weight: bold;
    font-size: 14px;
    text-align: left;"></label>
                    
 

           
     </div>
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="font-size: 11px;">M.C</label>
         <div class="col-xs-10">

 <asp:TextBox ID="TxtSintoma" runat="server" class="form-control"  Height="65" TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>

                     <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="font-size: 11px;">TRATAMIENTO</label>
         <div class="col-xs-10">

 <asp:TextBox ID="TxtDiagPresu" runat="server" class="form-control"    TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>

               <div style="font-size:16px">   <asp:Label ID="LblMsg1" runat="server" Text="" CssClass="alert-danger" ></asp:Label></div> 

           </div>

         </div>
               <div  style="display:none">
                              <div class="col-xs-6" >
   <div class="form-horizontal" >
       
                       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="font-size: 11px;">Tratamiento</label>
         <div class="col-xs-10">

 <asp:TextBox ID="TxtTratamiento" runat="server" class="form-control"   TextMode="MultiLine" Height="70"></asp:TextBox>
      
         </div>
           
     </div>            
           
                 <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="font-size: 11px;">Indicaciones</label>
         <div class="col-xs-10">

 <asp:TextBox ID="TxtIndicaciones" runat="server" class="form-control"  TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>

                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2" style="font-size: 11px;">Observaciones</label>
         <div class="col-xs-10">

 <asp:TextBox ID="TxtObseHc" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>


   </div>
                  
                  
                  </div>
              
                   </div>        
                           
                              </div>
  
           </div> 
         
           <div id="tabs1-3"> 

                       <div class="row"  style="    padding-top: 5px;  border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; ">
  
                   
         <div  style="border-bottom: solid;
    height: 40px;"> 
             <div class=' col-lg-offset-1 col-sm-3'>
              <input type="file"    id="f_UploadImage"  accept="image/x-png,image/gif,image/jpeg"   size="35" class="form-control"> 
           <%--  <img id="myUploadedImg" style="width:180px;" />--%>

                </div>  
              <div class='col-sm-3'>
   <asp:TextBox ID="TxtNombreImg" runat="server" CssClass="form-control" placeholder="Descripción del archivo"></asp:TextBox>
              </div>
          
              <div class='col-sm-1'>
                  <button id="btnAgregar1b3" type="button" class="btn2 btn-info  " onclick="previewFile()" >
    <span class=" glyphicon glyphicon-save" id="btnAgregar1b31"></span> Guardar
 </button>
                 </div>
              <div class='col-sm-3'>
         
                  <img src="../../images/Loading_icon.gif"  height="37" id="wait"  style="float: left;
    margin-left: 10px; display:none"/>
                
              </div>
               
         </div>                           
                       <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_hosp_hc_files' style='overflow: auto;  height: 310px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillahosp_hc_files'></table>   
   </div> 
                        
   

                    

           </div>
          
           </div>


 
        
<div class="row">
     <asp:HiddenField ID="HiddenField11" runat="server"   />
      <asp:HiddenField ID="HiddenField3" runat="server"   />
     <asp:HiddenField ID="HddImg" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="Txt_tur" runat="server"></asp:TextBox>
    </div>
</div>
        
          
</div>
          
         <div   style="  background-color:#7b7b7b; padding:5px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " id="barra" >


             
             
              <button id="btnAgregar1b" type="button" class="btn2 btn-default  " onclick="BtnAgregar11()" >
    <span class=" glyphicon glyphicon-save"></span> Nueva HC
 </button>
   
 
 &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp
        
        
 
 <button id="btnGuardar1" type="button" class="btn2 btn-primary"  onclick="BtnFnGuardar11()" >
    <span class="   glyphicon glyphicon-floppy-disk"></span> Guardar
  </button>

        &nbsp&nbsp
                   <button type="button" class="btn2 btn-verde  "  onclick="cerrarPop1()"> 
    <span class=" glyphicon  glyphicon-log-out"></span> Cerrar </button> 
               </div>   
          
              </div>       
      </div>
      
    </div>
   
 </div>
  

 </div>


        <style type="text/css">
.lightboxcontainer {
  width:100%;
  text-align:left;
}
.lightboxleft {
  width: 40%;
  float:left;
}
.lightboxright {
  width: 60%;
  float:left;
}
.lightboxright iframe {
  min-height: 390px;
}
.divtext {
  margin: 36px;
}
@media (max-width: 800px) {
  .lightboxleft {
    width: 100%;
  }
  .lightboxright {
    width: 100%;
  }
  .divtext {
    margin: 12px;
  }
}
</style>
        <script src="../../Scripts/html5lightbox/html5lightbox.js"></script>
    <a href="" data-overlaybgcolor="rgba(80, 78, 78, 0.68)" data-overlayopacity="1" class="html5lightbox" title="" id="verImg"      ></a>
        
        <script>

//files
            var html5lightbox_options = {
                overlaybgcolor: "#333",
                overlayopacity: "1",
                socialrotateeffect: "false"
            };

            var dataURL2 = "";
            function previewFile() {
                $('#wait').show();
                if ($("#f_UploadImage").val() != '') {

                    $('#btnAgregar1b31').removeClass("glyphicon-save");
                    $('#btnAgregar1b31').addClass("glyphicon-refresh glyphicon-refresh-animate");
                   
                    //  $('#f_UploadImage')[0].files[0].name; // nombre

                    //var formData = new FormData();
                    //formData.append('file', $('#f_UploadImage')[0].files[0]);

                   
                     
                     resizeAndUpload($('#f_UploadImage')[0].files[0]); // redimenciona y la guarda 
                    
                  
                } else {
                    $('#wait').hide();
                    alert('Adjunte un arhivo.');

                }
               

            }


            function dataURItoBlob(dataURI) {
                // separate out the mime component
                var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

                var binary = atob(dataURI.split(',')[1]);
                var array = [];
                for (var i = 0; i < binary.length; i++) {
                    array.push(binary.charCodeAt(i));
                }
                var blob = new Blob([new Uint8Array(array)], { type: mimeString });
                
                var fd = new FormData();
                fd.append('file', blob, $('#f_UploadImage')[0].files[0].name);

                var filePath = $("#f_UploadImage").val();
                var file_ext = filePath.substr(filePath.lastIndexOf('.') + 1, filePath.length);

                $.ajax({
                    type: 'post',
                    async: true,
                    url: '/Services/Subir_archivo.ashx',
                    data: fd,
                    success: function (status) {
                        if (status != 'error') {
                            //var my_path = "/images/productos/" + status;
                            //$("#myUploadedImg").attr("src", my_path);
                            try {
                                if (status != 'Se excedió la longitud de solicitud máxima.') {

                                    var json = JSON.stringify
                                    ({
                                        'v_obj': {
                                            'Id': '99',
                                            'Paciente': $("#Main_HddId").val(),
                                            'Descripción': $("#Main_TxtNombreImg").val(),
                                            'Aud': '',
                                            'Path': status,
                                            'tipo': file_ext
                                        }
                                    });
                                    $.ajax({
                                        type: "POST",
                                        url: 'Pacientes.aspx/WmGvAlta_hosp_hc_files',
                                        data: json,
                                        contentType: "application/json; charset=utf-8",
                                        dataType: 'json',
                                        success: (function (Result) {
                                            $("#Main_TxtNombreImg").val('');
                                            $('#f_UploadImage').val('');
                                            $('#Modalhosp_hc_files').modal('hide');
                                            //  Buscar_hosp_dias();
                                            Buscar_hosp_hc_files();
                                            $('#btnAgregar1b31').removeClass("glyphicon-refresh glyphicon-refresh-animate");
                                            $('#btnAgregar1b31').addClass("glyphicon-save");
                                            $('#wait').hide();
                                        }),
                                        error: errores
                                    });

                                } else {
                                    $('#btnAgregar1b31').removeClass("glyphicon-refresh glyphicon-refresh-animate");
                                    $('#btnAgregar1b31').addClass("glyphicon-save");
                                    $('#wait').hide();
                                    throw "SE EXCEDIÓ EL TAMAÑO MÁXIMA DEL ARCHIVO QUE ES 4GB .";
                                }
                            } catch (e) {
                                alert(e);
                            }



                        }
                    },
                    processData: false,
                    contentType: false,
                    error: errores
                });

                return blob;
            }
            function resizeAndUpload(file) {
                var reader = new FileReader();
                reader.onloadend = function () {

                    var tempImg = new Image();
                    tempImg.src = reader.result;
                    tempImg.onload = function () {

                        var MAX_WIDTH = 1024;
                        var MAX_HEIGHT = 768;
                        var tempW = tempImg.width;
                        var tempH = tempImg.height;
                        if (tempW > tempH) {
                            if (tempW > MAX_WIDTH) {
                                tempH *= MAX_WIDTH / tempW;
                                tempW = MAX_WIDTH;
                            }
                        } else {
                            if (tempH > MAX_HEIGHT) {
                                tempW *= MAX_HEIGHT / tempH;
                                tempH = MAX_HEIGHT;
                            }
                        }

                        var canvas = document.createElement('canvas');
                        canvas.width = tempW;
                        canvas.height = tempH;
                        var ctx = canvas.getContext("2d");
                        ctx.drawImage(this, 0, 0, tempW, tempH);
                        var dataURL = canvas.toDataURL("image/jpeg");
                       // return dataURL;
                      
                        var blob = dataURItoBlob(dataURL); // blob la guarda
                    //    return blob;
                    }

                }
                reader.readAsDataURL(file);// llama a la funcion
                
            }

            function dataURItoBlob2(dataURI) {
                var binary = atob(dataURI.split(',')[1]);
                var array = [];
                for (var i = 0; i < binary.length; i++) {
                    array.push(binary.charCodeAt(i));
                }
                return new Blob([new Uint8Array(array)], { type: 'image/jpeg' });
            }


            function Buscar_hosp_hc_files() {
                                try {

                                    var v_buscar = $('#cmbTipoOp').val();
                                    var json = JSON.stringify
                                   ({
                                       'v_tipo': '99',
                                       'v_valor': $("#Main_HddId").val()

                                   });
                                    $.ajax({
                                        type: 'POST',
                                        url: 'Pacientes.aspx/WsListar_hosp_hc_files',
                                        data: json,
                                        contentType: 'application/json; charset=utf-8',
                                        dataType: 'json',
                                        success: resultado_hosp_hc_files,
                                        error: errores
                                    });

                                } catch (e) {
                                    alert(e.message);
                                }
                            }

                            function resultado_hosp_hc_files(Resultado) {
                                var v_obj = Resultado.d;
                                var Tabla_Titulo = '';
                                var Tabla_Datos = '';
                                var Tabla_Fin = '';
                                $('#Resultado_hosp_hc_files').show();
                                $('#Resultado_hosp_hc_files').empty();
                                Tabla_Titulo = "  <table    id='grillahosp_hc_files' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th>Descripción</th><th>Archivo</th><th>Fecha</th> <th></th>  </tr></thead><tbody> ";
                                $.each(v_obj, function (index, obj) {
                                    Tabla_Datos = Tabla_Datos + " <tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod_ver_hc_files(\"" + obj.Path + "\");' > <img src='/images/jpg.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver</span></a></td>  <td>" + obj.Descripción + " </td>  <td>" + obj.Path + " </td><td>" + obj.Aud + " </td><td style='width:30px'> <a class='tooltips' onclick='gvDel_hosp_hc_files(" + obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> </a></td>   </tr>";
                                });
                                Tabla_Fin = " </tbody></table>";
                                $('#Resultado_hosp_hc_files').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                                fn_cantidad();
                            }
                            function PopMod_ver_hc_files(v_img) {
                                //$('#verImg').attr('href', "/Subidos/ORL/" + v_img);
                                //$('#verImg').click();
                                var image = new Image();

                                image.src = "/Subidos/ORL/" + v_img;

                                var viewer = new Viewer(image, {
                                    hidden: function () {
                                        viewer.destroy();
                                    },
                                });

                                // image.click();
                                viewer.show();

                            }

                            function fn_cantidad() {
                                cantidad = $('#grillahosp_hc_files tbody').find('tr').length;
                                $('#span_cantidad').html(cantidad);
                            };


                            function gvDel_hosp_hc_files(ids) {
                                try {
                                    if (confirm('Esta seguro que desea eliminar el registro ?')) {
                                        var json = JSON.stringify
                                            ({
                                                'v_Id': ids
                                            });

                                        $.ajax({
                                            type: 'POST',
                                            url: 'Pacientes.aspx/WmGvDel_hosp_hc_files',
                                            data: json, contentType: 'application/json; charset=utf-8',
                                            dataType: 'json',
                                            success: (function (Result) {
                                                Buscar_hosp_hc_files();
                                            }),
                                            error: errores
                                        });
                                    }
                                }
                                catch (e) {
                                    alert(e);
                                }
                            }

                            function PopMod_hosp_hc_files(id) {
                                try {
                                    $("#btnModificar1b").show();
                                    $("#btnGuardar1b").hide();
                                    $("#TituloPop").text('Modificar');
                                    $('#Modalhosp_hc_files').modal();
                                    $('#Main_TxtId').val(id);


                                    var json = JSON.stringify
                                        ({
                                            'v_tipo': '99',
                                            'v_valor': id
                                        });
                                    $.ajax({
                                        type: 'POST',
                                        url: 'Pacientes.aspx/WsListar_hosp_hc_files',
                                        data: json,
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (Resultado) {
                                            var v_obj = Resultado.d;
                                            $.each(v_obj, function (index, obj) {
                                                $('#Main_TxtId').val(obj.Id);
                                                $('#Main_TxtPaciente').val(obj.Paciente);
                                                $('#Main_TxtDescripción').val(obj.Descripción);
                                                $('#Main_TxtAud').val(obj.Aud);
                                                $('#Main_TxtPath').val(obj.Path);
                                                $('#Main_Txttipo').val(obj.tipo);

                                            });
                                        },
                                        error: erroresJs
                                    });
                                } catch (e) {
                                    alert(e.message);
                                }
                            }



            // end files
            var v_pro = '';
            
            function PopVer(id) {
                limpiar();
                $("#btnAgregar1a").hide();
                $("#btnGuardar1a").hide();

                $("#TituloPop").text('Ver Cliente');
                $("#ModalCat").modal();

                deshabilitarFrm();


                var json = JSON.stringify
          ({
              "v_Id": id

          });

                $.ajax({
                    type: "POST",
                    url: "Clientes.aspx/WsBuscarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {

                        if (result.d != null) {

                            $("#Main_TxtCodSistema").val(result.d.Id);
                            $("#Main_TxtCodMunual").val(result.d.Cod_Manual);
                            $("#Main_TxtCuit").val(result.d.Doc_No);
                            $("#CmbTipoDoc").val(result.d.Tipo_Doc);

                            // $("#cmbAfip").removeAttr('selected');
                            $("#cmbObraSocial").val(result.d.OBRASOCIAL);
                        //    $("#cmbObraSocial option[value=" + result.d.ObraSocial + "]").attr("selected", true);
                            
                            $("#Main_TxtNombre").val(result.d.Nombre);
                            $("#Main_TxtApellido").val(result.d.Apellido);


                            $("#Main_TxtObservacion").val(result.d.Observacion);
                            $("#cmbCtaContable").val(result.d.Cta_contable);
                            $("#Main_TxtCalle").val(result.d.Calle);
                            $("#Main_TxtNum").val(result.d.Numero);
                            $("#Main_TxtDpto").val(result.d.Dpto);

                            $("#HddProv").val(result.d.Provincia);
                            $("#HddDep").val(result.d.Departamento);
                            $("#HddDis").val(result.d.Distrito);


                            $("#cmbPais").val(result.d.Pais);
                            $("#Main_TxtCp").val(result.d.Cp);
                            v_pro = result.d.Pais;
                            ListarProvincia(result.d.Pais);
                            ListarDepartamento(result.d.Provincia);
                            ListarDistrito(result.d.Departamento);


                     
                            $("#Main_TxtEmpTel").val(result.d.Emp_Tel);
                            $("#Main_TxtEmpCel").val(result.d.Emp_Cel);
                            $("#Main_TxtEmpMail").val(result.d.Emp_Mail);
                            $("#Main_TxtEmpWeb").val(result.d.Emp_Web);

                            $("#cmbProv").val(result.d.Provincia);
                            $("#cmbDepartamento").val(result.d.Departamento);
                            $("#cmbDistrito").val(result.d.Distrito);


                        }
                    },

                    error: errores
                });


            }
            function PopMod(id) {
               
                deshabilitarFrm();
                limpiar();
             
                $("#btnGuardar1a").hide();
                $("#btnAgregar1a").hide();
                $("#TituloPop").text('PACIENTES');

               

                if (getUrlParameter('pac') != null) {
                    $('#ModalCat').modal({
                        backdrop: 'static',
                        keyboard: false
                    })
                } else { $("#ModalCat").modal(); }

                $("#Main_TxtCodSistema").val(id);

                var json = JSON.stringify
          ({
              "v_Id": id

          });

                $.ajax({
                    type: "POST",
                    url: "Pacientes.aspx/WsBuscarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {

                        if (result.d != null) {

                            
                            $("#Main_TxtCuit").val(result.d.DOCUMENTO);// --

                          //  $("#CmbTipoDoc").val(result.d.DOCUMENTO);

                            // $("#cmbAfip").removeAttr('selected');
                            $("#Main_cmbObraSocial").val(result.d.OBRASOCIAL);


                         //   $("#Main_cmbObraSocial option[value=" + result.d.OBRASOCIAL + "]").attr("selected", true);
                            $("#Main_TxtObservacion").val(result.d.OBS_Pac);

                            $("#Main_TxtNombre").val(result.d.NOMBRE); // --
                            $("#Main_TxtApellido").val(result.d.APELLIDO);// --

                            $("#Main_TxtFechaHasta").val(result.d.Fecha_Nac);

                            $("#Main_TxtCalle").val(result.d.Calle);
                            $("#Main_TxtNum").val(result.d.Numero);
                            $("#Main_TxtDpto").val(result.d.Dpto);

                            $("#HddProv").val(result.d.Provincia);
                            $("#HddDep").val(result.d.Departamento);
                            $("#HddDis").val(result.d.Distrito);


                            $("#cmbPais").val(result.d.Pais);
                            $("#Main_TxtCp").val(result.d.Cp);
                            v_pro = result.d.Pais;
                            ListarProvincia(result.d.Pais);
                            ListarDepartamento(result.d.Provincia);
                            ListarDistrito(result.d.Departamento);

                            $("#cmbProv").val(result.d.Provincia);
                            $("#cmbDepartamento").val(result.d.Departamento);
                            $("#cmbDistrito").val(result.d.Distrito);

 

                            $("#Main_TxtEmpTel").val(result.d.TEL); // --
 
                            $("#Main_TxtEmpMail").val(result.d.MAIL); // --
                            $("#Main_TxtNroOS").val(result.d.NroOS);
                           // var pathfoto = "../../Subidos/ORL/";
                             var pathfoto = "/Subidos/ORL/";
                            if (result.d.FOTO=="") {pathfoto = "";}
                              $('#myUploadedImg').attr('src',pathfoto + result.d.FOTO);
                           
                            
                        }
                    },

                    error: errores
                });

               
            }
            function PopAlta() {
                habilitarFrm();
                limpiar();

                $("#btnAgregar1a").hide();
                $("#btnGuardar1a").show();

                $("#TituloPop").text('Alta de Cliente');
                $("#ModalCat").modal();

            }

            

            function limpiar() {
                $("#TxtMsj").text('');
                $("#tabs").tabs({ active: 0 });

                $("#HddProv").val('');
                $("#HddDep").val('');
                $("#HddDis").val('');
$("#myUploadedImg").removeAttr('src')
               
                $("#Main_TxtEmpTel").val('');
                $("#Main_TxtEmpCel").val('');
                $("#Main_TxtEmpMail").val('');
                

                $('#Main_TxtCodMunual').val('');
                $('#Main_TxtCodSistema').val('0');
                $('#Main_TxtObservacion').val('');
                $('#Main_TxtCuit').val('');

                $('#Main_TxtNombre').val('');
                $('#Main_TxtApellido').val('');
                $('#Main_TxtCalle').val('');
                $('#Main_TxtNum').val('');
                $('#Main_TxtDpto').val('');
                $('#Main_TxtCp').val('');




                $("#cmbPais").attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
                $("#cmbProv").empty();
                $('#cmbDepartamento').empty();
                $('#cmbDistrito').empty();
                $('#cmbAfip').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
                $('#cmbTipo').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");

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
                        url: "/App/ORL/Pacientes.aspx/WsListar",
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


            function existe() {
                try {
                    if ($("#Main_TxtDoc").val() != '') {
                        var json = JSON.stringify
                    ({
                        "v_valor": $("#TxtDoc").val()
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

                                    $("#TxtNombre").val(tur.NOMBRE);
                                    $("#TxtApellido").val(tur.APELLIDO);
                                    $("#TxtNac").val(tur.Fecha_Nac);
                                    $("#cmbObraSocial").val(tur.OBRASOCIAL);
                                    $("#TxtCel").val(tur.TEL);
                                    $("#txtMail").val(tur.MAIL);
                                    $("#txtObsHC").val(tur.OBS_Pac);





                                    $("#Hddexiste").val(tur.id);
                                } else {
                                    $("#Hddexiste").val('0');

                                    $("#TxtNombre").val('');
                                    $("#TxtApellido").val('');
                                    $("#TxtNac").val('');

                                    $("#TxtCel").val('');
                                    $("#txtMail").val('');

                                    $("#TxtNombre").prop('disabled', false);
                                    $("#TxtApellido").prop('disabled', false);
                                    $("#TxtNac").prop('disabled', false);
                                    $("#cmbObraSocial").prop('disabled', false);
                                    $("#TxtCel").prop('disabled', false);
                                    $("#txtMail").prop('disabled', false);
                                }
                            }),
                            error: errores
                        });
                    } else { alert('debe seleccionar un empleado'); }
                } catch (e) {
                    alert(e.message);

                }
            }
  
       
            function limpiarCli() {


                $("#HddProv").val('');
                $("#HddDep").val('');
                $("#HddDis").val('');
         
                $("#Main_TxtEmpTel").val('');
                $("#Main_TxtEmpCel").val('');
                $("#Main_TxtEmpMail").val('');
              

                $('#Main_TxtCodMunual').val('');
                $('#Main_TxtCodSistema').val('0');
                $('#Main_TxtObservacion').val('');
                $('#Main_TxtCuit').val('');

                $('#Main_TxtNombre').val('');
                $('#Main_TxtApellido').val('');
                $('#Main_TxtCalle').val('');
                $('#Main_TxtNum').val('');
                $('#Main_TxtDpto').val('');
                $('#Main_TxtCp').val('');




                $("#cmbPais").attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
                $("#cmbProv").empty();
                $('#cmbDepartamento').empty();
                $('#cmbDistrito').empty();
                $('#cmbAfip').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
                $('#cmbTipo').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");

            }

           

            function resultado(Resultado) {
                var Pacientes = Resultado.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";




                $("#Resultado").show();
                $("#Resultado").empty();
                Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr>  <th></th>  <th></th><th>Nombre</th><th>N° Doc</th><th>Tel</th><th>O.S</th><th>Fecha Nac</th></tr></thead><tbody>";
                $.each(Pacientes, function (index, pacientes) {
                    Tabla_Datos = Tabla_Datos + "<tr   > <td style='width:30px'> <a class='' onclick='PopMod(" + pacientes.id + ",this);' > <img src='/images/ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span></span></a></td> <td style='width:30px'> <a class='tooltips Altahc'  onclick='PopAltaHc(this,1," + pacientes.id + " ,\"" + pacientes.APELLIDO + ' ' + pacientes.NOMBRE + '  - N°DOC :' + pacientes.DOCUMENTO + "\", \"" + pacientes.OBRASOCIAL + '  Nro: ' + pacientes.NroOS + "\",\"" + pacientes.Fecha_Nac + "\",\"" + pacientes.TEL + '  ' + pacientes.MAIL + "\" ,\"" + pacientes.OBS_Pac.replace(/\s/g, ' ') + "\" ,\"" + pacientes.Calle + '  Nro: ' + pacientes.Numero + "\");'> <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span> HC</span></a></td><td>" + pacientes.NOMBRE + " " + pacientes.APELLIDO + "</td><td>" + pacientes.DOCUMENTO + "</td><td>" + pacientes.TEL + "</td><td>" + pacientes.OBRASOCIAL + "</td><td>" + pacientes.Fecha_Nac + "</td></tr>";
                });

                Tabla_Fin = "</tbody></table>";
                $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                fn_cantidad();
       
                if ($("#MiCuenta1_lblMail").text() == '- ORL  - ') {
                   
                     $(".Altahc").hide();               
                }

            }

            function errores(msg) {
                var jsonObj = JSON.parse(msg.responseText);
                alert('Error: ' + jsonObj.Message);
            }


            function fn_cantidad() {
                cantidad = $("#grilla tbody").find("tr").length;
                $("#span_cantidad").html(cantidad);
            };
            $(document).ajaxStart(function () {
                $(".spinner-wrapper").css("display", "block");
                $(".loader").css("display", "block");
            });
            $(document).ajaxComplete(function () {
                $(".spinner-wrapper").css("display", "none");
                $(".loader").css("display", "none");

            });
            $(function () {

                $(".campoFecha").mask("99/99/9999");
 

                $('#tabs').tabs();

           

                $("#Main_TxtContacMail").blur(function () {
                    validarEmail($("#Main_TxtContacMail").val());
                });

                $("#Main_TxtEmpMail").blur(function () {
                    validarEmail($("#Main_TxtEmpMail").val());
                });

                ListarPais();



            });


            $("#cmbPais").change(function () {
                ListarProvincia($("#cmbPais").val());
                $("#cmbDepartamento").val(0).change();
                $("#cmbDistrito").val(0).change();

            })

            $("#cmbProv").change(function () {
                ListarDepartamento($("#cmbProv").val());
                $("#cmbDistrito").val(0).change();
            })

            $("#cmbDepartamento").change(function () {
                ListarDistrito($("#cmbDepartamento").val());
            })

            function bitacora() {
                try {

                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {

                            "Id": $("#Main_TxtCodSistema").val(),

                            "Cod_Manual": $("#Main_TxtCodMunual").val(),
                            "Tipo_Doc": $("#CmbTipoDoc").val(),
                            "Doc_No": $("#Main_TxtCuit").val(),
                            "Iva": $("#cmbAfip").val(),
                            "Nombre": $("#Main_TxtNombre").val(),
                            "Apellido": $("#Main_TxtApellido").val(),
                            "Observacion": $("#Main_TxtObservacion").val(),
                            "Cta_contable": $("#cmbCtaContable").val(),
                            "Calle": $("#Main_TxtCalle").val(),
                            "Numero": $("#Main_TxtNum").val(),
                            "Dpto": $("#Main_TxtDpto").val(),
                            "Pais": $("#cmbPais").val(),
                            "Cp": $("#Main_TxtCp").val(),
                            "Provincia": $("#cmbProv").val(),
                            "Departamento": $("#cmbDepartamento").val(),
                            "Distrito": $("#cmbDistrito").val(),


                    
                            "Emp_Tel": $("#Main_TxtEmpTel").val(),
                            "Emp_Cel": $("#Main_TxtEmpCel").val(),
                            "Emp_Mail": $("#Main_TxtEmpMail").val()
                           

                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Clientes.aspx/WmMod2",
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

            function ModificarJs() {
                try {
                    
                      var filePath=  $('#myUploadedImg').attr('src')
                    var fotosinPath = filePath.substr(filePath.lastIndexOf('/') + 1, filePath.length);
               
                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {

                            "Id": $("#Main_TxtCodSistema").val(),
 
                            "DOCUMENTO": $("#Main_TxtCuit").val(),
                            "NOMBRE": $("#Main_TxtNombre").val(),
                            "APELLIDO": $("#Main_TxtApellido").val(),
                            "OBS_Pac": $("#Main_TxtObservacion").val(),
                            "Fecha_Nac": $("#Main_TxtFechaHasta").val(),
                            "Calle": $("#Main_TxtCalle").val(),
                            "Numero": $("#Main_TxtNum").val(),
                            "Dpto": $("#Main_TxtDpto").val(),
                            "Pais": $("#cmbPais").val(),
                            "Cp": $("#Main_TxtCp").val(),
                            "Provincia": $("#cmbProv").val(),
                            "Departamento": $("#cmbDepartamento").val(),
                            "Distrito": $("#cmbDistrito").val(),
                            "OBRASOCIAL": $("#Main_cmbObraSocial").val(),

                            "NroOS": $("#Main_TxtNroOS").val(),
                                "FOTO":  fotosinPath,
                            "TEL": $("#Main_TxtEmpTel").val(),
                            "MAIL": $("#Main_TxtEmpMail").val()
                           

                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Pacientes.aspx/WmMod2",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: Modificado_Completo,
                        error: errores
                    });

           $('#verfoto').hide();

                    //$("#webcam").empty(); 
                } catch (e) {
                    alert(e.message);
                }

            }


            function AltaJs() {
                try {

                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {

                            "Id": '0',
                            "Cod_Manual": $("#Main_TxtCodMunual").val(),
                            "Tipo_Doc": $("#CmbTipoDoc").val(),
                            "Doc_No": $("#Main_TxtCuit").val(),
                            "Iva": $("#cmbAfip").val(),
                            "Nombre": $("#Main_TxtNombre").val(),
                            "Apellido": $("#Main_TxtApellido").val(),
                            "Observacion": $("#Main_TxtObservacion").val(),
                            "Cta_contable": $("#cmbCtaContable").val(),
                            "Calle": $("#Main_TxtCalle").val(),
                            "Numero": $("#Main_TxtNum").val(),
                            "Dpto": $("#Main_TxtDpto").val(),
                            "Pais": $("#cmbPais").val(),
                            "Cp": $("#Main_TxtCp").val(),
                            "Provincia": $("#cmbProv").val(),
                            "Departamento": $("#cmbDepartamento").val(),
                            "Distrito": $("#cmbDistrito").val(),
 
                            "Emp_Tel": $("#Main_TxtEmpTel").val(),
                            "Emp_Cel": $("#Main_TxtEmpCel").val(),
                            "Emp_Mail": $("#Main_TxtEmpMail").val()
                        

                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Clientes.aspx/WmAlta2",
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

                if (getUrlParameter('pac') != null) {
                    // si viende de otra page
                   
                    window.location.href = getUrlParameter('url') + '.aspx?serv=' + getUrlParameter('serv') + '&prof=' + getUrlParameter('prof') + '&dia=' + getUrlParameter('dia');

                } else {
                    Buscar();
                    $("#ModalCat").modal('hide');
                }
            }

            function ListarPais() {
                try {

                    var json = JSON.stringify
              ({
                  "v_tipo": '',
                  "v_valor": ''
              });

                    $.ajax({
                        type: "POST",
                        url: "/App/Kardex/Proveedores.aspx/WsListarP",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarPais,
                        error: errores
                    });


                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarPais(Resultado) {

                var Especialidad = Resultado.d;

                $('#cmbPais').empty();

                $('#cmbPais').append('<option value="0">- -</option>');

                $.each(Especialidad, function (index, especialidades) {
                    $('#cmbPais').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.nombre)
                        );
                });


                //select un item  para select2
                //   $("#cmbPais").val(0).change();


            }

            function ListarProvincia(ids, sel) {
                try {

                    var json = JSON.stringify
              ({

                  "v_valor": ids
              });

                    $.ajax({
                        type: "POST",
                        url: "/App/Kardex/Proveedores.aspx/WsListarProvincia",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarProv,
                        error: errores
                    });


                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarProv(Resultado) {

                var Especialidad = Resultado.d;

                $('#cmbProv').empty();

                $('#cmbProv').append('<option value="0">- -</option>');


                $.each(Especialidad, function (index, especialidades) {
                    if ($("#HddProv").val() == especialidades.Id) {


                        $('#cmbProv').append(
                             $('<option  selected></option>').val(especialidades.Id).html(especialidades.Provincia)
                           );
                    } else {
                        $('#cmbProv').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.Provincia)
                        );
                    }
                });


                //select un item  para select2
                //  $("#cmbProv").val(1).change();
            }

            function ListarDepartamento(ids) {
                try {

                    var json = JSON.stringify
              ({

                  "v_valor": ids
              });

                    $.ajax({
                        type: "POST",
                        url: "/App/Kardex/Proveedores.aspx/WsListarDepartamento",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarDep,
                        error: errores
                    });


                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarDep(Resultado) {

                var Especialidad = Resultado.d;

                $('#cmbDepartamento').empty();

                $('#cmbDepartamento').append('<option value="0">- -</option>');

                $.each(Especialidad, function (index, especialidades) {
                    if ($("#HddDep").val() == especialidades.Id) {

                        $('#cmbDepartamento').append(
                              $('<option selected></option>').val(especialidades.Id).html(especialidades.NombreDepartamento)
                            );
                    } else {
                        $('#cmbDepartamento').append(
                             $('<option></option>').val(especialidades.Id).html(especialidades.NombreDepartamento)
                           );
                    }

                });


                //select un item  para select2
                //  $("#cmbDepartamento").val(1).change();
            }

            function ListarDistrito(ids) {

                try {

                    var json = JSON.stringify
              ({

                  "v_valor": ids
              });

                    $.ajax({
                        type: "POST",
                        url: "/App/Kardex/Proveedores.aspx/WsListarDistrito",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: CargarDist,
                        error: errores
                    });


                } catch (e) {
                    alert(e.message);
                }
            }
            function CargarDist(Resultado) {



                var Especialidad = Resultado.d;

                $('#cmbDistrito').empty();

                $('#cmbDistrito').append('<option value="0">- -</option>');


                $.each(Especialidad, function (index, especialidades) {
                    if ($("#HddDis").val() == especialidades.Id) {
                        $('#cmbDistrito').append(
                              $('<option selected></option>').val(especialidades.Id).html(especialidades.NombreDistrito)
                            );
                    } else {

                        $('#cmbDistrito').append(
                            $('<option></option>').val(especialidades.Id).html(especialidades.NombreDistrito)
                          );
                    }
                });


                //select un item  para select2
                //  $("#cmbDistrito").val(1).change();
            }
            function validarEmail(valor) {
                if (valor != '') {
                    if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(valor)) {
                        $("#TxtMsj").text('');
                    } else {
                        $("#TxtMsj").text("La dirección de email es incorrecta!.");
                    }
                }

            }

           function gvDel(Ids, row) {

                if (confirm("¿Esta seguro que desea eliminar el registro?")) {
                    gvok(Ids);

                    $(row).closest("tr").remove();

                }

            }

            function gvok(v_id) {

                try {

                    if (true) {


                        var json = JSON.stringify
                          ({
                              "v_id": v_id

                          })
                        $.ajax({
                            type: "POST",
                            url: "Clientes.aspx/gvProv_del",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: '',
                            error: errores
                        });
                    }
                } catch (e) {
                    alert(e.message);
                }
            }

            function habilitarFrm() {

                $("#btnAgregar1a").show();
                   $("#btnfoto").show();
                
                    $("#tabs").tabs({ active: 0 });

                $("#Main_TxtObservacion").prop('disabled', false);
                $("#Main_cmbObraSocial").prop('disabled', false);
                $("#Main_TxtCuit").prop('disabled', false);
                $("#Main_TxtFechaHasta").prop('disabled', false);             
                $("#Main_TxtNombre").prop('disabled', false);
                $("#Main_TxtApellido").prop('disabled', false);

                
                $("#Main_TxtCalle").prop('disabled', false);
                $("#Main_TxtNum").prop('disabled', false);
                $("#Main_TxtDpto").prop('disabled', false);
                $("#cmbPais").prop('disabled', false);
                $("#Main_TxtCp").prop('disabled', false);
                $("#cmbProv").prop('disabled', false);
                $("#cmbDepartamento").prop('disabled', false);
                $("#cmbDistrito").prop('disabled', false);
                $("#Main_TxtNroOS").prop('disabled', false);
            
                $("#Main_TxtEmpTel").prop('disabled', false);            
                $("#Main_TxtEmpMail").prop('disabled', false);
                 
                if ($("#cmbPais").val() == '0') {
                    $("#cmbPais").val('1');

                    $("#HddProv").val('1');
                    ListarProvincia($("#cmbPais").val());
                    ListarDepartamento('1');
                }

            }
            function deshabilitarFrm() {

                  $("#btnfoto").hide();
               
                $("#CmbTipoDoc").prop('disabled', true);
                $("#Main_TxtObservacion").prop('disabled', true);
                
                $("#Main_TxtCuit").prop('disabled', true);
            
                $("#Main_TxtNombre").prop('disabled', true);
                $("#Main_TxtApellido").prop('disabled', true);
 
                $("#Main_TxtCalle").prop('disabled', true);
                $("#Main_TxtNum").prop('disabled', true);
                $("#Main_TxtDpto").prop('disabled', true);
                $("#cmbPais").prop('disabled', true);
                $("#Main_TxtCp").prop('disabled', true);
                $("#cmbProv").prop('disabled', true);
                $("#cmbDepartamento").prop('disabled', true);
                $("#cmbDistrito").prop('disabled', true);
         
                $("#Main_TxtEmpTel").prop('disabled', true);            
                $("#Main_TxtEmpMail").prop('disabled', true);

                $("#Main_TxtFechaHasta").prop('disabled', true);
                $("#Main_TxtNroOS").prop('disabled', true);
                $("#Main_cmbObraSocial").prop('disabled', true);

            }
   
            $(document).ready(function () {
               
                $('#tabs1').tabs();
                $(this).everyTime(35000, function () {
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
                            window.location.href = "http://www.corlquilmes.com.ar/login_orl.aspx";

                        }
                    });


                });




                function VerifySessionState(result) {
                   $("#miLoader").show();  

                    if (!result.d) {

                        window.location.href = "http://www.corlquilmes.com.ar/login_orl.aspx";
                    }
                }

                //fin de ready

            });
            

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
            // utilizacion


            if (getUrlParameter('serv') != null) {
                //$("#Main_CmbEspecialidad").val(getUrlParameter('serv'));
                //$("#Main_cmbProf").val(getUrlParameter('prof'));
                //$("#Main_TxtFechaHasta").val(getUrlParameter('dia'));
                PopMod(getUrlParameter('pac'));
                $("#btnVolver").show();
                $("#btncerrarpop").hide();
                $("#close2").hide();
                

            } else {
                $("#btnVolver").hide();
                $("#btncerrarpop")
                $("#close2").show();

            }

            function volverPop() {
                window.location.href = getUrlParameter('url') + '.aspx?serv=' + getUrlParameter('serv') + '&prof=' + getUrlParameter('prof') + '&dia=' + getUrlParameter('dia');

            }

////////////////////////////////////////////  pop hc ///////////////////////
            function BtnFnModificar11() {

                if ($("#Main_TxtId").val() != '') {
                    $("#Main_LblMsg1").text('')
                    $("#Main_HiddenField11").val('Modificar');
                    habilitarFrmPop();

                    $('#btnAgregar11').prop('disabled', true);
                    $('#btnModificar11').prop('disabled', false);
                    $('#btnElimina11').prop('disabled', true);
                    $('#btnCancelar11').prop('disabled', false);
                    $('#btnGuardar11').prop('disabled', false);

                    $('#btnGuardar11').attr("class", "btn2 btn-danger");
                }
            }
            function BtnFnEliminar11() {
                $("#btnGuardar11").show();

                if ($("#Main_TxtId").val() != '') {

                    $("#Main_LblMsg1").text('¿ Desea Eliminar ? Presione Guardar para confirmar.')

                    $("#Main_HiddenField11").val('Eliminar');

                    $('#btnAgregar11').prop('disabled', true);
                    $('#btnModificar11').prop('disabled', true);
                    $('#btnElimina11').prop('disabled', false);
                    $('#btnCancelar11').prop('disabled', false);
                    $('#btnGuardar11').prop('disabled', false);

                    $('#btnGuardar11').attr("class", "btn2 btn-danger");


                }


            }
            function BtnFnGuardar11() {
                $("#Main_LblMsg1").text('');

                $('#btnModificar11').prop('disabled', false);
                $('#btnElimina11').prop('disabled', false);
                var Op = '';
                Op = $("#Main_HiddenField11").val();


                switch (Op) {
                    case 'Alta':
                        $("#Main_HiddenField11").val("Cancelar");


                        AltaJsPop()
                        
                        // $("#Main_btnAgregar").click();
                        BuscarPop();
                        ExitoPop();


                        break;

                    case 'Eliminar':
                        $("#Main_HiddenField11").val("Cancelar");

                        EliminarJsPop();

                        //$("#Main_btnEliminar").click();

                        ExitoPop();
                        break;
                    case 'Modificar':
                        $("#Main_HiddenField11").val("Cancelar");

                        ModificarJsPop();
                        //   $("#Main_btnModificar").click();
                        ExitoPop();

                        break;
                    case 'Cancelar':

                        break;

                }

            }
            function cerrarPop1() {
                FaltaGuardar();
                var json = JSON.stringify
                 ({
                     "v_pac": $("#Main_HddId").val(),
                     "obs": $("#Main_TxtDatos").val()
                 });
                $.ajax({
                    type: "POST",
                    url: "AsistenciaHc.aspx/WsCerrarHc",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Result) {
                        Buscar();
                        $("#ModalHc").modal('hide');
                    }),
                    error: errores
                });
            }


            //function ModificarJsPop() {
            //    try {
            //        var ImageURL = $("#wPaint").wPaint("image");
            //        // Split the base64 string in data and contentType
            //        var block = ImageURL.split(";");
            //        // Get the content type of the image
            //        var contentType = block[0].split(":")[1];// In this case "image/gif"
            //        // get the real base64 content of the file
            //        var realData = block[1].split(",")[1];

            //        var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
            //        ({
            //            // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
            //            "v_obj": {

            //                "Id": $("#Main_TxtId").val(),
            //                // "Paciente": $("#Main_HddId").val(),
            //                "Fecha": $("#Main_TxtFechaHc").val(),
            //                "Sintoma": $('#Main_TxtSintoma').val(),
            //                "Diag_Presu": $('#Main_TxtDiagPresu').val(),
            //                "Tratamiento": $('#Main_TxtTratamiento').val(),
            //                "Indicaciones": $('#Main_TxtIndicaciones').val(),
            //                "Obs": $('#Main_TxtObseHc').val(),
            //                "Peso": $('#Main_TxtPeso').val(),
            //                "Temp": $('#Main_TxtTemp').val(),
            //                "PreArt": $('#Main_TxtPreArt').val(),
            //                "Sat": $('#Main_TxtSat').val(),
            //                "FreCard": $('#Main_TxtFrecCardiaca').val(),
            //                "HGTN": $('#Main_TxtHGTN').val(),
            //                "FreResp": $('#Main_TxtFrecResp').val(),
            //                "img": realData

            //            }
            //        });

            //        $.ajax({
            //            type: "POST",
            //            url: "AsistenciaHc.aspx/WsModificarHc",
            //            data: json,
            //            contentType: "application/json; charset=utf-8",
            //            dataType: "json",
            //            success: (function () {
            //                ListarHc();

            //            }),
            //            error: errores
            //        });

            //    } catch (e) {
            //        alert(e.message);
            //    }
            //}

            function EliminarJsPop() {
                var json = JSON.stringify
                     ({
                         "v_id": $("#Main_TxtId").val()
                     });
                $.ajax({
                    type: "POST",
                    url: "AsistenciaHc.aspx/WsDeleteHc",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function () {
                        ListarHc();
                        BtnCancelar11();
                    }),
                    error: errores
                });

            }

            function ExitoPop() {

                $("#Main_HiddenField1").val("Cancelar");
                LimpiarFrmPop();

                //    $("#Main_LblMsg").text('Se completo con éxito la transacción');

                deshabilitarFrmPop();
            }

            function BuscarPop() {

                try { 
                    
                } catch (e) {
                    alert(e.message);
                }
            }

            //function AltaJsPop() {

            //    try {

            //        var ImageURL = $("#wPaint").wPaint("image");
            //        // Split the base64 string in data and contentType
            //        var block = ImageURL.split(";");
            //        // Get the content type of the image
            //        var contentType = block[0].split(":")[1];// In this case "image/gif"
            //        // get the real base64 content of the file
            //        var realData = block[1].split(",")[1];
            //        var miImg = null;
            //        if ($("#Main_HddImg").val() == "SI") {
            //            miImg = realData;
            //        }

            //        var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
            //        ({
            //            // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
            //            "v_obj": {

            //                "Id": $("#Main_Txt_tur").val(),
            //                "Paciente": $("#Main_HddId").val(),
            //                "Fecha": $("#Main_TxtFechaHc").val(),
            //                "Sintoma": $('#Main_TxtSintoma').val(),
            //                "Diag_Presu": $('#Main_TxtDiagPresu').val(),
            //                "Tratamiento": $('#Main_TxtTratamiento').val(),
            //                "Indicaciones": $('#Main_TxtIndicaciones').val(),
            //                "Obs": $('#Main_TxtObseHc').val(),

            //                "Peso": $('#Main_TxtPeso').val(),
            //                "Temp": $('#Main_TxtTemp').val(),
            //                "PreArt": $('#Main_TxtPreArt').val(),
            //                "Sat": $('#Main_TxtSat').val(),
            //                "FreCard": $('#Main_TxtFrecCardiaca').val(),
            //                "HGTN": $('#Main_TxtHGTN').val(),
            //                "FreResp": $('#Main_TxtFrecResp').val(),
            //                "Consultorio": $('#MiCuenta1_lblMail').text(),
            //                "img": miImg
            //            }
            //        });

            //        $.ajax({
            //            type: "POST",
            //            url: "AsistenciaHc.aspx/WsAltaHc",
            //            data: json,
            //            contentType: "application/json; charset=utf-8",
            //            dataType: "json",
            //            success: (function () {
            //                ListarHc();

            //            }),
            //            error: errores
            //        });

            //    } catch (e) {
            //        alert(e.message);
            //    }




            //}


            //function PopAltaHc(obj, ids, pac, nom, os, fec_nac, tel, datos, dir) {

            //    $("#wPaint").hide();
            //    $("#wPaintNo").show();

            //    if ($(obj).hasClass('active')) {
            //        $(obj).removeClass('active');
            //    } else {
            //        $(obj).addClass('active').siblings().removeClass('active');
            //    }
            //    $("#Consultorio").text('');
            //    $("#lblPac").text('OS: ' + os);
            //    $("#lblos").text(nom);
            //    $("#lbltel").text(tel);
            //    $("#lbldir").text(dir);
            //    $("#lblNac").text('FECHA NAC: ' + fec_nac);
            //    $("#Main_TxtDatos").val(datos);
            //    //habilitarFrm();
            //    LimpiarFrmPop();
            //    deshabilitarFrmPop();
            //    $("#btnAgregar1a").hide();
            //    $("#btnGuardar1a").show();

            //    $("#TituloPop").text('Alta de Cliente');
            //    $("#ModalHc").modal();
            //    $("#Main_Txt_tur").val(ids); // del turno
            //    $("#Main_HddId").val(pac);   // del paciente

            //    //   $("#Main_TxtId").val(hc.Id) // es el id de hc
            //    ListarHc();
            //}



            $("#tabs1").tabs({
                activate: function (event, ui) {
                    var active = $('#tabs1').tabs('option', 'active');
                    //if ($("#tabs1 ul>li a").eq(active).attr("href") == "#tabs1-2") {
                    //    $("#ResultadoHc").hide();
                    //    $("#Main_HddImg").val("SI");
                    //} else {
                    //    $("#Main_HddImg").val("NO");
                    //    $("#ResultadoHc").show();
                    //}

                    if ($("#tabs1 ul>li a").eq(active).attr("href") == "#tabs1-2") {
                        $("#ResultadoHc").hide();
                        $("#Main_HddImg").val("SI");
                        $("#barra").hide();
                    }
                    if ($("#tabs1 ul>li a").eq(active).attr("href") == "#tabs1-3") {
                        //  $("#Main_HddImg").val("NO");
                        $("#ResultadoHc").hide();
                        Buscar_hosp_hc_files();
                        $("#barra").hide();
                    }

                    if ($("#tabs1 ul>li a").eq(active).attr("href") == "#tabs1-1") {
                        //$("#Main_HddImg").val("NO");
                        $("#ResultadoHc").show();
                        $("#barra").show();

                    }




                }
            }

);
            //function FillHc(obj,ids) {
            //    try {
            //        $("#wPaint").show();
            //        $("#wPaintNo").hide();

            //        FaltaGuardar();
            //        BtnCancelar11();
            //        if ($(obj).hasClass('active')) {
            //            $(obj).removeClass('active');
            //        } else {
            //            $(obj).addClass('active').siblings().removeClass('active');
            //        }

                     

            //        var json = JSON.stringify
            //  ({
            //      "v_Id": ids
            //  });

            //        $.ajax({
            //            type: "POST",
            //            url: "AsistenciaHc.aspx/WsBuscarHc",
            //            data: json,
            //            contentType: "application/json; charset=utf-8",
            //            dataType: "json",
            //            success: (function (Result) {
            //                var hc = Result.d;
            //                //   $("#Main_HddId").val(hc.Id); este es solo paciente
            //                $("#Main_TxtId").val(hc.Id); // es el id hc
            //                $("#Main_TxtFechaHc").val(hc.Fecha);
            //                $('#Main_TxtSintoma').val(hc.Sintoma);
            //                $('#Main_TxtDiagPresu').val(hc.Diag_Presu);
            //                $('#Main_TxtTratamiento').val(hc.Tratamiento);
            //                $('#Main_TxtIndicaciones').val(hc.Indicaciones);
            //                $('#Main_TxtObseHc').val(hc.Obs); 

            //                $('#Main_TxtPeso').val(hc.Peso);
            //                $('#Main_TxtTemp').val(hc.Temp);
            //                $('#Main_TxtPreArt').val(hc.PreArt);
            //                $('#Main_TxtSat').val(hc.Sat);
            //                $('#Main_TxtFrecCardiaca').val(hc.FreCard);
            //                $('#Main_TxtHGTN').val(hc.HGTN);
            //                $('#Main_TxtFrecResp').val(hc.FreResp);

            //                $('#Consultorio').text(hc.Consultorio);
            //                console.log(hc.Consultorio);
            //                loadImage_base64(hc.img);
            //            }),
            //            error: errores
            //        });


            //    } catch (e) {
            //        alert(e.message);
            //    }

            //}


            function ListarHc() {
                var json = JSON.stringify
                   ({
                       "v_pac": $("#Main_HddId").val()
                   });
                $.ajax({
                    type: "POST",
                    url: "AsistenciaHc.aspx/WsListarHc",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Result) {

                        var Pacientes = Result.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";
                        var total = parseFloat('0');
                        $("#ResultadoHc").show();
                        $("#ResultadoHc").empty();
                        Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;font-size: 10px;'><thead  style='background-color: #a1cece;'><tr>  <th>Fecha HC</th> <th>Sintoma</th><th>Diagnóstico</th> </tr></thead><tbody>";
                        $.each(Pacientes, function (index, pacientes) {
                            var sin = pacientes.Sintoma;
                            if (pacientes.Sintoma.trim().length > 230) {
                                sin = pacientes.Sintoma.substr(0, 100) + '.... (Ver más)';
                            }

                            var dig = pacientes.Diag_Presu;
                            if (pacientes.Diag_Presu.trim().length > 230) {
                                dig = pacientes.Diag_Presu.substr(0, 100) + '.... (Ver más)';
                            }

                            Tabla_Datos = Tabla_Datos + "<tr  style='cursor:pointer'  onclick='FillHc(this," + pacientes.Id + ");'><td  style='font-weight: 700;   font-size: 11px;'>" + pacientes.Fecha + "</td><td>" + sin + "</td><td>" + dig + "</td> </tr>";
                        });

                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoHc").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                    }),
                    error: errores
                });
            }

            function LimpiarFrmPop() {
                $("#Main_HddImg").val('NO');
                loadImage_base64('');
                $("#tabs1").tabs({ active: 0 });
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
                document.getElementById("Main_TxtFechaHc").value = today;
                $('#Main_TxtSintoma').val('');
                $('#Main_TxtDiagPresu').val('');
                $('#Main_TxtIndicaciones').val('');
                $('#Main_TxtTratamiento').val('');
                $('#Main_TxtObseHc').val('');

                $('#Main_TxtPeso').val('');
                $('#Main_TxtTemp').val('');
                $('#Main_TxtPreArt').val('');
                $('#Main_TxtSat').val('');
                $('#Main_TxtFrecCardiaca').val('');
                $('#Main_TxtHGTN').val('');
                $('#Main_TxtFrecResp').val('');


                $('#btnGuardar1').attr("class", "btn2 btn-primary");

            }
            function habilitarFrmPop() {

                $("#btnGuardar1").show();
                $('#Main_TxtSintoma').prop('disabled', false);
                $('#Main_TxtDiagPresu').prop('disabled', false);
                $('#Main_TxtIndicaciones').prop('disabled', false);
                $('#Main_TxtTratamiento').prop('disabled', false);
                $('#Main_TxtObseHc').prop('disabled', false);
                $('#Main_TxtFechaHc').prop('disabled', false);

                $('#Main_TxtPeso').prop('disabled', false);
                $('#Main_TxtTemp').prop('disabled', false);
                $('#Main_TxtPreArt').prop('disabled', false);
                $('#Main_TxtSat').prop('disabled', false);
                $('#Main_TxtFrecCardiaca').prop('disabled', false);
                $('#Main_TxtHGTN').prop('disabled', false);
                $('#Main_TxtFrecResp').prop('disabled', false);

            }
            function deshabilitarFrmPop() {
                
                $("#btnGuardar1").hide();
                $('#Main_TxtSintoma').prop('disabled', true);
                $('#Main_TxtDiagPresu').prop('disabled', true);
                $('#Main_TxtIndicaciones').prop('disabled', true);
                $('#Main_TxtTratamiento').prop('disabled', true);
                $('#Main_TxtObseHc').prop('disabled', true);
                $('#Main_TxtFechaHc').prop('disabled', true);

                $('#Main_TxtPeso').prop('disabled', true);
                $('#Main_TxtTemp').prop('disabled', true);
                $('#Main_TxtPreArt').prop('disabled', true);
                $('#Main_TxtSat').prop('disabled', true);
                $('#Main_TxtFrecCardiaca').prop('disabled', true);
                $('#Main_TxtHGTN').prop('disabled', true);
                $('#Main_TxtFrecResp').prop('disabled', true);

            }

            function BtnCancelar11() {
                $("#Main_LblMsg1").text('');
                $("#Main_TxtId").val('');
                deshabilitarFrmPop();
                $("#Main_HiddenField11").val('Cancelar');

                $('#btnAgregar11').prop('disabled', false);
                $('#btnModificar11').prop('disabled', false);
                $('#btnElimina11').prop('disabled', false);
                $('#btnCancelar11').prop('disabled', false);

                $('#btnGuardar11').prop('disabled', false);

                $('#btnGuardar11').attr("class", "btn2 btn-primary");

            }

            function BtnAgregar11() {
                $("#Main_LblMsg1").text('');
                $("#Consultorio").text('');
                $("#wPaint").show();
                $("#wPaintNo").hide();

                LimpiarFrmPop();

                $("#Main_HiddenField11").val('Alta');

                habilitarFrmPop();

                $('#btnAgregar11').prop('disabled', false);
                $('#btnModificar11').prop('disabled', true);
                $('#btnElimina11').prop('disabled', true);
                $('#btnCancelar11').prop('disabled', false);

                $('#btnGuardar11').prop('disabled', false);

                $('#btnGuardar11').attr("class", "btn2 btn-danger");

            }

            
            function deshabilitarFrmPop() {
                $("#btnGuardar11").hide();
                $('#Main_TxtSintoma').prop('disabled', true);
                $('#Main_TxtDiagPresu').prop('disabled', true);
                $('#Main_TxtIndicaciones').prop('disabled', true);
                $('#Main_TxtTratamiento').prop('disabled', true);
                $('#Main_TxtObseHc').prop('disabled', true);
                $('#Main_TxtFechaHc').prop('disabled', true);

                $('#Main_TxtPeso').prop('disabled', true);
                $('#Main_TxtTemp').prop('disabled', true);
                $('#Main_TxtPreArt').prop('disabled', true);
                $('#Main_TxtSat').prop('disabled', true);
                $('#Main_TxtFrecCardiaca').prop('disabled', true);
                $('#Main_TxtHGTN').prop('disabled', true);
                $('#Main_TxtFrecResp').prop('disabled', true);

            }


            //var orl = "data:image/png;base64,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";
            //var wp = $("#wPaint").wPaint({
            //    image: orl

            //}).data('_wPaint');



            function loadImage_base64(ids) {
                if (ids == '') {
                    $("#wPaint").wPaint("image", orl);
                } else {
                    $("#wPaint").wPaint("image", ids);
                }

            }

            function loadImage_png() {
                $("#wPaint").wPaint("image", "images/demo/wPaint.png");
            }

            function loadImage_jpg(ids) {

                $("#wPaint").wPaint("image", "images/demo/wPaint.jpg");
            }

            function saveImage() {
                var imageData = $("#wPaint").wPaint("image");

                //$("#canvasImage").attr('src', imageData);
                //$("#canvasImageData").val(imageData);

            }

            function clearCanvas() {
                alert('ewq');
                $("#wPaint").wPaint("clear");
            }

            function upload_image(id) {
                var imageData = $("#" + id).wPaint("image");

                $.ajax({
                    url: '/wPaint/upload.php',
                    data: { image: imageData },
                    type: 'post',
                    success: function (resp) {
                        alert('successfully uploaded image!');
                    }
                });
            }

            function FaltaGuardar() {
                if ($("#Main_HiddenField11").val() != 'Cancelar') {
                    if ($("#Main_TxtSintoma").val() != '') {

                        if (confirm("Desea guardar los datos ingresados antes de seguir ?")) {
                            BtnFnGuardar11();
                        }

                    }
                }
            }


            $("._wColorPicker_paletteHolder").css("overflow", "visible");
            $("._wColorPicker_paletteHolder").css("width", "210px");

      

            function foto() {

                

           

                $('#verfoto').show();
                    $('#webcam').webcam({
                        noCameraFound: function () {
                            this.debug('error', 'Web camera is not available');
                        },
                        error: function (e) {
                            this.debug('error', 'Internal camera plugin error');
                        },
                        cameraDisabled: function () {
                            this.debug('error', 'Please allow access to your camera');
                        },
                        debug: function (type, string) {
                            if (type == 'error') {
                                $(".webcam-error").html(string);
                            } else {
                                $(".webcam-error").html('');
                            }
                        },
                        cameraEnabled: function () {
                            this.debug('notice', 'Camera enabled');
                            if (this.isCameraEnabled) return;
                            this.isCameraEnabled = true;
                            $('#popup-webcam-cams')
                                .append($.map(this.getCameraList(), function (cam, i) {
                                    return '<option value="' + i + '">' + cam + '</option>';
                                }).join(''));
                            setTimeout($.proxy(function () {
                                this.setCamera('0');
                                $('#popup-webcam-take-photo')
                                    .prop('disabled', false)
                                    .show();
                            }, this), 750);
                        }
                    });

                    $('#popup-webcam-cams').change(function () {
                        var $cam = $('#webcam');
                        var success = $cam.webcam('setCamera', $(this).val());
                        if (!success) {
                            $cam.webcam('debug', 'error', 'Unable to select camera');
                        } else {
                            $cam.webcam('debug', 'notice', 'Camera changed');
                        }
                    });
                    $('#popup-webcam-take-photo').click(function (e) {
                        e.preventDefault();
                        var api = $('#webcam').data('webcam');
                    


                        
                        var result = api.save();
                        if (result && result.length) {
                            
                            var v_tipo = "data:image/jpeg;base64," + result;
                            sendFile(dataURItoBlob(v_tipo));

                            //var img = new Image();
                            //img.src = "data:image/jpeg;base64," + result;
                            //$('#result').append(img);

 
                       

                          //  alert('base64encoded jpeg (' + shotResolution[0] + 'x' + shotResolution[1] + '): ' + result.length + 'chars');
                            /* resume camera capture */
                            api.setCamera($('#popup-webcam-cams').val());
                        } else {
                            api.debug('error', 'Broken camera');
                        }

                       





                    });



            }
       


                function sendFile(file) {

                    var formData = new FormData();
                    formData.append('file', file);
                    $.ajax({
                        type: 'post',
                        async: false,
 
                        url: '/Services/subirPaciente.ashx?dni='+$('#Main_TxtCuit').val(),
                        data: formData,
                        success: function (status) {
                            if (status != 'error') {
                                //var my_path = "../../Subidos/ORL/" + status;
                          
                                  var my_path = "/Subidos/ORL/" + status;
                                $("#myUploadedImg").attr("src", my_path);
                            }
                        },
                        processData: false,
                        contentType: false,
                        error: function () {
                            alert("Error en la carga");
                        }
                    });
                }


                function dataURItoBlob(dataURI) {
                     
                    var byteString,
                        mimestring

                    if (dataURI.split(',')[0].indexOf('base64') !== -1) {
                        byteString = atob(dataURI.split(',')[1])
                    } else {
                        byteString = decodeURI(dataURI.split(',')[1])
                    }

                    mimestring = dataURI.split(',')[0].split(':')[1].split(';')[0]

                    var content = new Array();
                    for (var i = 0; i < byteString.length; i++) {
                        content[i] = byteString.charCodeAt(i)
                    }

                    return new Blob([new Uint8Array(content)], { type: mimestring });
                }
       
        </script>
	
      <style>

          ._wColorPicker_paletteHolder {

              overflow:visible;
          }
      </style>
            

 </asp:Content>
