<%@ Page Title="" Language="C#"     Culture="Auto" UICulture="Auto" MasterPageFile="~/App/Master/HomeOnPersonal.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="HardSoft.App.Personal.Empleados" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
 
     <script type="text/javascript" src="jquery.webcam.js"></script>
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
    <style>
          .selectDeb {
    zoom: 1.4;
}
    </style>
     <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          

    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>
 
    
     <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>

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
                Ver Empleados         </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab" style="text-shadow: #969696 0.1em 0.1em 0.2em; "  >
       <strong>   Empleados </strong> 
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
             <option value="0">DNI</option> 
          <option value="2">Nombre</option> 
          
           <option value="1">Legajo</option> 
           <option value="5">LEY</option> 
          <option value="3">Departamento</option> 
                   <option value="6">Cargo</option>
          
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
             
            <input type="text" id="kwd_search" value="" class="form-control" style="width:150px;float:left"/>
              


             <div style="display:none">
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="PopAlta()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Nuevo
 </button>
    </div>
           
        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>

    
           <div  style="color:white;text-align:right;width:100px;float:right">Registros: 
    <span id="span_cantidad">0</span></div>
               </div> 
         
         
         <br />
   </div>

    <input id="hddIDUSER" type="hidden" />

           <!-- Modal -->
  <div class="modal fade" id="ModalCat" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"   style="background-color: rgb(241, 241, 241);">
      <div class="row" >
              <div class=" col-xs-6 " id="TituloPop"   style="font-weight: 900;
    font-size: 17px;text-shadow: #969696 0.1em 0.1em 0.2em; padding-left: 20px;" >
      
       </div>     
         <div class=" col-xs-6 "  >
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
          </div>
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
       
     


    
      <div id="tabs" style="text-transform:uppercase">
  <ul>
    <li><a href="#tabs-1"> Datos</a></li>
      <li><a href="#tabs-2"> Foto</a></li>
     <li><a href="#tabs-3">Trabajo</a></li>
      
  </ul>


  <div id="tabs-1">
      <div class="row"  style="    padding-top: 20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
 

       <div class="col-xs-6">
          
       <div class="form-horizontal" >

               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">LEY</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtTitulo" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>  
    <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">DNI</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtEmp" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>        
           
                 <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>  
 

   <div class="form-group">
         <label for="l" class="control-label col-xs-4">Sexo</label>
         <div class="col-xs-8">

         <select id="CmbSex" class="form-control" style="width: 160px;float:left;height: 35px;">
               <option value="0">- -</option>
                 <option value="Masc"> Masculino </option>
                  <option value="Femen"> Femenino </option>
                  
             </select>
    </div>
           
     </div>

     

        

               <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >Fecha Nac.</label>
         <div class="col-xs-6"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtNac" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtNac"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-2">  </div>
     </div>

     

                   <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Dirección</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtDir" runat="server" class="form-control"    TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>  

   
        </div>
          </div>
       <div class="col-xs-6">
        <div class="form-horizontal">
            
            
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">CARGO</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNacionalidad" runat="server" class="form-control"   ></asp:TextBox>
      
         </div>
           
     </div>   
       <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Legajo </label>
         <div class="col-xs-6">

 <asp:TextBox ID="TxtNo" runat="server" class="form-control"    ></asp:TextBox>
      
         </div>
            
           
     </div>
      
         <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Tel. Oficina </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtOfi" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div>

            
               <div class="form-group">
         <label for="TxtNunDoc" class="control-label col-xs-4"  >Fecha TOMA DE POSESION </label>
         <div class="col-xs-6"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFechaEmp" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="imgPopup2" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup2" runat="server" TargetControlID="TxtFechaEmp"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

           <div class="col-xs-2">  </div>
     </div>


      
            <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Número Cel </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtCel" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
           
     </div> 
     
                    <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Horario</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtCardNum" runat="server" class="form-control"   TextMode="MultiLine"></asp:TextBox>
      
         </div>
           
     </div>      
            
               </div>
          </div>
 
</div>
      </div>
   <div id="tabs-2">
       <div class="bs-example">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" id="btn_photo" data-parent="#accordion" href="#collapseOne" onclick="ok()"><span class="glyphicon glyphicon-plus"></span> Tomar Foto</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                 <div class="form-horizontal">
 <div  class="col-xs-12">
  <table border="0" cellspacing="0" cellpadding="0" style=" ;margin:auto">
        <tr>
            <td class="webcam-container size640x480">
                <div id="webcam"
                     data-swffile="sAS3Cam.swf"
                     
                     data-stage-scale-mode="noScale" data-stage-align="TL"
                     class="size640x480">
                </div>
            </td>
        </tr>
        <tr>
            <td class="webcam-text">
                <div style="margin-top:10px">
                    <select id="popup-webcam-cams"></select>
                </div>
                <div>
                    <input id="popup-webcam-take-photo"
                           type="button"
                           disabled="disabled"
                           value="Tomar foto"
                           style="display:none" />
                </div>
                <p class="webcam-error"></p>
            </td>
        </tr>
    </table>
    </div>  
  
 
      
        </div>
                </div>
            </div>
        </div>
      
    </div>
	 
</div>
 
      <div class="row"  style="border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
     <div >
          <div id="result" style="    margin: auto;
    text-align: center;" >
          <img id="myUploadedImg"   style="height: 204px;    margin: 10px" />   

               
    </div>
          </div>
           

</div>
      </div>

          <div id="tabs-3">
      <div class="row"  style="    padding-top: 20px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;background-color: rgb(241, 241, 241);">
 

       <div class="col-xs-6">
          
       <div class="form-horizontal" >
    <div class="form-group">
          <div class="col-xs-1">
                   <a class="tooltips" style="cursor:pointer;     float: left; " onclick="PopAltaLugar()">  <img src="/images/add-mas.png" style="height: 20px;margin-top: 5px;">        
<span>Nuevo </span></a>
     </div>
         <label for="TxtNombre" class="control-label col-xs-2">Lugar </label>
         <div class="col-xs-9">
                  <select id="CmbLugar" class="cmbBuscar form-control"  style="width: 100%">     
</select> 

         </div>
          
     </div>      
           
     
 </div>

       </div>

           <div class="col-xs-6">
                    <div class="form-horizontal" >
    <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-2">Feriados</label>
        
   <div class="col-xs-2" style=" ">
             <input id="CkFeriado" type="checkbox"   class="form-control selectDeb "/>      
         </div>


   <div class="col-xs-2">
 
         </div> 

           <label for="TxtNombre" class="control-label col-xs-2">Francos</label>
        
   <div class="col-xs-2" style=" ">
  <a class="tooltips" style="cursor:pointer;     float: left; " onclick="PopAltaFranco()">  <img src="/images/add-mas.png" style="height: 20px;margin-top: 5px;">        
