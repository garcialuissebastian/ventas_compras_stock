<%@ Page Title="" Language="C#" Culture="Auto" UICulture="Auto"  MasterPageFile="~/App/Master/HomeOnPersonal.Master" AutoEventWireup="true" CodeBehind="Departamentos.aspx.cs" Inherits="HardSoft.App.Personal.Departamentos" %>
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
         <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <script src="/js/jstree.min.js"></script>

    <style>
        .navbar-inverse {
        background-color: #fff;
    /* border-color: #080808; */
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
       <strong>  Departamentos</strong> 
            </div>


          
       
  <div   style="margin-top:5px; background-color:#cecece;  color:white; font-weight:800; padding:10px;border-radius: 10px 10px 10px 10px; width :300px ;position:fixed;  right:10px;right: 135px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >
      
   <a class='tooltips glyphicon glyphicon-floppy-disk' onclick='nuevo()' >  <span>Nuevo</span></a>
  <a class='tooltips  glyphicon glyphicon-pencil' onclick='Modificar()' >  <span>Editar</span></a>
   <a class='tooltips  glyphicon glyphicon-remove' onclick='Eliminar()' >  <span>Eliminar</span></a>
  <a class='tooltips glyphicon glyphicon-transfer' onclick='Mover()' >  <span>Mover Personal</span></a>
      </div>

        <div class="row" style="   margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; margin-bottom: 15px; ">
            
            <div class="col-sm-6 col-lg-6 col-xs-6">
                 <div id="frmt" class="demo" style="    margin-top: 10px; float:left"></div>
            </div>
     
          <div class="col-sm-6 col-lg-6 col-xs-6"></div> 
            
     </div>
         

        </div>




         
           <!-- Modal -->
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
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre Departamento</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
      
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
            
            $("#TituloPop").text('Nuevo departamento');
            $("#ModalCat").modal();
            $("#btnAgregar1a").hide();
            $("#Main_TxtNombre").val('');
            $("#IdMov").hide();
            $("#verId").show();
            $("#btnMover").hide();
        }


        function Modificar() {
            if ($("#Main_TxtIds").val() == '' || $("#Main_TxtNombre").val() == '') {
                alert('Seleccione un departamento a modificar');
            } else {
                $("#TituloPop").text('Modificar departamento');
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
                alert('Seleccione un departamento a mover');
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

                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                ({
                    // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                   
                    "id": $("#CmbLugar").val(),
                        "nombre": $("#Main_TxtNombre").val()    
                });

                $.ajax({
                    type: "POST",
                    url: "Departamentos.aspx/WmAlta",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Result) {
                        window.location.href = 'Departamentos.aspx';
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
                    url: "Departamentos.aspx/WmMov",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Result) {
                        window.location.href = 'Departamentos.aspx';
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
                        "idPadre": $("#CmbLugar").val()
                    });

                    $.ajax({
                        type: "POST",
                        url: "Departamentos.aspx/WmMod",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Result) {
                            window.location.href = 'Departamentos.aspx';
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
                        url: "Departamentos.aspx/WmDel",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Result) {
                            window.location.href = 'Departamentos.aspx';
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
            llenar();
            ListarLugares();
            $(".cmbBuscar").select2();
        });

        function llenar() {
            $.ajax({
                type: "POST",
                url: "Departamentos.aspx/WsListarDep",
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
                  //  alert(data.instance.get_node(data.selected[0]).parent);
               //     console.log(data.instance.get_node(data.selected[0]));
                    $("#CmbLugar").val(data.instance.get_node(data.selected[0]).parent).trigger('change');
                }
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
                    url: "Empleados.aspx/WsListarP",
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

           </script>

 <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
