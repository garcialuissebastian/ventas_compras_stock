<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HardSoft.App.Cbte.WebForm1" %>

<!DOCTYPE html>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>jQuery UI Datepicker - Revolucionario francés</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

    <input type="text" id="campoData">
<input type="text" id="campoTelefone">
<input type="text" id="campoSenha">
 
<script>
    jQuery(function ($) {
        $("#campoData").mask("99/99/9999");
        $("#campoTelefone").mask("(999) 999-9999");
        $("#campoSenha").mask("***-****");
    });
</script>
<script>
    $(function () {
        $("#datepicker").datepicker({
            firstDay: 1,
            monthNames: ['Nivôse', 'Pluviôse', 'Ventôse',
            'Germinal', 'Floréal', 'Prairial',
            'Messidor', 'Thermidor', 'Fructidor',
            'Vendémiaire', 'Brumaire', 'Frimaire'],
            dayNamesMin: ['sep', 'pri', 'duo', 'tri', 'qua', 'qui', 'sex']
        });
    });
</script>
</head>

<body>
Fecha:
<div id="datepicker"></div>
</body>
</html> 