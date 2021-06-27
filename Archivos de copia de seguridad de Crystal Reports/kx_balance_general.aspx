<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master"  Culture="Auto" UICulture="Auto"   AutoEventWireup="true"   CodeBehind="kx_balance_general.aspx.cs" Inherits="HardSoft.App.OAA.kx_balance_general" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     
   <script>
       var ultimatecka = "";
       function acceptNum2(evt, valo) {
           // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46
           var key = nav4 ? evt.which : evt.keyCode;

           var len = valo.length;
          
           var index = valo.indexOf('.'); 
           
           if (index > 0) {

               var CharAfterdot = (len + 1) - index;
               
               if (CharAfterdot > 3) { 
                   if (ultimatecka == '8') {
                      
                       return true;

                   }

                       if(key == 8){
                           ultimatecka = '8';
                           return true;
                       } else {
                           return false ;
                       }

               }

           }
           if (key == 46) {

               if (valo.indexOf(".") != -1) {
                   //retun -1 si no encuentra . en string
                   return false;
               }

           } else {

               return (key <= 13 || (key >= 48 && key <= 57) || key == 46 || key == 45);
           } 

         

            
       }
       var nav4 = window.Event ? true : false;
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
 
    <style>
                .ajax__calendar .ajax__calendar_day {
    border: 1px solid #dcdbdb;
}
            .ajax__calendar .ajax__calendar_hover .ajax__calendar_day {
    background-color: #0ba1ec;
    border-color: #daf2fc;
    color: #0066cc;
}

    </style>
	    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>

       <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

         <script type="text/javascript" src="/Scripts/jquery.dataTables.min.js" ></script>
    <link href="/css/jquery.dataTables.css" rel="stylesheet" />

      <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>


        <script src="/Scripts/dataTables.buttons.min.js"></script>
<script src="/Scripts/buttons.colVis.min.js"></script>
<script src="/Scripts/buttons.print.min.js"></script>
<script src="/Scripts/dataTables.select.min.js"></script>
<script src='/Scripts/buttons.html5.min.js'></script>
 
<script src='/Scripts/buttons.bootstrap.min.js'></script>
<script src='/Scripts/jszip.min.js'></script>
<script src='/Scripts/pdfmake.min.js'></script>
<script src='/Scripts/vfs_fonts.js'></script>
<script src='/Scripts/dataTables.responsive.min.js'></script>
<script src='/Scripts/responsive.bootstrap.min.js'></script>
    <link href="/css/jquery.dataTables.css" rel="stylesheet" />
     <style> 
     .MarcoMio {   
  margin-top: 5px;  
  background-color: #333;  
  padding: 5px; 
  border-radius: 10px 10px 10px 10px; 
  border: 1px solid; 
  box-shadow: 0 4px 5px #555; 
  color: white;  
  padding-left: 15px;  
   }  
 </style> 

    
 <%--   modal--%>  


  <div class='modal fade' id='Modalkx_asiento_diario' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-lg'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 

   <button type='button' class='close' data-dismiss='modal'>&times;</button>

 </div> 

 <div class='modal-body'> 

 <div   style='margin-top:0px;text-transform:uppercase' > 


 <div class='MarcoMio' id='TituloPop' style='margin-bottom: 5px;'> </div>  

 
 <div class='row'  style='margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>  

   <div class='col-xs-12'> 

  <div class='form-horizontal'>   
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Id</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtId' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Nro</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtNro' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
 
      
      <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-3'> Fecha</label>  
     <div class="col-xs-3"> 
          <input type="date" id="TxtFecha" date-format="DD/MM/YYYY"  class="form-control" style=" width: 150px;   height: 30px;    margin-top: 7px; "
                                            >
     
    </div> 
<div class='col-xs-6'>
</div> 
</div> 
  
      
      <div class='form-group' >  
    <label for='inputName' class='control-label col-xs-3'> Documento / Concepto</label>  
   <div class='col-xs-8'>  
    <asp:TextBox ID='TxtDocumento_concepto' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 

          <div class='col-xs-1'>
