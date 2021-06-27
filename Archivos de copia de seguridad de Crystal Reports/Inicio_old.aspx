<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio_old.aspx.cs" Inherits="HardSoft.App.ORL.Inicio_old" %>

<!DOCTYPE html>
<html lang="en"> 
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, user-scalable=si" />


  <title>Centro Otorrinolaringologico de Quilmes - ORL</title>
     <META NAME="AUTHOR" CONTENT="CORL QUILMES">
<META NAME="DESCRIPTION" CONTENT="El Centro Otorrinolaringologico de Quilmes se encuentra ubicado en pleno centro de nuestra ciudad, calle Alsina N° 280, entre Alvear y Brown.
Tel: 011 4253-4310 .-  Mail :corldequilmes@gmail.com">
<META NAME="KEYWORDS" CONTENT="Otorrinolaringologico de Quilmes,ORL,CORL">
    <META NAME="KEYWORDS" CONTENT=" Alsina 280, Quilmes.">
      <META NAME="KEYWORDS" CONTENT="Centro Otorrinolaringologico de Quilmes">
<META NAME="Resource-type" CONTENT="Document">
<META NAME="Revisit-after" CONTENT="2 days">
<META NAME="robots" content="index,follow">

	
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,800,700,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=BenchNine:300,400,700' rel='stylesheet' type='text/css'>
    <script src="/App/ORL/js/modernizr.js"></script>


    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-109156664-2"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-109156664-2');
</script>

 <style>

  
 </style>
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	
	<!-- ====================================================
	header section -->
	<div class="top-header"  >
		<div class="container">
			<div class="row">
			   <div class=" col-xs-6  col-md-7 col-lg-7  ">
					<nav class="navbar navbar-default">
					  <div class="container-fluid nav-bar">
					    <!-- Brand and toggle get grouped for better mobile display -->
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" style="right: 65%;">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					    </div>

					    <!-- Collect the nav links, forms, and other content for toggling -->
					    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					      
					      <ul class="nav navbar-nav navbar-right">
					        <li><a class="menu active" href="#home" >Inicio</a></li>
					        <li><a class="menu"  href="#about" >Institucional</a></li>
					        <li><a class="menu" href="#service">Centro Médico</a></li>
					     
					        <li><a class="menu" href="#contact">Contacto</a></li>
                               <li><a class="menu" href="Reservar.aspx" style="color:red">  Turnos    </a></li>
					      </ul>
					    </div><!-- /navbar-collapse -->
					  </div><!-- / .container-fluid -->
					</nav>
				</div>
				<div class="col-xs-6  col-lg-5 col-md-5 header-logo pull-right" style="text-align:right; 
    margin-top: 1px;
">
					<div class="col-xs-4  col-lg-12 ">
					<a href="index.aspx" id="logo2"><img src="img/logo1.png" alt="" class="" id="logo1"></a>
				</div>
                    
                    
                    <div class="col-xs-8 hidden-md hidden-lg hidden" style="-webkit-text-stroke-width: 1px;text-align:left
-webkit-text-stroke-color:red; font-size:16px; margin-top: 2px;">
                
                 
                   <div style="color:red;font-weight:800"><a href="Reservar.aspx" style="color:red;font-weight:800;"> TURNOS</a></div>   

                              <div  style="margin-top:0px"><a href="tel:+541142534310" style="color:red;font-weight:800;margin-top:10px">4253-4310</a></div> 
				      </div>
                
                </div>

			</div>
		</div>
	</div> <!-- end of header area -->

	<section class="slider" id="home">
		<div class="container-fluid hidden-xs">
			<div class="row">
			    <div id="carouselHacked" class="carousel slide carousel-fade" data-ride="carousel">
					<div class="header-backup"></div>
			        <!-- Wrapper for slides -->
			        <div class="carousel-inner" role="listbox">
			                  <div class="item  active">
			            	<img src="img/3s.jpg" alt="">
			                <div class="carousel-caption">
		               			<h1>Turnos Online</h1>
		               		
                                <p> 	<img src="img/wspicono.png" alt=""> <span style="  font-size:40px;  color: #50cd5e;"> WHATSAPP: 1133894444</span></p>
                                	<p>Más comodida para usted y su familia.</p>
		               			<button onClick="window.location.href='Reservar.aspx'">Reservar</button>
			                </div>
			            </div>
			      
                        
                        <div class="item ">
			            	<img src="img/1s.jpg" alt="">
			                <div class="carousel-caption">
		               			<h1></h1>
		               			<p>Más de 30 años aportando soluciones en la especialidad de ORL y conexas, con el mayor compromiso y dedicación.</p>
		               		 
			                </div>
			            </div>
			            <div class="item">
			            	<img src="img/2s.jpg" alt="">
			                <div class="carousel-caption">
		               			<h1></h1>
		               			<p>Actualización permanente en nuestras prestaciones científicas y tecnológicas para el mejor resultado asistencial</p>
		               			  
			                </div>
			            </div>
			       
			            	 
			            </div>
			        </div>
			        <!-- Controls -->
			        <a class="left carousel-control" href="#carouselHacked" role="button" data-slide="prev">
			            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			            <span class="sr-only">Previous</span>
			        </a>
			        <a class="right carousel-control" href="#carouselHacked" role="button" data-slide="next">
			            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			            <span class="sr-only">Next</span>
			        </a>
			    </div>
			</div>
		 

        <div id="ini" style="  padding:8px;   " class="hidden-lg hidden-md">
 
        <div class="row" style="margin-top:18%; text-align:center">   
             <img src="img/orl-quilmes.png" alt="" class=" img-responsive" style="margin:auto"  >
        </div>
            
           <div class="row" style="margin-top:5px">     
             <div  class="col-xs-6">   
          <a href="Reservar.aspx" >  <img src="img/CALEN4.png" class="img-responsive"/> </a>
             </div>
              <div class="col-xs-6">    
     <a href="tel:+541142534310">     <img src="img/CALEN3.png" border="0" usemap="#Map"  class="img-responsive" />
