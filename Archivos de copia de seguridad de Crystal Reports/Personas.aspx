

<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Personas.aspx.cs" Inherits="HardSoft.App.OAA.Personas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
       <link href="../../css/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    
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
                Ver Usuario        </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>  Usuario  </strong> 
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
          <option value="3">CUIT</option>
           <option value="6">Apellido</option>
          <option value="0">Nombre</option>          
          <option value="1">Id</option>
          <option value="2">Cod Manual</option>
           <option value="5">N°Documento</option>
          
           
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
  <table   id='grilla1'></table>

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
    <span id="span_cantidad1">0</span></div>
               </div> <br />
   </div>



           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"   style="background-color: rgb(241, 241, 241);">
      <div class="row" >
              <div class=" col-xs-6 " id="TituloPop"   style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;" >
      
       </div>     
         <div class=" col-xs-6 "  >
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
          </div>
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
       
     


    
      <div id="tabs" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs-1"> Datos</a></li>
      <li><a href="#tabs-2"> Contacto</a></li>
   <%--  <li><a href="#tabs-3" style="display:none"> Otros Datos</a></li>
   --%>   
       <li><a href="#tabs-4">Usuario</a></li>
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

         <label for="TxtNombre" class="control-label col-xs-4">Cod.Manual </label>
         <div class="col-xs-3">

 <asp:TextBox ID="TxtCodMunual" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>
   <label for="TxtNombre" class="control-label col-xs-3">Cod.Sistema </label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtCodSistema" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>


           
     </div>
         
           <div class="form-group">
      <div class="col-xs-4">

             <select id="CmbTipoDoc" class="form-control" style="width: 95px;float:right;height: 35px;">
                 <option value="DNI"> DNI </option>
                  <option value="CUIT"> CUIT </option>
                  <option value="LE"> LE </option>
                  <option value="LC"> LC </option>
                   <option value="LC"> CIE</option>
                       <option value="LC"> PAS</option>
             </select>

      </div>
         <div class="col-xs-4">
<asp:TextBox ID="TxtCuit" runat="server"  class="form-control"  Width="120px"     onKeyPress="return acceptNum(event)" ></asp:TextBox>
                 
         </div> <div class="col-xs-4">

      <a id="afip" class="tooltips" style="cursor:pointer ; display:none" href="#"   >        <img src="../../images/afip.jpeg" style="width:88px" />
           <span>Constancia</span></a>
         
         </div>
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

<div class="form-group hidden">
         <label for="TxtNombre" class="control-label col-xs-4" >IVA</label>
        <div class="col-xs-8">
              <select id="cmbAfip" class="form-control">
                   <option value="CONSUMIDOR_FINAL">CONSUMIDOR FINAL</option>
          <option value="MONOTRIBUTO">MONOTRIBUTO</option>         
       <option value="EXENTO">EXENTO</option>
       <option value="EXPORTACION">EXPORTACIÓN</option>
                  <option value="RESPONSABLE_INSCRIPTO">RESPONSABLE INSCRIPTO</option>
   <option value="RESPONSABLE_INSCRIPTO_CBU">RESPONSABLE INSCRIPTO CBU</option>
                  <option value="RESPONSABLE_INSCRIPTO_M">RESPONSABLE INSCRIPTO M</option>
      </select>
               </div>
           
     </div>
 
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Observaciones</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtObservacion" runat="server" class="form-control"  TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>

      
          <div class="form-group hidden">
         <label for="TxtNombre" class="control-label col-xs-4" >Cuenta contable</label>
         <div class="col-xs-8">

  <select id="cmbCtaContable" class="form-control">
          <option value="Deudores_por_Ventas">Deudores por Ventas</option> 
      </select>
      
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
     <div class="col-xs-6">
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
         <label for="TxtNombre" class="control-label col-xs-4">Celular</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpCel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">E-mail</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpMail" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

   <div class="form-group hidden" >
         <label for="TxtNombre" class="control-label col-xs-4">Web</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmpWeb" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
   
        <div class="form-group">
         <div id="TxtMsj" class="col-xs-12  alert-danger"></div>
   
           
     </div>
   
      
        </div>
          </div>

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
               <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
 Otro contacto
         </div>
           
     </div>

                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtContactoNom" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
           
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Teléfono</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtContacTel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
                  <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Celular</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtContactCel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
        <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">E-mail</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtContacMail" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

    
        
        </div>
          </div>
   
 