<span>Nuevo  </span></a>   
         </div>
     
 </div>
           </div>   </div>

    <div class="col-xs-12">
 <div class="form-horizontal" > 
              <div class="form-group" style="background-color: #84bff3;
    padding: 5px;">
         <label for="TxtNombre" class="control-label col-xs-1">Turno</label>
         <div class="col-xs-4">
<select id="CmbTurno" class="cmbBuscar form-control"  style="width: 100%" >
    
</select> 
         </div>

                      

                            <label for="TxtNunDoc" class="control-label col-xs-1"  >Inicio</label>
         <div class="col-xs-2"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtInicio" runat="server"  Width="110"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="ImageButton1" runat="server" TargetControlID="TxtInicio"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

                    
                            <label for="TxtNunDoc" class="control-label col-xs-1"  >Fin</label>
         <div class="col-xs-2"> 
     <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFin" runat="server" Width="110"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender3"   PopupButtonID="ImageButton2" runat="server" TargetControlID="TxtFin"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>  
               </div>

                            
                      
           
     </div>   

 </div>

           </div>



      </div></div>


       


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
        
            <div   style="margin-top:5px; margin-bottom:5px;background-color:#b9b9b9; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >

        
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " onclick="ModificarJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar 
 </button>

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
          <button type="button" class="close"  onclick="cerrarbtn()">&times;</button>
       
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
        
       <button id="btnGuardar12a" type="button" class="btn btn-info " onclick="AltaTipoLugar()"  >
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


              <!-- Modal -->
  <div class="modal fade" id="ModalCat3" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close"  onclick="cerrarbtn2()">&times;</button>
       
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
         <label for="TxtNombre" class="control-label col-xs-4">FRANCOS </label>
                <div class="col-xs-4">
 
            <asp:DropDownList ID="CmbSiempre" runat="server" CssClass=" form-control" Width="100%">
                 <asp:ListItem>SIEMPRE</asp:ListItem>
        <asp:ListItem>UNICA VEZ</asp:ListItem>
            </asp:DropDownList>
        
      
         </div>
           
         <div class="col-xs-4">
 <div id="siempre">
            <asp:DropDownList ID="CmbDias" runat="server" CssClass="  form-control" Width="100%"></asp:DropDownList>
        
    </div>
<div id="una" style="display:none">
    <div class="input-group date" data-provide="datepicker"  >
    <asp:TextBox ID="TxtFranco" runat="server"  Width="110"  placeholder="dia/mes/año"  CssClass="campoFecha form-control"   ></asp:TextBox> 
    <div class="input-group-addon">
     
         <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender4"   PopupButtonID="ImageButton3" runat="server" TargetControlID="TxtFranco"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div>     </div>    
               
         </div>
                 
     </div>
      
     
          
  
        
        </div>
         
           
             </div>
    <div class="col-xs-3">
        
       <button id="btnGuardar12a3" type="button" class="btn btn-info " onclick="AltaTipoFranco()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar 
 </button>
        <div class="alert-danger" id="IdErr3">
        
         
  
        
        </div>
          </div>

      

    </div>

</div>
   <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; ">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='ResultadoTipo3' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%;background-color: aliceblue; ">
        
        <div   >


        </div>
  

</div>
              </div>
     </div>
        

</div>
<div class="row">

<div  id="LblError3" class="alert alert"> </div>
</div>

                    <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


       



        <button type="button" class="btn btn-danger"  onclick="cerrarbtn2()"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button> 
              <br />
               


               </div>

            </div></div></div></div>


               <!-- Modal -->
  <div class="modal fade" id="ModalCat4" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       
    <div class="col-xs-12">
        <div class="form-horizontal">        
           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre Horario</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TextBox1" runat="server" class="form-control"  Width="100%" ></asp:TextBox>
      
         </div>
           
     </div>   
    
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Hora Entrada</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtEntrada" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
         </div>
     
         <label for="TxtNombre" class="control-label col-xs-4">Hora Salida</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtSalida" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
         </div>
           
     </div>  
  
             <div class="form-group">


         <label for="TxtNombre" class="control-label col-xs-4">MARGEN LLEGA 
TARDE (MINS)</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtTarde" runat="server" class="form-control required2"  Width="62"  onKeyPress="return acceptNum(event)"  ></asp:TextBox>
      
         </div>


                     <label for="TxtNombre" class="control-label col-xs-4">MARGEN LLEGA 
TEMPRANO (MINS)</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtTemprano" runat="server" class="  form-control required2" Width="62" onKeyPress="return acceptNum(event)"   ></asp:TextBox>
      
         </div>
           
     </div>  
    
  
    <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">COMIENZO 
ENTRADA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtComienzoEntrada" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
         </div>
           
     
         <label for="TxtNombre" class="control-label col-xs-4">FIN 
ENTRADA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtFinEntrada" runat="server" class="campoHora required form-control"  Width="62"    ></asp:TextBox>
      
         </div>
           
     </div>   
  
           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">COMIENZO 
SALIDA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtComienzoFin" runat="server" class="campoHora required form-control"  Width="62"  ></asp:TextBox>
      
         </div>
           
     
         <label for="TxtNombre" class="control-label col-xs-4">FIN 
SALIDA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TxtFinSalida" runat="server" class="campoHora required form-control"  Width="62"   ></asp:TextBox>
      
         </div>
           
     </div>   
  
        
     
         
                  
        </div>
          </div>
  
    
      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label2" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
    
      <asp:HiddenField ID="HiddenField3" runat="server"   />
    <div style="display:none">
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        
    </div>
    <asp:TextBox ID="TxtIds" runat="server"></asp:TextBox>
</div>
      
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              
     
       <button id="btnGuardar1b" type="button" class="btn2 btn-default " onclick="AltaJsHs()"  >
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
  <div class="modal fade" id="ModalHoras"  role="dialog" style="display:none" >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">
   <div class="row alert alert-negro" style="    margin: 10px;">
&nbsp &nbsp  <span id="tur2"></span>
   </div>
          
        <div class="form-horizontal">

         
          <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-3"  style="font-weight: 800;">    NOMBRE DEL TURNO </label>
         <div class="col-xs-4">

 <asp:TextBox ID="nombre1" runat="server" class="form-control"  ></asp:TextBox>
      
         </div>
               <div class="col-xs-5"></div>
           
     </div>
            </div>

       <div class="row alert alert-negro" style="    margin: 10px;">
        <div  class="col-lg-6" >
         &nbsp &nbsp  HORARIOS  
       </div>   
            <div   class="col-lg-6"  style="text-align:right">
     
      <a class="tooltips" id="addHs"  > 
   <img src="../../images/turno_Negro.png"  style="background-position:50%; background-repeat:no-repeat;cursor:pointer"><span>Nuevo Horario</span></a>
                
                
                 </div>   
