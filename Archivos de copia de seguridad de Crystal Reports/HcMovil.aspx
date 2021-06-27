<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="HcMovil.aspx.cs" Inherits="HardSoft.App.ORL.HcMovil" %>

 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
      
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
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>


    <a href="/Scripts/web/VisorPdf.aspx" class="html5lightbox" id="Visor"  data-width="960" data-height="750"> </a>


    
         
    
    <script src="/Scripts/html5lightbox/html5lightbox.js"></script>
         <script>

             jQuery(".html5lightbox").html5lightbox(); 

        </script>
    <style>
              .table {
     
    font-size: 12px;
}
.table>tbody>tr.active>td, .table>tbody>tr.active>th, .table>tbody>tr>td.active, .table>tbody>tr>th.active, .table>tfoot>tr.active>td, .table>tfoot>tr.active>th, .table>tfoot>tr>td.active, .table>tfoot>tr>th.active, .table>thead>tr.active>td, .table>thead>tr.active>th, .table>thead>tr>td.active, .table>thead>tr>th.active {
    background-color:#fbced7;
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
        tr:hover td {
    background:white;
}
    </style>

     <div class=" container" style="margin-top: 0px;">  
         
     <div style="display:none">
              
                </div>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        
          <div class="row">
    
  



&nbsp;<asp:UpdatePanel ID="UpdatePanel2" runat="server"   UpdateMode="Conditional">


  <ContentTemplate>
<fieldset>


     <div class="col-xs-12">
            
              <div   style="  
    background-color:#fbffff;
    padding: 3px;
    border-radius: 10px 10px 10px 10px;
    border: 1px solid;
    /* box-shadow: 0 4px 5px #555; */
    /* border: 1px solid; */
    margin-bottom: 3px;
    height: 40px;
    font-size:10px
   
 "> 
              <div class="col-sm-2">  </div>   
            <div  class="col-sm-10"
                 style="    
                 color:   #50c0b4;
    font-weight: 700;
    font-size: 16px;
    text-transform: uppercase;
    padding: 5px;
    "> Subir Imagenes HC</div> 
              </div>
         
         
          <div style="  
background-color:  #e1e1e1;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
  margin-bottom:5px;
     border: 1px solid;
    
 ">
            

     <div class="form-horizontal" >

                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">Tipo Busqueda</label>
         <div class="col-xs-7">   
            <select id="cmbTipoOp" class="form-control">
          <option value="4"  selected >DNI</option>
          
           <option value="6">Apellido</option>
          <option value="0">Nombre</option>          
         
          
           
      </select>
              </div>
                        <div class="col-xs-2"> </div>
           
     </div>
           
         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-7">   
    <asp:TextBox ID="TxtBuscar" runat="server"  class="form-control"></asp:TextBox>
    </div>
                        <div class="col-xs-2">

                 
                        </div>
      
         </div>
  

         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-5">   
   
         <button id="btnElimina1" type="button" class="btn2  btn-default "  onclick="Buscar()">
    <span class=" glyphicon glyphicon-search" id="btnwait"></span> Buscar
  </button>

    </div>
                        <div class="col-xs-4">

                 
                        </div>
      
         </div>

     
         
     
         
          <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; border-top:solid ">
          
              
       
           
<br />

          </div>
              


                

     
                
                                    
 </div>
    
    

    </fieldset>
      </ContentTemplate>
    </asp:UpdatePanel>

     </div> 






        </div>

          <div style="display:none">
        <asp:Button ID="Button1" runat="server" Text="Button"   />
        </div>
   </div>


     
      <script>
         

          function Buscar() {

              try {

                  $('#btnwait').removeClass("glyphicon-search");
                  $('#btnwait').addClass("glyphicon-refresh glyphicon-refresh-animate");


                  //   alert( $('#cmbTipoOp').val() );

                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                    ({
                        "v_tipo": $('#cmbTipoOp').val(),
                        "v_valor": $('#Main_TxtBuscar').val()

                    });
                  $.ajax({
                      type: "POST",
                      url: "Pacientes.aspx/WsListar",
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

              $('#btnwait').removeClass("glyphicon-refresh glyphicon-refresh-animate ");
              $('#btnwait').addClass("glyphicon-search");

              var Pacientes = Resultado.d;
              var Tabla_Titulo = "";
              var Tabla_Datos = "";
              var Tabla_Fin = "";




              $("#Resultado").show();
              $("#Resultado").empty();
              Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr>    <th></th><th>Nombre</th><th>N° Doc</th> </tr></thead><tbody>";
              $.each(Pacientes, function (index, pacientes) {
                  Tabla_Datos = Tabla_Datos + "<tr  onclick='Pophc(" + pacientes.id + ",this,\"" + pacientes.NOMBRE + " " + pacientes.APELLIDO + "\",\"" + pacientes.DOCUMENTO + "\");' > <td style='width:30px'> <a class=''  > <img src='/images/ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span></span></a></td> <td>" + pacientes.NOMBRE + " " + pacientes.APELLIDO + "</td><td>" + pacientes.DOCUMENTO + "</td></tr>";
              });

              Tabla_Fin = "</tbody></table>";
              $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
           

          }
          function Pophc(id,obj,nom,doc) {
              if ($(obj).hasClass('active')) {
                  $(obj).removeClass('active');
              } else {
                  $(obj).addClass('active').siblings().removeClass('active');
              }

              window.location.href = 'HcMovilSubir.aspx?Nom=' + nom + '&Dni=' + doc+ '&Hc=' + id + '';
          }
          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }
          $(function () {
              $('Main_TxtBuscar').val('');
              $('.navbar-header').hide();
              $('.miCuenta').hide();

          });

      
    </script>
   
          <link href=/css/select2.css" rel="stylesheet" />
     <link href=/css/select2-bootstrap.css" rel="stylesheet" />
    <script src=/js/select2.js"></script>
     
   

</asp:Content>
