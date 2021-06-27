<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="sueldo.aspx.cs" Inherits="HardSoft.App.Kardex.sueldo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    
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
 </style>  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
     
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

               return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
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
       
     <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
   <script type="text/javascript" src="/js/formError.js"></script>
   <script src="/js/kardex.js?v=01"></script>
       
    <div class=" container" style="margin-top:0px;text-transform:uppercase" >
        
       
 
 <div class='row'>  
     
        <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                     Productos             </li>
                                </ol>
        </nav>
       
 
        
       <div class="alert alert-cab"  >
       <strong>    Rubros </strong> 
            </div>
 
      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
       <div style='color:white;text-align:right; padding-top: 5px;' class='col-xs-3'>   
    Buscar  
    </div> 
  <div class='col-xs-3' >  
                    <select id='cmbTipoOp' class='form-control'>       
                   <option value='0'>Nombre</option>      
                       </select>      
   </div> 
       <div class='col-xs-3' >  
           <asp:TextBox ID='TxtBuscar' runat='server'  class='form-control'></asp:TextBox>   
   </div>  
   <div class='col-xs-3'  style='text-align:left'>   
  <button id='btnBuscarFrm' type='button' class='btn2  btn-default '  onclick='Buscar_sueldo() '> 
        <span class=' glyphicon glyphicon-search'></span> Buscar    
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_sueldo' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillasueldo'></table>   
   </div>   
   </div>    
    </div>  
      
     
     
     <div   style='margin-top:3px;text-align:center;padding-right: 15px; ' class='MarcoMio' >  
              <button id='btnAgregar1' type='button' class='btn2 btn-default ' onclick='PopAlta_sueldo()' >     
          <span class=' glyphicon glyphicon-floppy-save'></span> Nuevo   
  </button>  
         <button id='btnVolver1' type='button' class='btn2  btn-info  '  onclick='window.history.back();'>    
        Volver <span class=' glyphicon glyphicon-log-out'></span> 
     </button>   
            <div  style='color:white;text-align:right;width:100px;float:right'>Registros:    
      <span id='span_cantidad'>0</span></div>   
   </div>   
      </div>  
   
</div>
    <div style="display:none">
         <asp:Button ID="BtnRp" runat="server" Text="" OnClick="BtnRp_Click" />
    </div>
   
    <%-- ---------------------------------------------------------pop modal ----------------------- --%>

     <div class='modal fade' id='Modalkx_concep' role='dialog' style='display:none'  >  
    <div class='modal-dialog modal-lg'>  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 

   <button type='button' class='close' onclick="abmCerrar()">&times;</button>

 </div> 

 <div class='modal-body'> 
<!-- Modal cuerpo--> 


      <div   style='text-align:center;   margin-bottom: 3px;' class='MarcoMio' >    
 <div class='row' > 
     <div class='form-group' >   
       <div style='color:white;text-align:right; padding-top: 5px;' class='col-xs-3'>   
   Nombre
    </div> 
         <div style="display:none">
              <asp:TextBox ID='txtTipoConcep' runat='server'  class='form-control'></asp:TextBox>  
         </div>
          
         
       <div class='col-xs-6' >  
           <asp:TextBox ID='txtNombreConcep' runat='server'  class='form-control'></asp:TextBox>   
   </div>  
   <div class='col-xs-3'  style='text-align:left'>   
  <button  type='button' class='btn2  btn-default '  onclick='AgregarConcepto() '> 
        <span class=' glyphicon glyphicon-floppy-save'></span> Guardar 
   </button>   
     </div>  
            </div>    
 </div>  
 </div>     <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_concepto' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillaconcerpto'></table>   
   </div>   
   </div>    
    </div>  
      
     


 </div> 

  </div>   
      </div>  
 </div>  


 <%--   modal--%>  


  <div class='modal fade' id='Modalsueldo' role='dialog' style='display:none'  >  
    <div class='modal-dialog ' style="width: 1000px;">  
  <!-- Modal content-->   
       <div class='modal-content'>  
        <div class='modal-header'> 

   <button type='button' class='close' data-dismiss='modal'>&times;</button>

 </div> 

 <div class='modal-body'> 

 <div   style='margin-top:0px;text-transform:uppercase' > 


 <div class='MarcoMio' id='TituloPop' style='margin-bottom: 5px; display:none' > </div>  

 
 <div class='row'  style='margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; overflow: auto;  height: 420px; width: 100%; '>  

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
    <label for='inputName' class='control-label col-xs-2'> Empleador</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtEmpleador' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
 
       <label for='inputName' class='control-label col-xs-2'> Cuit</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtCuit' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 


