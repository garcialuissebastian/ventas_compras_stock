<%@ Page Title="" Language="C#"   Culture="Auto" UICulture="Auto"   EnableEventValidation="false "  MasterPageFile="~/App/Master/HomeOnPersonal.Master" AutoEventWireup="true" CodeBehind="Incidencias.aspx.cs" Inherits="HardSoft.App.Personal.Incidencias" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
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
</script>

    <style>


          .selectDeb {
    zoom: 1.4;
}
    </style>
   <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
      <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>
 
      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

        <link rel="stylesheet" href="../../css/jquery-ui.css">
 

    <style>

        .bs-example{
    	 
    }
    .panel-title .glyphicon{
        font-size: 14px;
    }
        video {
            height: 299px !important;
                width: 299px !important;
        }

            .webcam-container {
            padding: 0;
            margin: 0;
        }

        .size640x480 {
            /*width: 640px;*/
           /*height: 321px;*/
        }

        .webcam-container object {
            border: 1px solid #000;
        }

        .webcam-error {
            color: red;
            padding-top: 10px;
        }
        .ajax__calendar .ajax__calendar_day {
    border: 1px solid #dcdbdb;
}
            .ajax__calendar .ajax__calendar_hover .ajax__calendar_day {
    background-color: #0ba1ec;
    border-color: #daf2f;
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

     <div class="container"  style="margin-top: 36px;"> 
         
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Ver Incidencias         </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>  Incidencias</strong> 
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
            
          <option value="2">Nombre</option> 
           <option value="0">Empleado</option> 
           <option value="1">No.</option> 
       
                   
          
      </select>
      
       
      </div>
    
    <div class="col-xs-3" >
          <div id="B_Buscar" >
<asp:TextBox ID="TxtBuscar" runat="server"  class="form-control"></asp:TextBox>

</div>
 <div id="B_DEP" style="display:none"> 
        <select id="CmbLugar2" class="cmbBuscar form-control"  style="width: 100%">       
      </select>

     </div>


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


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="Inscidencias()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> <br />
   </div>



    
  <div class="modal fade" id="ModalIncidencia" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">

            
          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      Nuevo Incidencia
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       <div class="col-xs-3">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>
       <div class="col-xs-6">
        <div class="form-horizontal">
  
     <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Empleado</label>
         <div class="col-xs-8">

    <asp:DropDownList ID="cmbPersona" runat="server" CssClass="cmbBuscar form-control" Width="100%"></asp:DropDownList>
            
         </div>
           
     </div>

                  <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >Desde</label>
         <div class="col-xs-5"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="Img1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px" onmouseover="showMouseCoords();" />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="Img1" runat="server" TargetControlID="TxtDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-3"> 
                <asp:TextBox ID="TxtDesdeHs" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
           </div>
     </div>
      
             <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >Hasta</label>
         <div class="col-xs-5"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtHasta" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="Img2" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender3"   PopupButtonID="Img2" runat="server" TargetControlID="TxtHasta"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-3"> 
                <asp:TextBox ID="TxtHastaHs" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
           </div>
     </div>
      
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Tipo</label>
         <div class="col-xs-7">

   <asp:DropDownList ID="CmbLugar" runat="server" CssClass="   form-control" Width="100%"></asp:DropDownList>
      
         </div>
 <div class="col-xs-1">
                   <a class="tooltips" style="cursor:pointer;     float: left; " onclick="PopAltaDep()">  <img src="/images/add-mas.png" style="height: 20px;margin-top: 5px;">        
<span>Nuevo </span></a>
     </div>
           
     </div>
    

                 <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Motivo </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtMotivo" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>
      
     
    
        
        </div>
          </div>
    <div class="col-xs-3">
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


             <!-- Modal -->
  <div class="modal fade" id="ModalCat2" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div  >
      
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px; background-color:aliceblue; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div style="padding-top:10px" >
       <div class="col-xs-2">
        <div class="form-horizontal">
        
         
  
        
        </div>
          </div>
       <div class="col-xs-7">
        <div class="form-horizontal">
    
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-5">Nuevo </label>
         <div class="col-xs-7">

 <asp:TextBox ID="TxtCat" runat="server" class="form-control"    ></asp:TextBox>
      
         </div>
               
           
     </div>
      
     
          
  
        
        </div>
         
           
             </div>
    <div class="col-xs-3">
        
       <button id="btnGuardar12a" type="button" class="btn btn-info " onclick="AltaTipoJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>
        <div class="alert-danger" id="IdErr">
        
         
  
        
        </div>
          </div>

      

    </div>

</div>
   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; ">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoTipo' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%;background-color: aliceblue; ">
        
        <div   >


        </div>
  

</div>
              </div>
     </div>
        

</div>
<div class="row">

<div  id="LblError" class="alert alert"> </div>
</div>

                    <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


       



        <button type="button" class="btn btn-danger"  onclick="cerrarbtn()"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button> 
              <br />
               


               </div>

            </div></div></div></div>


    <script>

        function cerrarbtn() {

            $("#ModalCat2").modal('hide');
            Inscidencias();
            $("#Main_TxtCat").val('');
        }
        function PopAltaDep() {
            $('#ModalIncidencia').modal('hide');
            $("#ModalCat2").modal();
     //       $("#ModalCatSub").modal('hide');
            try {

                //   alert( $('#cmbTipoOp').val() );


                var json = JSON.stringify
                  ({
                      "v_tipo": '',
                      "v_valor": ''
                  });
                $.ajax({
                    type: "POST",
                    url: "Incidencias.aspx/WsListarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Pacientes = Resultado.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";

                        $("#ResultadoTipo").show();
                        $("#ResultadoTipo").empty();
                        Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>  </th>  <th> </th> </tr></thead><tbody>";
                        $.each(Pacientes, function (index, pacientes) {
                            Tabla_Datos = Tabla_Datos + "<tr> <td style='width:30px'> <a class='tooltips' onclick= 'gvTipo_del(" + pacientes.Id + ");' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td> <td>" + pacientes.nombre + "</td></tr>";
                        });

                        Tabla_Fin = "</tbody></table>";
                        $("#ResultadoTipo").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function gvTipo_del(ids) {
            var json = JSON.stringify
                      ({
                          "v_tipo": ids
                      });
            $.ajax({
                type: "POST",
                url: "Incidencias.aspx/WsBajaTipo",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: (function (Resultado) {
                    ListarTipoIncidencias();
                    $("#ModalCat2").modal('hide');
                    Inscidencias();
                    $("#Main_TxtCat").val('');
                }),
                error: errores
            });
        }

        function AltaTipoJs() {
          
            try {
                if ($("#Main_TxtCat").val() != '') {
                    var json = JSON.stringify
                ({
                    "v_tipo": $("#Main_TxtCat").val()
                });
                    $.ajax({
                        type: "POST",
                        url: "Incidencias.aspx/WsAltaTipo",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Resultado) {
                            ListarTipoIncidencias();
                            $("#ModalCat2").modal('hide');
                            Inscidencias();
                            $("#Main_TxtCat").val('');
                        }),
                        error: errores
                    });
                } else { alert('debe ingresar el nombre del tipo de incidencia');}
            } catch (e) {
                alert(e.message);

            }

        }
        $(function () {
            $(".campoFecha").mask("99/99/9999");
        
            $(".campoHora").mask("99:99");
           
            ListarTipoIncidencias();
            ListarEmpleado();
            $(".cmbBuscar").select2();
        });

        $("#Main_TxtDesdeHs").val('00:00');
        $("#Main_TxtHastaHs").val('23:59');

        $("#Main_TxtDesdeHs").hide();
        $("#Main_TxtHastaHs").hide();
        var date = new Date();
        var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
        var ultimoDia = new Date(date.getFullYear(), date.getMonth() , 7);

        var dd = primerDia.getDate();
        var mm = primerDia.getMonth() + 1; //January is 0!

        var yyyy = primerDia.getFullYear();
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        var today = dd + '/' + mm + '/' + yyyy;
 
        $("#Main_TxtDesde").val(today);
       // $('#Main_TxtHasta').val(today);


         dd = ultimoDia.getDate();
        mm = ultimoDia.getMonth() + 1; //January is 0!

        yyyy = ultimoDia.getFullYear();
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        today = dd + '/' + mm + '/' + yyyy;
     
        $('#Main_TxtHasta').val(today);


        $("#Main_TxtBuscar").keyup(function (e) {
            if (e.keyCode == 13) {
                Buscar();
            }
        });
        function Eliminar(v_date) {

            var json = JSON.stringify
                ({
                    "v_Id": v_date

                });
            $.ajax({
                type: "POST",
                url: "Incidencias.aspx/WsEliminar",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: (function (Resultado) {
                    Buscar();
                }),
                error: errores
            });

        
        
        }
        function Buscar() {

            try {
                var tipo = '';
                var valor = '';

              
                    tipo = $('#cmbTipoOp').val();
                    valor = $('#Main_TxtBuscar').val();
             
                var json = JSON.stringify
                  ({
                      "v_tipo": tipo,
                      "v_valor": valor

                  });
                $.ajax({
                    type: "POST",
                    url: "Incidencias.aspx/WsListar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Pacientes = Resultado.d;
                        var Tabla_Titulo = "";
                        var Tabla_Datos = "";
                        var Tabla_Fin = "";

                        $("#Resultado").show();
                        $("#Resultado").empty();
                        Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th></th><th>NOMBRE </th><th>TIPO </th> <th>MOTIVO</th><th>DESDE</th><th>HASTA</th></tr></thead><tbody>";
                        $.each(Pacientes, function (index, pacientes) {
                            Tabla_Datos = Tabla_Datos + "<tr >    <td style='width:30px'> <a class='tooltips' onclick='Eliminar(" + pacientes.ID + ");' > <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Eliminar</span></a></td><td>" + pacientes.Nombre + "</td><td>" + pacientes.DATEIDSTR + "</td><td>" + pacientes.YUANYING + "</td><td>" + pacientes.STARTSPECDAY + "</td><td>" + pacientes.ENDSPECDAY + "</td></tr>";
                        });

                        Tabla_Fin = "</tbody></table>";
                        $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                        fn_cantidad();
                    }),
                    error: errores
                });

            } catch (e) {
                alert(e.message);
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

        function Inscidencias() {
            $('#ModalIncidencia').modal();

        }

        function ListarEmpleado() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Empleados.aspx/WsListar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#Main_cmbPersona').empty();

                        $('#Main_cmbPersona').append(
                                $('<option></option>').val('0').html('- -')
                              );
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                            $('#Main_cmbPersona').append(
                                  $('<option></option>').val(especialidades.USERID).html(especialidades.BADGENUMBER + ' - ' + especialidades.NAME)


                                );

                            if (bb == 0) {
                                inx = especialidades.USERID;
                            }
                            bb++;
                        });
                    $('#Main_cmbPersona').val(0).trigger('change');

                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }

        function ListarTipoIncidencias() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Incidencias.aspx/WsListarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#Main_CmbLugar').empty();

                        //$('#CmbLugar').append(
                        //        $('<option></option>').val('0').html('- -')
                        //      );
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                            $('#Main_CmbLugar').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre)


                                );

                            if (bb == 0) {
                                inx = especialidades.Id;
                            }
                            bb++;
                        });
                     //   $('#Main_CmbLugar').val(inx).trigger('change');

                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }


        function ListarCmdEmpleado() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Incidencias.aspx/WsListarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#Main_CmbLugar').empty();

                        //$('#CmbLugar').append(
                        //        $('<option></option>').val('0').html('- -')
                        //      );
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                            $('#Main_CmbLugar').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre)


                                );

                            if (bb == 0) {
                                inx = especialidades.Id;
                            }
                            bb++;
                        });
                        //   $('#Main_CmbLugar').val(inx).trigger('change');

                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        function AltaJs()
        {
            try {
                if ($("#Main_cmbPersona").val() != '0') {
                    var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                    ({
                        // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                        "v_obj": {

                            "USERID": $("#Main_cmbPersona").val(),
                            "STARTSPECDAY": $("#Main_TxtDesde").val() + ' ' + $("#Main_TxtDesdeHs").val(),
                            "ENDSPECDAY": $("#Main_TxtHasta").val() + ' ' + $("#Main_TxtHastaHs").val(),
                            "DATEID": $('#Main_CmbLugar').val(),
                            "YUANYING": $('#Main_TxtMotivo').val()
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Incidencias.aspx/WsAltaIncidencia",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (result) {
                            Buscar();

                            $("#Main_cmbPersona").val(0).trigger('change');
                          
                            $("#Main_TxtDesdeHs").val('00:00');
                            $("#Main_TxtHastaHs").val('23:59');
                         
                            $('#Main_TxtMotivo').val('');

                        }),
                        error: errores
                    });
                } else { alert('Seleccione un empleado.');}
            } catch (e) {
                alert(e.message);
            }
        }
        function showMouseCoords(e) {
            var e = e ? e : window.event;
            if (!e) return;
            console.log(e.clientX + " " + e.clientY);

        }

     
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
                          window.location.href = "../../Login_hosp.aspx";
                          
                      }
                  });


              });




              function VerifySessionState(result) {
                  $("#miLoader").show();
                  if (!result.d) {

                      window.location.href = "../../Login_hosp.aspx";
                  }
              }

              //fin de ready

          });

      </script>
   

      <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
