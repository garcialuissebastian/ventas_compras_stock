<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnHosp.Master" enableEventValidation="false" AutoEventWireup="true" enableEventValidation="false" CodeBehind="AltaAud.aspx.cs" Inherits="HardSoft.App.Hospital.AltaAud" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <script language="JavaScript" type="text/javascript">

        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>

     
    
       
    <div class=" container" style="margin-top:0px;text-transform:uppercase" >
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                     Audiencias            </li>
                                </ol>
        </nav>
       
 
        
        <div class="alert alert-success">
          Alta de Audiencia
       </div>     
        
     

<div class="row"  style="text-transform:uppercase; margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
<div >
     <div class="row" style="margin-top:10px">
         <div class="col-xs-6"></div>
          <div class="col-xs-6">
        <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Fecha: </label>
         <div class="col-xs-8">

   <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtDesde" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup" runat="server" TargetControlID="TxtDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
      
         </div>
           
        </div>
   </div>

                  <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Lugar: </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtLugar1" runat="server" class="form-control" Width="180px" ></asp:TextBox>
      
         </div>
           
        </div>
   </div>
</div>
 


</div>
    <div class="alert alert-info" style="text-align:left;font-weight:700"> Requirentes o Requeridos:</div>

    <div class="col-xs-6">
        <div class="form-horizontal">

                   <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Tipo : </label>
         <div class="col-xs-8">

             <asp:DropDownList ID="CmbTipoRq" runat="server" CssClass="form-control">
                 <asp:ListItem>REQUIRENTE</asp:ListItem>
                 <asp:ListItem>REQUERIDO</asp:ListItem>
             </asp:DropDownList>
      
         </div>
           
     </div>


               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Apellido : </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtApellido" runat="server" class="form-control" ></asp:TextBox>
      
         </div>
           
     </div>
        
          <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Nombre : </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtNombre" runat="server" class="form-control" ></asp:TextBox>
      
         </div>
           
     </div>
      
      
   
            
            
                   <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">DNI : </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtDni" runat="server" class="form-control" onKeyPress="return acceptNum(event)"></asp:TextBox>
      
         </div>
           
     </div>
        
             <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Lugar de desempeño: </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtLugar" runat="server" class="form-control" ></asp:TextBox>
      
         </div>
           
     </div>
            
              </div>
          </div>

     <div class="col-xs-6">

         <div style="float:left;margin-top:200px">
                       <button id="btnAdd" type="button" class="btn2 btn-danger   " onclick="gvRq()" >
    <span class=" glyphicon glyphicon-plus"></span> Agregar 
 </button>

         </div>


    </div>

    </div>



  
         <div class="row">
    <div class="col-xs-12">
    <div id="ResultadoGv"  style="overflow-y: auto; overflow-x: hidden; height: 150px; width: 100%; background-color:rgb(240, 244, 251) "></div>
      
    </div>




    <div style="margin:auto;    text-align: center; margin-top:5px">
         <asp:Label ID="Label1" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField2" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
</div>

 <div class="alert alert-info" style="text-align:left;font-weight:700;margin-top:10px">Descripción del conflicto:</div>

    <div class="row">
        <div class="col-lg-12">
            <asp:TextBox ID="TxtConflicto" runat="server" CssClass="form-control" TextMode="MultiLine" Width="100%" Height="250px"></asp:TextBox>



        </div>

    </div>

     <div class="alert alert-info" style="text-align:left;font-weight:700;margin-top:10px">Cantidad de audiencias:</div>

    <div class="row">
        <div class="col-lg-6">
                 <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Conjunta  </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtConjunta" runat="server" class="form-control"  Width="50px"  onKeyPress="return acceptNum(event)"></asp:TextBox>
      
         </div>
    </div>         

     </div>
        </div>

              <div class="col-lg-6">
                 <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Privada  </label>
         <div class="col-xs-8">

 <asp:TextBox ID="TxtPrivada" runat="server" class="form-control" Width="50px" onKeyPress="return acceptNum(event)"></asp:TextBox>
      
         </div>
    </div>         

     </div>
        </div>

    </div>

    <div class="alert alert-info" style="text-align:left;font-weight:700;margin-top:10px">Duración del procedimiento:</div>

    <div class="row">
        <div class="col-lg-6">
                 <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Fecha de la </br> 1° Audiencia  </label>
         <div class="col-xs-8">

    <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtPrimera" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">

      <asp:ImageButton ID="imgPopup2" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup2" runat="server" TargetControlID="TxtPrimera"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
             
              
         </div>
    </div>         

     </div>
        </div>

              <div class="col-lg-6">
                 <div class="form-horizontal">
              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Fecha de la </br> última Audiencia  </label>
         <div class="col-xs-8">

    <div class="input-group date" data-provide="datepicker" style="width:180px">
    <asp:TextBox ID="TxtUltima" runat="server"  placeholder="dia/mes/año"  CssClass="campoFecha form-control" ></asp:TextBox> 
    <div class="input-group-addon">

      <asp:ImageButton ID="imgPopup3" ImageUrl="~/images/calendario.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender2"   PopupButtonID="imgPopup3" runat="server" TargetControlID="TxtUltima"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 
             
              
         </div>
    </div>   

     </div>
        </div>

    </div>


      <div class="alert alert-info" style="text-align:left;font-weight:700;margin-top:10px">Convenio de conflicto:</div>

    <div class="row">
        <div class="col-lg-6">
                 <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> </label>
         <div class="col-xs-8">
               <asp:RadioButtonList ID="ChConvenio" runat="server"  CssClass="form-control"   >
              <asp:ListItem Text=" SI"  Value="SI"   >  </asp:ListItem>
                <asp:ListItem Text=" NO" Value="NO"></asp:ListItem>

        </asp:RadioButtonList>
  
         </div>
    </div>         

     </div>
        </div>

              <div class="col-lg-6">
                 
          
     </div>
        

    </div>


     <div class="alert alert-info" style="text-align:left;font-weight:700;margin-top:10px">Acuerdo de las partes:</div>

    <div class="row">
        <div class="col-lg-6">
                 <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4"> </label>
         <div class="col-xs-8">
               <asp:RadioButtonList ID="ChAcuerdo" runat="server"  CssClass="form-control"   >
              <asp:ListItem Text=" SI"  Value="SI"   >  </asp:ListItem>
                <asp:ListItem Text=" NO" Value="NO"></asp:ListItem>

        </asp:RadioButtonList>
  
         </div>
    </div>         

     </div>
        </div>

              <div class="col-lg-6">
                 
          
     </div>
        

    </div>

  <div class="alert alert-info" style="text-align:left;font-weight:700;margin-top:10px">Se arribo a través de:</div>

    <div class="row">
        <div class="col-lg-6">
                 <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Mediación  </label>
         <div class="col-xs-8">

             <asp:CheckBox ID="ChMediacion" runat="server" />
         </div>
    </div>         

                              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Negociación  </label>
         <div class="col-xs-8">

             <asp:CheckBox ID="ChNegociacion" runat="server" />
         </div>
    </div>   
     </div>
        </div>

              <div class="col-lg-6">
                 <div class="form-horizontal">
               <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Arbitraje  </label>
         <div class="col-xs-8">

             <asp:CheckBox ID="ChArbitraje" runat="server" />
         </div>
    </div>         

                              <div class="form-group">
         <label for="TxtNombre" class="control-label col-xs-4">Facilitación  </label>
         <div class="col-xs-8">

             <asp:CheckBox ID="ChFacilitacion" runat="server"   />
         </div>
    </div>      

     </div>
        </div>

    </div>
