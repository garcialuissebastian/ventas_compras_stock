<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HardSoft.Default" enableEventValidation="false" %>

<%@ Register Src="~/App/UsrCtrl/Ingreso.ascx" TagPrefix="uc1" TagName="Ingreso" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

       <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <title>Hard & Soft</title>

        <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link href="css/animate.min.css" rel="stylesheet"/>
    <link href="css/owl.carousel.css" rel="stylesheet"/>
    <link href="css/owl.transitions.css" rel="stylesheet"/>
    <link href="css/prettyPhoto.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet"/>
    <link href="css/responsive.css" rel="stylesheet"/>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png"/>




</head>
<body id="home" class="homepage">


    <header id="top-header" class="navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    <div class="navbar-brand">
                        <a class="smooth-scroll" data-section="#home" href="#home" >
                            <img src="images/logo.png" alt=""/>
                        </a>
                    </div>
                    <!-- /logo -->
                </div>

                <!-- main nav -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul id="nav" class="nav navbar-nav">
                            <li class="scroll"><a href="#home" data-section="#home">Inicio</a></li>
                            <li class="scroll"><a href="#about" data-section="#about">Nosotros</a></li>
                            <li class="scroll"><a href="#features" data-section="#features">Servicios</a></li>
                               <li class="scroll"><a href="#portfolio" data-section="#portfolio">Facturación</a></li>
                           <li class="scroll"><a href="#contact-area" data-section="#contact-area">Contacto</a></li>
                          <li class="scroll"><a href="#"  onclick="nst()">Intranet</a></li>  
                            
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
                
            </div>
        </header>

    <section id="main-slider">
        <div class="owl-carousel">
            <div class="item" style="background-image: url(images/slider/bg1.png);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="carousel-content text-center">
                                    <h2>FACTURA ELECTRÓNICA <span> Comprobantes autorizados por AFIP</span>.</h2>
                                    <p> Solución informática a todos los responsables Inscriptos que estan obligados a emitir los documentos electrónicos alcanzados por la RG 3749/15 y para los que quieran optar por esta opción.</p>
                                    <a class="btn btn-primary btn-lg" href="FacturaElectronica.aspx">Ver Más</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/.item-->
            <div class="item" style="background-image: url(images/slider/bg2.png);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="carousel-content text-center">

                                    <h2>Diseño y desarrollo de   <span> Sistemas a Medida</span></h2>
                                    <p>Tanto WEB como de Escriotrio e Intranet, nuestro objetivo es solucionarle los problemas y simplificarle el manejo de información de su comercio/empresa.</p>
                                    <a class="btn btn-primary btn-lg" href="#">Ver más</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/.item-->
            <div class="item" style="background-image: url(images/slider/bg3.png);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="carousel-content text-center">
                                    <h2>Consultoría de Sistemas  <span>integrales</span>.</h2>
                                    
                                    <div  >
                                 <p>     
    Diseño y desarrollo de aplicaciones.
      &nbsp;-&nbsp;Planeación de estrategias de informática.
    &nbsp;-&nbsp;Desarrollos web - Diseño Web 
       &nbsp;-&nbsp;Mantenimiento de Equipos y Redes 
       &nbsp;-&nbsp;Evaluación de software y sus requerimientos
       &nbsp;-&nbsp;Abonos - Soporte Técnico</p> 
                                    </div>
                                   
                                    <a class="btn btn-primary btn-lg" href="#">Ver Más</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/.item-->
            
        </div><!--/.owl-carousel-->
    </section><!--/#main-slider-->

    <section id="about">
        <div class="container">

            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown"> Bienvenidos a <span> Hard Soft</span></h2>
                <p class="text-center wow fadeInDown">Technology Solutions</p>
            </div>

            <div class="row">
                

                <div class="col-sm-6 wow fadeInRight" style="text-align:justify">
                    <h3 class="column-title">Acerca Nuestro  </h3>
                    
                    <p> 
                    Somos una empresa especializada en brindar Soluciones Infomáticas caracterizandose por servicios en tecnologías y desarrollos de sistemas informáticos, creada para desarrollar soluciones destinadas a pequeñas y medianas empresas, lo que nos implica en un alto grado de creatividad, experiencia y responsabilidad. 
                 </p>
                       <p>Contamos con un equipo de desarrolladores que desde jóvenes han incursionado en el área de programación e investigación, manejando tecnologías diversas que abarcan desarrollos en múltiples plataformas y la programación en diferentes lenguajes, convirtiendose en expertos en sistemas informáticos respaldados por una extensa trayectoria.</p> 
                           <a class="btn btn-primary" href="Nosotros.aspx">Más sobre nosotros</a>

                </div>
                <div class="col-sm-6 wow fadeInLeft">
                   

                    <img class=" img-responsive img-rounded" src="images/service-solucion1.png" alt=""/>
                </div>
            </div>
        </div>
    </section><!--/#about-->



    
          <section id="features">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">Desarrollamos soluciones que ayudan a su empresa</h2>
                <p class="text-center wow fadeInDown">Cualquiera que sea su necesidad de software, nosotros se la podemos cubrir satisfactoriamente, ya sea desarrollo de escritorio,<br /> Web, Móvil o una combinacion de ellos implementando <span style="color:#72C05B;font-weight:bold"> las últimas tecnologías del mercado.</span></p>
            </div>
            <div class="row">
                <div class="col-sm-6 wow fadeInLeft">
                   <img class="img-responsive" src="images/programcion-222.png" alt="">
                </div>
                <div class="col-sm-6">
                    <div class="media service-box wow fadeInRight">
                        <div class="pull-left">
                            <i  >
                                <img src="images/asp.png" />


                            </i>





                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">.NET</h4>
                            <p>.NET es un conjunto completo de herramientas de desarrollo para la construcción de aplicaciones Web ASP, servicios Web XML y aplicaciones para escritorio.  Visual Basic .NET y.NET, Visual C# .NET son los lenguajes más utilizados en el mercado.</p>
                        </div>
                    </div>

                    <div class="media service-box wow fadeInRight">
                        <div class="pull-left">
                            <i >
                                <img src="images/java.png" />