</div> 
  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-2'> Dominicilio</label>  
   <div class='col-xs-10'>  
    <asp:TextBox ID='TxtDominicilio' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 


      <hr />

        <div class='form-group'>  
      <label for='inputName' class='control-label col-xs-2'>Período que se abona</label>  
   <div class='col-xs-1'>  
   
        <input type="number" id="Main_TxtPeriodo_mes" value=""  class="form-control" style="    width: 60px"/>
  </div> 
   
   <div class='col-xs-2'>  
  
       <input type="number" id="Main_TxtPeriodo_anio" value=""  class="form-control" style="width:100px"/>
  </div> 
             <label for='inputName' class='control-label col-xs-3'>Jornada</label>  
<div class='col-xs-4'>
      
    <select id="TxtJornal" class="form-control">
        <option value="">--</option>
        <option value="Media Jornada">Media Jornada</option>
         <option value="Jornada entera">Jornada entera</option>
         
    </select>

</div> 
</div> 
  


  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-2'> Beneficiario</label>  
   <div class='col-xs-4'>  
   
       <select id="TxtBeneficiario" class="form-control"></select>
  </div> 
 
   
    <label for='inputName' class='control-label col-xs-2'> Clasificacion</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtClasificacion' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
 
</div> 
  <div class='form-group'>  
        <label for='inputName' class='control-label col-xs-2'> Tarea que desempeña</label>  
   <div class='col-xs-5'>  
    <asp:TextBox ID='TxtTarea' runat='server' CssClass='form-control'></asp:TextBox> 
  </div>

        <label for='inputName' class='control-label col-xs-2'> Fecha Ingreso</label>  
   <div class='col-xs-3'>  
                  
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaIng" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup2" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="imgPopup2" runat="server" TargetControlID="TxtFechaIng"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
  </div>

 
</div> 

      <div class='form-group'>  
        <label for='inputName' class='control-label col-xs-2'> Banco Deposito</label>  
   <div class='col-xs-5'>  
    <asp:TextBox ID='TxtBcoDep' runat='server' CssClass='form-control'></asp:TextBox> 
  </div>

        <label for='inputName' class='control-label col-xs-2'> Fecha Deposito</label>  
   <div class='col-xs-3'>  
                  
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaDep" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup223" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender3"   PopupButtonID="imgPopup223" runat="server" TargetControlID="TxtFechaDep"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>
  </div>

 
</div> 
        <%--  grilla haberes--%>
<div class="alert alert-cab" style="    padding: 0px !important ">
    HABERES
</div>
   
 <div class='row' > 
     <div class='form-group' >   
       <div style=' text-align:right; padding-top: 5px;' class='col-xs-2'>   
   CONCEPTO
    </div> 
  <div class='col-xs-3' >  
                    <select id='cmbHaberes' class='form-control'>       
                     
                       </select>      
   </div> 
       <div class='col-xs-1' >  
         <button id='btnAgregarconcepto' type='button' class='btn2  btn-default '  onclick='abmConcepto("HABERES") '> 
        <span class=' glyphicon glyphicon-plus-sign'></span>  
   </button>  
   </div>  
       <div style=' text-align:right; padding-top: 5px;' class='col-xs-2' >   