</div> 
</div> 
 
      
 </div>  

 </div>   

  </div> 

      <div class=" col-xs-12  MarcoMio"  style='margin-bottom: 5px;'> 
           <div class="form-group">   
       <div style="color:white;text-align: center; " class="col-xs-4">   
         CUENTA
             
    </div> 
  <div class="col-xs-2" style="color:white;text-align: center; ">  
                 DEBE
   </div> 
          <div class="col-xs-2" style="color:white;text-align: center; ">  
                HABER
   </div> 
       <div class="col-xs-4" style="color:white;text-align: center; ">  
            ORGANIZACIÓN
       
   </div>  
           
               </div>  

     <div class="form-group">   
       <div style="color:white;text-align:center; " class="col-xs-4">   
         <select id="Main_CmbDebe" class="cmbBuscar form-control"  style="width: 100%">  </select> 
             
    </div> 
  <div class="col-xs-2" style="text-align:center; ">  
                  <input   type="text" id="Main_Txtdebe" class="form-control" onfocus="onFocus(this)" 
 onblur="onBlur(this)"  value="0.00" placeholder="Debe" style="text-align:center" onkeypress="return acceptNum2(event, this.value)">    
   </div> 
          <div class="col-xs-2"  style="text-align:center; ">  
                  <input   type="text" id="Main_Txthaber" class="form-control" onfocus="onFocus(this)" 
 onblur="onBlur(this)"  value="0.00" placeholder="Haber" style="text-align:center" onkeypress="return acceptNum2(event, this.value)">    
   </div> 
       <div class="col-xs-4">  
            <select id="Main_org" class="cmbBuscar form-control"  style="width: 100%">  </select> 
       
   </div>  
   <div class="col-xs-12" style="text-align:center; margin-top:5px">   
  <button id="btnBuscarFrm1" type="button" class=" btn2  btn-info   " onclick="AgregarAsiento() "> 
          + Agregar   
   </button>   
     </div>  
            </div>    
 </div>
     <div id="Resultado_kx_asiento_det" style="overflow: auto; min-height: 220px; width: 100%; ">
         </div>





  <div   style='margin-top: 5px; text-align: center;' class='MarcoMio' >  

  <button id='btnModificar1b' type='button' class='btn2 btn-default ' onclick='ModPopJs()'  >  

 <span class=' glyphicon glyphicon-save'></span> 
Modificar
 </button>  
  <button id='btnGuardar1b' type='button' class='btn2 btn-default ' onclick='AltaPopJs()'  >  

 <span class=' glyphicon glyphicon-save'></span> 
Guardar
 </button>  

 <button type='button' class='btn2 btn-danger' data-dismiss='modal'>  

 <span class=' glyphicon glyphicon-floppy-remove'></span> 
Cerrar
 </button> 
         <label for="TxtHaber1" class="control-label   pull-right" style=" color:white; padding: 10px;     font-size: 16px;" >
             <strong> HABER :  <span id="TxtHaber1" >0.00</span> </strong></label>

  <label for="TxtDebe1" class="control-label   pull-right" style="  padding: 10px;  color:white;   font-size: 16px;" >
             <strong>  DEBE :  <span id="TxtDebe1"   >0.00</span> </strong></label> 
 </div> 

 </div>  

        </div> 

  </div>   
      </div>  
 </div>  

     <%-- -------------------------------------------- formulario principal ----------------------------------- --%>
 
 
    <div class=" container" style="margin-top: 36px; min-height:600px"> 

      



 <div class='row'>   
        <div class="alert alert-cab"  >
       <strong>  Balance General </strong> 
            </div>


     
       <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 

        <div  class="form-group" > 
             <div class='col-xs-1' ></div>
         <label for="TxtNunDoc" class=" col-xs-2"  style="color:white;text-align:right; padding-top: 5px;"   > Desde</label>
         <div class="col-xs-2"> 

     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFechaDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
     
    </div> 

         <label for="TxtNunDoc" class=" col-xs-1"  style="color:white;text-align:right; padding-top: 5px;"   >Hasta</label>
         <div class="col-xs-2"> 

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
            
              <div class='col-xs-2'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_kx_asiento_diario()'> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  


