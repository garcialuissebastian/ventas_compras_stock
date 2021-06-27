<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="PedidosFarmacia.aspx.cs" Inherits="HardSoft.App.Kardex.PedidosFarmacia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

    <style>
        tr:hover td {
    background: #abccd2;
}
    </style>
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
    
      <script type="text/javascript" src="/js/formError.js"></script>

    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    <script src="../../js/jquery.maskedinput.js"></script>
   
    <script src="/Scripts/jquery-ui.js"></script>
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
    

    
    <a href="/Scripts/web/VisorPdf.aspx" class="html5lightbox" id="Visor"  data-width="960" data-height="650"> </a>


    
         
    
    <script src="/Scripts/html5lightbox/html5lightbox.js"></script>
         <script>

             jQuery(".html5lightbox").html5lightbox(); 

        </script>
 


       <div class=" container"  style="margin-top: 16px;">
         
        




<div class="row">

        <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
          Pedidos       </li>
                                </ol>
        </nav>

      <div class="">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
             
        
        <div class="alert alert-negro"  >
      Pedidos - Egreso de Articulos  
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       
       <div class="col-xs-12">
        <div class="form-horizontal">
      
        
               <div class="form-group">

                   
            <label for="TxtNombre" class="control-label col-xs-1">Origen: </label>
       
           <div class="col-xs-3">

<select id="cmbDepLt" class="form-control"></select>
      
         </div>
     
    <div style="display:none">
  <asp:TextBox ID="TxtCodSisLt" runat="server" class="form-control"  ></asp:TextBox>
         <asp:TextBox ID="TxtIds" runat="server" class="form-control"  ></asp:TextBox>
                  <asp:Button ID="BtnRp" runat="server" Text="Button" OnClick="BtnRp_Click" />
      </div>

         <label for="TxtNombreSk" class="control-label col-xs-1">   </label>
         <div class="col-xs-3">
         


      
             </div>
                 

            <label for="TxtNombre" class="control-label col-xs-1">Destino: </label>
         <div class="col-xs-3">

<select id="cmbDepLtdes" class="form-control cmbBuscar">
        <option value="10">FARMACIA</option>
</select>
      
         </div>
               
     </div>
      
   <div class="form-group">

                <label for="TxtNombreSk" class="control-label col-xs-2"> </label>
         <div class="col-xs-2">

 
         </div>
           
         <label for="TxtNombreSk" class="control-label col-xs-2">Comentario </label>
         <div class="col-xs-6">

 <asp:TextBox ID="TxtOrigenLt" runat="server" class="form-control"   TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>
      <hr />

         
            
         <div class="form-group"> 
                       <label for="TxtNombre" class="control-label col-xs-2" >Insumo</label>
         <div class="col-xs-5">
      <asp:TextBox ID="TxtInsumo" runat="server" class="form-control"  onkeypress="return acceptNum(event)" TextMode="MultiLine"></asp:TextBox>
      <div style="display:none">
          <asp:TextBox ID="TxtcodNum" runat="server"></asp:TextBox>
      </div>
         </div>
                <div class="col-xs-1" style="text-align:left">
              <a class="tooltips tooltipsArt" style="cursor: pointer;" onclick="VerInsumo()"> 
        
       <img src="/images/ver.png"  >    
                    
<span>Buscar Insumo </span>   </a> &nbsp;

  </div>
        
          
       

                         <label for="TxtCantLtu" class="control-label col-xs-1" >Cantidad</label>
         <div class="col-xs-1">
  <asp:TextBox ID="TxtCantLt" runat="server" class="form-control"  Text="1"   placeholder="1" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" 
 onblur="onBlur(this)">   ></asp:TextBox>
      
         </div>
           


               <div class="col-xs-2">
     </div>
     </div>
        
      
    
              
              </div>



      <div style="text-align: center;
    border-top: solid;
    padding: 4px;">      <button id="btnAgregar1Sk" type="button" class="btn2 btn-danger " onclick="AddLtJs()">
     + Agregar al stock
 </button>

      </div>
  
      
              <div id='ResultadoLt' style="overflow-y: auto; overflow-x: hidden; height: 180px; width: 100%; background-color: floralwhite;">
      <img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px; display:none' id="wait" />
