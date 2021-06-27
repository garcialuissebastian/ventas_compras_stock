<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn2.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="HcMovilSubir.aspx.cs" Inherits="HardSoft.App.ORL.HcMovilSubir" %>

 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
        <link href="../../Scripts/viewer/viewer.css" rel="stylesheet" />
  
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
      <script src="../../Scripts/viewer/viewer.js"></script>
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
    height: 60px;
    font-size:10px;
     color:black
   
 "> 
              <div class="col-sm-2">  </div>   
            <div  class="col-sm-10"
                 style="    
                
    font-weight: 700;
    font-size: 16px;
    text-transform: uppercase;
    padding: 5px;
    ">  

                <div id="TxtNombre"  > </div> 
                 <div id="TxtDni" > </div>

            </div> 
            
                  
                  
                  
                    </div>
         
         
          <div style="  
 
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
  margin-bottom:5px;
     border: 1px solid;
    
 ">
            

     <div class="form-horizontal" >

                 <div class="form-group">
         <label for="l" class="control-label col-xs-3">  </label>
         <div class="col-xs-7">   

               <input type="file"    id="f_UploadImage"  accept="image/x-png,image/gif,image/jpeg"   size="35" class="form-control"> 
       
                <%--   <img id="myUploadedImg" style="width:180px;"  />--%>

              </div>
                        <div class="col-xs-2"> </div>
           
     </div>
           
         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-7">   
     <asp:TextBox ID="TxtNombreImg" runat="server" CssClass="form-control" placeholder="Descripción del archivo"></asp:TextBox>
    </div>
                        <div class="col-xs-2">

                 
                        </div>
      
         </div>
  

         
                    <div class="form-group">
         <label for="l" class="control-label col-xs-3"></label>
    <div class="col-xs-5">   
   
               <button id="btnAgregar1b3" type="button" class="btn2 btn-info  " onclick="previewFile()" >
    <span class=" glyphicon glyphicon-save" id="btnAgregar1b31"></span> Guardar
 </button>
    </div>
                        <div class="col-xs-4">

                            <img src="../../images/Loading_icon.gif"  height="37" id="wait"  style="float: left;
    margin-left: 10px; display:none"/>

                        </div>
      
         </div>

    
     
         
                   <div style="border-top:solid"> 

                       <div    >
  
                                   
                       
              <div id='Resultado_hosp_hc_files' style='overflow: auto;  height: 260px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillahosp_hc_files'></table>   
   </div> 
                        
   

                    

          
          
           </div>


 
        
<div class="row">
     <asp:HiddenField ID="HiddenField11" runat="server"   />
      <asp:HiddenField ID="HiddenField3" runat="server"   />
     <asp:HiddenField ID="HddImg" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="Txt_tur" runat="server"></asp:TextBox>
    </div>
</div>
        
            <asp:HiddenField ID="HddId" runat="server"   />
</div>  
              
       
           
<br />

          </div>
              


                

     
                
                                    
 </div>
    
    