</i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">JAVA</h4>
                            <p>Es unos de los más potentes lenguajes de programación del mercado el cual puede ser ejecutado en multiples plataformas. Somos desarrolladores tanto de aplicaciónes de escritorio como web (JSP - JSF).</p>
                        </div>
                    </div>

                    <div class="media service-box wow fadeInRight">
                        <div class="pull-left">
                           <i >  <img src="images/php.png" /></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">PHP</h4>
                            <p>PHP es un lenguaje de código abierto muy popular, adecuado para desarrollo web y que puede ser incrustado en HTML. Es popular porque un gran número de páginas y portales web están creadas con PHP.</p>
                        </div>
                    </div>

                    <div class="media service-box wow fadeInRight">
                        <div class="pull-left">
                            <i >  <img src="images/sql2.png" /></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">BASE DE DATOS</h4>
                            <p>Desarrollamos aplicaciones que se conectan a distintos proveedores de base de datos SQLSERVER, MYSQL, ORACLE etc.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>   
    <br />
    
    <section id="portfolio" style="margin-top:10px">  
        <div class="container">

            <div class="row">
                 <div class="col-md-12">
                     <div class="section-header">
                    <h2 class="section-title text-center wow fadeInDown animated" style="visibility: visible;">Factura electrónica </h2>
                    <p class="text-center wow fadeInDown animated" style="visibility: visible;">Este sitio le permite generar Facturas Electrónicas propias gestionando el CAE a través de nosotros. Si Ud. ya cuenta con un sistema de facturación, o utiliza una planilla Excel como herramienta de facturación y desea integrarlo al Régimen de Factura Electrónica, podemos ofrecerles diversas soluciones. 
    <br />
                      
              <a href="FacturaElectronica.aspx"    >      <span style="color:#72C05B;font-weight:bold"> Ver más.</span></a> 
                         </p>
                </div>
                   
       </div></div>  

  <div class="row">
             <div class="col-md-4"> <img src="images/Fe.png"  class="img-responsive img-rounded"/> </div>
            <div class="text-center col-md-8">
                
                <h2 class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="0ms">SISTEMA INTEGRAL DE FACTURACIÓN. <br /> <span>Ingrese en modalidad DEMO para verificar las funcionalidades</span></h2>
                <p class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="100ms">Emití tu factura electrónica de AFIP desde cualquier lugar y con cualquier dispositivo <br />&nbsp;</p>
                <p class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms"><a class="btn btn-primary btn-lg" href="#">Ingresar</a></p>
            </div> </div>
        </div>
    </section>
 



    <section id="testimonial">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">

                <div id="carousel-testimonial" class="carousel slide text-center" data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <p><img class="img-circle img-thumbnail" src="images/seba.jpg" alt="" width="95px"></p>
                                <h4>García Luis Sebastián</h4>
                                <small>Analista en Sistemas informáticos</small>
                                <p>Consultor IT</p>
                            </div>
                            
                        </div>

                        <!-- Controls -->
                        <div class="btns">
                            <a class="btn btn-primary btn-sm" href="#carousel-testimonial" role="button" data-slide="prev">
                                <span class="fa fa-angle-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="btn btn-primary btn-sm" href="#carousel-testimonial" role="button" data-slide="next">
                                <span class="fa fa-angle-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/#testimonial-->





    <section id="contact-area">
        <div class="container">
            <div class="row">
                <div class="section-header">
                    <h2 class="section-title text-center wow fadeInDown animated" style="visibility: visible;">Contacto | CEL: 011-1536806247 </h2>
                    <p class="text-center wow fadeInDown animated" style="visibility: visible;">SISTEMAS@HARDSOFT.COM.AR</p>
                </div>
                

                <form id="main-contact-form" name="contact-form" method="post" action="#">
                    <div class="col-lg-6 animated animate-from-left" style="opacity: 1; left: 0px;">

                        <div class="form-group">
                                <label for="name">NOMBRE (Required)</label>
                                <input id="name" type="text" name="name" class="form-control" placeholder="Name" required>
                            </div>
                        <div class="form-group">
                                <label for="email">EMAIL </label>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
                            </div>
                        <div class="form-group">
                            <label for="subject">Subject</label>
                            <input type="text" id="subject" name="subject" class="form-control" placeholder="Subject" required>
                        </div>

                    </div>
                    <div class="col-lg-6 animated animate-from-right" style="opacity: 1; right: 0px;">
                        <div class="form-group">
                            <label for="message">SU MENSANJE</label>
                            <textarea name="message" id="message" class="form-control" rows="8" placeholder="Message" required></textarea>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="text-center">

                          <button type="submit" class="btn btn-primary btn-lg btn-send-msg">ENVIAR MENSAJE</button>

                    </div>



                                 

                </form>


                <form id="form1" runat="server">

                    <uc1:Ingreso runat="server" ID="Ingreso" />

                </form>
            </div>
        </div>
    </section><!--/#bottom-->

  <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                 
                    
                   <div class="row">
                       <div class="col-md-2">
                    <img src="images/androidb.png" />
                           
                       
                          </div> <div class="col-md-2">

                                        <img src="images/ventanas.png" />
                               </div>
                       
                        <div class="col-md-2">
                        <img src="images/linux.png" />
                        </div>
                       
                        <div class="col-md-2">
                        <img src="images/sql.png" />
                        </div>
                       
                       
                        <div class="col-md-3">
         <p  style="margin-top:20px; text-align:right">
                        &copy; 2016 Hard Soft - Technology Solutions. 
                    </p> 
 </div>


                       
                                       <div class="col-md-1">

        <a href="http://qr.afip.gob.ar/?qr=H1w99QOGN7bzBYz8WSxEBQ,," target="_F960AFIPInfo"><img src="http://www.afip.gob.ar/images/f960/DATAWEB.jpg" border="0" height="64px"></a>
 </div>
                    </div>

                </div>
            </div>
        </div>
    </footer>
    <script>
        function nst() {
            $("#myModal").modal();

        }

    </script>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/mousescroll.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/jquery.inview.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