</div>
      </div>

            <div id="tabs-3"   style="display:none">
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
     <div class="col-xs-6">
        <div class="form-horizontal">
                <div class="form-group"  >
         <label for="TxtDescripcion" class="control-label col-xs-4"> </label>
         <div class="col-xs-8"  style="margin-top: 5px; background-color: #636363;  border-radius: 5px 5px 5px 5px;   border: 1px solid; box-shadow: 0 4px 5px #555;   text-align: center;    color: #f1f1f1;">
Lista de Precio Principal
         </div>
           
     </div>
            
                      <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Lista $$</label>
         <div class="col-xs-8">

 <select id="cmbPrecio" class="form-control"> 
       </select>
         </div>
           
     </div>
  
   
      
        </div>
          </div>

       <div class="col-xs-6">
          
     
              </div>
   
 
</div>
      </div>



               <div id="tabs-4">
      <div class="row"  style="    padding-top: 20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
     
          
          <div class="col-xs-6">
        <div class="form-horizontal">
            
   
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> ID_USUARIO</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtID_USUARIO' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-3'> USUARIO</label>  
   <div class='col-xs-9'>  
    <asp:TextBox ID='TxtUSUARIO' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-3'> CLAVE</label>  
   <div class='col-xs-6'>  
    <asp:TextBox ID='TxtCLAVE' runat='server' CssClass='form-control' TextMode="Password"></asp:TextBox> 
  </div> 
<div class='col-xs-3'>
</div> 
</div> 
 
      
        </div>
           <br />
            <div style="text-align:left; display:none" id="btnpass">

      <button id="btnpass1a" type="button" class="btn2 btn-success " onclick="ModificarPassJs()" style="display: inline-block;">
    <span class=" glyphicon glyphicon-save"></span> Modificar Clave
 </button>

        <button id="btnpass2a" type="button" class="btn2 btn-danger " onclick="GuardarPassJs()" style="display: inline-block;">
    <span class=" glyphicon glyphicon-save"></span> Guardar
 </button>

  </div>

           <br />     
          </div>

       <div class="col-xs-6">
              <div class="form-horizontal">

  



                   <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-3'>DEPOSITO</label>  
   <div class='col-xs-9'>  
<select id="cmbDepLt" class="form-control"></select>
  </div> 
 
</div> 
                    <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-3'>Roles</label>  
   <div class='col-xs-9'>  