<div style="margin-top:5px; margin-bottom:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; ">
    <button id="btnVolver1" type="button" class="btn2  btn-info  " onclick="window.history.back();">
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
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
         
          //files
          var html5lightbox_options = {
              overlaybgcolor: "#333",
              overlayopacity: "1",
              socialrotateeffect: "false"
          };

          var dataURL2 = "";
          function previewFile() {
              $('#wait').show();
              if ($("#f_UploadImage").val() != '') {

                  $('#btnAgregar1b31').removeClass("glyphicon-save");
                  $('#btnAgregar1b31').addClass("glyphicon-refresh glyphicon-refresh-animate");

                  //  $('#f_UploadImage')[0].files[0].name; // nombre

                  //var formData = new FormData();
                  //formData.append('file', $('#f_UploadImage')[0].files[0]);



                  resizeAndUpload($('#f_UploadImage')[0].files[0]); // redimenciona y la guarda 


              } else {
                  $('#wait').hide();
             
                  alert('Adjunte un arhivo.');

              }

          }
          function dataURItoBlob(dataURI) {
              // separate out the mime component
              var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

              var binary = atob(dataURI.split(',')[1]);
              var array = [];
              for (var i = 0; i < binary.length; i++) {
                  array.push(binary.charCodeAt(i));
              }
              var blob = new Blob([new Uint8Array(array)], { type: mimeString });

              var fd = new FormData();
              fd.append('file', blob, $('#f_UploadImage')[0].files[0].name);

              var filePath = $("#f_UploadImage").val();
              var file_ext = filePath.substr(filePath.lastIndexOf('.') + 1, filePath.length);

              $.ajax({
                  type: 'post',
                  async: true,
                  url: 'http://facturacion.hardsoft.com.ar/Services/Subir_archivo.ashx',
                  data: fd,
                  success: function (status) {
                      if (status != 'error') {
                          //var my_path = "/images/productos/" + status;
                          //$("#myUploadedImg").attr("src", my_path);
                          try {
                              if (status != 'Se excedió la longitud de solicitud máxima.') {

                                  var json = JSON.stringify
                                  ({
                                      'v_obj': {
                                          'Id': '99',
                                          'Paciente': $("#Main_HddId").val(),
                                          'Descripción': $("#Main_TxtNombreImg").val(),
                                          'Aud': '',
                                          'Path': status,
                                          'tipo': file_ext
                                      }
                                  });
                                  $.ajax({
                                      type: "POST",
                                      url: 'Pacientes.aspx/WmGvAlta_hosp_hc_files',
                                      data: json,
                                      contentType: "application/json; charset=utf-8",
                                      dataType: 'json',
                                      success: (function (Result) {
                                          $("#Main_TxtNombreImg").val('');
                                          $('#f_UploadImage').val('');
                                          $('#Modalhosp_hc_files').modal('hide');
                                          //  Buscar_hosp_dias();
                                          Buscar_hosp_hc_files();
                                          $('#btnAgregar1b31').removeClass("glyphicon-refresh glyphicon-refresh-animate");
                                          $('#btnAgregar1b31').addClass("glyphicon-save");
                                          $('#wait').hide();
                                      }),
                                      error: errores
                                  });

                              } else {
                                  $('#btnAgregar1b31').removeClass("glyphicon-refresh glyphicon-refresh-animate");
                                  $('#btnAgregar1b31').addClass("glyphicon-save");
                                  $('#wait').hide();
                                  throw "SE EXCEDIÓ EL TAMAÑO MÁXIMA DEL ARCHIVO QUE ES 4GB .";
                              }
                          } catch (e) {
                              alert(e);
                          }

                          $('#btnAgregar1b31').removeClass("glyphicon-refresh glyphicon-refresh-animate");
                          $('#btnAgregar1b31').addClass("glyphicon-save");

                      }
                  },
                  processData: false,
                  contentType: false,
                  error: errores
              });

              return blob;
          }
          function resizeAndUpload(file) {
              var reader = new FileReader();
              reader.onloadend = function () {

                  var tempImg = new Image();
                  tempImg.src = reader.result;
                  tempImg.onload = function () {

                      var MAX_WIDTH = 1024;
                      var MAX_HEIGHT = 768;
                      var tempW = tempImg.width;
                      var tempH = tempImg.height;
                      if (tempW > tempH) {
                          if (tempW > MAX_WIDTH) {
                              tempH *= MAX_WIDTH / tempW;
                              tempW = MAX_WIDTH;
                          }
                      } else {
                          if (tempH > MAX_HEIGHT) {
                              tempW *= MAX_HEIGHT / tempH;
                              tempH = MAX_HEIGHT;
                          }
                      }

                      var canvas = document.createElement('canvas');
                      canvas.width = tempW;
                      canvas.height = tempH;
                      var ctx = canvas.getContext("2d");
                      ctx.drawImage(this, 0, 0, tempW, tempH);
                      var dataURL = canvas.toDataURL("image/jpeg");
                      // return dataURL;

                      var blob = dataURItoBlob(dataURL); // blob la guarda
                      //    return blob;
                  }

              }
              reader.readAsDataURL(file);// llama a la funcion

          }

          function dataURItoBlob2(dataURI) {
              var binary = atob(dataURI.split(',')[1]);
              var array = [];
              for (var i = 0; i < binary.length; i++) {
                  array.push(binary.charCodeAt(i));
              }
              return new Blob([new Uint8Array(array)], { type: 'image/jpeg' });
          }


          function Buscar_hosp_hc_files() {
              try {
               
                  var v_buscar = $('#cmbTipoOp').val();
                  var json = JSON.stringify
                 ({
                     'v_tipo': '99',
                     'v_valor':  $("#Main_HddId").val()

                 });
                  $.ajax({
                      type: 'POST',
                      url: 'Pacientes.aspx/WsListar_hosp_hc_files',
                      data: json,
                      contentType: 'application/json; charset=utf-8',
                      dataType: 'json',
                      success: resultado_hosp_hc_files,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }

          function resultado_hosp_hc_files(Resultado) {
              var v_obj = Resultado.d;
              var Tabla_Titulo = '';
              var Tabla_Datos = '';
              var Tabla_Fin = '';
              $('#Resultado_hosp_hc_files').show();
              $('#Resultado_hosp_hc_files').empty();
              Tabla_Titulo = "  <table    id='grillahosp_hc_files' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th> <th>Descripción</th> <th>Fecha</th> <th></th>  </tr></thead><tbody> ";
              $.each(v_obj, function (index, obj) {
                  Tabla_Datos = Tabla_Datos + " <tr >    <td style='width:30px'> <a class='tooltips' onclick='PopMod_ver_hc_files(\"" + obj.Path + "\");' > <img src='/images/jpg.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver</span></a></td>  <td>" + obj.Descripción + " </td>  <td>" + obj.Aud + " </td><td style='width:30px'> <a class='tooltips' onclick='gvDel_hosp_hc_files(" + obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> </a></td>   </tr>";
              });
              Tabla_Fin = " </tbody></table>";
              $('#Resultado_hosp_hc_files').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              fn_cantidad();
          }
          function PopMod_ver_hc_files(v_img) {
              //$('#verImg').attr('href', "/Subidos/ORL/" + v_img);
              //$('#verImg').click();
              var image = new Image();

              image.src = "http://facturacion.hardsoft.com.ar/Subidos/ORL/" + v_img;

              var viewer = new Viewer(image, {
                  hidden: function () {
                      viewer.destroy();
                  },
              });

              // image.click();
              viewer.show();

          }

          function fn_cantidad() {
              cantidad = $('#grillahosp_hc_files tbody').find('tr').length;
              $('#span_cantidad').html(cantidad);
          };


          function gvDel_hosp_hc_files(ids) {
              try {
                  if (confirm('Esta seguro que desea eliminar el registro ?')) {
                      var json = JSON.stringify
                          ({
                              'v_Id': ids
                          });

                      $.ajax({
                          type: 'POST',
                          url: 'Pacientes.aspx/WmGvDel_hosp_hc_files',
                          data: json, contentType: 'application/json; charset=utf-8',
                          dataType: 'json',
                          success: (function (Result) {
                              Buscar_hosp_hc_files();
                          }),
                          error: errores
                      });
                  }
              }
              catch (e) {
                  alert(e);
              }
          }

          function PopMod_hosp_hc_files(id) {
              try {
                  $("#btnModificar1b").show();
                  $("#btnGuardar1b").hide();
                  $("#TituloPop").text('Modificar');
                  $('#Modalhosp_hc_files').modal();
                  $('#Main_TxtId').val(id);


                  var json = JSON.stringify
                      ({
                          'v_tipo': '99',
                          'v_valor': id
                      });
                  $.ajax({
                      type: 'POST',
                      url: 'Pacientes.aspx/WsListar_hosp_hc_files',
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (Resultado) {
                          var v_obj = Resultado.d;
                          $.each(v_obj, function (index, obj) {
                              $('#Main_TxtId').val(obj.Id);
                              $('#Main_TxtPaciente').val(obj.Paciente);
                              $('#Main_TxtDescripción').val(obj.Descripción);
                              $('#Main_TxtAud').val(obj.Aud);
                              $('#Main_TxtPath').val(obj.Path);
                              $('#Main_Txttipo').val(obj.tipo);

                          });
                      },
                      error: erroresJs
                  });
              } catch (e) {
                  alert(e.message);
              }
          }



          // end files
         
          function errores(msg) {
              var jsonObj = JSON.parse(msg.responseText);
              alert('Error: ' + jsonObj.Message);
          }
          $(function () {

              if (getUrlParameter('Hc')=='') {
                  window.location = 'http://www.corlquilmes.com.ar';
              } 
              $('#TxtNombre').text(getUrlParameter('Nom'));
              $('#TxtDni').text(getUrlParameter('Dni'));
              $("#Main_HddId").val(getUrlParameter('Hc'))
              $('.navbar-header').hide();
              $('.miCuenta').hide();
              Buscar_hosp_hc_files();

            
          });

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
 

      </script>
    <style>

          ._wColorPicker_paletteHolder {

              overflow:visible;
          }
      </style>
            

          <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
     
   

</asp:Content>
