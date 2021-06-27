<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HardSoft.App.ORL.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
       <script type="text/javascript" src="http://www.hardsoft.com.ar/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.hardsoft.com.ar/js/bootstrap.min.js"></script>

       <script type="text/javascript" src="jquery.webcam.js"></script>
    <form id="form1" runat="server">
    <div>
     
      

          <%--       <br />     <br />
              <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <u> Camera</u>
        </td>
        <td>
        </td>
        <td align="center">
            <u>Captura de Foto</u>
        </td>
    </tr>
    <tr>
        <td>
            <div id="webcam">
            </div>
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:Image ID="imgCapture" runat="server" Style="visibility: hidden; width: 320px;
                height: 240px"  CssClass="img-rounded"/>
        </td>
    </tr>
</table>

                        
<br />
 

          

                  <input id="btnCapture" type="button" value="Capturar" class="btn-info"    onclick="return Capture();"/>

<br />
<span id="camStatus"></span>

              <br /><br />
 
    </div>

--%>








        ******************************************************************** 

            <div class="col-md-6">
             <div id="verfoto"  >
  <table border="0" cellspacing="0" cellpadding="0" style=" margin:auto">
        <tr>
            <td class="webcam-container ">
                <div id="webcam"
                   data-swffile="sAS3Cam.swf" 
                    >
                </div>
            </td>
        </tr>
        <tr>
            <td class="webcam-text">
                <div>
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
    </form>
</body>

<script src="../../Scripts/Webcam_Plugin/jquery.webcam.js"></script>


<%--                <script src='<%=ResolveUrl("../../Scripts/Webcam_Plugin/jquery.webcam.js") %>'   --%>
   
<script type="text/javascript">
    var pageUrl = '<%=ResolveUrl("../../Services/CSorl.aspx") %>';
    $(function () {

     
                
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
                            sendFile(dataURItoBlob(v_tipo));

                            //var img = new Image();
                            //img.src = "data:image/jpeg;base64," + result;
                            //$('#result').append(img);

 
                       

                          //  alert('base64encoded jpeg (' + shotResolution[0] + 'x' + shotResolution[1] + '): ' + result.length + 'chars');
                            /* resume camera capture */
                            api.setCamera($('#popup-webcam-cams').val());
                        } else {
                            api.debug('error', 'Broken camera');
                        }

                       





                    });

       <%-- jQuery("#webcam").webcam({
            width: 320,
            height: 240,
            mode: "save",
            swffile: '<%=ResolveUrl("../../Scripts/Webcam_Plugin/jscam.swf") %>',
            
            debug: function (type, status) {
                //$('#camStatus').append(type + ": " + status + '<br /><br />');
             
            },
            onSave: function (data) {
            
                $.ajax({
                    type: "POST",
                    url: pageUrl + "/GetCapturedImage",
                    data: '',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                
                        $("[id*=imgCapture]").css("visibility", "visible");
                        $("[id*=imgCapture]").attr("src", r.d);
                     
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            },
            onCapture: function () {
                webcam.save(pageUrl);
            }
        });--%>
    });
        function Capture() {
            webcam.capture();
            return false;
        }

       
      
    
 
</script>


</html>