</div> 
     

<div class="row"  style="margin-left:0px; margin-right:0px;   padding:10px;">
 
      <div class="col-xs-6" style="  margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
       
       <div id='ResultadoHoras' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
   
           </div>
    </div>  
    <div class="col-xs-6" style="min-height:232px; margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
        
         <div id='ResultadoDias' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
   
           </div>
    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <span class="alert-danger" id="Msg"></span>
    </div>
    
      <asp:HiddenField ID="HiddenField4" runat="server"   />
    <div style="display:none">
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
    </div>
</div>
        
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1b" type="button" class="btn2 btn-default " onclick="ModificarJs('0')"  >
    <span class=" glyphicon glyphicon-save"></span> Modificar</button>

       
  <button id="btnAgregar2b" type="button" class="btn2 btn-default " onclick="AltaTurJs()"  >
    <span class=" glyphicon glyphicon-save"></span> Guardar</button>

        <button type="button" class="btn2 btn-danger" data-dismiss="modal"> 
    <span class=" glyphicon glyphicon-floppy-remove"></span> Cerrar
  </button> 
              <br /> 
               </div>
         
</div> 
              </div>
        
      </div>
      
    </div>
  
   


             <!-- Modal -->
  <div class="modal fade" id="ModalHorasCfg" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       
        </div>
        <div class="modal-body">


          <div   style="margin-top:0px;text-transform:uppercase" >
           
       
        
        <div class="alert alert-negro" id="TituloPop">
      
       </div>     
        
     

<div class="row"  style="margin-left:0px; margin-right:0px;  background-color: #e9eaea; padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
       
    <div class="col-xs-12">
        <div class="form-horizontal">        
           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Nombre Horario</label>
         <div class="col-xs-8">

 <asp:TextBox ID="TextBox2" runat="server" class="form-control"  Width="100%" ></asp:TextBox>
      
         </div>
           
     </div>   
    
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Hora Entrada</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox3" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
         </div>
     
         <label for="TxtNombre" class="control-label col-xs-4">Hora Salida</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox4" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
         </div>
           
     </div>  
  
             <div class="form-group">


         <label for="TxtNombre" class="control-label col-xs-4">MARGEN LLEGA 
TARDE (MINS)</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox5" runat="server" class="form-control required2"  Width="62"  onKeyPress="return acceptNum(event)"  ></asp:TextBox>
      
         </div>


                     <label for="TxtNombre" class="control-label col-xs-4">MARGEN LLEGA 
TEMPRANO (MINS)</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox6" runat="server" class="  form-control required2" Width="62" onKeyPress="return acceptNum(event)"   ></asp:TextBox>
      
         </div>
           
     </div>  
    
  
    <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">COMIENZO 
ENTRADA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox7" runat="server" class="campoHora required form-control"  Width="62" ></asp:TextBox>
      
         </div>
           
     
         <label for="TxtNombre" class="control-label col-xs-4">FIN 
ENTRADA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox8" runat="server" class="campoHora required form-control"  Width="62"    ></asp:TextBox>
      
         </div>
           
     </div>   
  
           <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">COMIENZO 
SALIDA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox9" runat="server" class="campoHora required form-control"  Width="62"  ></asp:TextBox>
      
         </div>
           
     
         <label for="TxtNombre" class="control-label col-xs-4">FIN 
SALIDA</label>
         <div class="col-xs-2">

 <asp:TextBox ID="TextBox11" runat="server" class="campoHora required form-control"  Width="62"   ></asp:TextBox>
      
         </div>
           
     </div>   
  
        
     
         
                  
        </div>
          </div>
  
    
      

    </div>

</div>

 
        
<div class="row">
    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label3" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
    
      <asp:HiddenField ID="HiddenField5" runat="server"   />
    <div style="display:none">
        <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
    </div>
