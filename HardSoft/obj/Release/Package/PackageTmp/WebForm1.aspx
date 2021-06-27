<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HardSoft.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>


     <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
   
     <link rel="icon" href="img/favicon.ico"/>


    <link href="css/estilo.css" rel="stylesheet" />
    
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="css/bootstrap.min.css" />

     <link href="css/select2.css" rel="stylesheet" />
     <link href="css/select2-bootstrap.css" rel="stylesheet" />
    <script src="js/select2.js"></script>




    <link href="js/preloader.css" rel="stylesheet" />

    <script src="js/preloader.js"></script>
    <link href="js/responsive.css" rel="stylesheet" />
 

</head>
<body>


<!-- PRELOADER -->
<div class="spinner-wrapper">
    <div class="loader">Cargando...</div>
</div>
 <!-- /END PRELOADER -->





    <form id="form1" runat="server">
    <div>
    <div class="container">




<script type="text/javascript">
    $(document).ready(function () {
        $(".js-example-basic-single").select2();
         



    });

    $("#dropdown").select2({
        theme: "bootstrap"
    });
</script>

 



        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="js-example-basic-single" style="width: 75%" >
              <asp:ListItem></asp:ListItem>
            <asp:ListItem>Quilmes</asp:ListItem>
            <asp:ListItem>Varela</asp:ListItem>
             <asp:ListItem>La Plata</asp:ListItem>
             <asp:ListItem>Capital</asp:ListItem>

             <asp:ListItem>Avellaneda</asp:ListItem>
        </asp:DropDownList>
 






  <h1>MUNICIPIO <strong>QUILMES</strong> </h1>
    <p>    MUNICIPIO <strong>QUILMES</strong></p> MUNICIPIO Constancia de código QR
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header </h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        

            <div style="height:300px;border: 1px solid;">


            </div>

        
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
    </div>
    </form>
</body>
</html>
