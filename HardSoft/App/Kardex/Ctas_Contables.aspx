<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="Ctas_Contables.aspx.cs" Inherits="HardSoft.App.Kardex.Ctas_Contables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

     <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

   <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
    

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
 	<link rel="stylesheet" href="/css/themes/default/style.min.css" />

<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
       <%--  <link rel="stylesheet" href="/css/bootstrap.min.css" />--%>
    <script src="/js/jstree.min.js"></script>

    
    <link rel="stylesheet" href="/css/themes/jquery-ui.css">
    <script src="/css/themes/jquery-ui.js"></script>

        <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

  

     <div class=" container" style="margin-top: 36px;">  
         
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
               Inicio        </li>
                                </ol>
        </nav>
 
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
       <strong> Plan de Cuentas</strong> 
            </div>

 

     

        <div class="row" style="   margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; margin-bottom: 15px; ">
            
            <div class="col-sm-6 col-lg-6 col-xs-6">
                 <div id="frmt" class="demo" style="    margin-top: 10px; float:left"></div>
            </div>
     
          <div class="col-sm-6 col-lg-6 col-xs-6"></div> 
            
     </div>
         
               <div  id="miTool"  class="arrow_box" style="margin-top:5px; background-color:#cecece;  color:white; font-weight:800; padding:10px;border-radius: 6px; width :300px ;position:absolute;  left:10px;top: 135px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; display:none " >
      
                 <%--   <a class='tooltips glyphicon glyphicon-user' onclick='verPersonal()' >  <span>Ver Personal</span></a>--%>
   <a class='tooltips glyphicon glyphicon-floppy-disk' onclick='nuevo()' >  <span>Nuevo</span></a>
  <a class='tooltips  glyphicon glyphicon-pencil' onclick='Modificar()' >  <span>Editar</span></a>
   <a class='tooltips  glyphicon glyphicon-trash' onclick='Eliminar()' >  <span>Eliminar</span></a>

                      <a class='tooltips  glyphicon glyphicon-remove' onclick='cerrarTool()' style="float:right" >  <span>Cerrar</span></a>

<%--  <a class='tooltips glyphicon glyphicon-transfer' onclick='Mover()' >  <span>Mover Personal</span></a>--%>
      </div>



        </div>
                <!-- Modal  personal-->
  <div class="modal fade" id="ModalPer" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
      <div id="TituloPop" style="font-weight:700"></div>
        </div>
        <div class="modal-body">
  <div class="row" style="margin-left:0px; text-transform:uppercase; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 320px; width: 100%; ">
        
        <img src="/images/loadingHF.gif" style="height:40px ; margin-top:60px" />
  <table   id='grilla'></table>

