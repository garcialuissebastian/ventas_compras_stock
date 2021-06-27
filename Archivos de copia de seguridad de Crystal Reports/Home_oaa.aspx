<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOnOaa.Master" AutoEventWireup="true" CodeBehind="Home_oaa.aspx.cs" Inherits="HardSoft.App.Home_oaa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">


       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
    <script>


        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>

   
    



    <div class="container" style=" margin-top: 30px">

       <%-- <h2>.:: Bienvenido ::.</h2>--%>

         <div class="row  hs_div"  >



 <div class="col-md-12"   style="padding-top: 15px;
    padding-bottom: 15px;">
    
     <div class="col-sm-9 ">
          <div style="    
    font-size: 32px;
    font-weight: bold;
    padding-top: 10px;
    padding-left: 10px;float: left; padding:5px;
   ">

       
         <div style=" font-size:32px; font-weight:500; color:#12236b;text-align:left"   > 
             
             <asp:Label ID="lblRazon" runat="server" Text=""></asp:Label> 

         </div> 
          <div style="color:#333; font-size:24px;font-weight:500;float: left;    margin-top: 10px;">   
                    
                <asp:Label ID="lblEmpresa2" runat="server" Text="MI EMPRESA"></asp:Label>
               </div> <br />

            <div style="color:#333; font-size:20px;font-weight:500;float: left;    margin-top: 10px;"> 
                   <asp:Label ID="lblCuit2" runat="server" Text="1-11111111-1" Visible="false"></asp:Label>

            </div>
 <br />
                 <div style=" font-size:22px; font-weight:600; text-align: left; color: #333333;   margin-top: 22px;">   <asp:Label ID="lblModo" runat="server" Text="" Visible="false"></asp:Label></div> 
          
          </div>
          </div>

     <div class="col-sm-3">

      <%--   <img src="../../images/MiLogo.png" class="img-responsive" />--%>

        <%-- <img src="../images/ignis.jpg" class="img-responsive" />
    --%>
         <asp:Image ID="img" runat="server" class="img-responsive" />
         
          </div>
     </div>
 
    



     </div>


