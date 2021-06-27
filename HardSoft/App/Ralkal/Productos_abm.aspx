<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master"  enableEventValidation="false" AutoEventWireup="true" CodeBehind="Productos_abm.aspx.cs" Inherits="HardSoft.App.Ralkal.Productos_abm" %>

<%@ Register Src="~/App/Ralkal/CtrlFrm/Categoria_Productos.ascx" TagPrefix="uc1" TagName="Categoria_Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
          
       
    
    
    <script language="JavaScript" type="text/javascript">

        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>

     
    
       
    <div class=" container" style="margin-top:0px;text-transform:uppercase" >
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                     Productos             </li>
                                </ol>
        </nav>
       
 
        
        <div class="alert alert-success">
          Administración de productos
       </div>     
        
     

<div class="row"  style="text-transform:uppercase; margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >


    <div class="col-xs-6">
        <div class="form-horizontal">
        
          <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Código : </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtCod" runat="server" class="form-control" placeholder="Código"></asp:TextBox>
      
         </div>
           
     </div>
      
         <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre : </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control" placeholder="Nombre"></asp:TextBox>
      
         </div>
           
     </div>
  
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Categoria : </label>
         <div class="col-xs-7">

 <asp:DropDownList ID="cmbCategoria" runat="server" CssClass="cmbBuscar form-control " Width="100%"  >                                          
                                            
                                        </asp:DropDownList>
             </div>
           <div class="col-xs-1">
     
          <div style="cursor:pointer" onclick="PopCat()">    <img src="../../images/anadir.png" /></div> 
           
     </div>
               </div>
         <div class="form-group">
         <label for="mbTasaIVA" class="control-label col-xs-4">TasaIVA : </label>
         <div class="col-xs-8">

 <asp:DropDownList ID="cmbTasaIVA" runat="server" CssClass="form-control"  DataTextField="Descripcion"
                                            DataValueField="ID">
                                           
                                            <asp:ListItem Value="1">IVA 21%</asp:ListItem>
                                            <asp:ListItem Value="2">IVA 10.5%</asp:ListItem>
                                            <asp:ListItem Value="3">IVA 2.5%</asp:ListItem>
                                            <asp:ListItem Value="4">IVA 27%</asp:ListItem>
                                            <asp:ListItem Value="5">IVA 5%</asp:ListItem>
                                              <asp:ListItem Value="6">IVA Exento</asp:ListItem>
                                        </asp:DropDownList>

             

         </div>
           
     </div>
        
        </div>
          </div>

     <div class="col-xs-6">

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


            <uc1:Categoria_Productos runat="server" ID="Categoria_Productos" />




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
                       $('#Main_TxtCod').val('');
                      
                       $("#Main_cmbCategoria").val(0).change();

                       $('#Main_cmbTasaIVA').attr('selected', false);
                       $("#Main_cmbTasaIVA option[value=1]").attr("selected", true);

                       $('#btnGuardar1').attr("class", "btn2 btn-primary");

                   }
                   function deshabilitarFrm() {

                       $('#Main_TxtNombre').prop('disabled', true);
                       $('#Main_TxtCod').prop('disabled', true);
                       $('#Main_cmbCategoria').prop('disabled', true);
                       $('#Main_cmbTasaIVA').prop('disabled', true);

                       if ($("#Main_HiddenField1").val() == 'Alta') {
                           LimpiarFrm();
                       }
                   }


                   function habilitarFrm() {

                       $('#Main_TxtNombre').prop('disabled', false);
                       $('#Main_TxtCod').prop('disabled', false);
                       $('#Main_cmbCategoria').prop('disabled', false);
                       $('#Main_cmbTasaIVA').prop('disabled', false);

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
                       if ($("#Main_TxtId").val() != '') {
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
                   }
                   function BtnFnEliminar1() {

                       if ($("#Main_TxtId").val() != '') {

                           $("#Main_LblMsg").text('¿ Desea Eliminar ? Presione Guardar para confirmar.  Registro ' + $("#Main_TxtId").val())

                           $("#Main_HiddenField1").val('Eliminar');

                           $('#btnAgregar1').prop('disabled', true);
                           $('#btnModificar1').prop('disabled', true);
                           $('#btnElimina1').prop('disabled', false);
                           $('#btnCancelar1').prop('disabled', false);
                           $('#btnGuardar1').prop('disabled', false);

                           $('#btnGuardar1').attr("class", "btn2 btn-danger");

                       }


                   }


                   function Exito() {

                       $("#Main_HiddenField1").val("Cancelar");
                       LimpiarFrm();

                       //    $("#Main_LblMsg").text('Se completo con éxito la transacción');

                       deshabilitarFrm();


                   }
                   function BtnFnGuardar1() {
                       $("#Main_LblMsg").text('')
                       var Op = '';
                       Op = $("#Main_HiddenField1").val();


                       switch (Op) {
                           case 'Alta':
                               $("#Main_HiddenField1").val("Cancelar");

                               AltaJs()

                               // $("#Main_btnAgregar").click();

                               Exito();


                               break;

                           case 'Eliminar':
                               $("#Main_HiddenField1").val("Cancelar");

                               EliminarJs();

                               //$("#Main_btnEliminar").click();

                               Exito();
                               break;
                           case 'Modificar':
                               $("#Main_HiddenField1").val("Cancelar");

                              // ModificarJs();
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
                //$(".campoFecha").mask("99/99/9999");
                //$('#tabs').tabs();
                
                habilitar();
                deshabilitarFrm();
                ListarCategorias();

             


                $(".cmbBuscar").select2();


                var TipoOp = getUrlParameter('TipoOp');
                if (TipoOp == "Add") {
                    $('#btnModificar1').hide();
                    $('#btnElimina1').hide();
                } else {
                    $('#btnModificar1').show();
                    $('#btnElimina1').show();

                }

              

                var Ids = getUrlParameter('Ids')

                if (Ids > 0) {                    
                    
                    
                    try {
                        $("#Main_TxtId").val(Ids);

                        var json = JSON.stringify
                  ({
                      "v_tipo": 'Ids',
                      "v_valor": Ids
                  });

                        $.ajax({
                            type: "POST",
                            url: "Productos_abm.aspx/WsListarProductos",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: CargarFrm,
                            error: errores
                        });
                         

                    } catch (e) {
                        alert(e.message);
                    }
                }



                if ($("#Main_TxtId").val() == '') {

                    $('#btnModificar1').hide();
                    $('#btnElimina1').hide();
                } else {
                    $('#btnModificar1').show();
                    $('#btnElimina1').show();

                }

            });
            
            function ModificarJs() {
                try {

                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {

                            "Id": $("#Main_TxtId").val(),
                            "Nombre": $("#Main_TxtNombre").val(),
                            "Codigo": $("#Main_TxtCod").val(),
                            "Categoria": $("#Main_cmbCategoria").val(),
                            "TasaIVA": $("#Main_cmbTasaIVA").val()
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Productos_abm.aspx/WmModificar2",
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

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                   ({
                       // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                       "v_obj": {

                           
                           "Nombre": $("#Main_TxtNombre").val(),
                           "Codigo": $("#Main_TxtCod").val(),
                           "Categoria": $("#Main_cmbCategoria").val(),
                           "TasaIVA": $("#Main_cmbTasaIVA").val()
                          
                       }
                   });

                $.ajax({
                    type: "POST",
                    url: "Productos_abm.aspx/WmAlta",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Alta_Completo,
                    error: errores
                });

            }
            function ListarCategorias() {
                try {

                    var json = JSON.stringify
              ({
                 "v_tipo":'',
                  "v_valor":''
              });

                    $.ajax({
                        type: "POST",
                        url: "Productos_abm.aspx/WsListarCategorias",
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
                $('#Main_cmbCategoria').empty();

                 $('#Main_cmbCategoria').append('<option value="0">Seleccione una Categoria</option>');
                
                $.each(Especialidad, function (index, especialidades) {
                    $('#Main_cmbCategoria').append(
                          $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
                        );
                });

                // para seleccionar un item en  select compun
                //$('#cbo_DiaAtencion option').attr('selected', false);
                //$("#cbo_DiaAtencion option[value=" + dias.Dia + "]").attr("selected", true);
                 
                //select un item  para select2
                $("#Main_cmbCategoria").val(0).change();
            }

            function CargarFrm(Resultado) {
                try {
                     
                    var v_obj = Resultado.d;
                 
                $('#Main_TxtCod').val(v_obj.Codigo);
                $('#Main_TxtNombre').val(v_obj.Nombre);
                $('#Main_TxtCod').val(v_obj.Codigo);

                 // para select2
                $("#Main_cmbCategoria").val(v_obj.Categoria).change();
                    //para cmb comun
                $('#Main_cmbTasaIVA').attr('selected', false);
                $("#Main_cmbTasaIVA option[value=" + v_obj.TasaIVA + "]").attr("selected", true);


                } catch (e) {
                    alert(e.message);
                }
            }
            function EliminarJs() {

                var json = JSON.stringify
                ({
                    "Ids": $("#Main_TxtId").val()

                });

                $.ajax({
                    type: "POST",
                    url: "Productos_abm.aspx/WmEliminar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Quitar_Completo,
                    error: errores
                });

            }

                function Alta_Completo() {
                    alert("Registro dado de alta");
                }

                function Modificado_Completo() {
                    alert("Registro completo");
                }
                function Quitar_Completo() {
                    alert("Registro Eliminado");
                }

                function errores(msg) {
                    var jsonObj = JSON.parse(msg.responseText);
                    alert('Error: ' + jsonObj.Message);
                }

              
                function PopCat() {
                    $("#ModalCat").modal();
                }

        </script>
          
   <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
        
          <link href="http://www.hardsoft.com.ar/css/select2.css" rel="stylesheet" />
     <link href="http://www.hardsoft.com.ar/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="http://www.hardsoft.com.ar/js/select2.js"></script>


    </div>
   
   
     
      
    
     

     
    
     

</asp:Content>

