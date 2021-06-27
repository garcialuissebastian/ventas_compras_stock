<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ingreso.ascx.cs" Inherits="HardSoft.App.UsrCtrl.Ingreso" %>

                 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Ingreso</h4>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
			
                
                	<div role="form">
					<div class="form-group">
						<div class="input-group">
						 
						
                            <asp:TextBox ID="uLogin"  class="form-control"  placeholder="Usuario" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uLogin"
                        ErrorMessage="Requerido" Display="Dynamic" CssClass="error"  ToolTip="" Style=" float:right"></asp:RequiredFieldValidator>
                
                            	<label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
						</div>
					</div> 
                        <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							 

                            <asp:TextBox ID="uPassword" runat="server"  class="form-control"    placeholder="Contraseña" TextMode="Password"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uPassword"
                        ErrorMessage="Requerido" Display="Dynamic" CssClass="error"  ToolTip="" Style=" float:right"></asp:RequiredFieldValidator>
                
                            
                            <label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
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

			<div class="modal-footer">

                 <input type="button" id="poplog" class="form-control btn btn-primary" value="Ingresar" onclick="aceptarLog()"/>

 
                 <div style="display:none">
                     <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                     <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>

                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"   />
                 </div>

                
           
				<div class="progress">
					<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" style="width: 0%;">
						<span class="sr-only">progress</span>
					</div>
				</div>
			</div> <!-- /.modal-footer -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
 
    function errores(msg) {
        var jsonObj = JSON.parse(msg.responseText);
        alert('Error: ' + jsonObj.Message);
    }

     
    function aceptarLog() { 
        
        if ($("#Ingreso_uLogin").val() == '' || $("#Ingreso_uPassword").val() == '') {

            $("#MsgLog").text("Todos los campos son obligatorios");

        } else {


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
                      

                        window.location.href = obj;
                    } else {
                        $("#MsgLog").text("El usuario no existe.");

                    }
                }),
                error: errores
            });

 

        }
    }
</script>