</div>

     <%--  <select id='cmbTipoOp' class='form-control'>       
                   <option value='0'>Nombre</option>      
                       </select>      --%>

      
 </div>  
 </div> 
     
     
     
     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_kx_asiento_diario' style='overflow: auto; min-height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillakx_asiento_diario'></table>   
   </div>   
   </div>    
    </div>  
          <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
         
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
             
      </div>  
   
    </div>
     <div style="display:none">
       
        <asp:TextBox ID="valorFoco" runat="server"></asp:TextBox>
          
    </div>
    <script>
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


        function AgregarAsiento(){
            try {
           
                 if (  $("#Main_Txtdebe").val() == '0.00' &&  $("#Main_Txthaber").val() == '0.00')  {
                     return ;
                        
                }

                   if (   $("#Main_Txtdebe").val() =='' &&  $("#Main_Txthaber").val()  == '')  {
                     return ;
                        
                    }

            var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                          ({  
                               "Id_cta": $("#Main_CmbDebe").val(),
                                  "cta": $("#Main_CmbDebe option:selected").text(), 
                              "debe": $("#Main_Txtdebe").val(),
                                  "haber":  $("#Main_Txthaber").val(), 
                              "Id_org":  $("#Main_org").val(), 
                              "org": $("#Main_org option:selected").text(),
                               "Tipo": $($("#Main_org option:selected")).attr("data-tipo")

                          });

                        $.ajax({
                            type: "POST",
                            url: "kx_asiento_manual.aspx/WsAddasiento",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success:  resultado_kx_percepciones,
                            error: errores
                        });

                } catch (e) {
                      alert(e.message);
                }
        }

           function resultado_kx_percepcionesNro(Resultado) { 
                $("#Main_Txtdebe").val('0.00');
                                   $("#Main_Txthaber").val('0.00');
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
                var docu = '';
   var Tabla_Datos = '';
                var Tabla_Fin = '';
             var v_debe = 0;
               var v_haber = 0;   
   $('#Resultado_kx_asiento_det').show(); 
   $('#Resultado_kx_asiento_det').empty();   
   Tabla_Titulo =  "  <table     class='table   table-hover table-striped' style='width: 100%;text-align: center;'><thead><tr> <th></th> <th>Cuenta</th><th>Debe $</th><th>Haber $</th> <th>Organizacion</th> </tr></thead><tbody> "; 

               var cant = 0;
  $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'> <a class='tooltips' onclick='gvDel_kx_percepciones("+ obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Codigo + " </td> <td>" + obj.Debe + " </td> <td>" + obj.Haber+ " </td> <td>" + obj.Config+ " </td></tr>"; 
      if (cant==0) {
          docu = obj.Documento_concepto;
          var ff = obj.Fecha.split("/");
          console.log(ff);
          var mes = parseInt(ff[1]) - 1;
          document.getElementById("TxtFecha").value = new Date(ff[2],  mes,ff[0]).toISOString().substring(0, 10);
      }
      if (obj.Documento_concepto !=null) {
             docu = obj.Documento_concepto;
      }
      
      cant ++;
        v_debe= parseFloat(parseFloat(obj.Debe.replace(',', '.')  ) +  parseFloat( v_debe )   ).toFixed(2);
      $("#TxtDebe1").text(parseFloat(v_debe).toFixed(2));

      v_haber = parseFloat(parseFloat(obj.Haber.replace(',', '.')) + parseFloat(v_haber)).toFixed(2);

                      $("#TxtHaber1").text(parseFloat(v_haber).toFixed(2));
              
   });     
 Tabla_Fin = " </tbody></table>" ; 
               $('#Resultado_kx_asiento_det').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
              
              $("#Main_TxtDocumento_concepto").val(docu);   
               

            
     }


            function resultado_kx_percepciones(Resultado) { 
                $("#Main_Txtdebe").val('0.00');
                                   $("#Main_Txthaber").val('0.00');
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
                var Tabla_Fin = '';
             var v_debe = 0;
               var v_haber = 0;   
   $('#Resultado_kx_asiento_det').show(); 
   $('#Resultado_kx_asiento_det').empty();   
   Tabla_Titulo =  "  <table     class='table   table-hover table-striped' style='width: 100%;text-align: center;'><thead><tr> <th></th> <th>Cuenta</th><th>Debe $</th><th>Haber $</th> <th>Organizacion</th> </tr></thead><tbody> "; 
  
  $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'> <a class='tooltips' onclick='gvDel_kx_percepciones("+ obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Codigo + " </td> <td>" + obj.Debe + " </td> <td>" + obj.Haber+ " </td> <td>" + obj.Config+ " </td></tr>"; 
      
        v_debe= parseFloat(parseFloat(obj.Debe.replace(',', '.')  ) +  parseFloat( v_debe )   ).toFixed(2);
      $("#TxtDebe1").text(parseFloat(v_debe).toFixed(2));

      v_haber = parseFloat(parseFloat(obj.Haber.replace(',', '.')) + parseFloat(v_haber)).toFixed(2);

                      $("#TxtHaber1").text(parseFloat(v_haber).toFixed(2));
              
   });     
 Tabla_Fin = " </tbody></table>" ; 
   $('#Resultado_kx_asiento_det').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
                 
               

            
     }

  function Buscar_kx_asiento_diario() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
        ({
            'v_valor': $('#Main_TxtFechaDesde').val(),
        'v_valor1': $('#Main_TxtFechaHasta').val()

   });