</div>
              </div>
     </div>
             
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center;    height: 55px; " >
             
            <input type="text" id="kwd_search" value="" class="form-control" style="width:150px;float:left"/>
               
     <button type="button" class="btn2 btn-danger" onclick="VerFichadas()"> 
    <span class=" glyphicon glyphicon-hand-up"></span> Ver Fichadas
  </button>
           <script>
               function VerFichadas() {
                   window.location.href = 'Asistencia.aspx?Tipo=1&Dep=' + $('#Main_TxtIds').val();
               }
           </script>
 
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> 
         
  </div>
        
      </div>
      
    </div>
   
 </div>



         
           <!-- Modal  tooll-->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       <div class="col-xs-1">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>
       <div class="col-xs-10">
        <div class="form-horizontal">


       



         <div class="form-group" id="verId">
         <label for="TxtDescripcion" class="control-label col-xs-4">NODO PADRE </label>
         <div class="col-xs-8" style="text-align:left">
      <select id="CmbLugar" class="cmbBuscar form-control"  style="width: 100%">  </select>   
             <div style="display:none">
 <asp:TextBox ID="TxtIds" runat="server" class="form-control"    ></asp:TextBox>
      </div>
         </div>
           
     </div>


                    <div class="form-group" >
         <label for="TxtDescripcion" class="control-label col-xs-4"> TIPO </label>
         <div class="col-xs-8" style="text-align:left">
             <select  id="esCuenta"  style="width: 100%" class="form-control" >
                 <option value="SI">CUENTA</option>
                  <option value="NO">TITULO</option>
             </select>
         
         </div>
           
     </div>



          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control"    autocomplete="off"></asp:TextBox>
      
         </div>
           
     </div>



                    <div class="form-group  " id="IdMov">
         <label for="TxtNombre" class="control-label col-xs-4">Mover a</label>
         <div class="col-xs-8" style="text-align:left">

 <select id="CmbLugar1" class="cmbBuscar form-control"  style="width: 100%">  </select>   
      
         </div>
           
     </div>
      
       
  
        
        </div>
          </div>
    <div class="col-xs-1">
        <div class="form-horizontal">
        
         
  
        
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
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar 
 </button>

       <button id="btnGuardar1a" type="button" class="btn2 btn-default " onclick="AltaJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>

                   <button id="btnMover" type="button" class="btn2 btn-default  " onclick="MoveJs()"  >
    <span class=" glyphicon glyphicon-transfer"></span> Mover
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

        function nuevo() {

            
             $("#esCuenta").val("SI");
            $("#btnGuardar1a").show();
            $("#TituloPop").text('Nueva Cuenta');
            $("#ModalCat").modal();
            $("#btnAgregar1a").hide();
            $("#Main_TxtNombre").val('');
            $("#IdMov").hide();
            $("#verId").show();
            $("#btnMover").hide();


        }


        function Modificar() {
            if ($("#Main_TxtIds").val() == '' || $("#Main_TxtNombre").val() == '') {
                alert('Seleccione una cuenta a modificar');
            } else {
                $("#TituloPop").text('Modificar cuenta');
                $("#ModalCat").modal();
                $("#btnGuardar1a").hide();
                $("#btnAgregar1a").show();
                $("#IdMov").hide();
                $("#verId").show();
                $("#btnMover").hide();
            }
        }

        function Mover() {
            if ($("#Main_TxtIds").val() == '' || $("#Main_TxtNombre").val() == '') {
                alert('Seleccione una cuenta a mover');
            } else {
                $("#TituloPop").text('Mover personal a otro departamento');
                $("#ModalCat").modal();
                $("#verId").hide();
                
                $("#btnGuardar1a").hide();
                $("#btnAgregar1a").hide();
                $("#btnMover").show();
                $("#IdMov").show();
                
                
            }
        }

        function AltaJs() {
            try {

                
                $("#btnGuardar1a").prop('disabled', true);
                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                    // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                   
                    "id": $("#CmbLugar").val(),
                        "nombre": $("#Main_TxtNombre").val(),
                         "esCuenta": $("#esCuenta").val(),

                });

                $.ajax({
                    type: "POST",
                    url: "Ctas_Contables.aspx/WmAlta",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Result) {
                          $("#btnGuardar1a").prop('disabled', false);
                        window.location.href = 'Ctas_Contables.aspx';
                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }
        
        function MoveJs() {
            try {

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                    // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro

                    "id": $("#Main_TxtIds").val(),
                    "idPadre": $("#CmbLugar1").val()
                });

                $.ajax({
                    type: "POST",
                    url: "Departamento.aspx/WmMov",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Result) {
                        window.location.href = 'Departamento.aspx';
                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }
        function ModificarJs() {
            try {
                if ($("#CmbLugar option:selected").text() != $("#Main_TxtNombre").val()) {
                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro

                        "id": $("#Main_TxtIds").val(),
                        "nombre": $("#Main_TxtNombre").val(),
                            "idPadre": $("#CmbLugar").val(),
                         "esCuenta": $("#esCuenta").val()
                    });

                    $.ajax({
                        type: "POST",
                        url: "Ctas_Contables.aspx/WmMod",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Result) {
                            window.location.href = 'Ctas_Contables.aspx';
                        }),
                        error: errores
                    });
                }
            } catch (e) {
                alert(e.message);
            }
        }

        function Eliminar() {
            if ($("#Main_TxtNombre").val()!='') {

            if (confirm("Esta seguro que desea eliminar el departamento: " + $("#Main_TxtNombre").val())) {
                try {

                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro

                        "id": $("#Main_TxtIds").val()                       
                    });

                    $.ajax({
                        type: "POST",
                        url: "Ctas_Contables.aspx/WmDel",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Result) {
                            window.location.href = 'Ctas_Contables.aspx';
                        }),
                        error: errores
                    });

                } catch (e) {
                    alert(e.message);
                }
            }
            }
        }
        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

        //$('#frmt').jstree({
        //    'core': {
        //        'data': [
        //            {
        //                "text": "Root node",
        //                "state": { "opened": true, "disabled": true },
        //                "children": [
        //                    {
        //                        "text": "Child node 1",
        //                        "state": { "selected": true },
        //                        "icon": "jstree-file"
        //                    },
        //                    { "text": "Child node 2", "state": { "opened": false, "disabled": true } }
        //                ]
        //            }
        //        ]
        //    }
        //});

        $(function () {

            
            $(document).tooltip();

            llenar();
            ListarLugares();
            $(".cmbBuscar").select2();

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
        });

        function llenar() {
            $.ajax({
                type: "POST",
                url: "Ctas_Contables.aspx/WsListarDep",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (json) {
                    var myData = JSON.parse(json.d); // data.d is a JSON formatted string, to turn it into a JSON object

                //  console.log(myData);
                    createJSTrees(myData);


                },

                error: function (xhr, ajaxOptions, thrownError) {

                }
            });

        }
        function createJSTrees(jsonData) {
            $('#frmt').jstree({
                'core': {
                    'data': jsonData
                        
                }
            });
        }

        function verPersonal() {
               Buscar();
              $("#ModalPer").modal();
        }


        function cerrarTool() {
            $('#miTool').hide();
        }
        // interaction and events
        //$('#evts_button').on("click", function () {
        //    var instance = $('#frmt').jstree(true);
        //    instance.deselect_all();
        //    instance.select_node('1');
        //});
        $('#frmt')
            .on("changed.jstree", function (e, data) {
                if (data.selected.length) {
                    //alert('The selected node is: ' + data.instance.get_node(data.selected[0]).text);
                    $('#Main_TxtIds').val(data.instance.get_node(data.selected[0]).id);
                    $("#Main_TxtNombre").val(data.instance.get_node(data.selected[0]).text);

                    console.log(data.instance.get_node(data.selected[0]).original.Auxiliar);

                    if (data.instance.get_node(data.selected[0]).parent != '#') {
                        $("#CmbLugar").val(data.instance.get_node(data.selected[0]).parent).trigger('change');
                    } else {
                         $("#CmbLugar").val(data.instance.get_node(data.selected[0]).id).trigger('change');
                    }



                    $("#esCuenta").val("SI").trigger('change'); 
                    if (data.instance.get_node(data.selected[0]).original.Auxiliar != "SI") { // si es titulo
                   $("#CmbLugar").val(data.instance.get_node(data.selected[0]).id).trigger('change');
                    $("#esCuenta").val("NO").trigger('change'); // titulo
                    }  

                    var position = $("#" + data.node.id).offset();
                
                    $('#miTool').css({ "left": $("#" + data.instance.get_node(data.selected[0]).id).offset().left + $("#" +data.instance.get_node(data.selected[0]).id).width(), "top": position.top - 10 });
                    $('#miTool').show('fade');
                   
                    $('#TituloPop').text($("#Main_TxtNombre").val());
                    //   Buscar();
                  //  $("#ModalPer").modal();
                   
                }
            })


        $('#frmt')
        .on('hover_node.jstree', function (e, data) {
        
            



        })


      
        function ListarLugares() {

            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Ctas_Contables.aspx/WsListarCtas",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#CmbLugar').empty();
                        $('#CmbLugar1').empty();
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                            $('#CmbLugar').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre)


                                );

                            $('#CmbLugar1').append(
                                 $('<option></option>').val(especialidades.Id).html(especialidades.nombre)


                               );
 
                            if (bb == 0) {
                                inx = especialidades.Id;
                            }
                            bb++;
                        });
                        $('#CmbLugar').val(inx).trigger('change');
                        $('#CmbLugar1').val(inx).trigger('change');
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }

        
        function Buscar() {

            try {
                var tipo = '';
                var valor = '';

               
                var json = JSON.stringify
                  ({
                      "v_tipo": 3,
                      "v_valor": $('#Main_TxtIds').val()
                  });
                $.ajax({
                    type: "POST",
                    url: "Empleados.aspx/WsListar",
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
            Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>DNI</th> <th>LEGAJO</th><th>Nombre</th><th>Cel</th><th>Dirección</th><th>LEY</th><th>Tel Ofi</th><th>Departamento</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {


                Tabla_Datos = Tabla_Datos + "<tr  onclick='PopMod(" + pacientes.USERID + ",this);' style='cursor:pointer'>    <td>" + pacientes.BADGENUMBER + "</td><td>" + pacientes.SSN + "</td><td>" + pacientes.NAME + "</td><td>" + pacientes.PAGER + "</td><td>" + pacientes.STREET + "</td><td>" + pacientes.TITLE + "</td><td>" + pacientes.OPHONE + "</td><td>" + pacientes.DEFAULTDEPTID + "</td></tr>";
            });

            Tabla_Fin = "</tbody></table>";
            $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
            fn_cantidad();

        } 

        function fn_cantidad() {
            cantidad = $("#grilla tbody").find("tr").length;
            $("#span_cantidad").html(cantidad);
        };



        $(document).ready(function () {

            $(this).everyTime(25000, function () {
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
                       window.location.href = "../../Login.aspx";

                    }
                });


            });




            function VerifySessionState(result) {
                $("#miLoader").show();
                if (!result.d) {

                    window.location.href = "../../Login.aspx";
                }
            }

            //fin de ready

        });
       
    </script>

 <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