</div>
      
            <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              
     
       <button id="btnGuardar1b" type="button" class="btn2 btn-default " onclick="AltaJsHs()"  >
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
          function PopAltaFranco() {
              $('#ModalCat').modal('hide');
              $("#ModalCat3").modal();
              //       $("#ModalCatSub").modal('hide');
              BuscarFranco();
          }

          function BuscarFranco() {
              try {

                  //   alert( $('#cmbTipoOp').val() );


                  var json = JSON.stringify
                    ({
                        "v_user": $("#hddIDUSER").val()

                    });
                  $.ajax({
                      type: "POST",
                      url: "Empleados.aspx/WsListarFranco",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: (function (Resultado) {
                          var Pacientes = Resultado.d;
                          var Tabla_Titulo = "";
                          var Tabla_Datos = "";
                          var Tabla_Fin = "";

                          var dia = "";
                          $("#ResultadoTipo3").show();
                          $("#ResultadoTipo3").empty();
                          Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>  </th>  <th>  </th> <th>  </th></tr></thead><tbody>";
                          $.each(Pacientes, function (index, pacientes) {
                              if (pacientes.Siempre == "SIEMPRE") {
                                  dia = pacientes.Dia;
                              } else {
                                  dia = pacientes.Fecha;
                              }
                             
                              Tabla_Datos = Tabla_Datos + "<tr><td onclick='gvdel_franco(" + pacientes.Id + ");'    style='cursor:pointer;background-image:url(https://arquivirtual.quilmes.gov.ar/municipal/img/boton-eliminar.png); background-position:50%; background-repeat:no-repeat;'> </td> <td>" + pacientes.Siempre + "</td><td>" + dia + "</td></tr>";
                          });

                          Tabla_Fin = "</tbody></table>";
                          $("#ResultadoTipo3").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                      }),
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }

          function PopAltaLugar() {
              $('#ModalCat').modal('hide');
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
                      url: "Empleados.aspx/WsListarP",
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
                              Tabla_Datos = Tabla_Datos + "<tr><td onclick='gvTipo_del(" + pacientes.Id + ");'    style='cursor:pointer;background-image:url(https://arquivirtual.quilmes.gov.ar/municipal/img/boton-eliminar.png); background-position:50%; background-repeat:no-repeat;'> </td> <td>" + pacientes.nombre + "</td></tr>";
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

          $("#Main_TxtBuscar").keyup(function (e) {
              if (e.keyCode == 13) { 
                  Buscar();
              }
          });

          $("#cmbTipoOp").change(function () {

              if ($("#cmbTipoOp").val() != '3') {
                  $("#B_Buscar").show();
                  $("#B_DEP").hide();
              } else {
                  $("#B_Buscar").hide();
                  $("#B_DEP").show();
              }


          });

          $("#popup-webcam-take-photo").click(function () {
              $("#btn_photo").click();
          });

          var v_pro = '';
          $('#Main_TxtCodSistema').prop('disabled', true);



          function PopVer(id) {
              limpiar();
              $("#btnAgregar1a").hide();
              $("#btnGuardar1a").hide();

              $("#TituloPop").text('Ver Cliente');
              $("#ModalCat").modal();

              deshabilitarFrm();


              var json = JSON.stringify
        ({
            "v_Id": id

        });

              $.ajax({
                  type: "POST",
                  url: "Clientes.aspx/WsBuscarP",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (result) {

                      if (result.d != null) {

                          $("#Main_TxtCodSistema").val(result.d.Id);
                          $("#Main_TxtCodMunual").val(result.d.Cod_Manual);
                          $("#Main_TxtCuit").val(result.d.Doc_No);
                          $("#CmbTipoDoc").val(result.d.Tipo_Doc);

                          // $("#cmbAfip").removeAttr('selected');
                          $("#cmbAfip").val(result.d.Iva);
                          // $("#cmbAfip option[value=" + result.d.Iva + "]").attr("selected", true);
                          $("#Main_TxtNombre").val(result.d.Nombre);
                          $("#Main_TxtApellido").val(result.d.Apellido);
                         
                          
                          $("#Main_TxtObservacion").val(result.d.Observacion);
                          $("#cmbCtaContable").val(result.d.Cta_contable);
                          $("#Main_TxtCalle").val(result.d.Calle);
                          $("#Main_TxtNum").val(result.d.Numero);
                          $("#Main_TxtDpto").val(result.d.Dpto);

                          $("#HddProv").val(result.d.Provincia);
                          $("#HddDep").val(result.d.Departamento);
                          $("#HddDis").val(result.d.Distrito);


                          $("#cmbPais").val(result.d.Pais);
                          $("#Main_TxtCp").val(result.d.Cp);
                          v_pro = result.d.Pais;
                          ListarProvincia(result.d.Pais);
                          ListarDepartamento(result.d.Provincia);
                          ListarDistrito(result.d.Departamento);


                          $("#Main_TxtContactoNom").val(result.d.Contac_Nomb);
                          $("#Main_TxtContacTel").val(result.d.Contac_Tel);
                          $("#Main_TxtContactCel").val(result.d.Contac_Cel);
                          $("#Main_TxtContacMail").val(result.d.Contac_Mail);
                          $("#Main_TxtEmpTel").val(result.d.Emp_Tel);
                          $("#Main_TxtEmpCel").val(result.d.Emp_Cel);
                          $("#Main_TxtEmpMail").val(result.d.Emp_Mail);
                          $("#Main_TxtEmpWeb").val(result.d.Emp_Web);

                          $("#cmbProv").val(result.d.Provincia);
                          $("#cmbDepartamento").val(result.d.Departamento);
                          $("#cmbDistrito").val(result.d.Distrito);


                      }
                  },

                  error: errores
              });


          }
          function PopMod(id, obj) {

              if ($(obj).hasClass('active')) {
                  $(obj).removeClass('active');
              } else {
                  $(obj).addClass('active').siblings().removeClass('active');
              }
           //   habilitarFrm();
              //    limpiar();
              $("#tabs").tabs({ active: 0 });
              
              $("#hddIDUSER").val(id);
              $("#btnAgregar1a").show();
              $("#btnGuardar1a").hide();

              $("#TituloPop").text('Modificar Datos');
              $("#ModalCat").modal();
         
           

                  var json = JSON.stringify
            ({
                "v_Id": id
              
            });

                  $.ajax({
                      type: "POST",
                      url: "Empleados.aspx/WsBuscarP",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (result) {
                         
                          if (result.d != null) { 
                             
                              $("#Main_TxtEmp").val(result.d.BADGENUMBER);
                              $("#Main_TxtNacionalidad").val(result.d.MINZU);
                              $("#Main_TxtTitulo").val(result.d.TITLE);
                              $("#Main_TxtNac").val(result.d.BIRTHDAY);
                              $("#CmbSex").children("option:selected").removeAttr("selected");
                              $("#Main_TxtDir").val(result.d.PHOTO);

                              if (result.d.GENDER != '') {
                                   
                                  if (result.d.GENDER == 'Masc' || result.d.GENDER == 'Masculin') {
                                      setSelectByValue("CmbSex", "Masc");

                                  } else {
                                      setSelectByValue("CmbSex", "Femen");
                                  }

                              } else {
                                   
                                  setSelectByValue("CmbSex","0");
                              }
                              $("#CmbLugar").val(result.d.DEFAULTDEPTID).trigger('change');
                              $("#CmbTurno").val(result.d.Turno).trigger('change');

                              $("#Main_TxtDir").val(result.d.STREET);
                              
                              $("#Main_TxtNombre").val(result.d.NAME);
                              $("#Main_TxtNo").val(result.d.SSN);
                              
                              $("#Main_TxtOfi").val(result.d.OPHONE);
                              $("#Main_TxtFechaEmp").val(result.d.HIREDDAY);
                              $("#Main_TxtCel").val(result.d.PAGER);
                              $("#Main_TxtCardNum").val(result.d.CardNo);
                              $("#myUploadedImg").removeAttr('src');
                    
                              $("#Main_TxtFin").val(result.d.ENDDATE);
                              $("#Main_TxtInicio").val(result.d.STARTDATE);
                              // encadeno la hora para q  no me cachee la imagen
                              $("#myUploadedImg").attr('src', 'Imagenes.aspx?'+ new Date().getTime());
                            
                              if (result.d.HOLIDAY=='1') {
                                  $("#CkFeriado").prop("checked", true);
                              } else {
                                  $("#CkFeriado").prop("checked", false);
                              }
                              

                          }
                      },
                          
                      error: errores
                  });


          }



          function setSelectByValue(eID, val) { //Loop through sequentially//
              var ele = document.getElementById(eID);
              for (var ii = 0; ii < ele.length; ii++)
                  if (ele.options[ii].value == val) { //Found!
                      ele.options[ii].selected = true;
                      return true;
                  }
              return false;
          }

          function PopAlta() {
              habilitarFrm();
              limpiar();

              $("#btnAgregar1a").hide();
              $("#btnGuardar1a").show();

              $("#TituloPop").text('Alta de Cliente');
              $("#ModalCat").modal();


            
          }

          function limpiar() {

              $("#tabs").tabs({ active: 0 });

              $("#HddProv").val('');
              $("#HddDep").val('');
              $("#HddDis").val('');
              $("#Main_TxtContactoNom").val('');
              $("#Main_TxtContacTel").val('');
              $("#Main_TxtContactCel").val('');
              $("#Main_TxtContacMail").val('');
              $("#Main_TxtEmpTel").val('');
              $("#Main_TxtEmpCel").val('');
              $("#Main_TxtEmpMail").val('');
              $("#Main_TxtEmpWeb").val('');
               
              $('#Main_TxtCodMunual').val('');
              $('#Main_TxtCodSistema').val('0');
              $('#Main_TxtObservacion').val('');
              $('#Main_TxtCuit').val('');

              $('#Main_TxtNombre').val(''); 
              $('#Main_TxtApellido').val('');
              $('#Main_TxtCalle').val('');
              $('#Main_TxtNum').val('');
              $('#Main_TxtDpto').val('');
              $('#Main_TxtCp').val('');

           
             

              $("#cmbPais").attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
              $("#cmbProv").empty();
              $('#cmbDepartamento').empty();
              $('#cmbDistrito').empty();
              $('#cmbAfip').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
              $('#cmbTipo').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");

          }
          function Buscar() {

              try {
                  var tipo = '';
                  var valor = '';

                  if ($("#cmbTipoOp").val() != '3') {
                      tipo =  $('#cmbTipoOp').val();
                      valor = $('#Main_TxtBuscar').val();                       
                  } else {
                      tipo = $('#cmbTipoOp').val();
                      valor = $('#CmbLugar2').val();
                  }
 
                  var json = JSON.stringify
                    ({
                        "v_tipo": tipo,
                        "v_valor": valor

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
 
           
          function limpiarCli() {
 

              $("#HddProv").val('');
              $("#HddDep").val('');
              $("#HddDis").val('');
              $("#Main_TxtContactoNom").val('');
              $("#Main_TxtContacTel").val('');
              $("#Main_TxtContactCel").val('');
              $("#Main_TxtContacMail").val('');
              $("#Main_TxtEmpTel").val('');
              $("#Main_TxtEmpCel").val('');
              $("#Main_TxtEmpMail").val('');
              $("#Main_TxtEmpWeb").val('');

              $('#Main_TxtCodMunual').val('');
              $('#Main_TxtCodSistema').val('0');
              $('#Main_TxtObservacion').val('');
              $('#Main_TxtCuit').val('');

              $('#Main_TxtNombre').val('');
              $('#Main_TxtApellido').val('');
              $('#Main_TxtCalle').val('');
              $('#Main_TxtNum').val('');
              $('#Main_TxtDpto').val('');
              $('#Main_TxtCp').val('');




              $("#cmbPais").attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
              $("#cmbProv").empty();
              $('#cmbDepartamento').empty();
              $('#cmbDistrito').empty();
              $('#cmbAfip').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");
              $('#cmbTipo').attr('selectedIndex', '-1').children("option:selected").removeAttr("selected");

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
          $(function () {

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
              Buscar();
              $("#Main_TxtCodSistema").prop('disabled', true);

            $('#tabs').tabs();
            ListarDias();
            ListarLugares();
               ListarPais();
               ListarTurnos();
               $(".cmbBuscar").select2();
             
          });


         
      
          function bitacora() {
              try {

                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": {

                          "Id": $("#Main_TxtCodSistema").val(),

                          "Cod_Manual": $("#Main_TxtCodMunual").val(),
                          "Tipo_Doc": $("#CmbTipoDoc").val(),
                          "Doc_No": $("#Main_TxtCuit").val(),
                          "Iva": $("#cmbAfip").val(),
                          "Nombre": $("#Main_TxtNombre").val(),
                          "Apellido": $("#Main_TxtApellido").val(),
                          "Observacion": $("#Main_TxtObservacion").val(),
                          "Cta_contable": $("#cmbCtaContable").val(),
                          "Calle": $("#Main_TxtCalle").val(),
                          "Numero": $("#Main_TxtNum").val(),
                          "Dpto": $("#Main_TxtDpto").val(),
                          "Pais": $("#cmbPais").val(),
                          "Cp": $("#Main_TxtCp").val(),
                          "Provincia": $("#cmbProv").val(),
                          "Departamento": $("#cmbDepartamento").val(),
                          "Distrito": $("#cmbDistrito").val(),


                          "Contac_Nomb": $("#Main_TxtContactoNom").val(),
                          "Contac_Tel": $("#Main_TxtContacTel").val(),
                          "Contac_Cel": $("#Main_TxtContactCel").val(),
                          "Contac_Mail": $("#Main_TxtContacMail").val(),
                          "Emp_Tel": $("#Main_TxtEmpTel").val(),
                          "Emp_Cel": $("#Main_TxtEmpCel").val(),
                          "Emp_Mail": $("#Main_TxtEmpMail").val(),
                          "Emp_Web": $("#Main_TxtEmpWeb").val()

                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Clientes.aspx/WmMod2",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: Modificado_Completo,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }
          
          function ModificarJs() {
              try {
              //    sendFile(dataURItoBlob($("#myUploadedImg").attr('src')));
                  console.log();

                  if ($("#myUploadedImg").attr('src').substring(1, 8) == "magenes") {
                      var realData = "";
                  } else {
                      var ImageURL = $("#myUploadedImg").attr('src');
                      // Split the base64 string in data and contentType
                      var block = ImageURL.split(";");
                      // Get the content type of the image
                      var contentType = block[0].split(":")[1];// In this case "image/gif"
                      // get the real base64 content of the file
                      var realData = block[1].split(",")[1];
                  }
                  var feriado = '0';
                  if ($("#CkFeriado").is(':checked')) {
                      feriado = '1'; // si respeta los feriados establecidos (no trab los feriados)
                  }
                  var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                  ({
                      // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
                      "v_obj": {
                          
                          "MINZU": $("#Main_TxtNacionalidad").val(), // nacionalidad
                          "HOLIDAY": feriado,
                          "USERID": $("#hddIDUSER").val(),
                          "GENDER": $("#CmbSex").val(),
                          "BADGENUMBER": $("#Main_TxtEmp").val(),
                          "TITLE": $("#Main_TxtTitulo").val(), 
                          "BIRTHDAY": $("#Main_TxtNac").val(),
                          "STREET": $("#Main_TxtDir").val(),
                          "NAME": $("#Main_TxtNombre").val(),
                          "SSN": $("#Main_TxtNo").val(),
                          "OPHONE": $("#Main_TxtOfi").val(),
                          "HIREDDAY": $("#Main_TxtFechaEmp").val(),
                          "PAGER": $("#Main_TxtCel").val(),
                          "CardNo": $("#Main_TxtCardNum").val(),
                          "DEFAULTDEPTID": $("#CmbLugar").val(),
                          "USER_OF_RUN": $("#CmbTurno").val(),
                          "ENDDATE": $("#Main_TxtFin").val(),
                          "STARTDATE": $("#Main_TxtInicio").val(),
                          "img": realData
                          

                      }
                  });

                  $.ajax({
                      type: "POST",
                      url: "Empleados.aspx/WmMod2",
                      data: json,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: Modificado_Completo,
                      error: errores
                  });

              } catch (e) {
                  alert(e.message);
              }
          }

        function Modificado_Completo() {
            Buscar();
 
              $("#ModalCat").modal('hide');
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
                        $('#CmbLugar').empty();
                        $('#CmbLugar2').empty();
                        //$('#CmbLugar').append(
                        //        $('<option></option>').val('0').html('- -')
                        //      );
                        var inx = '0';
                        var bb =0;
                        $.each(Especialidad, function (index, especialidades) {
                            $('#CmbLugar').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre)

                          
                                );

                            $('#CmbLugar2').append(
                               $('<option></option>').val(especialidades.Id).html(especialidades.nombre)


                             );
                            if (bb == 0) {
                                inx = especialidades.Id;
                            }
                            bb++;
                        });
                        $('#CmbLugar').val(inx).trigger('change');
                        $('#CmbLugar2').val(inx).trigger('change');
                } ),
                    error: errores
                });

               
            } catch (e) {
                alert(e.message);
            }
        }

        function ListarTurnos() {
            try {

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

                        $('#CmbTurno').append(
                               $('<option></option>').val('0').html('- -')
                             );
                        $.each(Especialidad, function (index, especialidades) {
                            $('#CmbTurno').append(
                                  $('<option></option>').val(especialidades.Id).html(especialidades.nombre)
                                );
                        });
                        $('#CmbTurno').val('0').trigger('change');
                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }


        function ListarDias() {
            try {

                var json = JSON.stringify
          ({
              "v_tipo": '',
              "v_valor": ''
          });

                $.ajax({
                    type: "POST",
                    url: "Turnos.aspx/WsListarDias",
                    data: '',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: (function (Resultado) {
                        var Especialidad = Resultado.d;
                        $('#Main_CmbDias').empty();

                        //$('#CmbLugar').append(
                        //        $('<option></option>').val('0').html('- -')
                        //      );
                        var inx = '0';
                        var bb = 0;
                        $.each(Especialidad, function (index, especialidades) {
                            $('#Main_CmbDias').append(
                                  $('<option></option>').val(especialidades.valor).html(especialidades.descripcion)


                                );

                            //if (bb == 0) {
                            //    inx = especialidades.Id;
                            //}
                            //bb++;
                        });
                       // $('#Main_CmbLugar').val(inx).trigger('change');

                    }),
                    error: errores
                });


            } catch (e) {
                alert(e.message);
            }
        }


        function ListarPais() {
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
                      success: CargarPais,
                      error: errores
                  });


              } catch (e) {
                  alert(e.message);
              }
        }

        function AltaTipoFranco() {

            try {
        
                var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
                   ({ 

                       "v_obj": {
                           "Id": 0,
                           "Siempre": $("#Main_CmbSiempre").val(),
                           "Dia": $("#Main_CmbDias").val(),
                           "Fecha": $("#Main_TxtFranco").val(),
                           "User_id": $("#hddIDUSER").val(),
                           "Descripcion": "FRANCO"

                       }
                   });
                    $.ajax({
                        type: "POST",
                        url: "Empleados.aspx/WmAltaFranco",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Resultado) {
                            BuscarFranco();
                        }),
                        error: errores
                    });
              
            } catch (e) {
                alert(e.message);

            }

        }
        function AltaTipoLugar() {

            try {
                if ($("#Main_TxtCat").val() != '') {
                    var json = JSON.stringify
                ({
                    "v_tipo": $("#Main_TxtCat").val()
                });
                    $.ajax({
                        type: "POST",
                        url: "Empleados.aspx/WsAltaLugar",
                        data: json,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: (function (Resultado) {
                            ListarLugares();
                            $("#ModalCat2").modal('hide');
                            Inscidencias();
                            $("#Main_TxtCat").val('');
                        }),
                        error: errores
                    });
                } else { alert('debe ingresar el nombre del tipo del turno'); }
            } catch (e) {
                alert(e.message);

            }

        }
        function Inscidencias() {
            $("#ModalCat").modal();

        }
        function cerrarbtn() {

            $("#ModalCat2").modal('hide');
            Inscidencias();
            $("#Main_TxtCat").val('');
        }

        function cerrarbtn2() {

            $("#ModalCat3").modal('hide');
            Inscidencias();
            $("#Main_TxtCat").val('');
        }
          function CargarPais(Resultado) {

              var Especialidad = Resultado.d;

              $('#cmbDep').empty();

              $('#cmbDep').append('<option value="0">- -</option>');

              $.each(Especialidad, function (index, especialidades) {
                  $('#cmbDep').append(
                        $('<option></option>').val(especialidades.Id).html(especialidades.nombre)
                      );
              });


              //select un item  para select2
           //   $("#cmbPais").val(0).change();


          }

       
      

          function validarEmail(valor) {
              if (valor != '') {
                  if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(valor)) {
                      $("#TxtMsj").text('');
                  } else {
                      $("#TxtMsj").text("La dirección de email es incorrecta!.");
                  }
              }

          }

          function gvDel(Ids, row) {

              if (confirm("¿Esta seguro que desea eliminar el registro?")) {
                  gvok(Ids);

                  $(row).closest("tr").remove();
                   
              }

          }

          function gvok(v_id) {

              try {

                  if (true) {


                      var json = JSON.stringify
                        ({
                            "v_id": v_id

                        })
                      $.ajax({
                          type: "POST",
                          url: "Clientes.aspx/gvProv_del",
                          data: json,
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: '',
                          error: errores
                      });
                  }
              } catch (e) {
                  alert(e.message);
              }
          }
         
          function habilitarFrm() {
              
              $("#Main_TxtObservacion").prop('disabled', false);
              $("#CmbTipoDoc").prop('disabled', false);
              $("#Main_TxtObservacion").prop('disabled', false);
              $("#Main_TxtCodMunual").prop('disabled', false);
              $("#Main_TxtCuit").prop('disabled', false);
              $("#cmbAfip").prop('disabled', false);
              $("#Main_TxtDenominacion").prop('disabled', false);
              $("#Main_TxtNombre").prop('disabled', false);
              $("#Main_TxtApellido").prop('disabled', false);
       
              $("#cmbCtaContable").prop('disabled', false);
              $("#Main_TxtCalle").prop('disabled', false);
              $("#Main_TxtNum").prop('disabled', false);
              $("#Main_TxtDpto").prop('disabled', false);
              $("#cmbPais").prop('disabled', false);
              $("#Main_TxtCp").prop('disabled', false);
              $("#cmbProv").prop('disabled', false);
              $("#cmbDepartamento").prop('disabled', false);
              $("#cmbDistrito").prop('disabled', false);
              $("#Main_TxtContactoNom").prop('disabled', false);
              $("#Main_TxtContacTel").prop('disabled', false);
              $("#Main_TxtContactCel").prop('disabled', false);
              $("#Main_TxtContacMail").prop('disabled', false);
              $("#Main_TxtEmpTel").prop('disabled', false);
              $("#Main_TxtEmpCel").prop('disabled', false);
              $("#Main_TxtEmpMail").prop('disabled', false);
              $("#Main_TxtEmpWeb").prop('disabled', false);

          }
          function deshabilitarFrm() {

             
              $("#CmbTipoDoc").prop('disabled', true);
              $("#Main_TxtObservacion").prop('disabled', true);
              $("#Main_TxtCodMunual").prop('disabled', true);
              $("#Main_TxtCuit").prop('disabled', true);
              $("#cmbAfip").prop('disabled', true);
             $("#Main_TxtNombre").prop('disabled', true);
              $("#Main_TxtApellido").prop('disabled', true);

              $("#cmbCtaContable").prop('disabled', true);
              $("#Main_TxtCalle").prop('disabled', true);
              $("#Main_TxtNum").prop('disabled', true);
              $("#Main_TxtDpto").prop('disabled', true);
              $("#cmbPais").prop('disabled', true);
              $("#Main_TxtCp").prop('disabled', true);
              $("#cmbProv").prop('disabled', true);
              $("#cmbDepartamento").prop('disabled', true);
              $("#cmbDistrito").prop('disabled', true);
              $("#Main_TxtContactoNom").prop('disabled', true);
              $("#Main_TxtContacTel").prop('disabled', true);
              $("#Main_TxtContactCel").prop('disabled', true);
              $("#Main_TxtContacMail").prop('disabled', true);
              $("#Main_TxtEmpTel").prop('disabled', true);
              $("#Main_TxtEmpCel").prop('disabled', true);
              $("#Main_TxtEmpMail").prop('disabled', true);
              $("#Main_TxtEmpWeb").prop('disabled', true);

          }

          $("#Main_CmbSiempre").change(function () {
          
              if( $("#Main_CmbSiempre").val()=='SIEMPRE'){

                  $("#siempre").show();
                  $("#una").hide();

              } else {
                  $("#siempre").hide();
                  $("#una").show();
              }
                 
              
          })
          $(".campoFecha").mask("99/99/9999");




    </script>
   


    <script src="jquery.webcam.js"></script>

              
   <script type="text/javascript">


      
       $(function () { 

       });

       function gvdel_franco(ids) {
         
           var json = JSON.stringify
                     ({
                         "v_tipo": ids
                     });
           $.ajax({
               type: "POST",
               url: "Empleados.aspx/WsBajaFranco",
               data: json,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: (function (Resultado) {
                   BuscarFranco();
               }),
               error: errores
           });
       }


       function gvTipo_del(ids) {
           var json = JSON.stringify
                     ({
                         "v_tipo": ids
                     });
           $.ajax({
               type: "POST",
               url: "Empleados.aspx/WsBajaTipo",
               data: json,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: (function (Resultado) {
                   $('#CmbLugar option').each(function () {
                       if ($(this).val() == ids) {
                           $(this).remove();
                       }
                   });
                    
                   ListarLugares;
                   $("#ModalCat2").modal('hide');
                   Inscidencias();
                   $("#Main_TxtCat").val('');

                  
                  
               }),
               error: errores
           });
       }

       function ok() {

           $('#webcam').webcam({
               noCameraFound: function () {
                   this.debug('error', 'Web camera is not available');
               },
               error: function (e) {
                   this.debug('error', 'Internal camera plugin error');
               },
               cameraDisabled: function () {
                   this.debug('error', 'Please allow access to your camera');
               },
               debug: function (type, string) {
                   if (type == 'error') {
                       $(".webcam-error").html(string);
                   } else {
                       $(".webcam-error").html('');
                   }
               },
               cameraEnabled: function () {
                   this.debug('notice', 'Camera enabled');
                   if (this.isCameraEnabled) return;
                   this.isCameraEnabled = true;
                   $('#popup-webcam-cams')
                       .append($.map(this.getCameraList(), function (cam, i) {
                           return '<option value="' + i + '">' + cam + '</option>';
                       }).join(''));
                   setTimeout($.proxy(function () {
                       this.setCamera('0');
                       $('#popup-webcam-take-photo')
                           .prop('disabled', false)
                           .show();
                   }, this), 750);
               }
           });
       }

           $('#popup-webcam-cams').change(function () {
               var $cam = $('#webcam');
               var success = $cam.webcam('setCamera', $(this).val());
               if (!success) {
                   $cam.webcam('debug', 'error', 'Unable to select camera');
               } else {
                   $cam.webcam('debug', 'notice', 'Camera changed');
               }
           });
           $('#popup-webcam-take-photo').click(function (e) {
               e.preventDefault();
               var api = $('#webcam').data('webcam');




               var result = api.save();
               if (result && result.length) {

                   var v_tipo = "data:image/jpeg;base64," + result;
            //       sendFile(dataURItoBlob(v_tipo));

                   //var img = new Image();
                   //img.src = "data:image/jpeg;base64," + result;
                   //$('#result').append(img);


                   $("#myUploadedImg").attr("src", v_tipo);

                   //  alert('base64encoded jpeg (' + shotResolution[0] + 'x' + shotResolution[1] + '): ' + result.length + 'chars');
                   /* resume camera capture */
                   api.setCamera($('#popup-webcam-cams').val());
               } else {
                   api.debug('error', 'Broken camera');
               }







           });
     



           function sendFile(file) {

               var formData = new FormData();
               formData.append('file', file);
               $.ajax({
                   type: 'post',
                   async: false,

                   url: 'subirDB.ashx?Id='+$("#hddIDUSER").val(),
                   data: formData,
                   success: function (status) {

                   },
                   processData: false,
                   contentType: false,
                   error: function () {
                       alert("Error en la carga");
                   }
               });
           }



       function dataURItoBlob(dataURI) {

           var byteString,
               mimestring

           if (dataURI.split(',')[0].indexOf('base64') !== -1) {
               byteString = atob(dataURI.split(',')[1])
           } else {
               byteString = decodeURI(dataURI.split(',')[1])
           }
          
           mimestring = dataURI.split(',')[0].split(':')[1].split(';')[0]

           var content = new Array();
           for (var i = 0; i < byteString.length; i++) {
               content[i] = byteString.charCodeAt(i)
           }

           return new Blob([new Uint8Array(content)], { type: mimestring });
       }


       function PopAlta2() {
           
           $("#ModalCat4").modal('hide');
           //$("#ModalHoras").modal('hide');


           $("#Msg").text("");
           $("#tur2").text('ALTA TURNO');
           $("#ModalHoras").modal();
           $("#Main_nombre1").val('');

           $("#btnAgregar1b").hide();
           $("#btnAgregar2b").show();

           $('#addHs').attr('onclick', 'PopAltaHs(0,\"\")');

           $('#btnGuardar1b').attr('onclick', 'AltaJsHs(0,\"\")');

           cantidad = $("#grillaHs tbody").find("tr").length;


           for (var ei = 1; ei < cantidad + 1 ; ei++) {

               $("#" + ei).prop('checked', false);
           }

           for (var i = 1; i < 7 + 1; i++) {

               $("#d" + i).prop('checked', false);
           }

           var json = JSON.stringify
   ({
       "v_ids": 0

   });

           $.ajax({
               type: "POST",
               url: "Turnos.aspx/WsListarDeil",
               data: json,
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (result) {

                   if (result.d != null) {
                       var Pacientes = result.d;
                       $("#ModalHoras").modal();

                       var cant = 0;
                       $.each(Pacientes, function (index, pacientes) {

                           $("#" + pacientes.SCHCLASSID).prop('checked', true);
                           cant++;
                       });
                       if (cant > 0) {
                           $("#ResultadoDias").hide();
                       }


                   }
               },

               error: errores
           });


       }

       function PopAltaHs() {
           Cfg();
           // $("#ModalHoras").modal('hide');

           $("#Main_TxtNombre").val('');
           $("#Main_TxtEntrada").val('00:00');
           $("#Main_TxtSalida").val('00:00');



           $("#Main_TxtComienzoEntrada").val('00:00');
           $("#Main_TxtFinEntrada").val('00:00');

           $("#Main_TxtComienzoFin").val('00:00');
           $("#Main_TxtFinSalida").val('00:00');



           $("#TituloPop").text('Alta de Horario');
           $("#ModalHorasCfg").modal();

       }
       function Cfg() {

           try {

               var json = JSON.stringify
                 ({

                 });
               $.ajax({
                   type: "POST",
                   url: "Turnos.aspx/WsCfg",
                   data: '',
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: (function (Resultado) {
                       var Pacientes = Resultado.d;


                       $.each(Pacientes, function (index, pacientes) {


                           if (pacientes.descripcion == 'margenTarde') {
                               $("#Main_TxtTarde").val(pacientes.valor);
                           }
                           if (pacientes.descripcion == 'margenTemprana') {
                               $("#Main_TxtTemprano").val(pacientes.valor);
                           }


                       });

                   }),
                   error: errores
               });

           } catch (e) {
               alert(e.message);
           }
       }



       $(document).ready(function () {
           //BuscaHorarios();
           //BuscaDias();
           //PopAlta2();

         
        // Add minus icon for collapse element which is open by default
        $(".collapse.in").each(function(){
            $(this).siblings(".panel-heading").find(".glyphicon").addClass("glyphicon-minus").removeClass("glyphicon-plus");
        });
        
        // Toggle plus minus icon on show hide of collapse element
        $(".collapse").on('show.bs.collapse', function(){
            $(this).parent().find(".glyphicon").removeClass("glyphicon-plus").addClass("glyphicon-minus");
        }).on('hide.bs.collapse', function(){
            $(this).parent().find(".glyphicon").removeClass("glyphicon-minus").addClass("glyphicon-plus");
        });
       });
       function BuscaDias() {

           try {
               var v_buscar = $('#cmbTipoOp').val();
               var json = JSON.stringify
                 ({

                 });
               $.ajax({
                   type: "POST",
                   url: "Turnos.aspx/WsListarDias",
                   data: '',
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: (function (Resultado) {
                       var Pacientes = Resultado.d;
                       var Tabla_Titulo = "";
                       var Tabla_Datos = "";
                       var Tabla_Fin = "";

                       $("#ResultadoDias").show();
                       $("#ResultadoDias").empty();
                       Tabla_Titulo = "<table   id='grillaDia' class='   table-hover table-striped' style='width: 100%;    text-align: left;'><thead><tr><th></th>  <th>Día <span id='diaTitulo'></span></th></tr></thead><tbody>";
                       $.each(Pacientes, function (index, pacientes) {
                           Tabla_Datos = Tabla_Datos + "<tr >    <td>&nbsp  &nbsp <input type='checkbox' id='d" + pacientes.valor + "' value='" + pacientes.valor + "'    class='selectDeb'  onclick='cargarDia(" + pacientes.valor + ")'   /></td><td>" + pacientes.descripcion + "</td></tr>";
                       });

                       Tabla_Fin = "</tbody></table>";
                       $("#ResultadoDias").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                   }),
                   error: errores
               });

           } catch (e) {
               alert(e.message);
           }
       }

 
       function BuscaHorarios() {

           try {


               //   alert( $('#cmbTipoOp').val() );

               var v_buscar = $('#cmbTipoOp').val();
               var json = JSON.stringify
                 ({
                     "v_tipo": '0',
                     "v_valor": ''
                 });
               $.ajax({
                   type: "POST",
                   url: "Turnos.aspx/WsListarHorarios",
                   data: json,
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: (function (Resultado) {
                       var Pacientes = Resultado.d;
                       var Tabla_Titulo = "";
                       var Tabla_Datos = "";
                       var Tabla_Fin = "";
                       var ckHs = 0;
                       $("#ResultadoHoras").show();
                       $("#ResultadoHoras").empty();
                       Tabla_Titulo = "<table   id='grillaHs' class='   table-hover table-striped' style='width: 100%;    text-align: left;'><thead><tr><th></th>  <th>Nombre Horario</th></tr></thead><tbody>";
                       $.each(Pacientes, function (index, pacientes) {
                           ckHs++;
                           Tabla_Datos = Tabla_Datos + "<tr onclick='Popllenar(this," + pacientes.schClassid + ",\"" + pacientes.schName + "\")'  style=' cursor:pointer'>    <td>&nbsp  &nbsp <input type='checkbox' id='" + ckHs + "'    value='" + pacientes.schClassid + "'    class='selectDeb'    /></td><td>" + pacientes.schName + " (" + pacientes.StartTime + " - " + pacientes.EndTime + ")</td></tr>";
                       });

                       Tabla_Fin = "</tbody></table>";
                       $("#ResultadoHoras").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);


                   }),
                   error: errores
               });

           } catch (e) {
               alert(e.message);
           }
       }


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
    document.getElementById("Main_TxtFranco").value = today;


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