<map name="Map"><area shape="rect" coords="2,175,150,205" href="mailto:corldequilmes@gmail.com"></map></a>  
             </div>
          </div>
             
        </div>

	</section><!-- end of slider section -->

	<!-- about section -->
	<section class=" about  text-center" id="about" >
		<div class="container">
			<div class="row" style="">
				<h2>Institucional</h2>
				 
				<div class="col-md-4 col-sm-6">
					<div class="single-about-detail clearfix">
						<div class="about-img">
							<img class="img-responsive" src="img/c22.jpg" alt="">
						</div>
						<div class="about-details">
							<div class="pentagon-text">
								<h1>N</h1>
							</div>
							<h3>Nosotros</h3>
							<p style="text-align:justify"> 
                                El Centro Otorrinolaringologico de Quilmes se encuentra ubicado en pleno centro de nuestra ciudad, calle Alsina N° 280, entre Alvear y Brown, con fácil acceso por ferrocarril y líneas de transporte público. <br />
                                Brindamos nuestros servicios a pacientes partculares, de obras sociales y sistemas prepagos , quienes nos honran con su confianza, de forma ininterrumpida, desde el año 1980. <br />
                                Podemos decir, con orgullo, que aportamos soluciones en la especialidad de ORL, desde hace casi cuatro décadas, con nuestro mayor compromiso y dedicación.
</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="single-about-detail">
						<div class="about-img">
							<img class="img-responsive" src="img/c33.jpg" alt="">
						</div>
						<div class="about-details">
							<div class="pentagon-text">
								<h1>M</h1>
							</div>

							<h3>Misión</h3>
							<p style="text-align:justify">Proveer soluciones en el área de la otorrinolaringología y especialidades conexas con: <br/>
- Toda la dedicación<br/>
- Toda la tecnología<br/>
- Todos los días<br/>
</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="single-about-detail">
						<div class="about-img">
							<img class="img-responsive" src="img/c11.jpg" alt="">
						</div>
						<div class="about-details">
							<div class="pentagon-text">
								<h1>C</h1>
							</div>
							<h3>Compromiso</h3>
							<p>Llevar a cabo nuestra tarea con el compromiso permanente de:<br/>
- Observación del compromiso ético. <br/>
- Respeto al paciente y sus derechos.<br/>
- Transparencia en todos nuestros actos.<br/>
- Eficiencia para lograr la más rápida y efectiva solución a nuestros pacientes.<br/>
                                - Empeño en mantener, desde 1980, y hacia el futuro, la actualización permanente de nuestras prácticas y procedimientos científicos y tecnológicos , para el mejor resultado asistencial.

</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!-- end of about section -->

 <section class="about  text-center" id="service" >
        <div class="container">
            <div class="row" style="">
            <div class="section-header" >
                <h2 class="section-title text-center wow fadeInDown"> CENTRO MÉDICO</h2>
              
            </div>

            <div class="row">
                

                <div class="col-sm-4 wow fadeInRight" style="text-align:justify">
                    <h3  class="column-title"    style="">Especialidades  </h3>
                 <ul style="font-size: 22px;">
  <li>   
                   Otorrinolaringología Adultos</li>
<li>Otorrinolaringología Niños</li>
<li>Cirugía otorrinolaringológica</li>

<li>Foniatría</li>
                     <li>Audiología</li>
                     <li>Nutrición</li>
                   <li> Kinesiologia</li>
  </ul>
                </div>
				
				  <div class="col-sm-4 wow fadeInRight" style="text-align:justify">
                  <h3  class="column-title"    style="">Abordaje efectivo de trastornos de  </h3>
                 <ul style="font-size: 22px;">
  <li>   
                  Voz</li>