</div>
    
        </div>
          </div>
    

      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >

                  <button id="btnguardatSk" type="button" class="btn2 btn-default " onclick="AddGuardarJs()">
    Guardar
 </button>
             
     
                  <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
       
              <br />
                
               </div> 
</div> 
       
</div>




          </div>



                <!-- Modal -->
  <div class="modal fade" id="ModalInsumo" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header" style="background-color: #efefef; text-shadow: #969696 0.1em 0.1em 0.2em;  ">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
         
       <strong>Buscar Insumos </strong> 
             
        </div>
        <div class="modal-body">
     <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
 
   <div class="form-group" >
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
      
      <select id="cmbTipoOp" class="form-control">
              <%--  <option value="3">CodBarra Proveedor</option>--%>
           <option value="0">Nombre</option>
           <option value="2">Cod MS</option>
           <option value="8">CodBarra Sistema</option>      
         
         <%--   <option value="1">Cod Sistema</option>--%>
         
           
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
<asp:TextBox ID="TxtBuscarA" runat="server"  class="form-control" onkeydown="if (event.keyCode == 13) {  return false;} "></asp:TextBox>
        </div>
     <div class="col-xs-3"  style="text-align:left">
       
      
         <button id="btnElimina1R" type="button" class="btn2  btn-default "  onclick="Buscar()">
    <span class=" glyphicon glyphicon-search"></span> Buscar
  </button>
         
        
          </div>
       </div> 