MONTO $
    </div> 
   <div class='col-xs-2'  style='text-align:left'> 
       
       <input type="text"  value="0" class="form-control" id="TxtImporteHaber" placeholder="0" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" 
 onblur="onBlur(this)" /> 
     </div>  

          <div class='col-xs-2'  style='text-align:left'> 
       
  <button  type='button' class='btn2  btn-default '  onclick='alta_haber()' id="btnHaber"> 
        <span class=' glyphicon glyphicon-save'></span> Agregar   
   </button> 
              

     </div>  

            </div>    
 </div>  
    
      <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_haberes' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillHaberes'></table>   
   </div>   
   </div> 
          <div style="text-align: right;
     
    padding-right: 18px;
    margin-top: 30px;font-size: 18px;">
           <strong> TOTAL HABERES: <span id="IdTotalHaberes" style="color: red;">0</span> </strong>$ 
              </div>
    </div>  
       <hr />


          <%--  grilla haberes--%>
<div class="alert alert-cab" style="    padding: 0px !important ">
  DEDUCIONES
</div>
   
 <div class='row' > 
     <div class='form-group' >   
       <div style=' text-align:right; padding-top: 5px;' class='col-xs-2'>   
   CONCEPTO
    </div> 
  <div class='col-xs-3' >  
                    <select id='cmbDeducion' class='form-control'>       
                     
                       </select>      
   </div> 
       <div class='col-xs-1' >  
         <button  type='button' class='btn2  btn-default '  onclick='abmConcepto("DEDUCION") '> 
        <span class=' glyphicon glyphicon-plus-sign'></span>  
   </button>  
   </div>  
       <div style=' text-align:right; padding-top: 5px;' class='col-xs-2' >   
MONTO $
    </div> 
   <div class='col-xs-2'  style='text-align:left'> 
       
       <input type="text"  value="0" class="form-control" id="TxtImporteDeducion" placeholder="0" onkeypress="return acceptNum2(event, this.value)" onfocus="onFocus(this)" 
 onblur="onBlur(this)" /> 
     </div>  

          <div class='col-xs-2'  style='text-align:left'> 
       
  <button  type='button' class='btn2  btn-default '  onclick='alta_deducion()' id="btndeducir"> 
        <span class=' glyphicon glyphicon-save'></span> Agregar   
   </button> 
              

     </div>  

            </div>    
 </div>  
    
      <div class='row' style='margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;'>     
    <div class='col-sm-12' style='margin-top:5px; margin-right: 0px;'> 
              <div id='Resultado_deducion' style='overflow: auto;  height: 220px; width: 100%; '>    
      <div >    
     </div>   
     <table   id='grillDeducion'></table>   
   </div>   
   </div> 
          <div style="text-align: right;
     
    padding-right: 18px;
    margin-top: 30px;font-size: 18px;">
           <strong> TOTAL DEDUCIONES: <span id="IdTotalDeducion" style="color: red;">0</span> </strong>$ 
              </div>
    </div>  

    
      
        <div class='form-group' style="    background:#fbfbfb; margin-top:5px;
    padding: 2px;"> 
            <div class='col-xs-4'>
</div>
    <label for='inputName' class='control-label col-xs-4' style="font-size:18px; font-weight:bold"> Importe Cobrar $</label>  
   <div class='col-xs-4' style="text-align:right">  
    <asp:TextBox ID='TxtImporte_cobrar' runat='server' CssClass='form-control' Text="0" ></asp:TextBox> 
  </div> 
 
</div> 


      <div class='form-group'  style="    background: #fbfbfb; padding:2px  ">  
    <label for='inputName' class='control-label col-xs-2' style="font-weight:700"> Importe letra</label>  
   <div class='col-xs-10'>  
    <asp:TextBox ID='TxtImporte_letra' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
 
</div> 
  <div class='form-group'>  
    <label for='inputName' class='control-label col-xs-2'  style="font-weight:700"> Lugar</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtLugar' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
 
    <label for='inputName' class='control-label col-xs-3'  style="font-weight:700"> Fecha</label>  
   <div class='col-xs-3'>  
   
    
      


        <div class="input-group">
           
               
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFecha" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtFecha"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
              
          
     </div>

 

        </div>
  </div> 
     
</div> 
  
      
      
      <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Total_haberes</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtTotal_haberes' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
  <div class='form-group'  style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Importe_liquido</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtImporte_liquido' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 

  <div class='form-group' style="display:none">  
    <label for='inputName' class='control-label col-xs-4'> Aud</label>  
   <div class='col-xs-4'>  
    <asp:TextBox ID='TxtAud' runat='server' CssClass='form-control'></asp:TextBox> 
  </div> 
