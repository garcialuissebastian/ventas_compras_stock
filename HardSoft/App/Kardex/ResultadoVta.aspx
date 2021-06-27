<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="ResultadoVta.aspx.cs" Inherits="HardSoft.App.Kardex.ResultadoVta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
 
    

      var chart;
      var data;
  
      function drawChart() { 
          var data2 = "";
          var json = JSON.stringify
                  ({
                      "anio": $('#cmbTipoOp').val()
                     
                  });
              $.ajax({
                  type: "POST",
                  url: "ResultadoVta.aspx/GetChartData",
                  data: json,
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (r) {
                      pacientes = r.d;
                    
                      
                        data = google.visualization.arrayToDataTable([
                        ["Mes", "Ingreso $", { role: "style" }],
                        ["Enero", parseFloat(pacientes[0].replace(',', '.')), "#b87333"],
                        ["Febrero", parseFloat(pacientes[1].replace(',', '.')), "gold"],
  ["Marzo", parseFloat(pacientes[2].replace(',', '.')), "silver"],
                     ["Abril", parseFloat(pacientes[3].replace(',', '.')), "color: #e5e4e2"],
                       ["Mayo", parseFloat(pacientes[4].replace(',', '.')), "#b87333"],
                         ["Junio", parseFloat(pacientes[5].replace(',', '.')), "gold"],
                           ["Julio", parseFloat(pacientes[6].replace(',', '.')), "silver"],
                             ["Agosto", parseFloat(pacientes[7].replace(',', '.')), "color: #e5e4e2"],
                               ["Septiembre", parseFloat(pacientes[8].replace(',', '.')), "#b87333"],
                                   ["Octubre", parseFloat(pacientes[9].replace(',', '.')), "gold"],
                                    ["Noviembre", parseFloat(pacientes[10].replace(',', '.')), "silver"],
                                       ["Diciembre", parseFloat(pacientes[11].replace(',', '.')), "color: #e5e4e2"]
                      ]);

                
                     var view = new google.visualization.DataView(data);
                     view.setColumns([0, 1,
                                      {
                                          calc: "stringify",
                                          sourceColumn: 1,
                                          type: "string",
                                          role: "annotation"
                                      },
                                      2]);

                     var options = {
                         title: "",
                         width: 560,
                         height: 300,
                         bar: { groupWidth: "95%" },
                         legend: { position: "none" },
                         backgroundColor: '#f1f1f1',
                     };


   //                  var formatter = new google.visualization.NumberFormat(
   //{ negativeColor: 'red', negativeParens: true, pattern: '###.###' });
                      //                  formatter.format(data, 1);

// para mostral el monto es-ARG
                     var formatNumer = new google.visualization.NumberFormat({ pattern: 'decimal' });
                     formatNumer.format(data, 1);

                       chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                     google.visualization.events.addListener(chart, 'select', selectHandler);
                     chart.draw(view, options);

                     $("#miload").hide();
                  },
                  failure: function (r) {
                      alert(r.d);
                  },
                  error: function (r) {
                      alert(r.d);
                  }
              });
              
             // var data = google.visualization.arrayToDataTable(data2);
            
        
      }
    
     
       
      /**
       * Number.prototype.format(n, x, s, c)
       * 
       * @param integer n: length of decimal
       * @param integer x: length of whole part
       * @param mixed   s: sections delimiter
       * @param mixed   c: decimal delimiter
       */
      Number.prototype.format = function(n, x, s, c) {
          var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
              num = this.toFixed(Math.max(0, ~~n));

          return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
      };

      
      function selectHandler() {
          $("#ModalFc").modal();
         
          var selectedItem = chart.getSelection()[0];
          $("#RowArt").hide();
          $("#RowServ").hide();
       if (selectedItem) {
           
              var value = data.getValue(selectedItem.row, selectedItem.column);
            
              $("#totaltotal").text(parseFloat(value).format(2, 3, '.', ',')); 
             
       }


       var json = JSON.stringify
                      ({
                          "v_mes": selectedItem.row+1,
                          "v_anio": $('#cmbTipoOp').val()
                      });
       $.ajax({
           type: "POST",
           url: "ResultadoVta.aspx/Wsserv_artXmes",
           data: json,
           contentType: "application/json; charset=utf-8",
           dataType: "json",
           success: (function(Result){
               var ss  ;
               ss = parseFloat(Result.d[1]);
               console.log(Result);
               if (Result.d[1] != '0' && Result.d[1] != '') {
                   $("#totalArt").text(ss.format(2, 3, '.', ','));
                   $("#RowArt").show();
               } else {
                   $("#RowArt").hide();
               }
               if (Result.d[0] != '0' && Result.d[0] != '') {
                   $("#totalServ").text(parseFloat(Result.d[0]).format(2, 3, '.', ','));
                   $("#RowServ").show();
               }
               else {
                   $("#RowServ").hide();
               }
       }),
           error: errores
       });

       var day = "";
       switch (selectedItem.row + 1) {
           case 1:
               day = "ENERO";
               break;
           case 2:
               day = "FEBRERO";
               break;
           case 3:
               day = "MARZO";
               break;
           case 4:
               day = "ABRIL";
               break;
           case 5:
               day = "MAYO";
               break;
           case 6:
               day = "JUNIO";
               break;
           case 7:
               day = "JULIO";
               break;
           case 8:
               day = "AGOSTO";
               break;
           case 9:
               day = "SEPTIEMBRE";
               break;
           case 10:
               day = "OCTUBRE";
               break;
           case 11:
               day = "NOVIEMBRE";
               break;
           case 12:
               day = "DICIEMBRE";
       }

       $("#tituloHd").text(day);
       $("#Resultado").empty();
       $("#Resultado").append( "<img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px' />")
       
       Buscar(selectedItem.row+1);
      }



      // Listen for the 'select' event, and call my function selectHandler() when
      // the user selects something on the chart.

      var today = new Date();
    
      var yyyy = today.getFullYear();
      $(function () {
          for (var i = 2017; i <  yyyy+1; i++) {               
              $("#cmbTipoOp").append($('<option>',
   {
       value: i,
       text:  i
   })); 
          }

          $("#cmbTipoOp").val(today.getFullYear());

          google.charts.load("current", { packages: ['corechart'], language: 'pt_AR' });
          google.charts.setOnLoadCallback(drawChart);

      });
      
      function PopVer(ids) {
          try { 
              $("#Main_TxtRpid").val(ids);
              $("#Main_BtnImp").click();

          } catch (e) {
              alert(e);
          }
      }


      </script>

       <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
     
     <link rel="stylesheet" href="/css/jquery-ui.css">
          
    <script src="/js/jquery.maskedinput.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>

   <script type="text/javascript" src="/js/easing.min.js"></script> 
    <script type="text/javascript" src="/js/jquery.timers.js" ></script>
  <style>
      .Tipohd {
              padding: 0;
    width: 118px;
    font-size: 14px;
    font-weight: bold;
      }
  </style>
    <div class=" container" style="margin-top: 36px;">  
  <div class="row">
     
      


              <div class="col-sm-6" style="    height: 347px; background-color: #f1f1f1; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
  <div class=" " style=" height: 40px;    padding: 2px; background-color:#333;color:white; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; margin-bottom:5px"> 
   <div class="col-sm-3">
      <select id="cmbTipoOp" class="form-control">        
          
      </select>   
      </div><div class="col-sm-9" style="    padding-top: 5px; text-transform:uppercase">
       Ingreso por Ventas   </div>
  </div>
 
         <img id="miload" src="/images/loadingHF.gif" style="height:40px ; margin-top:80px;" />
         <div id="columnchart_values" style=" "></div>
     </div>
        

      <div class="col-sm-6" style="background-color: #f1f1f1; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">  
  <div class=" " style="  background-color:#333;color:white; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
 LOTE
  </div>
          
          
         
     </div>
          

  </div>
        </div>

    
               <!-- Modal -->
  <div class="modal fade" id="ModalFc" role="dialog" style="display:none"  >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header"> <div style="    background-color: aliceblue;">
           <button type="button" class="close" data-dismiss="modal">&times;</button><br />
       <div class="  alert-negro" style="padding:5px;margin-bottom:10px; ">
           <span id="tituloHd"></span>
  </div>
             <table style="    margin-left: 5px;">
                     
                   <tr id="RowArt"><td class="Tipohd">ARTICULO</td><td>$   &nbsp <span id="totalArt"></span></td></tr>
                   <tr  id="RowServ"><td class="Tipohd">SERVICIO</td><td>$ &nbsp <span id="totalServ"></span></td></tr>
                    <tr><td class="Tipohd" style="    color: red;">TOTAL</td><td style="    font-weight: 700;color: red;">$ &nbsp <span id="totaltotal"></span></td></tr>
             </table>

             </div>
        </div>
        <div class="modal-body">



             <div class="row" style="margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:5px; margin-right: 0px;" > 
    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 220px; width: 100%; ">
        
        <img src="/images/loadingHF.gif" style="height:40px ; margin-top:60px" />
  <table   id='grilla'></table>

