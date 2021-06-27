








<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnRk.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Lista_precios.aspx.cs" Inherits="HardSoft.App.Ralkal.Lista_precios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    
       <script language="JavaScript" type="text/javascript">


          
          function validNumber(e) {
              var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
              return ((tecla > 47 && tecla < 58) || tecla == 8);
          }

           function validLetter(e) {
               var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
               var especiales = [8, 32, 13];/*back, space, enter */

               for (var i in especiales) {
                   if (tecla == especiales[i]) { return true;/*break; */ }
               }
               return (((tecla > 96 && tecla < 123) || (tecla > 64 && tecla < 91)) || tecla == 8);
           }

           var nav4 = window.Event ? true : false;
           function acceptNum(evt) {
               // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46
               var key = nav4 ? evt.which : evt.keyCode;
            
               return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
           }

           function validateFloatKeyPress(el, evt, ints, decimals) {

               // El punto lo cambiamos por la coma
               if (evt.keyCode == 46) {
                   evt.keyCode = 44;
               }

               // Valores numéricos
               var charCode = (evt.which) ? evt.which : event.keyCode;
               if (charCode != 44 && charCode > 31
                   && (charCode < 48 || charCode > 57)) {
                   return false;
               }

               // Sólo una coma
               if (charCode == 44) {
                   if (el.value.indexOf(",") !== -1) {
                       return false;
                   }
                   return true;
               }

               // Determinamos si hay decimales o no
               if (el.value.indexOf(",") == -1) {
                   // Si no hay decimales, directamente comprobamos que el número que hay ya supero el número de enteros permitidos
                   if (el.value.length >= ints) {
                       return false;
                   }
               }

               else {
                   // Damos el foco al elemento
                   el.focus();
                   // Para obtener la posición del cursor, obtenemos el rango de la selección vacía
                   var oSel = this.document.selection.createRange();
                   // Movemos el inicio de la selección a la posición 0
                   oSel.moveStart('character', -el.value.length);
                   // La posición de caret es la longitud de la selección
                   iCaretPos = oSel.text.length;
                   // Distancia que hay hasta la coma
                   var dec = el.value.indexOf(",");
                   // Si la posición es anterior a los decimales, el cursor está en la parte entera
                   if (iCaretPos <= dec) {
                       // Obtenemos la longitud que hay desde la posición 0 hasta la coma, y comparamos
                       if (dec >= ints) {
                           return false;
                       }
                   }
                   else { // El cursor está en la parte decimal
                       // Obtenemos la longitud de decimales (longitud total menos distancia hasta la coma menos el carácter coma)
                       var numDecimals = el.value.length - dec - 1;
                       if (numDecimals >= decimals) {
                           return false;
                       }
                   }
               }
               return true;
           }

           function decimales(evt, control) {
               //Limita un control a números con dos decimales.
               var texto = control.value;
               var coma = texto.indexOf(',');

               if (evt.keyCode <= 13 || (evt.keyCode >= 48 && evt.keyCode <= 57)) {
                   if ((coma != -1) && (texto.length - (coma + 1)) >= 2) {
                       return false;
                   }
               }
               else if (evt.keyCode == 44 && texto.length > 1) {
                   if (coma != -1 && texto.indexOf(',', coma) != -1) {
                       return false;
                   }
               } else {
                   return false;
               }
               return true;
           }
    </script>
       


    

     <div class=" container">   <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active">
                  Nueva Lista           </li>
                                </ol>
        </nav>
    <div style="margin-top:0px;text-transform:uppercase" >
    
        
        <div class="alert alert-success">
       <strong>    Listas de Precios </strong> 
            </div>


        
       <div   style="margin-top:5px;  padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >



