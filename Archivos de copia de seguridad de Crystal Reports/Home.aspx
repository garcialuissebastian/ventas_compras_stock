<%@ Page Title="" Language="C#" Culture="Auto" UICulture="Auto"  MasterPageFile="~/App/Master/HomeOnPersonal.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HardSoft.App.Personal.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

     <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

   <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
 
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

    <style>

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
    </style>

     <div class=" container" style="margin-top: 36px;">  
         
           <nav role="navigation">
                <ol class="breadcrumb">
                                    <li>
                        <a href="http://www.hardsoft.com.ar/App/Home.aspx">Inicio</a>                    </li>
                             
                     <li class="active" >
               Inicio        </li>
                                </ol>
        </nav>
 
    <div style="margin-top:0px;text-transform:uppercase"  >
    
        
        <div class="alert alert-cab"  >
       <strong>  SISTEMA DE ASISTENCIA</strong> 
            </div>


          <div class="">
       
  <div   style="margin-top:5px; background-color:#333; color:white; font-weight:800; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center; " >
   
      </div>

        <div class="row" style="height:350px;  margin-left:0px; margin-right:0px;   padding:10px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
       
     </div>

                 
       <div   style="margin-top:5px; background-color:#333; padding:10px;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; " >
          
           
      





        </div>

          </div>

        </div>

     
     

      <script>
        

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

               

</asp:Content>