</div>
              </div>

             
     </div>
                
         

                <div   style="  background-color:#333; padding:5px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >


             
              <button id="btnAgregar1a" type="button" class="btn2 btn-default " data-dismiss="modal"  >
    <span class=" glyphicon glyphicon-save"></span> Cerrar
 </button>
  <div   style="color:white;text-align:right;width:100px;float:right;   margin-right: 5px;">Registros: 
    <span id="span_cantidad">0</span></div>
                    </div>

             </div>
            </div></div></div>


         <div style="display:none">
        <asp:TextBox ID="TxtRpid" runat="server"></asp:TextBox>
         <asp:TextBox ID="TxtTipoRep" runat="server"></asp:TextBox>
                <asp:Button ID="BtnImp" runat="server" Text="Button" OnClick="BtnImp_Click" />
    </div>
    <script>

        $("#cmbTipoOp").change(function () {
          
            google.charts.load("current", { packages: ['corechart'], language: 'pt_AR' });
            google.charts.setOnLoadCallback(drawChart);
            
        })


        function Buscar(mes) {
            
                try { 

                    if (true) {

                        var json = JSON.stringify
                          ({
                              "v_mes":mes,
                              "v_anio": $('#cmbTipoOp').val()

                          });
                        $.ajax({
                            type: "POST",
                            url: "Cbtes_Ver.aspx/WssaldoXmes",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado3,
                            error: errores
                        });
                    }
                } catch (e) {
                    alert(e.message);
                }
            
        }



        function resultado3(Re) {
            var Tabla_Datos = "";
            //1
            var Pacientes = Re.d;
            var Tabla_Titulo = "";
            var Tabla_Fin = "";

            $("#Resultado").show();
            $("#Resultado").empty();

            Tabla_Titulo = "<table   id='grilla' class='table   table-hover table-striped' style='width: 100%;'><thead><tr><th></th><th>Fecha</th><th>Resultado</th><th>CbteTipo</th> <th>Observaciones</th><th>DocNro</th><th>ImpNeto$</th><th>ImpIVA$</th> <th>ImpTotal$</th> </tr></thead><tbody>";
            $.each(Pacientes, function (index, pacientes) {

                Tabla_Datos = Tabla_Datos + "<tr     ><td  style='width:30px'> <a class='tooltips' onclick='PopVer(" + pacientes.Id + ");' > <img src='/images/Ver2.png' style='background-position:50%; background-repeat:no-repeat;cursor:pointer' /> <span>Ver Cbte</span></a></td><td>" + pacientes.Fecha + "</td><td>" + pacientes.Resultado + "</td><td>" + pacientes.CbteTipo + "</td><td>" + pacientes.Observaciones + "</td><td>" + pacientes.DocNro + "</td><td>" + pacientes.ImpNeto + "</td><td>" + pacientes.ImpIVA + "</td><td>" + pacientes.ImpTotal + "</td></tr>";
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