<li>Audición</li>
<li>Equilibrio</li>
<li>Vias aéreas superiores</li>
<li>Roncopatias y trastornos del sueño</li>

<li>Cefaleas</li>
                     <li>Nutrición</li>
  </ul>
                </div>
	
	  <div class="col-sm-4 wow fadeInRight" style="text-align:justify">
                  <h3  class="column-title"    style="">Profesionales </h3>
                 <ul style="font-size: 22px;">
  <li>   
                Dr. Elías J Zacarías</li>
<li>Dr. Ramiro Zacarías</li>
 
<li>Fga. Marcela Fernández Garrassino</li>
<li>Nutr. Lía Cristina Cespi</li>
 <li>Mariano Aguilo</li>
  </ul>
                </div>	
	   
	   
            </div>
			 <div class="row">
			 <h2> Coberturas</h2>
			<h3>   APRES, GALENO, OSDE, UNION PERSONAL/ACCORD SALUD, OSMECON , FEMEBA, IOMA,  AMFFA, BCO. PCIA., CASA, COMEI, OSMEBA, OSPF, P.JUDICIAL, SERVESALUD, PAMI: arancel de -50% </h3>
                 
			 
			 </div>
        </div></div>
    </section><!--/#about-->
	<!-- service section starts here -->
 
  
	<!-- map section -->
	<div class="api-map" id="contact">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 map" id="map"></div>
			</div>
		</div>
	</div><!-- end of map section -->

	<!-- contact section starts here -->
	<section class="contact">
		<div class="container">
			<div class="row">
				<div class="contact-caption clearfix">
					<div class="contact-heading text-center">
						<h2>Centro ORL de Quilmes</h2>
					</div>
					<div class="col-md-5 contact-info text-left">
						<h3>contacto</h3>
						<div class="info-detail">
							<ul><li><i class="fa fa-calendar"></i><span>Lunes - Viernes:</span> 16 a 20:30 </li></ul>
							<ul><li><i class="fa fa-map-marker"></i><span>Dirección:</span> Alsina 280, B1878KLF, Quilmes</li></ul>
							<ul><li><i class="fa fa-phone"></i><span>Tel:</span> 011 4253-4310  </li></ul>
						 	<ul><li><i class="fa fa-phone"></i><span>Whatsapp:</span> 1133894444</li></ul>
							<ul><li><i class="fa fa-envelope"></i><span>Email:</span> corldequilmes@gmail.com</li></ul>
						</div>
					</div>
					<div class="col-md-6 col-md-offset-1 contact-form">
                        <h3>¿Cómo llegar?</h3>
                        <div class="info-detail">
					 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3279.3944689022032!2d-58.25866108514407!3d-34.720449980429365!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95a32e3ff44c1745%3A0x393e87e3430257e5!2sAlsina+280%2C+Quilmes%2C+Buenos+Aires!5e0!3m2!1ses!2sar!4v1508290502419"   height="200px" width="100%" frameborder="1" style="border:1px" allowfullscreen></iframe>
				</div>	</div>
				</div>
			</div>
		</div>
	</section><!-- end of contact section -->

	<!-- footer starts here -->
	<footer class="footer clearfix">
		<div class="container">
			<div class="row">
				<div class="col-xs-6 footer-para">
					<p>&copy;Hard&Soft All right reserved</p>
				</div>
				<div class="col-xs-6 text-right">
					<a href=""><i class="fa fa-facebook"></i></a>
					<a href=""><i class="fa fa-twitter"></i></a>
					<a href=""><i class="fa fa-skype"></i></a>
				</div>
			</div>
		</div>
	</footer>

	<!-- script tags
	============================================================= -->
    <script src="/App/ORL/js/jquery-2.1.1.js"></script>
	 
   
    <script src="/App/ORL/js/bootstrap.min.js"></script>
 <script>
 $('.navbar-nav>li>a').on('click', function(){
    $('.navbar-collapse').collapse('hide');
});
     jQuery(function ($) {
         var ancho = $(window).width();
       var alto =$(window).height();
         
         if (ancho < 720) {

             $("#ini").css({ 'height': alto });

          $("#logo1").attr("src", "");
             $("#logo2").attr("href", "Reservar.aspx");
         
             $("#logo1").css({ 'margin-bottom': '0px', 'width': '50px' });
             $(".nav-bar").css({ 'margin-top': '8px' });
$(".header-logo").css({ 'z-index': '2' });
           //  $(".icon-next").css({ 'margin-top': '-210px' });
             $("#logo1").click(function () {
                
                 window.location.href = "Reservar.aspx";
             });
         }
         //alert(ancho);

     });
 </script>



</body>
</html>