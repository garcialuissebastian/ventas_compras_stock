
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ingreso.ascx.cs" Inherits="HardSoft.App.UsrCtrl.Ingreso" %>


<%--                 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	--%>
                      <div class="modal fade"  id="myModal" role="dialog" style="display:none"  >
   
                     <div class="modal-dialog modal-sm">

		<div class="modal-content">

			<div class="modal-header" style="background-color: #e2dede;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		 
                <img src="/images/logoIn.png"  class="img-responsive"   />

			</div> <!-- /.modal-header -->

			<div class="modal-body" style="    background-color: #c3c3c3;">
			
                
                	<div role="form">
					<div class="form-group">
						<div class="input-group">
						 
						
                            <asp:TextBox ID="uLogin"   placeholder="Usuario" runat="server" CssClass="logIn"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uLogin"
                        ErrorMessage="Requerido" Display="Dynamic" CssClass="error"  ToolTip="" Style=" float:right"></asp:RequiredFieldValidator>
                 
						</div>
					</div> 
                        <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							 

                            <asp:TextBox ID="uPassword" runat="server"  class="form-control"   CssClass="logIn"   placeholder="Contraseña" TextMode="Password"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uPassword"
                        ErrorMessage="Requerido" Display="Dynamic" CssClass="error"  ToolTip="" Style=" float:right"></asp:RequiredFieldValidator>
                
                             
						</div> <!-- /.input-group -->
					</div> <!-- /.form-group -->

					<div class="checkbox" style="display:none">
						<label>
							<input type="checkbox"> Recordar
						</label>
					</div> 
                        
                        <!-- /.checkbox -->
                        <asp:Label ID="Msg" runat="server" Text="" CssClass="alert-danger"></asp:Label>
                        <div id="MsgLog" class="alert-danger"></div>
				</div>

                
			
           
            
            </div> <!-- /.modal-body -->

			<div class="modal-footer" style="  background-color: #e2dede;">

                 <input type="button" id="poplog" class="form-control btn btn-primary" value="Ingresar" onclick="aceptarLog()"/>

 
                 <div style="display:none">
                     <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                     <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>

                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"   />
                 </div>

                
           
				<div class="progress1" style="text-align:center; display:none">
					 <img src='/images/loadingHF.gif' style='height:40px ; margin-top:5px' />
				</div>
			</div> <!-- /.modal-footer -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <style>
        .logIn {
    width: 250px;
    background-color: rgba(253,253,253,0.2);
    color: rgba(255,255,255,1);
    font-size: 18px;
    text-shadow: 1px 1px 0px #000000;
    font-weight: lighter;
    border: 1px solid rgba(255,255,255,0.5);
    box-shadow: 0px 1px 4px -1px #FFF inset;
    padding-left: 20px;
    height: 40px;
    border-radius: 10px !important;
    border: 0;
    margin: 6px;
    transition: all 1s;
}
</style>
  
<script>
 
    function errores(msg) {
        var jsonObj = JSON.parse(msg.responseText);
        alert('Error: ' + jsonObj.Message);
    }

     
    function aceptarLog() { 
        $("#MsgLog").text("");
        if ($("#Ingreso_uLogin").val() == '' || $("#Ingreso_uPassword").val() == '') {

            $("#MsgLog").text("Todos los campos son obligatorios");

        } else {

            $(".progress1").show();
            $("#Ingreso_uLogin").prop('disabled',true);
            $("#Ingreso_uPassword").prop('disabled', true);
            var json = JSON.stringify
                ({
                    "v_v": $("#Ingreso_uLogin").val(),
                    "v_p": $("#Ingreso_uPassword").val()

                });
            $.ajax({
                type: "POST",
                url: "Default.aspx/WsIn",
                data: json,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: (function (result) {
                    var obj = result.d;
                  
                    if (obj != "NO") {

                        $("#Ingreso_txtUser").val($("#Ingreso_uLogin").val());
                        $("#Ingreso_txtPass").val($("#Ingreso_uPassword").val()); 

                        $("#Ingreso_uPassword").val("");
                        $("#Ingreso_uLogin").val("");
                        $("#Ingreso_MsgLog").text("");
                      
                        $(document).ajaxStart(function () {
                            $(".spinner-wrapper").css("display", "block");
                            $(".loader").css("display", "block");

                        });
                        window.location.href = obj;
                    } else {
                        $("#MsgLog").text("El usuario no existe.");
                        $(".progress1").hide();
                        $("#Ingreso_uLogin").prop('disabled', false);
                        $("#Ingreso_uPassword").prop('disabled', false);
                    }
                }),
                error: errores
            });

 

        }
    }
</script>