<div class='col-xs-4'>
</div> 
</div> 
 </div>  

 </div>   

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


 </div> 

 </div>  

        </div> 

  </div>   
      </div>  
 </div>  
    <script>

        
           $('#Main_TxtLugar').prop('disabled', true);
          $('#Main_TxtImporte_letra').prop('disabled', true);
        $('#Main_TxtEmpleador').prop('disabled', true);
        $('#Main_TxtCuit').prop('disabled', true);
        $('#Main_TxtDominicilio').prop('disabled', true);
          $('#Main_TxtImporte_cobrar').prop('disabled', true);
         $('#Main_TxtImporte_cobrar').css('text-align','center')
         $('#Main_TxtImporte_cobrar').css('font-size','16px')
        $(function () {
            BuscarPersonas();
            Buscar_sueldo();
                $(".campoFecha").mask("99/99/9999");
           
            
        }
        );

       


        function alta_haber() {

            $('#btnHaber').hide();
            var json = JSON.stringify
   ({
        'v_concepto': $('#cmbHaberes option:selected').text(),
       'v_importe': $('#TxtImporteHaber').val(),
        'Id':$('#cmbHaberes').val()
   });
$.ajax({
    type: 'POST',
    url: 'sueldo.aspx/WsAltahaber',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_haberes,
    error: erroresJs
  });

        }

          function alta_deducion() {
              $('#btndeducir').hide();
    var json = JSON.stringify
   ({
        'v_concepto': $('#cmbDeducion option:selected').text(),
       'v_importe': $('#TxtImporteDeducion').val(),
       'Id': $('#cmbDeducion').val()

   });
$.ajax({
    type: 'POST',
    url: 'sueldo.aspx/WsAltdeducion',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_deducion,
    error: erroresJs
  });

        }

        function AgregarConcepto() {

           
            if ($('#Main_txtNombreConcep').val()=="") {
                return;
            }
      try {
          var json = JSON.stringify
          ({
            'v_obj': {
          'Id':'',
          'Nombre': $('#Main_txtNombreConcep').val(),
          'Tipo': $('#Main_txtTipoConcep').val(),
          'Id_sueldo': '0',
          'Importe':'0'
            }
          });
          $.ajax({
        type: "POST",
        url: 'sueldo.aspx/WmGvAlta_sueldo_conceptos',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
            $('#Main_txtNombreConcep').val('');
       
              Buscar_sueldo_conceptos(  $('#Main_txtTipoConcep').val());
            //$('#Main_txtTipoConcep').val('');
     
        
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
        }

        
  function Buscar_sueldo_conceptos(tipo) {
try {   

 
    var json = JSON.stringify
   ({
        'v_tipo':'99',
       'v_valor': tipo

   });
$.ajax({
    type: 'POST',
    url: 'sueldo.aspx/WsListar_sueldo_conceptos',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_sueldo_conceptos,
    error: erroresJs
  });


    } catch (e) {
      alert(e.message);
    }
        }

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

         function resultado_sueldo_conceptos(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_concepto').show();
   $('#Resultado_concepto').empty();   
   Tabla_Titulo =  "  <table    id='grillasueldo_conceptos' class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Eliminar</th>  <th>Nombre</th>  </tr></thead><tbody> "; 
   $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'> <a class='tooltips' onclick='gvDel_sueldo_conceptos("+ obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Nombre + " </td>  </tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_concepto').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
               BuscarConceptos( $('#Main_txtTipoConcep').val()); // llena de nuevo el cmb

         }

         function resultado_haberes(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
             var Tabla_Fin = '';
                $('#IdTotalHaberes').text('0');
   $('#Resultado_haberes').show();
   $('#Resultado_haberes').empty();   
   Tabla_Titulo =  "  <table      class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Eliminar</th>  <th>Nombre</th> <th>Monto $</th>  </tr></thead><tbody> "; 
             let precio = 0;  
               $('#Main_TxtTotal_haberes').val("0");
             $.each(v_obj, function (index, obj) {   

                  precio  +=  parseFloat(obj.Importe.replace(',', '.'));
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'> <a class='tooltips' onclick='baja_haber(\"" + obj.Id + "\");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Nombre + " </td> <td>" + obj.Importe+ " </td>  </tr>"; 

                  $('#IdTotalHaberes').text(precio.toFixed(2));
                  $('#Main_TxtTotal_haberes').val(precio.toFixed(2));
                
       
   });     
 Tabla_Fin = " </tbody></table>" ; 
             $('#Resultado_haberes').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
             $('#TxtImporteHaber').val('0');
            $('#btnHaber').show();
              Total();
        }

        function Total() {
            var total = parseFloat( $('#IdTotalHaberes').text().replace(',', '.')) - parseFloat( $('#IdTotalDeducion').text().replace(',', '.'));
            $('#Main_TxtImporte_cobrar').val(total.toFixed(2));

                $("#Main_TxtImporte_letra").val(   numeroALetras($("#Main_TxtImporte_cobrar").val(), {
                plural: 'PESOS',
                singular: 'PESO',
                centPlural: 'CENTAVOS',
                centSingular: 'CENTAVO'
            }));

        }

         function resultado_deducion(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
             var Tabla_Fin = '';
                $('#IdTotalDeducion').text('0');
   $('#Resultado_deducion').show();
   $('#Resultado_deducion').empty();   
   Tabla_Titulo =  "  <table      class='table   table-hover table-striped' style='width: 100%;'><thead><tr> <th>Eliminar</th>  <th>Nombre</th> <th>Monto $</th>  </tr></thead><tbody> "; 
             let precio = 0;  
              $('#Main_TxtImporte_liquido').val("0");
             $.each(v_obj, function (index, obj) {   

                  precio  +=  parseFloat(obj.Importe.replace(',', '.'));
   Tabla_Datos = Tabla_Datos + " <tr >   <td style='width:30px'> <a class='tooltips' onclick='baja_deducion(\"" + obj.Id+ "\");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>   <td>" + obj.Nombre + " </td> <td>" + obj.Importe+ " </td>  </tr>"; 

                 $('#IdTotalDeducion').text(precio.toFixed(2));
                 $('#Main_TxtImporte_liquido').val(precio.toFixed(2));
                

       
   });     
 Tabla_Fin = " </tbody></table>" ; 
             $('#Resultado_deducion').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
             $('#TxtImporteDeducion').val('0');
             Total();
              $('#btndeducir').show();
             
     }

          function  baja_haber(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_concepto': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'sueldo.aspx/Wsbajahaber',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: resultado_haberes,
    error: erroresJs
    });
      }
    }
    catch (e)
    {
      alert(e);
    }
  }

          function  baja_deducion(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_concepto': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'sueldo.aspx/Wsbajadeducion',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: resultado_deducion,
    error: erroresJs
    });
      }
    }
    catch (e)
    {
      alert(e);
    }
  }

            function gvDel_sueldo_conceptos(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_Id': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'sueldo.aspx/WmGvDel_sueldo_conceptos',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: (function (Result) {
    Buscar_sueldo_conceptos( $("#Main_txtTipoConcep").val()) ;
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

        function abmConcepto(tipo) {

           
            $('#Main_txtTipoConcep').val(tipo);
            Buscar_sueldo_conceptos(tipo);
            $('#Modalkx_concep').modal();
$("#Modalsueldo").modal('hide');



        }
            function abmCerrar() {
            
            $('#Modalkx_concep').modal('hide');
$("#Modalsueldo").modal();



        }

            function BuscarConceptos(tipo) {

              try { 
 
                  var json = JSON.stringify
                    ({
                        "v_tipo":"99",
                        "v_valor": tipo

                    });
                  $.ajax({
                      type: "POST",
                      url: "sueldo.aspx/WsListar_conceptos",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) { 

                          var Especialidad = Resultado.d;
                          if (tipo=='HABERES') {
                                 $('#cmbHaberes').empty();
          
              $.each(Especialidad, function (index, especialidades) {
                  var mm = especialidades.Nombre;
                  $('#cmbHaberes').append(
                         
                        $('<option></option>').val( especialidades.Id).html(mm)
                      );
                 
              }); 
                          }


                                 if (tipo=='DEDUCION') {
                                 $('#cmbDeducion').empty();
          
              $.each(Especialidad, function (index, especialidades) {
                  var mm = especialidades.Nombre;
                  $('#cmbDeducion').append(
                         
                        $('<option></option>').val( especialidades.Id).html(mm)
                      );
                 
              }); 
                          }


                      }
                          ),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }

          }

           function BuscarPersonas() {

              try {

 
                  var json = JSON.stringify
                    ({
                        "v_tipo":"4",
                        "v_valor": ""

                    });
                  $.ajax({
                      type: "POST",
                      url: "Personas.aspx/WsListar",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {

                              var Especialidad = Resultado.d;
              $('#TxtBeneficiario').empty();

                          $('#TxtBeneficiario').append(
                         
                        $('<option></option>').val('').html('--')
                      );
              $.each(Especialidad, function (index, especialidades) {
                  var mm = especialidades.Nombre +' '+ especialidades.Apellido;
                  $('#TxtBeneficiario').append(
                         
                        $('<option></option>').val(mm).html(mm)
                      );
                 
              }); 

                      }
                          ),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }

          }

  function Buscar_sueldo() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        'v_tipo': $('#cmbTipoOp').val(),
       'v_valor': $('#Main_TxtBuscar').val()

   });