</div>
       

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">



      var chart;
      var data;

         var chart1;
      var data1;
      function drawChart() {
          var data2 = "";
          var json = JSON.stringify
                  ({
                      "anio": $('#cmbTipoOp').val()

                  });
          $.ajax({
              type: "POST",
              url: "/App/Home.aspx/GetChartData",
              data: json,
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: function (r) {
                  pacientes = r.d;


                  data = google.visualization.arrayToDataTable([
                  ["Mes", "Ingreso $", { role: "style" }],
                  ["Enero", parseFloat(pacientes[0].replace(',', '.')), "#b87333"],
                  ["Febrero", parseFloat(pacientes[1].replace(',', '.')), "gold"],
["Marzo", parseFloat(pacientes[2].replace(',', '.')), "#3377b3"],
               ["Abril", parseFloat(pacientes[3].replace(',', '.')), "color: #e5e4e2"],

                 ["Mayo", parseFloat(pacientes[4].replace(',', '.')), "#25a77e"],
                   ["Junio", parseFloat(pacientes[5].replace(',', '.')), "#dc7ec3"],
                     ["Julio", parseFloat(pacientes[6].replace(',', '.')), "#e64310"],
                       ["Agosto", parseFloat(pacientes[7].replace(',', '.')), "color: #45463d"],
                         ["Septiembre", parseFloat(pacientes[8].replace(',', '.')), "#10e654"],
                             ["Octubre", parseFloat(pacientes[9].replace(',', '.')), "#10e4e6"],
                              ["Noviembre", parseFloat(pacientes[10].replace(',', '.')), "#b7b0ec"],
                                 ["Diciembre", parseFloat(pacientes[11].replace(',', '.')), "color: #747b36"]
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
                      width: 550,
                      height: 300,
                      bar: { groupWidth: "95%" },
                      legend: { position: "none" },
                      backgroundColor: '#fff'

                  };


                  //                  var formatter = new google.visualization.NumberFormat(
                  //{ negativeColor: 'red', negativeParens: true, pattern: '###.###' });
                  //                  formatter.format(data, 1);

                  // para mostral el monto es-ARG
                  var formatNumer = new google.visualization.NumberFormat({ pattern: 'decimal' });
                  formatNumer.format(data, 1);

                  chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));

                       
                   function selectHandler() {
         

                      var selectedItem = chart.getSelection()[0];

         if (selectedItem == null) {
                       
                    chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                  google.visualization.events.addListener(chart, 'select', selectHandler);
             chart.draw(view, options);
              $("#ModalFc").modal('hide')
             return;
            
         } else {
                 $("#ModalFc").modal(); 
         }

          $("#RowArt").hide();
          $("#RowServ").hide();
          if (selectedItem) {

              var value = data.getValue(selectedItem.row, selectedItem.column);

              $("#totaltotal").text(parseFloat(value).format(2, 3, '.', ','));

          }


          var json = JSON.stringify
                         ({
                             "v_mes": selectedItem.row + 1,
                             "v_anio": $('#cmbTipoOp').val()
                         });
          $.ajax({
              type: "POST",
              url: "/App/Home.aspx/Wsserv_artXmes",
              data: json,
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: (function (Result) {
                  var ss;
                  ss = parseFloat(Result.d[1]);

                  var s_iibb;
                  s_iibb = parseFloat(Result.d[2]);
                  console.log(Result);


                  if (s_iibb != '0' && s_iibb != '') {
                      $("#totaliibb").text(s_iibb.format(2, 3, '.', ','));
                      $("#Rowiibb").show();
                  } else {
                      $("#Rowiibb").hide();
                  }


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
          $("#Resultado").append("<img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px' />")

          Buscar(selectedItem.row + 1);
      }

                  google.visualization.events.addListener(chart, 'select', selectHandler ) ;
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

         function drawChartVtas() {
          var data2 = "";
          var json = JSON.stringify
                  ({
                      "anio": $('#cmbTipoOpVtas').val()

                  });
          $.ajax({
              type: "POST",
              url: "/App/Home.aspx/GetChartDataVtas",
              data: json,
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: function (r) {
                  pacientes = r.d;


                  data1 = google.visualization.arrayToDataTable([
                  ["Mes", "Ingreso $", { role: "style" }],
                  ["Enero", parseFloat(pacientes[0].replace(',', '.')), "#b87333"],
                  ["Febrero", parseFloat(pacientes[1].replace(',', '.')), "gold"],
["Marzo", parseFloat(pacientes[2].replace(',', '.')), "#3377b3"],
               ["Abril", parseFloat(pacientes[3].replace(',', '.')), "color: #e5e4e2"],

                 ["Mayo", parseFloat(pacientes[4].replace(',', '.')), "#25a77e"],
                   ["Junio", parseFloat(pacientes[5].replace(',', '.')), "#dc7ec3"],
                     ["Julio", parseFloat(pacientes[6].replace(',', '.')), "#e64310"],
                       ["Agosto", parseFloat(pacientes[7].replace(',', '.')), "color: #45463d"],
                         ["Septiembre", parseFloat(pacientes[8].replace(',', '.')), "#10e654"],
                             ["Octubre", parseFloat(pacientes[9].replace(',', '.')), "#10e4e6"],
                              ["Noviembre", parseFloat(pacientes[10].replace(',', '.')), "#b7b0ec"],
                                 ["Diciembre", parseFloat(pacientes[11].replace(',', '.')), "color: #747b36"]
                  ]);


                  var view1 = new google.visualization.DataView(data1);
                  view1.setColumns([0, 1,
                                   {
                                       calc: "stringify",
                                       sourceColumn: 1,
                                       type: "string",
                                       role: "annotation"
                                   },
                                   2]);

                  var options1 = {
                      title: "",
                      width: 550,
                      height: 300,
                      bar: { groupWidth: "95%" },
                      legend: { position: "none" },
                      backgroundColor: '#fff',
                  };


                  //                  var formatter = new google.visualization.NumberFormat(
                  //{ negativeColor: 'red', negativeParens: true, pattern: '###.###' });
                  //                  formatter.format(data, 1);

                  // para mostral el monto es-ARG
                  var formatNumer1 = new google.visualization.NumberFormat({ pattern: 'decimal' });
                  formatNumer1.format(data1, 1);

               function selectHandlerVtas() {
        


             google.visualization.events.addListener(chart1, 'select', selectHandlerVtas);

         


             var selectedItem1 = chart1.getSelection()[0];
                   
                   if (selectedItem1 == null) {
                       
                    chart1 = new google.visualization.ColumnChart(document.getElementById("columnchart_valuesVtas"));
                  google.visualization.events.addListener(chart1, 'select', selectHandlerVtas);
                       chart1.draw(view1, options1);
                        
                      $("#ModalFc").modal('hide')
             return;
            
         } else {
                 $("#ModalFc").modal(); 
         } 

          $("#RowArt").hide();
          $("#RowServ").hide();
          if (selectedItem1) {

              var value = data1.getValue(selectedItem1.row, selectedItem1.column);

              $("#totaltotal").text(parseFloat(value).format(2, 3, '.', ','));

          }


          var json = JSON.stringify
                         ({
                             "v_mes": selectedItem1.row + 1,
                             "v_anio": $('#cmbTipoOpVtas').val()
                         });
          $.ajax({
              type: "POST",
              url: "/App/Home.aspx/Wsserv_artXmesVtas",
              data: json,
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: (function (Result) {
                  var ss;
                  ss = parseFloat(Result.d[1]);

                  var s_iibb;
                  s_iibb = parseFloat(Result.d[2]);
                  console.log(Result);


                  if (s_iibb != '0' && s_iibb != '') {
                      $("#totaliibb").text(s_iibb.format(2, 3, '.', ','));
                      $("#Rowiibb").show();
                  } else {
                      $("#Rowiibb").hide();
                  }


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
          switch (selectedItem1.row + 1) {
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
          $("#Resultado").append("<img src='/images/loadingHF.gif' style='height:40px ; margin-top:60px' />")

          BuscarVtas(selectedItem1.row + 1);
      }


                  // para ventas 
                  chart1 = new google.visualization.ColumnChart(document.getElementById("columnchart_valuesVtas"));
                  google.visualization.events.addListener(chart1, 'select', selectHandlerVtas);
                  chart1.draw(view1, options1);



                  $("#miloadVtas").hide();
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
      Number.prototype.format = function (n, x, s, c) {
          var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
              num = this.toFixed(Math.max(0, ~~n));

          return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
      };


    
    

      // Listen for the 'select' event, and call my function selectHandler() when
      // the user selects something on the chart.

      var today = new Date();

      var yyyy = today.getFullYear();
      $(function () {
          for (var i = 2017; i < yyyy + 1; i++) {
              $("#cmbTipoOp").append($('<option>',
   {
       value: i,
       text: i
                  }));


                        $("#cmbTipoOpVtas").append($('<option>',
   {
       value: i,
       text: i
   }));
          }
 
            $.ajax({
                  url: "/Services/controlador_intranet.ashx?data=1&permiso=CONFIG_KARDEX",
                  responseType: "json",
                  timeout: 20000,
                  cache: true,
                  success: function (result) {
                      $.each(eval(result), function (i, obj) {

                          if (obj.existe == "si") {
                              $("#verGraficos").show();


                                  $.ajax({
                      type: "POST",
                      url: "Home.aspx/graficos",
                      data: '',
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                                      success: (function (Resultado) {

                                          $.each(eval(Resultado.d), function (i, obj) {  
                                            
                                              if (obj.descripcion == "VER_FACTURACION" && obj.valor == "S") {
                                              
                                              $("#grafFac").show();
                                                $("#cmbTipoOp").val(today.getFullYear());
                              google.charts.load("current", { packages: ['corechart'], language: 'pt_AR' });
                              google.charts.setOnLoadCallback(drawChart);
                                              }


                                              if (obj.descripcion == "VER_VENTAS" && obj.valor == "S") {
                                                       $("#grafVtas").show();
   $("#cmbTipoOpVtas").val(today.getFullYear());
                              google.charts.load("current", { packages: ['corechart'], language: 'pt_AR' });
                              google.charts.setOnLoadCallback(drawChartVtas);
                                              }

                                               })

                                           }),
                      error: errores
                              });



                            


                            

                          } else {
                              $("#verGraficos").hide();
                          }

                      })

                           },
                  error: function (jqXHR, textStatus, errorThrown) {
                  }
              });


                          ;
         

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



    <div class=" container" style="margin-top: 15px; display:none ; " id="verGraficos" >  


           
         
  <div class="row" id="sGraficos" style="display:none; margin-bottom:15px   ">
     
      

      <div class="col-sm-6" style="display:none" id="grafFac">
              <div  style="    height: 347px; background-color: #fff; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
  <div class=" " style=" height: 40px;    padding: 2px; background-color:#333;color:white; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; margin-bottom:5px"> 
   <div class="col-sm-3">
      <select id="cmbTipoOp" class="form-control">        
          
      </select>   
      </div><div class="col-sm-9" style="    padding-top: 5px; text-transform:uppercase">
      FACTURACIÓN   </div>
  </div>
 
         <img id="miload" src="/images/loadingHF.gif" style="height:40px ; margin-top:80px;"  />
         <div id="columnchart_values" style=" "></div>
     </div>
      </div>
       <div class="col-sm-6" id="grafVtas" style="display:none">
        
          <div  style="    height: 347px; background-color: #fff; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
  <div class=" " style=" height: 40px;    padding: 2px; background-color:#333;color:white; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; margin-bottom:5px"> 
   <div class="col-sm-3">
      <select id="cmbTipoOpVtas" class="form-control">        
          
      </select>   
      </div><div class="col-sm-9" style="    padding-top: 5px; text-transform:uppercase">
      VENTAS  </div>
  </div>
 
         <img id="miloadVtas"   src="/images/loadingHF.gif" style="height:40px ; margin-top:80px;"  />
         <div id="columnchart_valuesVtas" style=" "></div>
     </div>
            </div>

      <br />  
<%--      <div class="col-sm-6" style="background-color: #fff; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">  
  <div class=" " style="  background-color:#333;color:white; border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;"> 
 LOTE
  </div>
          
        
         
     </div>--%>
          

  </div>
     
        
        
        <br />
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
             <table style=" float: left;   margin-left: 5px;">
                     
                   <tr id="RowArt"><td class="Tipohd">ARTICULO</td><td>$   &nbsp <span id="totalArt"></span></td></tr>
                   <tr  id="RowServ"><td class="Tipohd">SERVICIO</td><td>$ &nbsp <span id="totalServ"></span></td></tr>
                    <tr><td class="Tipohd" style="    color: red;">TOTAL</td><td style="    font-weight: 700;color: red;">$ &nbsp <span id="totaltotal"></span></td></tr>
             </table>


                <table style="    float:right;margin-right: 6px;">
                     
                   <tr id="Rowiibb"><td class="Tipohd" style="width: 265px">IIBB - TOTAL IMP. DETERMINADO </td><td>$   &nbsp <span id="totaliibb"></span></td></tr>
                  
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

         $("#cmbTipoOpVtas").change(function () {

            google.charts.load("current", { packages: ['corechart'], language: 'pt_AR' });
            google.charts.setOnLoadCallback(drawChartVtas);

        })

            function BuscarVtas(mes) {

            try {

                if (true) {

                    var json = JSON.stringify
                      ({
                          "v_mes": mes,
                          "v_anio": $('#cmbTipoOpVtas').val()

                      });
                    $.ajax({
                        type: "POST",
                        url: "Home.aspx/WssaldoXmesVtas",
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

        function Buscar(mes) {

            try {

                if (true) {

                    var json = JSON.stringify
                      ({
                          "v_mes": mes,
                          "v_anio": $('#cmbTipoOp').val()

                      });
                    $.ajax({
                        type: "POST",
                        url: "/App/Kardex/Cbtes_Ver.aspx/WssaldoXmes",
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

                  $.ajax({
                      type: "POST",
                      url: "../ActiveSession.aspx/KeepActiveSession",
                      data: {},
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: true,
                      success: VerifySessionState,
                      error: function (XMLHttpRequest, textStatus, errorThrown) {
                          window.location.href = "../Login.aspx";
                      }
                  });

                 
              });




              function VerifySessionState(result) {

                
                  if (!result.d) {
                    
                      window.location.href = "/";
                  }
              }

       
    </script>

   

</asp:Content>