</div>
   


      
        
<div class="row">
    <div style="margin:auto;    text-align: center;">
         <asp:Label ID="LblMsg" runat="server" Text="" CssClass="alert-danger"> </asp:Label>
    </div>
      <asp:HiddenField ID="HiddenField1" runat="server"   />
    <div style="display:none">
        <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
          <asp:TextBox ID="TxtPuesto" runat="server"></asp:TextBox>
    </div>
</div>
        






         

   <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
        
 <button id="btnGuardar1" type="button" class="btn2 btn-default"  onclick="guardar()" >
    <span class="   glyphicon glyphicon-floppy-disk"></span> Guardar
  </button>

        <button id="btnVolver1" type="button" class="btn2  btn-info  "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
        <div style="display:none">
       <asp:Button ID="Guardar" runat="server" Text="Button" OnClick="Guardar_Click" />
      </div>
              <br />
 
 
                      


               </div>

        
        <br />


<script>
    function gvRq() {

        try {
        
           
                var json = JSON.stringify
                  ({
                      "v_obj": {

                          "Id": '0',
                          "Apellido": $('#Main_TxtNombre').val(),
                          "Nombre": $('#Main_TxtApellido').val(),
                          "Dni": $('#Main_TxtDni').val(),
                          "Lugar": $('#Main_TxtLugar').val(),
                          "Tipo": $('#Main_CmbTipoRq').val(),
                          "Id_aud": '0'
                      }
                  })

                
                $.ajax({
                    type: "POST",
                    url: "AltaAud.aspx/gvRq",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoAdd,
                    error: errores
                });
            
        } catch (e) {
            alert(e.message);
        }
    }

    function resultadoAdd(Resultado) {

        
        var Pacientes = Resultado.d;
        var Tabla_Titulo = "";
        var Tabla_Datos = "";
        var Tabla_Fin = "";
        var v_total = 0;
        $("#ResultadoGv").show();
        $("#ResultadoGv").empty();
        Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>#</th> <th>Apellido</th> <th>Nombre</th><th>DNI</th><th>Lugar de desempeño</th><th>Tipo</th></tr></thead><tbody>";
        $.each(Pacientes, function (index, pacientes) {
            var Total = 0;
            if (pacientes.Cant != 0) {
               
            } else {

                Total = pacientes.Precio;
            }

            v_total = v_total + Total;
            Tabla_Datos = Tabla_Datos + "<tr ><td onclick='gvRq_del(" + pacientes.Id + ");'    style='cursor:pointer;background-image:url(/images/boton-eliminar.png); background-position:50%; background-repeat:no-repeat;'> </td><td>" + pacientes.Apellido + "</td><td>" + pacientes.Nombre + "</td><td>" + pacientes.Dni + "</td><td>" + pacientes.Lugar + "</td><td>" + pacientes.Tipo + "</td></tr>";
        });

        Tabla_Fin = "</tbody></table>";
        $("#ResultadoGv").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);



        $('#Main_TxtNombre').val('');
        $('#Main_TxtApellido').val('');
        $('#Main_TxtDni').val('');
         $('#Main_TxtLugar').val('');
        
    }

    function guardar() {

        $('#Main_Guardar').click();


    }
    function gvRq_del(v_id) {

        try {

           

                var json = JSON.stringify
                  ({
                      "v_id": v_id

                  })
                $.ajax({
                    type: "POST",
                    url: "AltaAud.aspx/gvRq_del",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoAdd,
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
</script>
      
          
   <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   
        
          <link href="http://www.hardsoft.com.ar/css/select2.css" rel="stylesheet" />
     <link href="http://www.hardsoft.com.ar/css/select2-bootstrap.css" rel="stylesheet" />
    <script src="http://www.hardsoft.com.ar/js/select2.js"></script>


    </div>


</asp:Content>