</div>
</div>
  
   <div id="ResultadoB" style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; "> </div>


            
         </div>
        <div class="modal-footer">
            
          <button type="button" class="btn2 btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
   
 </div>
    <script>

        function AddGuardarJs() {

            try {

                
                  $("#cmbDepLtdes").removeClass("valid");
         
                if ($("#cmbDepLtdes").val()== -1) {
                    alert("Seleccione un Destino.");
                    $("#cmbDepLtdes").addClass("valid");
                    return;
                }
                //   alert( $('#cmbTipoOp').val() );

                $("#btnguardatSk").hide();
              
                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_motivo":'',
                      "v_dep_origen": $("#cmbDepLt").val(),
                      "v_dep_destino": $("#cmbDepLtdes").val(),
                       "v_remito":  '',
                        "v_comentario": $("#Main_TxtOrigenLt").val()
                  });
                $.ajax({
                    type: "POST",
                    url: "PedidosFarmacia.aspx/WmAddGuardar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (result) {
                      

                      //  window.location.href = "EgresosFarmacia.aspx";
                        $("#Main_BtnRp").click();  
                          $("#btnguardatSk").show();

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
                      "v_valor": $('#Main_TxtBuscarA').val(),
                      "v_dep": $('#cmbDepLtdes').val()
                      
                  });
                $.ajax({
                    type: "POST",
                   url: "ArticuloFarmacia.aspx/WsListarArticulo",
                  //  url: "PedidosFarmacia.aspx/WsListarArticuloSkFarmacia",
                    data: json,
                    async:false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoArt,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }



        function resultadoArt(Resultado) {
            var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#ResultadoB").show();
            $("#ResultadoB").empty();
            Tabla_Titulo = "<table   id='grillaArt' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <td >  Cod_MS </td>  <th>Articulo</th><th>Descripcion</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {

               // var sin = pacientes.desc_Art;
                //if (pacientes.desc_Art.trim().length > 280) {

                //    sin = pacientes.desc_Art.substr(0, 250) + '.... (Ver más)';
                //}
                sin = pacientes.Nombre.trim();

                var sin2 = '';

                  if (sin == '') {
                  
                     var sin = pacientes.DescripcionPrincipal.trim();
                }

                sin2 = pacientes.DescripcionPrincipal.trim();
                if (pacientes.DescripcionPrincipal.trim().length > 280) {

                    sin2 = pacientes.DescripcionPrincipal.substr(0, 250) + '.... (Ver más)';
                } 
                if (sin=='') {
                     sin = pacientes.DescripcionSecundaria.trim() ; 
                }
                
                if (sin == '') {
                  
                     sin = pacientes.Nombre.trim() ; 
                }

                sin = sin +' ('+ sin2+')';
                    //console.log(pacientes);
                var v_lote = 0;
                if (pacientes.Lote == 'SI') {
                    v_lote = 1;
                }
                  


                if (pacientes.Anulado != 'SI') {
                    Tabla_Datos = Tabla_Datos + "<tr    onclick='setInsumo(" + pacientes.Id + ", \"" +  sin.replace(/\s/g,' ') + "\" ,\"" + pacientes.Cod_Manual +  "\" ) ' style='cursor:pointer;'>  <td >" +  pacientes.Cod_Manual + "</td>  <td style='text-align: justify;'>" + sin + "</td> <td style='text-align: justify;'>" +pacientes.DescripcionPrincipal.trim() + "</td> </tr>";
                }

            });


            Tabla_Fin = "</tbody></table>";
            $("#ResultadoB").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();
            
            if (Pacientes.length < 1) {
                $("#ResultadoB").html("   <div class='alert alert-danger'> No se encuentra stock para el insumo buscado.  </div> ");
            }
            //   esValido2('ADM_KARDEX');


        }
        function setSelectByText(eID,text)
{ //Loop through sequentially//
  var ele=document.getElementById(eID);
  for(var ii=0; ii<ele.length; ii++)
    if(ele.options[ii].text==text) { //Found!
      ele.options[ii].selected=true;
      return true;
    }
  return false;
}

        function setInsumo(id, nom, cod) {

            
        

            $("#Main_TxtInsumo").val(nom);
            $("#Main_TxtCodSisLt").val(cod);
             $("#Main_TxtIds").val(id);
            
              $("#Main_TxtCantLt").val(0);
            
          
            
            $("#ModalInsumo").modal('hide');
            $("#ResultadoB").empty();
            $("#Main_TxtBuscarA").val('');
            
            
            
        }

        function AddLtJs() {
 
            //$("#ContentPlaceHolder1_TxtEmpresa3").addClass("valid");
            //$("#ContentPlaceHolder1_TxtFecha_Ini3").removeClass("valid");

            $("#Main_TxtCantLt").removeClass("valid");
            if ($("#Main_TxtCantLt").val() < 1) {
                $("#Main_TxtCantLt").addClass("valid");
                return;
            }

         

            $("#Main_TxtInsumo").removeClass("valid");
            if ($("#Main_TxtInsumo").val() == "") {
                $("#Main_TxtInsumo").addClass("valid");
                return;
            }

 


           
            if ($("#cmbDepLt").val() == null) {
                alert("Debe agregar un deposito para seguir.  Vaya al menu Entidad --> Deposito");
            } else {

                try {

                 
                    var json = JSON.stringify
                   ({
                       "v_id": $("#Main_TxtIds").val(),
                       "v_dep": $("#cmbDepLt").val(),
                       "v_cant": $("#Main_TxtCantLt").val(),
                       "v_motivo": "EGRESO DE PEDIDO "  ,
                       "v_remito": $("#Main_TxtcodNum").val() ,
                       "v_origen": $("#Main_TxtOrigenLt").val(),
                       "v_proveedor": '',
                       "v_comentario": '',
                       "v_tipo_ingreso": "LOTE",
                       "v_lote": '',
                       "v_vto": '',
                       "v_lab": '',
                       "v_desclab":'',
                            "v_descArt": $("#Main_TxtInsumo").val(),
                              "v_cod": $("#Main_TxtCodSisLt").val()
                       
                   });
                    $.ajax({
                        type: "POST",
                        url: "PedidosFarmacia.aspx/WmAddLote",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {

                           // actualizarStk($("#Main_TxtNombreSk").val());
                            llenarGrilla(result);

                          
                        },
                        
                        error: errores
                    });

                   
          $("#Main_TxtCantLt").val('0');
                    $("#Main_TxtProvLt").val('');
                    $("#Main_TxtProvIdLt").val('0');
                    $("#Main_TxtInsumo").val('');
                  
                } catch (e) {
                    alert(e.message);
                }
            }
        }

        function llenarGrilla(result) {
            if (result.d != null) {
                var Pacientes = result.d;
                var Tabla_Titulo = "";
                var Tabla_Datos = "";
                var Tabla_Fin = "";

              
                $("#ResultadoLt").show();
                $("#ResultadoLt").empty();
                Tabla_Titulo = "<table     class='table   table-hover table-striped' style='width: 100%;'><thead> <tr><th></th>  <th>Cod_Ms </th> <th>Insumo</th>    <th>CANT</th>  </tr></thead><tbody  style='text-align: center;'>";
                $.each(Pacientes, function (index, pacientes) {

                  

                    Tabla_Datos = Tabla_Datos + "<tr   ><td  style='width:30px'> <a class='tooltips tooltipsArt' onclick='gvLotDel(" + pacientes.Id + ",this);' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Cod_Manual + "</td><td>" + pacientes.desc_Art + "</td><td>" + pacientes.Cant + "</td></tr>";



                });

                Tabla_Fin = "</tbody></table>";
                $("#ResultadoLt").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

            }


        }

        function gvLotDel(ids, oo) {
            try {


                if (!confirm("Esta seguro que desea eliminar ese lote ?")) {
                    return;
                }


                var json = JSON.stringify
                  ({
                      "v_id": ids
                  });
                $.ajax({
                    type: "POST",
                    url: "IngresosFarmacia.aspx/gvLab_del",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {

                        llenarGrilla(result);
                    },
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }


    
       

        function ListarDeposito() {
            try {

                var json = JSON.stringify
        ({
            "v_tipo": '89',
            "v_valor": ''
        });

                $.ajax({
                    type: "POST",
                    url: "Deposito.aspx/WsListarFarmacia",
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
 
            $('#cmbDepLt').empty();
           
            $.each(Especialidad, function (index, especialidades) {
               
                $('#cmbDepLt').append(
                $('<option></option>').val(especialidades.Id).html(especialidades.Nombre)
              );
            });


        }

        function actualizarStk(ids) {


            $("#ResultadoDep").show();
            $("#ResultadoDep").empty();

            $("#Main_TxtId").val(ids);
            var json = JSON.stringify
({
    "v_tipo": '0',
    "v_valor": ids

});

            $.ajax({
                type: "POST",
                url: "ArticuloFarmacia.aspx/WsListarDep_IdArt",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                    if (result.d != null) {



                        var Pacientes = result.d;
                        var Tabla_TituloRep = "";
                        var Tabla_DatosRep = "";
                        var Tabla_Fin = "";

                        $("#ResultadoDep").show();
                        $("#ResultadoDep").empty();
                        $("#ResultadoLote").empty();
                        Tabla_TituloRep = "<table   class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Depósito</th> <th>Stock</th></tr></thead><tbody style='text-align: center;'>";


                        $.each(Pacientes, function (index, pacientes) {

                            var v_lote = 0;
                            if (pacientes.Lote == 'SI') {
                                v_lote = 1;
                            }
                            Tabla_DatosRep = Tabla_DatosRep + "<tr  onclick='lotesXdep(this," + pacientes.id_articulo + ", " + pacientes.id_deposito + "," + v_lote + ");' style='cursor:pointer;' ><td>" + pacientes.deposito_nombre + "</td><td>" + pacientes.stock + "</td></tr>";
                        });

                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoDep").html(Tabla_TituloRep + Tabla_DatosRep + Tabla_Fin);


                    }
                },

                error: errores
            });

        }


        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

        function VerInsumo() {

            $("#ModalInsumo").modal();
        }
        $('#Main_TxtInsumo').prop('disabled', true);
     
     
           
        $(function () {
            ListarDeposito(); // origen
          
          
            $(".cmbBuscar").select2();
        });

        $(".campoFecha").mask("99/99/9999");




         function mostrar() {
              $('#Visor').click();

          }



           $(this).everyTime(15000, function () {

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


           function onBlur(obj) {
                 if ($(obj).val() == '') {
                    $(obj).val( $("#Main_valorFoco").val()) ;
                } 
            }
              function onFocus(obj) {
                  $("#Main_valorFoco").val($(obj).val()); 
                   $(obj).attr('placeholder', 
                $(obj).val()); 
                   $(obj).val(''); 
                   return; 
            }

              function VerifySessionState(result) {

                
                  if (!result.d) {
                    
                      window.location.href = "../../Login_hosp.aspx";
                  }
              }

    </script>


         <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
