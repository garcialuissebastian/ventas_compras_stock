<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="HardSoft.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       <style>
	@font-face {
		font-family: 'Raleway';
		src: local('Raleway Thin'), local('Raleway-Thin'), url(http://themes.googleusercontent.com/static/fonts/raleway/v7/RJMlAoFXXQEzZoMSUteGWD8E0i7KZn-EPnyo3HZu7kw.woff) format('woff');
	}
	@font-face {
		font-family: 'Raleway';
		font-style: italic;
		font-weight: 400;
		src: local('Raleway'), url(http://themes.googleusercontent.com/static/fonts/raleway/v7/IczWvq5y_Cwwv_rBjOtT0w.woff) format('woff');
	}
	@font-face {
  		font-family: 'Raleway Bold';
  		font-weight: 900;
 		src: local('Raleway Bold'), local('Raleway-Bold'), url(http://themes.googleusercontent.com/static/fonts/raleway/v7/JbtMzqLaYbbbCL9X6EvaIxsxEYwM7FgeyaSgU71cLG0.woff) format('woff');
	}
	.rlw {
		font-family: 'Raleway';
	}
	.rlw-normal {
		font-family: 'Raleway';
		font-weight: 400;
		font-style: italic;
	}
	.rlw-bold {
		font-family: 'Raleway Bold';
	}
	</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="content">
	<p class="rlw">Este párrafo utiliza la fuente Raleway declarada definida en la primera regla font-face.</p>
	<p class="rlw-normal">Este párrafo utiliza la fuente Raleway definida en la segunda regla font-face. Mira como no está en cursiva (italic) y piensa por qué.</p>
	<p class="rlw-bold">Este párrafo utiliza la fuente Raleway definida en la segunda regla font-face.</p>
</div>
    </div>
    </form>
</body>
</html>