$.ajax({
    type: 'POST',
    url: 'sueldo.aspx/WsListar_sueldo',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: resultado_sueldo,
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
    }

 function Buscar_benificiario() {
try {   

    var v_buscar = $('#cmbTipoOp').val();
    var json = JSON.stringify
   ({
        
       'v_valor':  $('#TxtBeneficiario').val()

   });
$.ajax({
    type: 'POST',
    url: 'sueldo.aspx/WsListar_benificiario',
    data: json,
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    success: (function (Resultado) {
        $('#Main_TxtClasificacion').val(Resultado.d.Clasificacion);
        $('#Main_TxtTarea').val(Resultado.d.Tarea);
        $('#Main_TxtFechaIng').val(Resultado.d.FechaIng);
        $('#Main_TxtFechaIng').val(Resultado.d.FechaIng);
         $('#Main_TxtFechaIng').val(Resultado.d.FechaIng);
        
        

    }
        ),
    error: erroresJs
  });

    } catch (e) {
      alert(e.message);
    }
        }
        $('#TxtBeneficiario').change(
            function() {
                Buscar_benificiario();
            }

        );
        
  function resultado_sueldo(Resultado) {
   var v_obj = Resultado.d;
   var Tabla_Titulo = '';
   var Tabla_Datos = '';
   var Tabla_Fin = '';
   $('#Resultado_sueldo').show();
   $('#Resultado_sueldo').empty();   
   Tabla_Titulo =  "  <table    id='grillasueldo' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th></th>    <th>Beneficiario</th><th>Clasificacion</th><th>Periodo_mes</th><th>Periodo_anio</th>   <th>Importe_cobrar</th><th>Fecha</th>  </tr></thead><tbody> "; 
   $.each(v_obj, function (index, obj) {      
   Tabla_Datos = Tabla_Datos + " <tr > <td style='width:30px'> <a class='tooltips' onclick='PDF_sueldo("+ obj.Id + ");' > <img src='/images/pdf_icon.jpg' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Descargar</span></a></td>     <td style='width:30px'> <a class='tooltips' onclick='gvDel_sueldo("+ obj.Id + ");'> <img src='/images/boton-eliminar.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer'> <span>Eliminar</span></a></td>       <td>" + obj.Beneficiario + " </td> <td>" + obj.Clasificacion + " </td> <td>" + obj.Periodo_mes + " </td> <td>" + obj.Periodo_anio + " </td>      <td>" + obj.Importe_cobrar + " </td>  <td>" + obj.Fecha + " </td> </tr>"; 
   });     
 Tabla_Fin = " </tbody></table>" ; 
     $('#Resultado_sueldo').html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
     fn_cantidad_sueldo();
     }

    function fn_cantidad_sueldo() {
     cantidad = $('#grillasueldo tbody').find('tr').length;
     $('#span_cantidad').html(cantidad);
     };
        function PDF_sueldo(id) {

            $('#Main_TxtId').val(id);
            $('#Main_BtnRp').click();
            
        }

    function gvDel_sueldo(ids) {
      try {
    if (confirm('Esta seguro que desea eliminar el registro ?')) {
    var json = JSON.stringify
        ({
        'v_Id': ids
        });
   
    $.ajax({
        type: 'POST',
        url: 'sueldo.aspx/WmGvDel_sueldo',
        data: json, contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: (function (Result) {
    Buscar_sueldo() ;
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

    function PopMod_sueldo(id) {
      try {
    $("#btnModificar1b").show();
    $("#btnGuardar1b").hide();
    $("#TituloPop").text('Modificar');
    $('#Modalsueldo').modal();
    $('#Main_TxtId').val(id);
   

    var json = JSON.stringify
        ({
          'v_tipo':'99',
          'v_valor': id
        });
      $.ajax({
      type: 'POST',
      url: 'sueldo.aspx/WsListar_sueldo',
      data: json,
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (Resultado) {
          var v_obj = Resultado.d;
          $.each(v_obj, function (index, obj) {          
          $('#Main_TxtId').val(obj.Id);
          $('#Main_TxtEmpleador').val(obj.Empleador);
          $('#Main_TxtDominicilio').val(obj.Dominicilio);
          $('#Main_TxtCuit').val(obj.Cuit);
          $('#Main_TxtBeneficiario').val(obj.Beneficiario);
          $('#Main_TxtClasificacion').val(obj.Clasificacion);
          $('#Main_TxtPeriodo_mes').val(obj.Periodo_mes);
          $('#Main_TxtPeriodo_anio').val(obj.Periodo_anio);
          $('#Main_TxtImporte_letra').val(obj.Importe_letra);
          $('#Main_TxtLugar').val(obj.Lugar);
          $('#Main_TxtFecha').val(obj.Fecha);
          $('#Main_TxtTotal_haberes').val(obj.Total_haberes);
          $('#Main_TxtImporte_liquido').val(obj.Importe_liquido);
          $('#Main_TxtImporte_cobrar').val(obj.Importe_cobrar);
          $('#Main_TxtAud').val(obj.Aud);
         
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
          'Empleador': $('#Main_TxtEmpleador').val(),
          'Dominicilio': $('#Main_TxtDominicilio').val(),
          'Cuit': $('#Main_TxtCuit').val(),
          'Beneficiario': $('#TxtBeneficiario').val(),
          'Clasificacion': $('#Main_TxtClasificacion').val(),
          'Periodo_mes': $('#Main_TxtPeriodo_mes').val(),
          'Periodo_anio': $('#Main_TxtPeriodo_anio').val(),
          'Importe_letra': $('#Main_TxtImporte_letra').val(),
          'Lugar': $('#Main_TxtLugar').val(),
          'Fecha': $('#Main_TxtFecha').val(),
          'Total_haberes': $('#Main_TxtTotal_haberes').val(),
          'Importe_liquido': $('#Main_TxtImporte_liquido').val(),
          'Importe_cobrar': $('#Main_TxtImporte_cobrar').val(),
          'Aud': $('#Main_TxtAud').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'sueldo.aspx/WmGvMod_sueldo',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
        $('#Modalsueldo').modal('hide');
        Buscar_sueldo();
        LimpiarPop();
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
    }
   
      function LimpiarPop() {


           var hoy = new Date;
          $('#Main_TxtPeriodo_mes').val(hoy.getMonth());

          $('#Main_TxtPeriodo_anio').val(hoy.getFullYear());


          $('#Main_TxtId').val('');
          //$('#Main_TxtEmpleador').val('');
          //$('#Main_TxtDominicilio').val('');
          //$('#Main_TxtCuit').val('');
          $('#TxtBeneficiario').val('');
          $('#Main_TxtClasificacion').val('');
          
          $('#Main_TxtImporte_letra').val('');
      
          $('#Main_TxtTotal_haberes').val('0');
          $('#Main_TxtImporte_liquido').val('0');
          $('#Main_TxtImporte_cobrar').val('0');
          $('#Main_TxtAud').val('');
      }



        function PopAlta_sueldo() {

           
            BuscarConceptos("HABERES");
             BuscarConceptos("DEDUCION");

    LimpiarPop();
    $("#btnModificar1b").hide();
    $("#btnGuardar1b").show();
    $("#TituloPop").text('Alta');
    $("#Modalsueldo").modal();
    $("#Main_TxtId").val('0');
            $("#Main_TxtId").prop('disabled', true);
        
 
     
          var today = new Date();
          var dd = today.getDate();
          var mm = today.getMonth() + 1; //January is 0!

          var yyyy = today.getFullYear();
          if (dd < 10) {
              dd = '0' + dd;
          }
          if (mm < 10) {
              mm = '0' + mm;
          }
          var today = dd + '/' + mm + '/' + yyyy;
          document.getElementById("Main_TxtFecha").value = today;

      }



    function AltaPopJs() {
        try {

            if ( $('#TxtBeneficiario').val()=='') {
                alert('seleccione un beneficiario.');
                return;
            }
          var json = JSON.stringify
          ({
            'v_obj': {
          'Id': $('#Main_TxtId').val(),
                  'Empleador': $('#Main_TxtEmpleador').val(),
                  'FechaIng': $('#Main_TxtFechaIng').val(),
               'Tarea': $('#Main_TxtTarea').val(),
          'Dominicilio': $('#Main_TxtDominicilio').val(),
          'Cuit': $('#Main_TxtCuit').val(),
          'Beneficiario': $('#TxtBeneficiario').val(),
          'Clasificacion': $('#Main_TxtClasificacion').val(),
          'Periodo_mes': $('#Main_TxtPeriodo_mes').val(),
          'Periodo_anio': $('#Main_TxtPeriodo_anio').val(),
          'Importe_letra': $('#Main_TxtImporte_letra').val(),
          'Lugar': $('#Main_TxtLugar').val(),
          'Fecha': $('#Main_TxtFecha').val(),
          'Total_haberes': $('#Main_TxtTotal_haberes').val(),
          'Importe_liquido': $('#Main_TxtImporte_liquido').val(),
                  'Importe_cobrar': $('#Main_TxtImporte_cobrar').val(),
                  'Fecha_cobro': $('#Main_TxtFechaDep').val(),
                  'Banco_cobro': $('#Main_TxtBcoDep').val(), 
                     'Jornal': $('#TxtJornal').val(), 
          'Aud': $('#Main_TxtAud').val()
            }
          });
          $.ajax({
        type: "POST",
        url: 'sueldo.aspx/WmGvAlta_sueldo',
        data: json,
        contentType:"application/json; charset=utf-8",
        dataType: 'json',
        success: (function (Result) {
            $('#Modalsueldo').modal('hide');
            window.location.href = 'sueldo.aspx';
    }),
        error: erroresJs
    });
      } catch (e) {
        alert(e.message);
      }
    }
        function limpar() {
            $('#Main_TxtId').val(''),
               
                $('#Main_TxtFechaIng').val('');
                $('#Main_TxtTarea').val('');
           
                $('#TxtBeneficiario').val('');
                $('#Main_TxtClasificacion').val('');
                $('#Main_TxtPeriodo_mes').val('');
                $('#Main_TxtPeriodo_anio').val('');
                $('#Main_TxtImporte_letra').val('');
                
                $('#Main_TxtFecha').val('');
                $('#Main_TxtTotal_haberes').val('');
                $('#Main_TxtImporte_liquido').val('');
            $('#Main_TxtImporte_cobrar').val('');
            $('#IdTotalHaberes').text('0');
              $('#IdTotalDeducion').text('0');
            
            $('#Resultado_deducion').empty();   
                $('#Resultado_haberes').empty();   
        }
     
        function erroresJs(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

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
                    window.location.href = "//www.hardsoft.com.ar/";

                }
            });

        });

        function VerifySessionState(result) {
            $("#miLoader").show();
            if (!result.d) {

                window.location.href = "//www.hardsoft.com.ar/";
            }
        }


    </script>
</asp:Content>
