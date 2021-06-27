<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="IngresoProducto.aspx.cs" Inherits="HardSoft.App.Ralkal.IngresoProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
          
       
    
    
    <script language="JavaScript" type="text/javascript">

        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>

        <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
   
    
       
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
         Ingreso de productos
       </div>     
        
     

<div class="row"  style="text-transform:uppercase; margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >


    <div class="col-xs-6">
        <div class="form-horizontal">
        
        
     
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Producto : </label>
         <div class="col-xs-7">

 <asp:DropDownList ID="cmbCategoria" runat="server" CssClass="cmbBuscar form-control " Width="100%"  >                                          
                                            
                                        </asp:DropDownList>
             </div>
             <div class="col-xs-1">
     
           <a class="tooltips" style="cursor:pointer " href="#"  onclick="PopCat()">   <img src="../../../images/buscar-documentos.png" /><span>Buscar Producto</span></a></div> 
               </div>
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Cantidad : </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtCant" runat="server" class="form-control"  Width="60px" onkeypress="return acceptNum(event)"></asp:TextBox>
      <strong>Stock: <span id="TxtStock" style="color: red;"></span></strong>
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
 

        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
        
    
      
              <br />
 
<div style="display:none">

             
         <asp:Button ID="btnAgregar" runat="server" Text="Agregar"  CssClass="ImageButton1"  />
                                         
                                       
                                         
                                       
                                           
                       </div>          
                      


               </div>

        
        <br />



   <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


             <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
       <strong> Buscar  Productos </strong> 
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
          <option value="0">Codigo</option>
          <option value="1">Nombre</option>
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
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />

</div>




   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <div   >


        </div>
  

</div>
              </div>
     </div>

        </div>

     

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
                       $('#Main_TxtCant').val('');
                       
                       $("#Main_cmbCategoria").val(0).change();
                                           }

                   function CargarVerP(prod) {

                       $("#Main_cmbCategoria").val(prod).change();
                       $("#ModalCat").modal('hide');


                   }
                   function deshabilitarFrm() {

                       $('#Main_TxtCant').prop('disabled', true);
                       
                       $('#Main_cmbCategoria').prop('disabled', true);
                     

                        
                   }


                   function habilitarFrm() {

                       $('#Main_TxtCant').prop('disabled', false);                     
                       $('#Main_cmbCategoria').prop('disabled', false);
               

                   }

                   function deshabilitar() {

                       $('#btnAgregar1').prop('disabled', true); 

                   }

                   function habilitar() {

                       $('#btnAgregar1').prop('disabled', false);                     
                       $("#Main_HiddenField1").val('Cancelar');
                   }

                   function BtnAgregar1() {
                       $("#Main_LblMsg").text('')
                      // LimpiarFrm();

                       $("#Main_HiddenField1").val('Alta');
 

                       if ($("#Main_cmbCategoria option:selected").val() != 0) {

                           if ($("#Main_TxtCant").val()!='') {

                               AltaEnt();
                               LimpiarFrm();
                           } else {
                               alert('Ingrese una cantidad.');
                           }
                       } else {
                           alert('Seleccione un producto.');
                       }
                     
 
                   
                   }

                   function BtnCancelar1() {
                       $("#Main_LblMsg").text('')
                       deshabilitarFrm();
                       $("#Main_HiddenField1").val('Cancelar');

                       $('#btnAgregar1').prop('disabled', false);
                    

                   }

                   function BtnFnModificar1() {
                       if ($("#Main_TxtId").val() != '') {
                           $("#Main_LblMsg").text('')
                           $("#Main_HiddenField1").val('Modificar');
                           habilitarFrm();

                           $('#btnAgregar1').prop('disabled', true);
                          
                       }
                   }
                   function BtnFnEliminar1() {

                       if ($("#Main_TxtId").val() != '') {

                           $("#Main_LblMsg").text('¿ Desea Eliminar ? Presione Guardar para confirmar.  Registro ' + $("#Main_TxtId").val())

                           $("#Main_HiddenField1").val('Eliminar');

                           $('#btnAgregar1').prop('disabled', true);
                   

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
                   function Buscar() {

                       try {


                           var v_buscar = $('#cmbTipoOp').val();
                           var json = JSON.stringify
                             ({
                                 "v_tipo": $('#cmbTipoOp').val(),
                                 "v_valor": $('#Main_TxtBuscar').val()

                             });
                           $.ajax({
                               type: "POST",
                               url: "Producto_ver.aspx/WsListar",
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

                   function resultado(Resultado) {
                       var Pacientes = Resultado.d;
                       var Tabla_Titulo = "";
                       var Tabla_Datos = "";
                       var Tabla_Fin = "";

                       $("#Resultado").show();
                       $("#Resultado").empty();
                       Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>#</th> <th>Codigo</th><th>Nombre</th></tr></thead><tbody>";
                       $.each(Pacientes, function (index, pacientes) {
                           Tabla_Datos = Tabla_Datos + "<tr onclick='CargarVerP(" + pacientes.Id + ");' style='cursor:pointer;'><td style='background-image:url(/images/seleccionar-objeto.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Codigo + "</td><td>" + pacientes.Nombre + "</td></tr>";
                       });

                       Tabla_Fin = "</tbody></table>";
                       $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                   }

                   function AltaEnt() {


                       try {

                           var json = JSON.stringify
                     ({
                         "v_tipo": $("#Main_cmbCategoria").val(),
                         "v_valor": $("#Main_TxtCant").val()
                     });

                           $.ajax({
                               type: "POST",
                               url: "IngresoProducto.aspx/WsAdd",
                               data: json,
                               contentType: "application/json; charset=utf-8",
                               dataType: "json",
                               success: (function () { LimpiarFrm(); alert("Entrada Guardada."); }),
                               error: errores
                           });



                       } catch (e) {
                           alert(e.message);
                       }
                   }


                   function Stock(v_id) {

                       try {
                           var json = JSON.stringify
                             ({
                                 "v_id": v_id

                             });
                           $.ajax({
                               type: "POST",
                               url: "Nota_vta.aspx/WsStock",
                               data: json,
                               contentType: "application/json; charset=utf-8",
                               dataType: "json",
                               success: SetStock,
                               error: errores
                           });

                       } catch (e) {
                           alert(e.message);
                       }
                   }
                   function SetStock(Resultado) {


                       var sal = Resultado.d;


                       $("#TxtStock").text(sal);

                   }


</script>


        <script type="text/javascript">
            $(function () {
               
             
                ListarCategorias();

                $("#Main_cmbCategoria").change(function () {
                   
                    Stock($("#Main_cmbCategoria").val());

                })


                $(".cmbBuscar").select2();

  

            });

          
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
                      "v_tipo": '',
                      "v_valor": ''
                  });

                        $.ajax({
                            type: "POST",
                            url: "Nota_vta.aspx/WsListarP",
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

                $('#Main_cmbCategoria').append('<option value="0">Seleccione un Producto</option>');

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


