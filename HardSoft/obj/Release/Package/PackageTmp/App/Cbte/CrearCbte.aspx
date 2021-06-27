<%@ Page Title="" Language="C#" MasterPageFile="~/App/Master/HomeOn.Master" AutoEventWireup="true" CodeBehind="CrearCbte.aspx.cs" Inherits="HardSoft.App.Cbte.CrearCbte" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 
 

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

    <script type="text/javascript" src="../../js/bootstrap-datepicker.js" ></script>
 
    <script src="../../js/jquery.maskedinput.js"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      

    <script>


        function acceptNum(e) {
            var tecla = document.all ? tecla = e.keyCode : tecla = e.which;
            return ((tecla > 47 && tecla < 58) || tecla == 8);
        }
    </script>

    <div class="container" style=" margin-top: 30px">

        <h3>CREAR COMPROBANTE</h3>

         <div class="row" style="margin-top: 5px;
background-color: #333;
padding: 10px;
border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555;
text-align: center;
color:white; min-height:200px
">
        <div class="col-md-12"    style="padding-top:10px ;border: 1px solid #aaaaaa;border-radius: 5px 5px 5px 5px;
background: #ffffff ;
color: #222222;""  >



            <div class="col-md-3"   > 


                <img src="../../images/logo.png"  class=" img-responsive">

       </div>



              <div class="col-md-4"   > 

                  
                  <div class="form-horizontal" role="form">
  <div class="form-group">
    <label for="ejemplo_email_3" class="col-lg-2 control-label">Email</label>
    <div class="col-lg-10">
      <input type="email" class="form-control" id="ejemplo_email_3"      placeholder="Email">

            
    </div>
  </div>

                      </div>

                     <div class="form-horizontal" role="form">
  <div class="form-group">
    <label for="ejemplo_email_3" class="col-lg-2 control-label">Email</label>
    <div class="col-lg-10">
       

           <asp:DropDownList ID="cmbTipoDoc" runat="server">
              
           </asp:DropDownList>
    </div>
  </div>

                      </div>

              </div>
              <div class="   col-md-5"  style="border: 1px solid #aaaaaa;border-radius: 5px 5px 5px 5px;
background: #ffffff ;
color: #222222;" > 
                  <h4 style="text-align:left">Perìodo de Factutaciòn</h4>

                    <div class="form-horizontal" role="form">
  <div class="form-group">
    <label for="ejemplo_email_3" class="col-lg-2 control-label">Desde</label>
    <div class="col-lg-10">
       
       
    


     <div class="input-group date" data-provide="datepicker">
    <asp:TextBox ID="TxtDesde" runat="server"    CssClass="campoFecha form-control"></asp:TextBox> 
    <div class="input-group-addon">
      <asp:ImageButton ID="imgPopup" ImageUrl="~/images/calendar.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="Calendar2"   PopupButtonID="imgPopup" runat="server" TargetControlID="TxtDesde"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 

  </div>

                      </div>


              </div>


               <div class="form-horizontal" role="form">
  <div class="form-group">
    <label for="ejemplo_email_3" class="col-lg-2 control-label">Desde</label>
    <div class="col-lg-10">
       
       
    


     <div class="input-group date" data-provide="datepicker">
    <asp:TextBox ID="TxtHasta" runat="server"    CssClass="campoFecha form-control"></asp:TextBox> 
    <div class="input-group-addon">

      <asp:ImageButton ID="imgPopup1" ImageUrl="~/images/calendar.png" ImageAlign="Bottom" OnClientClick="return false;"
    runat="server"   Width="16px" Height="16px"  />
 
        <asp:CalendarExtender ID="CalendarExtender1"   PopupButtonID="imgPopup1" runat="server" TargetControlID="TxtHasta"
    Format="dd/MM/yyyy"   ></asp:CalendarExtender>
    </div>
</div> 

  </div>

                      </div>


                   <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                   <br />
                   <asp:Label ID="Msg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
        </div>


 </div>


    </div>
</div>
        </div>

 
<script>
    jQuery(function ($) {
        $(".campoFecha").mask("99/99/9999");
   
    });
</script>



</asp:Content>