<div class="row" >
    <div class="col-xs-6">

        <form method="post" id="formulario">
 
	 
    <div class="form-horizontal">
         
       
        

           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Activa:</label>
         <div class="col-xs-8">
           
             <div class="checkbox" style="float: left;"    >
    <label>

    <input type="checkbox" id="CK" /> 

    </label>
  </div>
              </div>
        
     </div>
                 
       <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Nombre:</label>
         <div class="col-xs-8">
           
             <asp:TextBox ID="TxtNombre" runat="server" class="form-control   " placeholder="Nombre" ></asp:TextBox>
               
              </div>
        
     </div>
           <div class="form-group">
         <label for="inputName" class="control-label col-xs-4">Descripción:</label>
         <div class="col-xs-8">
            
             <asp:TextBox ID="TxtDescrip" runat="server" class="form-control" placeholder="Descripción" ></asp:TextBox>
         </div>
        
     </div>
       
          </div>
     
       </form> 
         </div>   
     <div class="col-xs-6">
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
          



   <div class="row" style="margin-left:0px; margin-right:0px; margin-top:5px;  padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
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

               <button id="btnGuardar1" type="button" class="btn2 btn-default   " onclick="Guardar()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Guardar
 </button>
    
             
              <button id="btnAgregar1" type="button" class="btn2 btn-default   " onclick="AltaJs()" >
    <span class=" glyphicon glyphicon-floppy-save"></span> Guardar
 </button>
    
           
        <button id="btnVolver1" type="button" class="btn2  btn-info   "  onclick="window.history.back();" >
      Volver <span class=" glyphicon glyphicon-log-out"></span>
  </button>
    
               </div> <br />
   
       <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script>
      
        function replacer(key, value) {
            if (typeof value === "string") {
                return undefined;
            }
            return value;
        }
        function AltaJs() {

            if ($("#Main_TxtNombre").val() == "") {
                $("#Main_TxtNombre").focus().after("<span class='alert-danger'>Ingrese su nombre</span>");
                return false;

            }
            
            var sal;
            try {

 
                var json = JSON.stringify
                  ({
                      "v_tipo": '',
                      "v_valor": ''

                  });
                $.ajax({
                    type: "POST",
                    url: "Lista_precios.aspx/WsListarP",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultado2,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }
        }

        function resultado2(Resultado) {
            try {


                
                var Pacientes = Resultado.d;
                var sal= "";
      
                
                $.each(Pacientes, function (index, pacientes) {
                    

                    if (index == Pacientes.length - 1) {

                        sal += '{ "Id": "0", "Id_Producto": "' + pacientes.Id + '", "Id_Lista": "1", "Precio": "' + $("#Txt_" + pacientes.Id).val() + '" }';

                    }else{
                sal += '{ "Id": "0", "Id_Producto": "' + pacientes.Id + '", "Id_Lista": "1", "Precio": "' + $("#Txt_" + pacientes.Id).val() + '" },';
            }

            });
           
            } catch (e) {
                alert(e.message);
            }

            
             

            // obj js
            //var json = JSON.stringify // esta funcion convierte un obj java scrip a json para pasarlo
            //   ({
            //       // Armo el obj q paso como parametro. Puedo pasar parametros y el obj anidado adentro
            //       "v_obj": {


            //           "Nombre": $("#Main_TxtNombre").val(),
            //           "Descripcion": $("#Main_TxtApellido").val(),
            //           "Activa": $("#CK").val(),
            //           "Detalle": [
            //                { 'Id':'',"Id_Producto": '1', 'Id_Lista': '1', 'Precio': '1' },
            //                { 'Id': '', "Id_Producto": '2', 'Id_Lista': '2', 'Precio': '2' }
            //                      ]

            //       }
            //   });
            try {





                //  var obj = JSON.stringify(json, replacer);
                // Pasar un string to objeto de js

                //var jsontext = '{"name":"x","age":"11"}';
                //var getContact = JSON.parse(jsontext);
                //alert(getContact.age);

                var ckin = '0';
                if ($('#CK').prop('checked')) {
                    ckin = '1';
                }
                
                // despues el obj js lo paso json cn stringify
                var obj1 = '{"v_obj": {"Nombre":"' + $('#Main_TxtNombre').val() + '" ,"Descripcion":"' + $('#Main_TxtDescrip').val() + '" ,"Activa":"' + ckin + '" , "Detalle": [  ' + sal + ' ] }}';

                // primero paso el el string a obj js y despues el obj js lo paso json cn stringify
                var obj = JSON.stringify(JSON.parse(obj1));

                $.ajax({
                    type: "POST",
                    url: "Lista_precios.aspx/WmAltaP",
                    data: obj1,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: Alta_Completo,
                    error: errores
                });

                Limpiar(this);
            } catch (e) {
                alert(e.message);
            }






        }


        function Buscar() {

            try {


                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      "v_tipo": '',
                      "v_valor": ''

                  });
                $.ajax({
                    type: "POST",
                    url: "Lista_precios.aspx/WsListarP",
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
            $(location).attr("href", "Puesto_per.aspx?TipoOpA=Ver&Ids=" + Ids);
        }


        function Limpiar(frm) {
            var inputs = document.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                inputs[i].value = "";
            }
        }

        function resultado(Resultado) {
            var Pacientes = Resultado.d;
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#Resultado").show();
            $("#Resultado").empty();
            Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>Código</th><th>Nombre</th><th>Precio</th></tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {
                Tabla_Datos = Tabla_Datos + "<tr ><td >" + pacientes.Codigo + "</td><td>" + pacientes.Nombre + "</td><td><input type='text' style='width: 100px;margin: auto;' class='form-control' id='Txt_" + pacientes.Id + "' onkeypress='return acceptNum(event)' /></td></tr>";
            });

            Tabla_Fin = "</tbody></table>";
            $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
        }

        function errores(msg) {
            var jsonObj = JSON.parse(msg.responseText);
            alert('Error: ' + jsonObj.Message);
        }

        function Alta_Completo() {
            alert("Registro dado de alta");
        }

        function Modificado_Completo() {
            alert("Registro completo");
        }
        function Quitar_Completo() {
            alert("Registro Eliminado");
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
            var Idsp = getUrlParameter('Idsp');
            if (Idsp > 0) {

                $('#btnAgregar1').hide();
                $('#btnGuardar1').show();
               
                Cargar(Idsp);
            } else {
                Buscar();
                $('#btnAgregar1').show();
                $('#btnGuardar1').hide();
            }

         
             
        });

        function Guardar() {
          
          
            var ids = getUrlParameter('Idsp');
            if ($('#CK').prop("checked")) {
                
                tipos = "1";
            } else {
                tipos = "0";
                 
            }
            
            var json = JSON.stringify
                 ({
                   
                     "v_valor": ids,
                     "v_tipo": tipos
                 });
            $.ajax({
                type: "POST",
                url: "Lista_precios.aspx/WsActivar",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: exito,
                error: errores
            });



        }

        function exito() {
            alert("Guardado");
        }

        function Cargar(Idsp) {

            try {


                //   alert( $('#cmbTipoOp').val() );

                var v_buscar = $('#cmbTipoOp').val();
                var json = JSON.stringify
                  ({
                      
                           
                          "v_valor": Idsp
                                        });
                $.ajax({
                    type: "POST",
                    url: "Lista_precios.aspx/WsListar",
                    data: json,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: resultadoCargar,
                    error: errores
                });

            } catch (e) {
                alert(e.message);
            }


        }
        function resultadoCargar(Resultado) {
            var Pacientes = Resultado.d;
           // var Pacientes = Pacientes2.Detalle;
            


            $("#Main_TxtNombre").val(Pacientes.Nombre);
            $('#Main_TxtNombre').prop('disabled', true);
            $("#Main_TxtDescrip").val(Pacientes.Descripcion);
            $('#Main_TxtDescrip').prop('disabled', true);

            if (Pacientes.Activa == 'True') {
                                $('#CK').prop("checked", true);               
            }

        
            var Tabla_Titulo = "";
            var Tabla_Datos = "";
            var Tabla_Fin = "";

            $("#Resultado").show();
            $("#Resultado").empty();
            Tabla_Titulo = "<table class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th>Código</th><th>Nombre</th><th>Precio</th></tr></thead><tbody>";
            $.each(Pacientes.Detalle, function (index, pacientes) {
                Tabla_Datos = Tabla_Datos + "<tr ><td >" + pacientes.Producto.Codigo + "</td><td>" + pacientes.Producto.Nombre + "</td><td>" + parseFloat(pacientes.Precio).toFixed(2) + "</td></tr>";
            });

            Tabla_Fin = "</tbody></table>";
            $("#Resultado").html(Tabla_Titulo + Tabla_Datos + Tabla_Fin);
        }
         

        

    </script>


          <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>
   


</asp:Content>