<select id="cmbRoles" class="form-control"></select>
  </div> 
 
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
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; margin-bottom:5px;background-color:#b9b9b9; padding:10px;border-radius: 10px 10px 10px 10px;
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
            function ListaPrecios() {

                // LISTA de precio del usuario 1  

                try {
                    var json = JSON.stringify
                      ({
                          "v_id": '1'
                      });
                    $.ajax({
                        type: "POST",
                        url: "Articulo.aspx/WsListarPrecios",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            if (result.d != null) {
                                var Pacientes = result.d;

                                $('#cmbPrecio').empty();

                                $('#cmbPrecio').append(
                                          $('<option></option>').val('1').html('Lista1 -' + Pacientes.l1_desc)
                                        );
                                $('#cmbPrecio').append(
                                       $('<option></option>').val('2').html('Lista2 -' + Pacientes.l2_desc)
                                     );
                                $('#cmbPrecio').append(
                                       $('<option></option>').val('3').html('Lista3 -' + Pacientes.l3_desc)
                                     );
                                $('#cmbPrecio').append(
                                       $('<option></option>').val('4').html('Lista4 -' + Pacientes.l4_desc)
                                     );

                                $('#cmbPrecio').append(
                                       $('<option></option>').val('5').html('Lista5 -' + Pacientes.l5_desc)
                                     );



                            }
                        },
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }

          var v_pro = '';
          $('#Main_TxtCodSistema').prop('disabled', true);
            function PopVer(id) {
               $("#btnpass").hide();
              limpiar();
              $("#btnAgregar1a").hide();
              $("#btnGuardar1a").hide();

              $("#TituloPop").text('Ver Usuario');
              $("#ModalCat").modal();

              deshabilitarFrm();


              var json = JSON.stringify
        ({
            "v_Id": id

        });

              $.ajax({
                  type: "POST",
                  url: "Personas.aspx/WsBuscarP",
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
                          $("#cmbAfip").val(result.d.Iva);
                          // $("#cmbAfip option[value=" + result.d.Iva + "]").attr("selected", true);
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


                          $("#Main_TxtContactoNom").val(result.d.Contac_Nomb);
                          $("#Main_TxtContacTel").val(result.d.Contac_Tel);
                          $("#Main_TxtContactCel").val(result.d.Contac_Cel);
                          $("#Main_TxtContacMail").val(result.d.Contac_Mail);
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
            function PopMod(id, user) {
                $("#btnpass").show();
                   $("#Main_TxtUSUARIO").prop('disabled', true);
              $("#cmbDepLt").prop('disabled', true);
              $("#Main_TxtCLAVE").prop('disabled', true);
                $("#cmbRoles").prop('disabled', true);
                $("#btnpass1a").show();
                  $("#btnpass2a").hide();


              habilitarFrm();
              limpiar();
              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();

              $("#TituloPop").text('Modificar Usuario');
              $("#ModalCat").modal();
         
           

                  var json = JSON.stringify
            ({
                "v_Id": id
              
            });

                  $.ajax({
                      type: "POST",
                      url: "Personas.aspx/WsBuscarP",
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
                              $("#cmbAfip").val(result.d.Iva);
                             // $("#cmbAfip option[value=" + result.d.Iva + "]").attr("selected", true);
                              $("#Main_TxtObservacion").val(result.d.Observacion);
                              
                              $("#Main_TxtNombre").val(result.d.Nombre);
                              $("#Main_TxtApellido").val(result.d.Apellido);

                              $("#cmbCtaContable").val(result.d.Cta_contable);
                              $("#Main_TxtCalle").val(result.d.Calle);
                              $("#Main_TxtNum").val(result.d.Numero);
                              $("#Main_TxtDpto").val(result.d.Dpto);

                              $("#HddProv").val(result.d.Provincia);
                              $("#HddDep").val(result.d.Departamento);
                              $("#HddDis").val(result.d.Distrito);

                               $("#Main_TxtID_USUARIO").val(user);

                              $("#cmbPais").val(result.d.Pais);
                              $("#Main_TxtCp").val(result.d.Cp);
                              v_pro = result.d.Pais;
                              ListarProvincia(result.d.Pais);
                              ListarDepartamento(result.d.Provincia);
                              ListarDistrito(result.d.Departamento);
                            
                              
                              $("#Main_TxtContactoNom").val(result.d.Contac_Nomb);
                              $("#Main_TxtContacTel").val(result.d.Contac_Tel);
                              $("#Main_TxtContactCel").val(result.d.Contac_Cel);
                              $("#Main_TxtContacMail").val(result.d.Contac_Mail);
                              $("#Main_TxtEmpTel").val(result.d.Emp_Tel);
                              $("#Main_TxtEmpCel").val(result.d.Emp_Cel);
                              $("#Main_TxtEmpMail").val(result.d.Emp_Mail);
                              $("#Main_TxtEmpWeb").val(result.d.Emp_Web);

                              $("#Main_TxtUSUARIO").val(result.d.User_Usuario);
                                  $("#cmbDepLt").val(result.d.Deposito_Usuario);
                                $("#cmbRoles").val(result.d.Roles_Usuario);



                              $("#cmbProv").val(result.d.Provincia);
                              $("#cmbDepartamento").val(result.d.Departamento);
                              $("#cmbDistrito").val(result.d.Distrito);
                              if (result.d.ListaP =="") {
                                  document.getElementById("cmbPrecio").selectedIndex = "0";
                              } else {
                                  $("#cmbPrecio").val(result.d.ListaP);
                              }
                              Buscar();
                          }
                      },
                          
                      error: errores
                  });


          }
            function PopAlta() {
                 $("#btnpass").hide();
                $("#Main_TxtUSUARIO").prop('disabled', false);
              $("#cmbDepLt").prop('disabled',false);
              $("#Main_TxtCLAVE").prop('disabled',false);
              $("#cmbRoles").prop('disabled',false);
              habilitarFrm();
              limpiar();

              $("#btnAgregar1a").hide();
              $("#btnGuardar1a").show();

              $("#TituloPop").text('Alta de Usuario');
              $("#ModalCat").modal();

          }

          function limpiar() {

              $("#tabs").tabs({ active: 0 });

              $("#HddProv").val('');
              $("#HddDep").val('');
              $("#HddDis").val('');
              $("#Main_TxtContactoNom").val('');
              $("#Main_TxtContacTel").val('');
              $("#Main_TxtContactCel").val('');
              $("#Main_TxtContacMail").val('');
              $("#Main_TxtEmpTel").val('');
              $("#Main_TxtEmpCel").val('');
              $("#Main_TxtEmpMail").val('');
              $("#Main_TxtEmpWeb").val('');
               
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
              document.getElementById("cmbPrecio").selectedIndex = "0";

           
             

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
                      url: "Personas.aspx/WsListar",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: resultadoL,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }

          }

          function resultadoL(Resultado) {
              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = ""; 
              $("#Resultado").show();
              $("#Resultado").empty();
              Tabla_Titulo = "<table   id='grilla1' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th>  <th>Nombre</th><th>N° Doc</th><th>Tel</th> <th>Dirección</th></tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr ><td  style='width:30px'> <a class='tooltips' onclick='gvDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td> <td style='width:30px'> <a class='tooltips' onclick='PopMod(" + pacientes.Id + ", " + pacientes.Id_Usuario + "  ,this);' > <img src='/images/boton-editar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Editar</span></a></td> <td>" + pacientes.Nombre + ' ' + pacientes.Apellido + "</td><td>" + pacientes.Tipo_Doc + ':' + pacientes.Doc_No + "</td><td>" + pacientes.Emp_Tel + " " + pacientes.Emp_Cel + "</td><td>" + pacientes.Calle + ' N° ' + pacientes.Numero + "</td></tr>";
              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              fn_cantidad1();

          }

          $("#Main_TxtCuit").keyup(function (e) {
              if (e.keyCode == 13) {
                  
                  $("#Main_TxtNombre").focus();
              }
          });
 
          function Cuit() {
              ListarDepartamento("1");

           
              var esTipo = "DNI";
              var esTipo2 = "NO";
              if ($("#CmbTipoDoc").val() == "CUIT") {
                  esTipo = "CUIT";
                  esTipo2 = "SI";
              }
              if ($("#CmbTipoDoc").val() == "DNI") {
                  esTipo = "DNI";
                  esTipo2 = "SI";
              }
              if (esTipo2 == "SI") {
                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                             ({
                                 v_doc: $("#Main_TxtCuit").val(),
                                 v_tipo: esTipo
                             });

                  $.ajax({
                      type: "POST",
                      url: "Cbtes.aspx/validad_doc",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {
                          var Pacientes = Resultado.d;
                          if (Pacientes.Nombre != null) {
                              $("#cmbAfip").val("CONSUMIDOR_FINAL");
                              var ape = Pacientes.Nombre.substr(0, Pacientes.Nombre.indexOf(' '));
                              var nom = Pacientes.Nombre.substr(Pacientes.Nombre.indexOf(' ') + 1);

                              $("#Main_TxtNombre").val(nom);
                              $("#Main_TxtApellido").val(ape);
                              $("#Main_TxtCuit").val(Pacientes.Doc_No);

                              if (Pacientes.Calle != null) {
                                  var calle = Pacientes.Calle.substr(0, Pacientes.Calle.indexOf(' '));
                                  var nume = Pacientes.Calle.substr(Pacientes.Calle.indexOf(' ') + 1);

                                  $("#Main_TxtCalle").val(calle);
                                  $("#Main_TxtNum").val(nume);
                                  $("#Main_TxtCp").val(Pacientes.Cp);
                                  if (Pacientes.Provincia == "1") {
                                      $("#cmbPais").val("1");
                                      $('#cmbProv').append(
                               $('<option></option>').val("1").html("Buenos Aires")
                             );
                                  }


                              }

                              if (Pacientes.Iva == "MONOTRIBUTO") {
                                  $("#cmbAfip").val("MONOTRIBUTO");
                              }

                              if (Pacientes.Iva == "RESPONSABLE INSCRIPTO") {
                                  $("#cmbAfip").val("RESPONSABLE INSCRIPTO");
                              }


                          } else {
                              $('#afip').prop('href', '#');

                          }

                      }),
                      error: errores
                  });

              }


              if ($("#CmbTipoDoc").val() == 'CUIT') {

                  ver_cuit($("#Main_TxtCuit").val());
                  $('#afip').show();
                  $('#afip').prop('href', 'https://soa.afip.gob.ar/sr-padron/v1/constancia/' + $("#Main_TxtCuit").val());

              } else {
                  $('#afip').hide();
              }

              limpiarCli();
          }
          function limpiarCli() {
 

              $("#HddProv").val('');
              $("#HddDep").val('');
              $("#HddDis").val('');
              $("#Main_TxtContactoNom").val('');
              $("#Main_TxtContacTel").val('');
              $("#Main_TxtContactCel").val('');
              $("#Main_TxtContacMail").val('');
              $("#Main_TxtEmpTel").val('');
              $("#Main_TxtEmpCel").val('');
              $("#Main_TxtEmpMail").val('');
              $("#Main_TxtEmpWeb").val('');

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

          function ver_cuit(v_cuit) {
              try {
                  $.ajax({
                      url: "https://soa.afip.gob.ar/sr-padron/v2/persona/" + v_cuit,
                      responseType: "json",
                      timeout: 20000,
                      cache: true,
                      success: function (result) {

                          if (result.data != null) {

                              // alert(result.data.nombre + "\n" + result.data.domicilioFiscal.direccion + " - Cod Postal:" + result.data.domicilioFiscal.codPostal);
                              
                              $("#cmbAfip").val("CONSUMIDOR_FINAL");
                              var ape = result.data.nombre.substr(0, result.data.nombre.indexOf(' '));
                              var nom = result.data.nombre.substr(result.data.nombre.indexOf(' ') + 1);
                              $("#Main_TxtNombre").val(nom);
                              $("#Main_TxtApellido").val(ape);
                              var calle = result.data.domicilioFiscal.direccion.substr(0, result.data.domicilioFiscal.direccion.indexOf(' '));
                              var nume = result.data.domicilioFiscal.direccion.substr(result.data.domicilioFiscal.direccion.indexOf(' ') + 1);
                              $("#Main_TxtCalle").val(calle);
                              $("#Main_TxtNum").val(nume);
 

                              $("#Main_TxtCp").val(result.data.domicilioFiscal.codPostal); 
                             
                              if (result.data.domicilioFiscal.idProvincia == 1) { 
                              }
                              if (result.data.categoriasMonotributo != null) {                                  
                                  $("#cmbAfip").val("MONOTRIBUTO");
                              }

                              if (result.data.idCatAutonomo != null) {
                                  $("#cmbAfip").val("RESPONSABLE INSCRIPTO");
                              }
                              

                              
                          } else {
                              $('#afip').prop('href', '#');

                          }

                      },
                      error: function (jqXHR, textStatus, errorThrown) {
                      }
                  });
              } catch (e) {

              }

          }



       
          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }


          function fn_cantidad1() {
               
              cantidad = $("#grilla1 tbody").find("tr").length;
              $("#span_cantidad1").html(cantidad);
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

            //  ListaPrecios();
              ListarRoles();
              $("#Main_TxtCodSistema").prop('disabled', true);

            $('#tabs').tabs();

            $("#Main_TxtCuit").blur(function () {
                // Cuit();
                //  probar si anda despues
              });

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


                          "Contac_Nomb": $("#Main_TxtContactoNom").val(),
                          "Contac_Tel": $("#Main_TxtContacTel").val(),
                          "Contac_Cel": $("#Main_TxtContactCel").val(),
                          "Contac_Mail": $("#Main_TxtContacMail").val(),
                          "Emp_Tel": $("#Main_TxtEmpTel").val(),
                          "Emp_Cel": $("#Main_TxtEmpCel").val(),
                          "Emp_Mail": $("#Main_TxtEmpMail").val(),
                          "Emp_Web": $("#Main_TxtEmpWeb").val()

                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Personas.aspx/WmMod2",
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
                          "ListaP": $("#cmbPrecio").val(),

                          "Contac_Nomb": $("#Main_TxtContactoNom").val(),
                          "Contac_Tel": $("#Main_TxtContacTel").val(),
                          "Contac_Cel": $("#Main_TxtContactCel").val(),
                          "Contac_Mail": $("#Main_TxtContacMail").val(),
                          "Emp_Tel": $("#Main_TxtEmpTel").val(),
                          "Emp_Cel": $("#Main_TxtEmpCel").val(),
                          "Emp_Mail": $("#Main_TxtEmpMail").val(),
                          "Emp_Web": $("#Main_TxtEmpWeb").val(),
                          "Roles_Usuario": $("#cmbRoles").val(),
                           "Id_Usuario": $("#Main_TxtID_USUARIO").val(),
                          "Deposito_Usuario": $("#cmbDepLt").val()
                          
                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Personas.aspx/WmMod2",
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

          function AltaJs() {
              try {

                   $("#Main_TxtUSUARIO").removeClass("valid");
                  if ($("#Main_TxtUSUARIO").val() == "") {
                      alert("El campo Usuario es obligatorio");
                $("#Main_TxtUSUARIO").addClass("valid");
                return;
                  }

                      $("#Main_TxtCLAVE").removeClass("valid");
                  if ($("#Main_TxtCLAVE").val() == "") {

                           alert("El campo Clave es obligatorio");
                $("#Main_TxtCLAVE").addClass("valid");
                return;
                  }


                          $("#Main_TxtNombre").removeClass("valid");
                  if ($("#Main_TxtNombre").val() == "") {
                     alert("El campo Nombre es obligatorio");
                $("#Main_TxtNombre").addClass("valid");
                return;
                  }

                      $("#Main_TxtApellido").removeClass("valid");
                  if ($("#Main_TxtApellido").val() == "") {
                     alert("El campo Apellido es obligatorio");
                $("#Main_TxtApellido").addClass("valid");
                return;
                  }

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


                          "Contac_Nomb": $("#Main_TxtContactoNom").val(),
                          "Contac_Tel": $("#Main_TxtContacTel").val(),
                          "Contac_Cel": $("#Main_TxtContactCel").val(),
                          "Contac_Mail": $("#Main_TxtContacMail").val(),
                          "Emp_Tel": $("#Main_TxtEmpTel").val(),
                          "Emp_Cel": $("#Main_TxtEmpCel").val(),
                          "Emp_Mail": $("#Main_TxtEmpMail").val(),
                          "ListaP": $("#cmbPrecio").val(),
                          "Emp_Web": $("#Main_TxtEmpWeb").val(),

                            "User_Usuario": $("#Main_TxtUSUARIO").val(),
                            "Pass_Usuario": $("#Main_TxtCLAVE").val(),
                          "Deposito_Usuario": $("#cmbDepLt").val(),
                              "Roles_Usuario": $("#cmbRoles").val()
                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Personas.aspx/WmAlta2",
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

          function ListarPais() {
              try {

                  var json = JSON.stringify
            ({
                "v_tipo": '',
                "v_valor": ''
            });

                  $.ajax({
                      type: "POST",
                      url: "Proveedores.aspx/WsListarP",
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
                      url: "Proveedores.aspx/WsListarProvincia",
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
                      url: "Proveedores.aspx/WsListarDepartamento",
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
                      url: "Proveedores.aspx/WsListarDistrito",
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
                          url: "Personas.aspx/gvProv_del",
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
              
              $("#Main_TxtObservacion").prop('disabled', false);
              $("#CmbTipoDoc").prop('disabled', false);
              $("#Main_TxtObservacion").prop('disabled', false);
              $("#Main_TxtCodMunual").prop('disabled', false);
              $("#Main_TxtCuit").prop('disabled', false);
              $("#cmbAfip").prop('disabled', false);
              $("#Main_TxtDenominacion").prop('disabled', false);
              $("#Main_TxtNombre").prop('disabled', false);
              $("#Main_TxtApellido").prop('disabled', false);
       
              $("#cmbCtaContable").prop('disabled', false);
              $("#Main_TxtCalle").prop('disabled', false);
              $("#Main_TxtNum").prop('disabled', false);
              $("#Main_TxtDpto").prop('disabled', false);
              $("#cmbPais").prop('disabled', false);
              $("#Main_TxtCp").prop('disabled', false);
              $("#cmbProv").prop('disabled', false);
              $("#cmbDepartamento").prop('disabled', false);
              $("#cmbDistrito").prop('disabled', false);
              $("#Main_TxtContactoNom").prop('disabled', false);
              $("#Main_TxtContacTel").prop('disabled', false);
              $("#Main_TxtContactCel").prop('disabled', false);
              $("#Main_TxtContacMail").prop('disabled', false);
              $("#Main_TxtEmpTel").prop('disabled', false);
              $("#Main_TxtEmpCel").prop('disabled', false);
              $("#Main_TxtEmpMail").prop('disabled', false);
              $("#Main_TxtEmpWeb").prop('disabled', false);

                  $("#cmbDepLt").prop('disabled', false);
             
              $("#cmbRoles").prop('disabled', false);
          }


            function ModificarPassJs() {

                //$("#Main_TxtUSUARIO").prop('disabled', false);
                //$("#cmbDepLt").prop('disabled',  false);
                $("#Main_TxtCLAVE").prop('disabled',  false);
                //$("#cmbRoles").prop('disabled',  false);
                $("#btnpass2a").show();
                 $("#btnpass1a").hide();
                    
            }
            function deshabilitarFrm() {

               $("#Main_TxtUSUARIO").prop('disabled', true);
              $("#cmbDepLt").prop('disabled', true);
              $("#Main_TxtCLAVE").prop('disabled', true);
              $("#cmbRoles").prop('disabled', true);
               

              $("#CmbTipoDoc").prop('disabled', true);
              $("#Main_TxtObservacion").prop('disabled', true);
              $("#Main_TxtCodMunual").prop('disabled', true);
              $("#Main_TxtCuit").prop('disabled', true);
              $("#cmbAfip").prop('disabled', true);
             $("#Main_TxtNombre").prop('disabled', true);
              $("#Main_TxtApellido").prop('disabled', true);

              $("#cmbCtaContable").prop('disabled', true);
              $("#Main_TxtCalle").prop('disabled', true);
              $("#Main_TxtNum").prop('disabled', true);
              $("#Main_TxtDpto").prop('disabled', true);
              $("#cmbPais").prop('disabled', true);
              $("#Main_TxtCp").prop('disabled', true);
              $("#cmbProv").prop('disabled', true);
              $("#cmbDepartamento").prop('disabled', true);
              $("#cmbDistrito").prop('disabled', true);
              $("#Main_TxtContactoNom").prop('disabled', true);
              $("#Main_TxtContacTel").prop('disabled', true);
              $("#Main_TxtContactCel").prop('disabled', true);
              $("#Main_TxtContacMail").prop('disabled', true);
              $("#Main_TxtEmpTel").prop('disabled', true);
              $("#Main_TxtEmpCel").prop('disabled', true);
              $("#Main_TxtEmpMail").prop('disabled', true);
              $("#Main_TxtEmpWeb").prop('disabled', true);

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

                  window.location.href = "/";
              }
            }

                  function ListarDeposito() {
            try {


                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                        "v_tipo": $('#cmbTipoOp').val(),
                        "v_valor": $('#Main_TxtBuscar').val()

                    });
                  $.ajax({
                      type: "POST",
                      url: "Deposito.aspx/WsListar",
                      data: json,
                       async: false,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: CargarDepLt,
                      error: errores
                });

       


            } catch (e) {
                alert(e.message);
            }
        }


        function CargarDepLt(Resultado) {

            var Especialidad = Resultado.d;
 
            $('#cmbDepLt').empty();
           
            $.each(Especialidad, function (index, especialidades) {
               
                $('#cmbDepLt').append(
                $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
              );
            });


        }

            function GuardarPassJs() {

                  try {

                        $('#Main_TxtCLAVE').removeClass("valid");
                  if ( $('#Main_TxtCLAVE').val() == "") {
                      alert("El campo Clave es obligatorio");
                $('#Main_TxtCLAVE').addClass("valid");
                return;
                  }
                    
                  var json = JSON.stringify
                    ({
                        "v_idmail": $('#Main_TxtUSUARIO').val(),
                       "pwd":$('#Main_TxtCLAVE').val()

                    });
                  $.ajax({
                      type: "POST",
                      url: "Personas.aspx/Pwd",
                      data: json,
                       async: false,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (result) {
                          alert("Clave Modificada.");
                          $('#Main_TxtCLAVE').val('');
                      }),
                      error: errores
                });


            } catch (e) {
                alert(e.message);
            }

            }

            function ListarRoles() {
            try {


                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                        "v_sis": "IRIARTE",
                       

                    });
                  $.ajax({
                      type: "POST",
                      url: "Personas.aspx/WmListarRoles",
                      data: json,
                       async: false,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: CargarRoles,
                      error: errores
                });

       


            } catch (e) {
                alert(e.message);
            }
        }


        function CargarRoles(Resultado) {

            var Especialidad = Resultado.d;
 
            $('#cmbRoles').empty();
           
            $.each(Especialidad, function (index, especialidades) {
               
                $('#cmbRoles').append(
                $('<option></option>').val(especialidades.valor).html(especialidades.valor)
              );
            });


        }


            
        $(function () {
            
            ListarDeposito();
  
        })  

    </script>
   
    
</asp:Content>

