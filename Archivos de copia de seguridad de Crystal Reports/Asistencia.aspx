
<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnPersonal.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Asistencia.aspx.cs" Inherits="HardSoft.App.Personal.Asistencia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
 
       <script language="JavaScript" type="text/javascript">

           $(document).keypress(function (event) {
               // para q no haga submit cuando pressiono enter en alguna parte
               var keycode = event.keyCode || event.which;
               if (keycode == '13'){ 
                   return false;
               }
           });
           function acceptNum(e) {
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               return ((tecla > 47 && tecla < 58) || tecla == 8);
           }
         </script>


       <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
      <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>
 
        <link rel="stylesheet" href="../../css/jquery-ui.css">
          
    
       <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
    <style>
 
        .ajax__calendar .ajax__calendar_day {
    border: 1px solid #dcdbdb;
}
            .ajax__calendar .ajax__calendar_hover .ajax__calendar_day {
    background-color: #0ba1ec;
    border-color: #daf2fc;
    color: #0066cc;
}

        
      tr:hover td{background:#c7c7c7;}
         .table-hover>tbody>tr.active:hover>td, .table-hover>tbody>tr.active:hover>th, .table-hover>tbody>tr:hover>.active, .table-hover>tbody>tr>td.active:hover, .table-hover>tbody>tr>th.active:hover {
    background-color: #fbced7;
} 
                .selectDeb {
    zoom: 1.6;
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
      <div class=" container" style="margin-top: 36px;">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
                Ver Asistencia        </li>
                                </ol>
        </nav>

          </div>
    <div style="margin-top:0px;text-transform:uppercase" class="container-fluid"  >
    
        
        <div class="alert alert-cab" style="display:none" >
       <strong>   Asistencia   </strong> 
            </div> 
        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >
 
<div class="row" >
 
    <div class="form-horizontal">
          <div class="form-group"  style="padding-top: 5px;">
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Desde
       </div>
                 
         <div class="col-xs-3"> 
<div class="col-xs-9">
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
        </div>  
     </div><div class="col-xs-3" style="color:white;text-align:right; padding-top: 5px;">HASTA</div>
     
    </div> 
                 
  <div class="col-xs-3" >
    <div style="width:153px">
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
    
    <div class="col-xs-3"  >
        </div>
     
       </div> 

   <div class="form-group"  style="text-transform:uppercase">
    
      <div style="color:white;text-align:right; padding-top: 5px;" class="col-xs-3"> 
     Buscar  
       </div>
  <div class="col-xs-3" >
    
     <%-- 
      <select id="cmbTipoOp" class="form-control" style="margin-left:14px">
          <option value="0">Empleado</option>
             <option value="1">Departamento</option>
         MINZU
      </select>--%>
      <asp:DropDownList ID="cmbTipoOp" runat="server" CssClass=" form-control">
          <asp:ListItem Value="0">DNI</asp:ListItem>
           <asp:ListItem Value="1">Departamento</asp:ListItem>
            <asp:ListItem Value="2">Turno</asp:ListItem>
             <asp:ListItem Value="3">Nombre</asp:ListItem>
          <asp:ListItem Value="4">Cargo</asp:ListItem>

      </asp:DropDownList>
           
      </div>
    
    <div class="col-xs-3" >
         
<div id="VerBuscar">
<asp:TextBox ID="TxtBuscar" runat="server"  class="form-control"></asp:TextBox>
   </div>
        <div  id="VerLugar" style="display:none">
            <%--     <select id="CmbLugar" class="cmbBuscar form-control"  style="width: 100%">     
</select> --%>
            <asp:DropDownList ID="CmbLugar" runat="server" CssClass="cmbBuscar form-control" Width="100%"></asp:DropDownList>
        
        </div>  

         <div  id="VerTurno" style="display:none">
             <select id="CmbTurno" class="cmbBuscar form-control"  style="width: 100%" >
    
</select> 
             </div>
        
           </div>
     <div class="col-xs-1"  style="text-align:left">
      
         <button id="btnElimina1" type="button" class="btn2  btn-default "  onclick="Buscar2()">
    <span class=" glyphicon glyphicon-search"></span> 
  </button>
            
          
         <div style="display:none">
         <asp:Button ID="BtnReport" runat="server" Text="Button" OnClick="BtnReport_Click" />
             </div>
  

         </div>
   <div class="col-xs-1" style="    padding-top: 5px;">
 
        <a class="tooltips" style="padding:5px; border-radius: 4px;background-color:white" onclick="addFichada()"> <img src="/images/ajustes.png" style="background-position:50%; background-repeat:no-repeat; "> <span>Agregar fichada</span></a>
 

   </div>     
       
  <div class="col-xs-1">
      <asp:CheckBox ID="CkFaltas" runat="server" Text="SOLO FALTAS"   />   
    
  </div>       
        </div> 

  
    </div>
    

</div>
</div>
 
       <div id="tabs2" style="text-transform:uppercase;font-size:12px; ">
  <ul>
       <li><a href="#tabs2-2"> Fichadas / Reloj</a></li> 
    <li><a href="#tabs2-1"> Reporte</a></li>
      
       
  </ul> 

           <div id="tabs2-1" style="background-color: #f1f1f1;"> 

    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 400px; width: 100%; ">
        
 
  <table   id='grilla'></table>

</div>


           </div>
             <div id="tabs2-2" style="background-color: #f1f1f1;"> 


                   <div id='Resultado2' style="overflow-y: auto; overflow-x: hidden; height: 400px; width: 100%; ">
        
        <div   >



        </div>
  <table   id='grilla2'></table>
             </div>
           </div>

        
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
           <div style="display:none">
           <asp:Button ID="BtnFichadas" runat="server" Text="Button" OnClick="BtnFichadas_Click" />
               <asp:TextBox ID="TxtLugar" runat="server"></asp:TextBox>
                 <asp:TextBox ID="TxtOp" runat="server"></asp:TextBox>
               
                   </div>
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta2()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Descarga</button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
       &nbsp   <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
               </div> <br />
</div>
          </div>



      <div class="modal fade" id="ModalFichada" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">

            
          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      Nuevo Fichada
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
         <label for="TxtNunDoc" class="control-label col-xs-4"  >FECHA</label>
         <div class="col-xs-5"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="Img1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="Img1" runat="server" TargetControlID="TxtDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-3"> 
             
           </div>
     </div>
      
         <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >HORA</label>
        

           <div class="col-xs-3"> 
                <asp:TextBox ID="TxtDesdeHs" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
           </div>
              <div class="col-xs-5"> 
     
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


    <script>

        function addFichada() {
            $("#ModalFichada").modal();

        }

        function AltaJs() {
          
          
                try {
                    if ($("#Main_cmbPersona").val() != '0') {
                        var json = JSON.stringify
                    ({
                        "v_user": $("#Main_cmbPersona").val(),
                        "v_fecha": $("#Main_TxtDesde").val() + ' ' + $("#Main_TxtDesdeHs").val()
                    });
                        $.ajax({
                            type: "POST",
                            url: "Asistencia.aspx/WsAltaFichada",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Resultado) {
                                $("#ModalFichada").modal('hide');
                                Buscar2();
                            }),
                            error: errores
                        });
                    } else { alert('debe seleccionar un empleado');}
                } catch (e) {
                    alert(e.message);

                }

            }


        $(document).ajaxStart(function () {
            $(".spinner-wrapper").css("display", "block");
            $(".loader").css("display", "block");

        });
        $(document).ajaxComplete(function () {
            $(".spinner-wrapper").css("display", "none");
            $(".loader").css("display", "none");
          
        });
        var date = new Date();
        var primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
        var ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        
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

        $('#Main_TxtFechaDesde').val(today);
        $('#Main_TxtDesde').val(today);
     
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
        $('#Main_TxtFechaHasta').val(today);
    
        
        function Inscidencias() {
            $('#ModalIncidencia').modal();
            
        }

        function ListarTurnos() {
            try {
                var inx = '0';
                var bb = 0;
                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Empleados.aspx/WsListarTurnos",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#CmbTurno').empty();

                     
                        $.each(Especialidad, function (index, especialidades) {
                            $('#CmbTurno').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre)
                                );
                            if (bb == 0) {
                                inx = especialidades.Id;
                            }
                            bb++;
                        });
                        $('#CmbTurno').val(inx).trigger('change');
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }

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
                     
                        if (getUrlParameter('Dep') == null) {
                            $('#Main_CmbLugar').val(inx).trigger('change');
                        } else {
                            $('#Main_CmbLugar').val(getUrlParameter('Dep')).trigger('change');
                        }
                     
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }
        


        $("#Main_CmbLugar").change(function () {
         
            $("#Main_TxtLugar").val($("#Main_CmbLugar").val());
           
        })

        $("#CmbTurno").change(function () {

            $("#Main_TxtLugar").val($("#CmbTurno").val());

        })

        $("#Main_CkFaltas").change(function () {
            if ($("#tabs2").tabs('option', 'active') == 1) {
                Buscar2();
            } else {
                alert("Solo para la solapa Reporte");
                $("#Main_CkFaltas").prop("checked", false);
            }
        })
        $("#Main_cmbTipoOp").change(function () {
           
            $("#Main_TxtOp").val($("#Main_cmbTipoOp").val());
            if ($("#Main_cmbTipoOp").val() == '1') {
                $("#Main_TxtBuscar").hide();
                $("#VerLugar").show();
                $("#VerTurno").hide();
            } if ($("#Main_cmbTipoOp").val() == '0') {
                $("#Main_TxtBuscar").show();
                $("#VerLugar").hide();
                $("#VerTurno").hide();
            }

            if ($("#Main_cmbTipoOp").val() == '2') {
                $("#Main_TxtBuscar").hide();
                $("#VerTurno").show();
                $("#VerLugar").hide();
            }
            if ($("#Main_cmbTipoOp").val() == '3') {
                $("#Main_TxtBuscar").show();
                $("#VerLugar").hide();
                $("#VerTurno").hide();
            }
            if ($("#Main_cmbTipoOp").val() == '4') {
                $("#Main_TxtBuscar").show();
                $("#VerLugar").hide();
                $("#VerTurno").hide();
            }
          
        })
      
        $(function () {
          
            $(".campoFecha").mask("99/99/9999");
            $('#tabs2').tabs();
            ListarLugares();
            $(".campoHora").mask("99:99");
            $(".cmbBuscar").select2();
            $("#Main_TxtOp").val($("#Main_cmbTipoOp").val());
           
            $("#Main_TxtDesdeHs").val('00:00');
            ListarEmpleado();
            ListarTurnos();
        });
        function PopAlta2() {

            $("#Main_TxtLugar").val($("#Main_CmbLugar").val());
            if ($('#Main_cmbTipoOp').val() == '2') {
                $("#Main_TxtLugar").val($("#CmbTurno").val());
            }
        
            if ($('#Main_cmbTipoOp').val() == '2') {
                $("#Main_TxtLugar").val($("#CmbTurno").val());
            }

            if ($("#tabs2").tabs('option', 'active') == 1) {
                $("#Main_BtnReport").click(); //  fichadas con horario
            }
            if ($("#tabs2").tabs('option', 'active') == 0) {
                $("#Main_BtnFichadas").click(); //  fichadas reloj
            }

        }
        function Buscar2() {

            var ss = 'si';
            if ($('#Main_TxtBuscar').val() == '') {
                ss = 'no';
            }
            if ($('#Main_cmbTipoOp').val() == '1') {
                ss = 'si';
            }
            
            if ($('#Main_cmbTipoOp').val() == '2') {
                ss = 'si';
            }
           

            if (ss != 'no') {
            var dateParts1 = $('#Main_TxtFechaDesde').val().split("/");
            var dateObject1 = new Date(dateParts1[2], dateParts1[1] - 1, dateParts1[0]);
              

            var dateParts2 = $('#Main_TxtFechaHasta').val().split("/");
            var dateObject2 = new Date(dateParts2[2], dateParts2[1] - 1, dateParts2[0]);

            var day_as_milliseconds = 86400000;
            var diff_in_millisenconds = dateObject2 - dateObject1;
            var diff_in_days = diff_in_millisenconds / day_as_milliseconds;

            if (diff_in_days < 120) {


               
 
            if(     $("#tabs2").tabs('option', 'active')==1){
                Buscar(); //  fichadas con horario
            }


            if ($("#tabs2").tabs('option', 'active') == 0) {

                try {
                    $("#Main_CkFaltas").prop("checked", false);
                    var valor="";
                    if ($('#Main_cmbTipoOp').val() == '1') {//dto
                        valor = $('#Main_CmbLugar').val();
                    }
                    if ($('#Main_cmbTipoOp').val() == '2') {
                        valor = $('#CmbTurno').val();
                    }
                    if ($('#Main_cmbTipoOp').val() == '0') {
                        valor = $('#Main_TxtBuscar').val();
                    }
                    if ($('#Main_cmbTipoOp').val() == '3') {
                        valor = $('#Main_TxtBuscar').val();
                    }
                    if ($('#Main_cmbTipoOp').val() == '4') {
                        valor = $('#Main_TxtBuscar').val();
                    
                    }
                    if (true) {
                        var v_buscar = $('#Main_cmbTipoOp').val();
                        var json = JSON.stringify
                          ({
                              "v_pers":valor,
                              "v_desde": $('#Main_TxtFechaDesde').val(),
                              "v_hasta": $('#Main_TxtFechaHasta').val(),
                              "v_tipo": $('#Main_cmbTipoOp').val()

                          });
                        $.ajax({
                            type: "POST",
                            url: "Asistencia.aspx/ListarFichadas",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: (function (Result) {
                                var Pacientes = Result.d;
                                var Tabla_Titulo = "";
                                var Tabla_Datos = "";
                                var Tabla_Fin = "";

                                $("#Resultado2").show();
                                $("#Resultado2").empty();
                                Tabla_Titulo = "<table   id='grilla2' class='table   table-hover table-striped' style='width: 100%;'><thead><tr>  <th>Fecha</th><th>Nombre</th><th>Fichada</th><th>Lugar</th> </tr></thead><tbody style='text-align: center;'>";
        
                                $.each(Pacientes, function (index, pacientes) {

                                    Tabla_Datos = Tabla_Datos + "<tr  > <td>" + pacientes.Fecha + "</td><td style='font-size: 10px;'>" + pacientes.Nombre + "</td><td style='color: blue;'>" + pacientes.Entrada + "</td><td >" + pacientes.TieTrabajado + "</td></tr>";

                                });

                                Tabla_Fin = "</tbody></table>";
                                $("#Resultado2").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);

                                cantidad = $("#grilla2 tbody").find("tr").length;
                                $("#span_cantidad").html(cantidad);

                            }),
                            error: errores
                        });
                    }
                } catch (e) {
                    alert(e.message);
                }
            }

            } else {
                alert('EL RANGO DE FECHAS NO DEBE SUPERAR LOS 120 DÍAS');
            }



        } else {
                alert('INGRESE UN EMPLEADO A BUSCAR ');
        }
        }
       
        function Buscar() {

            try {
            

                if (true) {
                    var valor = "";
                    if ($('#Main_cmbTipoOp').val() == '1') {
                        valor = $('#Main_CmbLugar').val();
                    } 
                    if ($('#Main_cmbTipoOp').val() == '0') { 
                        valor = $('#Main_TxtBuscar').val();
                    }
                    if ($('#Main_cmbTipoOp').val() == '2') {
                        valor = $('#CmbTurno').val();
                    }
                    if ($('#Main_cmbTipoOp').val() == '3') {
                        valor = $('#Main_TxtBuscar').val();
                    }
                    if ($('#Main_cmbTipoOp').val() == '4') {
                        valor = $('#Main_TxtBuscar').val();

                    }
                    var json = JSON.stringify
                      ({
                          "v_pers": valor,
                          "v_desde": $('#Main_TxtFechaDesde').val(),
                          "v_hasta": $('#Main_TxtFechaHasta').val(),
                               "v_tipo": $('#Main_cmbTipoOp').val()
                      });
                    $.ajax({
                        type: "POST",
                        url: "Asistencia.aspx/ListarAsistencia",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: resultado,
                        error: errores
                    });
                }  
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
            Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th style=' width: 10px;'></th> <th>Fecha</th><th>Nombre</th><th>Horario</th><th>Entrada</th><th>Salida</th> <th style='font-weight: bold;'>Entro</th><th style='font-weight: bold;'>Salio</th><th>Tarde</th><th>Temprano</th><th>Hs <br/> Extras</th><th>Debe <br/> Entrada</th><th>Debe <br/> Salida</th><th>Excepción</th></tr></thead><tbody style='text-align: center;'>";
        
            $.each(Pacientes, function (index, pacientes) {
                var red = "style= 'background-color: #f5d3d3'";
                if (pacientes.Falta != 'SI') {                 
                    red = "";
                }
                var debFalta = " <a class='tooltips' > <img src='/images/cruz.png' style='background-position:50%; background-repeat:no-repeat; '/> <span>Ausente</span></a>";
                var debEnt = " <a class='tooltips' > <img src='/images/check2.png' style='background-position:50%; background-repeat:no-repeat; '/>  </a>";
                var debSal = debEnt;
                if (pacientes.DebeEnt != 'SI') {
                    debEnt = "";
                }
                if (pacientes.DebeSal != 'SI') {
                    debSal = "";
                }
                if (pacientes.Falta != 'SI') {
                    debFalta = " <a class='tooltips' > <img src='/images/si.png' style='background-position:50%; background-repeat:no-repeat; '/> <span>Presente</span></a>";
                }
                if (!$("#Main_CkFaltas").is(':checked')) {

                    Tabla_Datos = Tabla_Datos + "<tr " + red + " > <td style=' width: 10px;'>" + debFalta + "</td> <td style='text-align: left;'>" + pacientes.Fecha + "</td><td style='font-size: 10px;'>" + pacientes.Nombre + "</td><td style='color: blue;width: 120px;'>" + pacientes.Horario + "</td><td style='color: blue;'>" + pacientes.Entrada + "</td><td style='color: blue;'>" + pacientes.Salida + "</td><td style='font-weight: bold;color: red;'>" + pacientes.Entro + "</td> <td style='font-weight: bold;color: red;'>" + pacientes.Salio + "</td><td>" + pacientes.Tarde + "</td><td>" + pacientes.Temprano + "</td><td style='bold;color: green;'>" + pacientes.HsExt + "</td><td>" + debEnt + "</td><td>" + debSal + "</td><td style='color: #f50808; font-weight: 700;'>" + pacientes.Incidencia + "</td></tr>";
                } else {
                    if (pacientes.Falta == 'SI') {
                        Tabla_Datos = Tabla_Datos + "<tr " + red + " > <td style=' width: 10px;'>" + debFalta + "</td> <td style='text-align: left;'>" + pacientes.Fecha + "</td><td style='font-size: 10px;'>" + pacientes.Nombre + "</td><td style='color: blue;width: 120px;'>" + pacientes.Horario + "</td><td style='color: blue;'>" + pacientes.Entrada + "</td><td style='color: blue;'>" + pacientes.Salida + "</td><td style='font-weight: bold;color: red;'>" + pacientes.Entro + "</td> <td style='font-weight: bold;color: red;'>" + pacientes.Salio + "</td><td>" + pacientes.Tarde + "</td><td>" + pacientes.Temprano + "</td><td style='bold;color: green;'>" + pacientes.HsExt + "</td><td>" + debEnt + "</td><td>" + debSal + "</td><td style='color: #f50808; font-weight: 700;'>" + pacientes.Incidencia + "</td></tr>";
                    }
                }
                
            });

            Tabla_Fin = "</tbody></table>";
            $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
        
            cantidad = $("#grilla tbody").find("tr").length;
            $("#span_cantidad").html(cantidad);

        }

        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
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


        ///////// parametros pasados por url js

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
        if (getUrlParameter('Tipo')!=null) {
            $('#Main_cmbTipoOp').val(getUrlParameter('Tipo'));            
           
            $("#Main_TxtBuscar").hide();
            $("#VerLugar").show();
            $("#VerTurno").hide();

         //   window.setTimeout(show_popup, 5000);
          
        }
              
        $(window).load(function () {
            if (getUrlParameter('Tipo') != null) {
                Buscar2();
            }
        });
       


        $(document).ready(function () {
          
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
