<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="Producto_ver.aspx.cs" Inherits="HardSoft.App.Ralkal.Producto_ver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
  
    <link href="../../css/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
    
       <script language="JavaScript" type="text/javascript">

         function acceptNum(e) {
             var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
             return ((tecla > 47 && tecla < 58) || tecla == 8);
         }
         </script>

    
    

     <div class=" container">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                   Ver Productos           </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
       <strong>   Productos </strong> 
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
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />

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

       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick=" window.location.href='Productos_abm.aspx?TipoOp=Add';" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
    
               </div>

         <br />
   </div>
       <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script>


        
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



        function CargarVer(Ids) {
            $(location).attr("href", "Productos_abm.aspx?Ids=" + Ids);
        }

        function resultado(Resultado) {
            var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#Resultado").show();
            $("#Resultado").empty();
            Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>#</th><th>Id</th><th>Codigo</th><th>Nombre</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {
                Tabla_Datos = Tabla_Datos + "<tr onclick='CargarVer(" + pacientes.Id + ");' style='cursor:pointer;'><td style='background-image:url(/images/ver.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Id + "</td><td>" + pacientes.Codigo + "</td><td>" + pacientes.Nombre + "</td></tr>";
            });
            
            Tabla_Fin = "</tbody></table>";
            $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
        }

        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }


        $(function () {
            //$("#Resultado").hide();

        });

    </script>

      <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
         
</asp:Content>