$.ajax({
    type: 'POST',
    url: 'kx_balance_general.aspx/WsListar_kx_asiento_diario',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_kx_asiento_diario,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
        }

        function BuscarNro(ids) {

           LimpiarPop();
    $("#btnModificar1b").hide();
    $("#btnGuardar1b").hide();
    $("#TituloPop").text('Ver Asiento');
    $("#Modalkx_asiento_diario").modal(); 
    $("#Main_TxtId").prop('disabled', true);


            try {
                  var json = JSON.stringify
        ({
            'Id_nro': ids 

   });
                $.ajax({
                            type: "POST",
                            url: "kx_asiento_manual.aspx/WsBuscar_asiento",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado_kx_percepcionesNro,
                            error: errores
                        });

                } catch (e) {
                      alert(e.message);
                }
        }

         function resultado_kx_asiento_diario(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
             var Tabla_Fin = '';
             var Nroold ='';
   $('#Resultado_kx_asiento_diario').show();
             $('#Resultado_kx_asiento_diario').empty();  
            
   Tabla_Titulo =  "  <table    id='grillakx_asiento_diario' class='table    table-bordered    no-footer  ' style='width: 100%;'><thead><tr style='background-color: #1ba0b5; font-weight: 700;'>   <th>CUENTA</th><th>DEBE</th><th>HABER</th> </tr></thead><tbody> "; 

           
             $.each(v_obj, function (index, obj) {  
                 var entro = 'no';

                 if ( obj.Id == '1'   || obj.Id == '2'|| obj.Id == '3') {
                     Tabla_Datos = Tabla_Datos + " <tr style=' font-weight: bold; background-color: #d7eff3;' >    <td   style='text-align: left; padding-left: 33px; font-weight: bold; background-color: #d7eff3;'>" + obj.Codigo + " </td> <td>     </td> <td>     </td>  </tr>";
                     entro = 'si';
                 }
                
                 if (obj.Id == '0') {
                     var coll = '';
                     if ('PASIVO MAS PATRIMONIO' == obj.Codigo || 'TOTAL ACTIVO' == obj.Codigo ) {
   Tabla_Datos = Tabla_Datos + " <tr style=' font-weight: bold; background-color:#67a4ad;' >    <td   style='text-align: left; padding-left: 33px; font-weight: bold;  '>" + obj.Codigo + " </td><td>   " + obj.Debe + " </td> <td>   " + obj.Haber + " </td>  </tr>";
                   
                     } else {
                         // totales 
                           var vthaber = obj.Haber == "" ?"0,00": obj.Haber;
                        var vtdebe = obj.Debe == "" ? "0,00": obj.Debe;
                            Tabla_Datos = Tabla_Datos + " <tr style=' font-weight: bold; background-color:#5fc4d4;' >    <td   style='text-align: left; padding-left: 33px; font-weight: bold;  '>" + obj.Codigo + " </td><td>   " + vtdebe+ " </td> <td>   " + vthaber + " </td>  </tr>";
                   
                     }

                        
                     entro = 'si';
                      

                 }

                 if (entro == 'no') {

                     var vhaber = obj.Haber == "0,00" ? "" : obj.Haber;
                        var vdebe = obj.Debe == "0,00" ? "" : obj.Debe;
                      Tabla_Datos = Tabla_Datos + " <tr >    <td style='text-align: left'>" + obj.Codigo+ " </td> <td>   " + vdebe + " </td> <td>   " + vhaber + " </td>  </tr>"; 
       
                 }
          
                  

             });



             
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_kx_asiento_diario').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     
  
                 document.title = 'Balance General'; // para cuando imprimo salga con el nombre  q quiero
              $('#grillakx_asiento_diario').DataTable({

                    "language": {
                "search": "Filtrar:",
                "zeroRecords": "No se encontró ningun registro",
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior",
                    "print": "Imprimir"
                },
                  "select": {
                    "rows": " %d filas seleccionadas"
                },
                "loadingRecords": "Un momento, cargando...",
                "processing": "Procesando  ...",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "lengthMenu": "Mostrando _MENU_ registros",
                  },
                  "paging": false,
 "ordering": false,
                  dom: 'Bfrtip',
   
        buttons: [
          //  'excel', 'pdf', 'print'

              
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [ 0,1,2]
                    } 
            },
                 {
                    extend: 'excel',
                    exportOptions: {
                         columns: [ 0,1,2]
                    } 
            },

                   {
                    extend: 'print',
                    exportOptions: {
                        columns: [0,1,2]
                    } 
            },


                  ]

    } );
   


     }

          function gvDel(v_id) {

              try {

                  
              if (!confirm("¿Esta seguro que desea eliminar el registro?")) {
                  return;
                   
              }
                  if (true) {


                      var json = JSON.stringify
                        ({
                            "v_Id": v_id

                        })
                      $.ajax({
                          type: "POST",
                          url: "kx_asiento_manual.aspx/WmGvDel_kx_asiento_diario",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: (function () { Buscar_kx_asiento_diario();}
                              
                              ),
                          error: errores
                      });
                  }
              } catch (e) {
                  alert(e.message);
              }
          }
  
    function fn_cantidad_kx_asiento_diario() {
     cantidad = $('#grillakx_asiento_diario tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
     };
   

             function gvDel_kx_percepciones(ids) {
    try {

         if (!confirm("Esta seguro que desea eliminar el regitro ?")) {
             return;  
                        }
          var json = JSON.stringify
          ({ 
              'v_id': ids 
          });
          $.ajax({
        type: "POST",
        url: 'kx_asiento_manual.aspx/gvPerc_del',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success:resultado_kx_percepciones,
        error: erroresJs
          });
      } catch (e) {
        alert(e.message);
                }
            }

    function gvDel_kx_asiento_diario(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_Id': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'kx_asiento_manual.aspx/WmGvDel_kx_asiento_diario',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: (function (Result) {
    Buscar_kx_asiento_diario() ;
          }),
    error: erroresJs
    });
      }
    }
    catch (e)
    {
      alert(e);
    }
  }

    function PopMod_kx_asiento_diario(id) {
      try {
    $("#btnModificar1b").show();
    $("#btnGuardar1b").hide();
    $("#TituloPop").text('Modificar');
    $('#Modalkx_asiento_diario').modal();
    $('#Main_TxtId').val(id);
   

    var json = JSON.stringify
        ({
          'v_tipo':'99',
          'v_valor': id
        });
      $.ajax({
      type: 'POST',
      url: 'kx_asiento_manual.aspx/WsListar_kx_asiento_diario',
      data: json,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (Resultado) {
          var v_obj = Resultado.d;
          $.each(v_obj, function (index, obj) {          
          $('#Main_TxtId').val(obj.Id);
          $('#Main_TxtNro').val(obj.Nro);
          $('#Main_TxtFecha').val(obj.Fecha);
          $('#Main_TxtCodigo').val(obj.Codigo);
          $('#Main_TxtId_cta').val(obj.Id_cta);
          $('#Main_TxtAnio').val(obj.Anio);
          $('#Main_Txtmes').val(obj.mes);
          $('#Main_TxtDocumento_concepto').val(obj.Documento_concepto);
          $('#Main_TxtDebe').val(obj.Debe);
          $('#Main_TxtHaber').val(obj.Haber);
          $('#Main_TxtConfig').val(obj.Config);
          $('#Main_TxtId_Cbte').val(obj.Id_Cbte);
          $('#Main_TxtTipo').val(obj.Tipo);
         
        });
      },
      error: erroresJs
    });
    } catch (e) {
    alert(e.message);
    }
  }
 
 

    function ModPopJs() {
      try {
          var json = JSON.stringify
          ({
            'v_obj': {
          'Id': $('#Main_TxtId').val(),
          'Nro': $('#Main_TxtNro').val(),
          'Fecha': $('#Main_TxtFecha').val(),
          'Codigo': $('#Main_TxtCodigo').val(),
          'Id_cta': $('#Main_TxtId_cta').val(),
          'Anio': $('#Main_TxtAnio').val(),
          'mes': $('#Main_Txtmes').val(),
          'Documento_concepto': $('#Main_TxtDocumento_concepto').val(),
          'Debe': $('#Main_TxtDebe').val(),
          'Haber': $('#Main_TxtHaber').val(),
          'Config': $('#Main_TxtConfig').val(),
          'Id_Cbte': $('#Main_TxtId_Cbte').val(),
          'Tipo': $('#Main_TxtTipo').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'kx_asiento_manual.aspx/WmGvMod_kx_asiento_diario',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_asiento_diario').modal('hide');
        Buscar_kx_asiento_diario();
        LimpiarPop();
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
    }
   
      function LimpiarPop() {
       
          $('#Main_TxtId').val('');
          $('#Main_TxtNro').val('');
          $('#Main_TxtFecha').val('');
          $('#Main_TxtCodigo').val('');
          $('#Main_TxtId_cta').val('');
          $('#Main_TxtAnio').val('');
          $('#Main_Txtmes').val('');
          $('#Main_TxtDocumento_concepto').val('');
          $('#Main_TxtDebe').val('');
          $('#Main_TxtHaber').val('');
          $('#Main_TxtConfig').val('');
          $('#Main_TxtId_Cbte').val('');
          $('#Main_TxtTipo').val('');

            $('#Resultado_kx_asiento_det').empty();  
          $("#TxtDebe1").text('0.00');
          $("#TxtHaber1").text('0.00');

            $.ajax({
                            type: "POST",
                            url: "kx_asiento_manual.aspx/WsLimpiarItem",
                            data: '',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success:  '',
                            error: errores
            });

      }



    function PopAlta_kx_asiento_diario() {
     
    LimpiarPop();
    $("#btnModificar1b").hide();
    $("#btnGuardar1b").show();
    $("#TituloPop").text('Nuevo Asiento');
    $("#Modalkx_asiento_diario").modal();
    $("#Main_TxtId").val('0');
    $("#Main_TxtId").prop('disabled', true);
      }



    function AltaPopJs() {
        try {
              //$("#Main_TxtDocumento_concepto").removeClass("valid");
              //if ($("#Main_TxtDocumento_concepto").val() == '') {
              //          $("#Main_TxtDocumento_concepto").addClass("valid");
              //    return;
              //      }
            

            if ($("#TxtDebe1").text()!=$("#TxtHaber1").text()) { 

                var rr =  parseFloat($("#TxtHaber1").text()) - parseFloat($("#TxtDebe1").text()) ;
                 
                Swal.fire({
                    icon: 'warning',
                    title: 'No se pudo completar la operación.',
                    text: 'El movimiento no balancea.Suma del Debe: '+$("#TxtDebe1").text()+'.Suma del Haber: '+$("#TxtHaber1").text()+', Diferencia: '+rr
                });
                return; 

            }


          var json = JSON.stringify
          ({
            'v_obj': {
          'Id': $('#Main_TxtId').val(),
          'Nro': $('#Main_TxtNro').val(),
          'Fecha': $('#TxtFecha').val(),
          'Codigo': $('#Main_TxtCodigo').val(),
          'Id_cta': $('#Main_TxtId_cta').val(),
          'Anio': $('#Main_TxtAnio').val(),
          'mes': $('#Main_Txtmes').val(),
          'Documento_concepto': $('#Main_TxtDocumento_concepto').val() + " (Asiento Manual)",
          'Debe': $('#Main_TxtDebe').val(),
          'Haber': $('#Main_TxtHaber').val(),
          'Config': $('#Main_TxtConfig').val(),
          'Id_Cbte': $('#Main_TxtId_Cbte').val(),
          'Tipo': $('#Main_TxtTipo').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'kx_asiento_manual.aspx/WmGvAlta_kx_asiento_diario',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalkx_asiento_diario').modal('hide');
        Buscar_kx_asiento_diario();
        LimpiarPop();
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
        }


           function ListarContables() {

            try {
 
                $.ajax({
                    type: "POST",
                    url: "CbtesOrden.aspx/WsListarCtas",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                    
                         $('#Main_CmbDebe').empty();
                       
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                         
                             $('#Main_CmbDebe').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre) 
                                );
                            
 
                         
                        });
            
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }

           function ListarOrganizacion() {

            try {
 
                $.ajax({
                    type: "POST",
                    url: "kx_asiento_manual.aspx/WsListarOrg",
                    data: '',
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                    
                         $('#Main_org').empty();
                          $('#Main_org').append(
                        $('<option  data-tipo="" ></option>').val('').html('') );
                        $.each(Especialidad, function (index, especialidades) {
                         
                             $('#Main_org').append(
                                  $('<option  data-tipo="'+especialidades.Id+'" ></option>').val(especialidades.id_pais).html(especialidades.nombre) 
                            );

                         
                            
 
                         
                        });
            
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }

            $(this).everyTime(10000, function () {
           
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
                    window.location.href = "/Login_oaa.aspx";

                }
            });

        }); 

        function VerifySessionState(result) {
            $("#miLoader").show();
            if (!result.d) {

                window.location.href = "/Login_oaa.aspx";
            }
        }
        
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
        $(function () {
            Buscar_kx_asiento_diario();
             $(".campoFecha").mask("99/99/9999");
            ListarContables();
            ListarOrganizacion();
            $(".cmbBuscar").select2();

             if (getUrlParameter('Cbte') != null) {
                 
                 BuscarNro(getUrlParameter('Cbte'));
            }
            
        var date = new Date();
 

        var dd = date.getDate();
        var mm = date.getMonth()  ; //January is 0!

        var yyyy = date.getFullYear();
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        var today = dd + '/' + mm + '/' + yyyy;
             

            document.getElementById("TxtFecha").value = new Date(yyyy, mm, dd).toISOString().substring(0, 10);


        }
            );




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
          var today = dd + '/01/' + yyyy;

          $('#Main_TxtFechaDesde').val(today);
           
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
    </script>
        <link href="/css/select2.css" rel="stylesheet" />
     <link href="/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="/js/select2.js"></script>
</asp:Content>
