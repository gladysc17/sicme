<%-- 
    Document   : PrincipalMedico
    Created on : 28-mar-2017, 19:31:37
    Author     : Gladys M
--%>

<%@page import="DTO.MedicoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Medico</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../js/funciones.js" type="text/javascript"></script>
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Favicon -->
        <link href="../img/favicon.ico" rel="Shortcut icon">
        <!-- Web Fonts -->
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'> 
        <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css">      
        <link type="text/css" rel="stylesheet" href="../css/ie8.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/blocks.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/plugins.min.css">
        <link type="text/css" rel="stylesheet" href="../css/style.min.css">       
        <link type="text/css" rel="stylesheet" href="../css/app.min.css">
        <link type="text/css" rel="stylesheet" href="../css/shop.plugins.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/shop.blocks.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/style-switcher.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/shop.style.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/header-v6.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/header-v8.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/header.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/footer-v1.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/animate.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/line-icons.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="../css/owl.carousel.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/horizontal-parallax.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/layerslider.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/ured.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/jquery.mCustomScrollbar.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/sky-forms.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/custom-sky-forms.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/profile.min.css">       
        <link type="text/css" rel="stylesheet" href="../css/brand-buttons.min.css">
        <link type="text/css" rel="stylesheet" href="../css/brand-buttons-inversed.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/hover.min.css">
        <link type="text/css" rel="stylesheet" href="../css/custom-hover-effects.min.css">
        <link type="text/css" rel="stylesheet" href="../css/custom.min.css">
        <link type="text/css" rel="stylesheet" href="../css/pgwslider.min.css">              
    </head>

    <body class="header-fixed boxed-layout" style="position: relative; min-height: 100%; top: 0px;">

        <div id="menu-principal" class="header-v6 header-white-transparent header-sticky" style="position: relative;">            

            <div class="header-v8 img-logo-superior" style="background-color: #aa1916;">

                <!--=== Parallax Quote ===-->
                <div class="parallax-quote parallaxBg" style="padding: 30px 30px;">

                    <div class="parallax-quote-in" style="padding: 0px;">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-5">
                                <a href="#">
                                    <img id="logo-header"
                                         src=" ../img/logo_ufps.png" alt="Logo UFPS">
                                </a>
                            </div>
                            <div class="col-md-2 col-ms-1 col-xs-2 pull-right">
                                <a href="http://www.colombia.co/"><img class="header-banner"   src="../img/escudo_colombia.png"  alt="Escudo de Colombia"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--=== End Parallax Quote ===-->


            </div><!--/end header-v8-->


            <div class="menu-responsive">
                <!-- Logo -->
                <a class="logo logo-responsive" href="../index.html">
                    <img src="../img/horizontal_logo_pequeno.png" alt="Logo">
                </a>  
                <!-- End Logo -->



                <!-- Toggle get grouped for better mobile display -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bars"></span>
                </button>
                <!-- End Toggle -->
            </div>

            <!-- Navbar -->
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse" style="background-color: #aa1916">
                <div class="container" >
                    <h1 align="center" style="color: white"> GESTION DE CITAS MEDICAS U.F.P.S</h1>
                </div>
            </div><!--/navbar-collapse-->

            <!-- End Navbar -->
        </div>

        <div class="row boxed-layout-space">
            <%
                MedicoDTO med = (MedicoDTO) session.getAttribute("medico");
                
                if (med == null) {

                    response.sendRedirect("../index.jsp");
                    return;
                }
                int id = med.getIdentificacion();
            %>
            <div class="col-md-3">
                <div class="sidebar" style="background-color: gray; position: relative">
                    <div class="sidebar">
                        <div class="user-panel">
                            <div class="pull-left image"><img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image"></div>
                            <div class="pull-left info">
                                <p style="color: white"><%=med.getNombre()%></p>
                                <p style="color: white" class="designation"><%=med.getServicio()%></p>
                            </div>                        
                        </div>                                                                                               
                        <div align="center">
                            <input class="btn btn-sm btn-link" type="button" value="Datos Personales" onclick="cargarForm('medico/recargoMedico_DatosPersonales.jsp')"/>
                            <a class="btn btn-sm btn-default btn-link" href="../controlador/procesarCierreSesion.jsp"> Cerrar Sesion </a> 
                            <a class="btn btn-sm btn-default btn-link" href="../index.jsp"> PRINCIPAL </a> 
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-9 boxed ">
                <div>
                    <ul class="breadcrumb">
                        <li><i class="fa fa-home fa-lg"></i></li>
                        <li><a href="PrincipalMedico.jsp">Inicio</a></li>
                    </ul>
                </div>

                <div class="row" id="recargo">
                    <div class="col-md-12" style="background-color: #EEE">                       
                        <div align="center">
                            <h1>Citas Medicas</h1>

                            <div class="col-lg-4 col-md-4">
                                <div class="card">
                                    <h2 class="card-title"> Citas Programadas </h2>    
                                    <img src="../img/cita.jpg" alt="" width="60" height="60"/>
                                    <input type="button" class="btn btn-sm" value="Atención día" onclick="cargarForm('medico/recargoMedico_ListaAtencionCitasDia.jsp')"/>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="card">
                                    <h2 class="card-title">  Consultar Citas </h2>
                                    <img src="../img/cita.jpg" alt="" width="50" height="50"/>
                                    <input type="button" class="btn btn-sm" value="Consulta" onclick="cargarForm('medico/recargoMedico_ConsultarCitasFecha.jsp')"/>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="card">
                                    <h2 class="card-title">  Historia Clinica </h2>
                                    <img src="../img/cita.jpg" alt="" width="50" height="50"/>
                                    <input type="button" class="btn btn-sm" value="H.C"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="background-color: #EEE" >
                        <div align="center">
                            <h1>Eventos</h1>
                            <div class="col-md-6">
                                <div class="card">
                                    <h5 class="card-title"> Nuevo Evento </h5>
                                    <img src="../img/even.jpg" alt="" width="50" height="50"/>                                  
                                    <input type="button" class="btn btn-sm" value="Crear" onclick="cargarForm('medico/recargoMedico_CrearEvento.jsp?idMedico=' +<%=id%>)"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <h5 class="card-title"> Consultar Evento </h5>
                                    <img src="../img/even.jpg" alt="" width="50" height="50"/>                                   
                                    <input type="button" class="btn btn-sm" value="Consulta" onclick="cargarForm('medico/recargoMedico_ConsultarEvento.jsp?iddMedico=' +<%=id%>)" />
                                </div>
                            </div>
                        </div>                                                                     
                    </div>                    
                </div>       
            </div>
        </div>


        <div>
            <div class="footer-v1 off-container">
                <div class="footer">
                    <div class="container">
                        <div class="row">
                            <!-- About -->
                            <div class="col-md-4 col-sm-4 md-margin-bottom-40">
                                <div class="footer-main">
                                    <a href="index.html"><img id="logo-footer" class="img-responsive" src="../img/logoufpsvertical.png" alt="Logo Pie de Página"></a>
                                </div>
                            </div><!--/col-md-3-->
                            <!-- End About -->


                            <!-- Link List -->
                            <div class="col-md-4 col-sm-4  md-margin-bottom-40">                            
                                <img src="../img/logo_ingsistemas_vertical_invertido.png" alt=""  width="150" height="180"/>
                            </div><!--/col-md-3-->
                            <!-- End Link List -->

                            <!-- Address -->
                            <div class="col-md-4 col-sm-4  map-img md-margin-bottom-40">
                                <div class="headline" style="border-bottom: #272727;"><h2>Contactos</h2></div>
                                <address class="md-margin-bottom-40">
                                    Avenida Gran Colombia No. 12E-96 Barrio Colsag, <br>
                                    San José de Cúcuta - Colombia <br>
                                    Teléfono (057)(7) 5776655 <br>
                                    La Vicerrectoría de Bienestar Universitario se encuentra ubicada en el primer piso del Edificio Aulas Sur, Oficina 104 Teléfono 5776655 - 5752920 ext. 216 – 217.
                                </address>
                            </div><!--/col-md-3-->
                            <!-- End Address -->
                        </div>
                    </div>
                </div><!--/footer-->

                <div class="copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8">
                                <p>
                                    2016 © All Rights Reserved.
                                    Desarrollado por: <a href="#">VAVM - División de Sistemas</a>
                                </p>
                            </div>

                            <!-- Social Links -->
                            <div class="col-md-4">  
                                <ul class="list-inline dark-social pull-right space-bottom-0">
                                    <li>
                                        <a data-placement="top" data-toggle="tooltip" class="tooltips" data-original-title="Facebook" href="https://www.facebook.com/UFPS-C%C3%BAcuta-553833261409690">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-placement="top" data-toggle="tooltip" class="tooltips" data-original-title="Twitter" href="https://twitter.com/UFPSCUCUTA">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-placement="top" data-toggle="tooltip" class="tooltips" data-original-title="Instagram" href="https://www.instagram.com/ufpscucuta/">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-placement="top" data-toggle="tooltip" class="tooltips" data-original-title="Youtube" href="#">
                                            <i class="fa fa-youtube"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-placement="top" data-toggle="tooltip" class="tooltips" data-original-title="Correo" href="#">
                                            <i class="fa fa-envelope-o"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- End Social Links -->
                        </div>
                    </div>
                </div><!--/copyright-->
            </div>
        </div>

        <div class="owl-clients-v1" style="background-color:#EEE; padding: 5px;">
            <div class="item">
                <a href="http://www.mineducacion.gov.co/"><img src="../img/mineducacion.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.contraloriagen.gov.co/"><img src="../img/contraloria.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.procuraduria.gov.co/"><img src="../img/procuraduriageneraldelanacion.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.gobiernoenlinea.gov.co/"><img src="../img/gobiernoenlinea.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.urnadecristal.gov.co/"><img src="../img/urnadecristal.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.icfes.gov.co/"><img src="../img/icfes.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.icetex.gov.co/"><img src="../img/icetex.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.universia.net.co/"><img src="../img/universia.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.colombiaaprende.edu.co/"><img src="../img/colombiaaprende.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.renata.edu.co/"><img src="../img/renata-logo.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.colciencias.gov.co/"><img src="../img/COLCIENCIAS.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.cna.gov.co/"><img src="../img/cna.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.mineducacion.gov.co/sistemasdeinformacion/1735/propertyvalue-41698.html"><img src="../img/SACES.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.mineducacion.gov.co/sistemasdeinformacion/1735/w3-propertyname-2672.html"><img src="../img/SNIES.png" class="hover-shadow" alt=""></a>
            </div>
            <div class="item">
                <a href="http://www.mineducacion.gov.co/sistemasdeinformacion/1735/w3-propertyname-2895.html"><img src="../img/SPADIES.png" class="hover-shadow" alt=""></a>
            </div>


        </div>

        <script src="../js/jquery-2.1.4.min.js"></script>        
        <script src="../js/essential-plugins.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/pace.min.js"></script>
        <script src="../js/main.js"></script>        
        <script src="../js/funciones.js" type="text/javascript"></script>        
        <script type="text/javascript" src="../js/jquery-migrate.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../js/pgwslider.min.js"></script>
        <script type="text/javascript" src="../js/back-to-top.min.js"></script>
        <script type="text/javascript" src="../js/smoothScroll.min.js"></script>
        <script type="text/javascript" src="../js/owl.carousel.min.js"></script>
        <script type="text/javascript" src="../js/sequence.jquery-min.js"></script>
        <script type="text/javascript" src="../js/greensock.js"></script>
        <script type="text/javascript" src="../js/layerslider.transitions.js"></script>
        <script type="text/javascript" src="../js/layerslider.kreaturamedia.jquery.js"></script>
        <script type="text/javascript" src="../js/custom.min.js"></script>
        <script type="text/javascript" src="../js/app.min.js"></script>
        <script type="text/javascript" src="../js/owl-carousel.min.js"></script>
        <script type="text/javascript" src="../js/datepicker.min.js"></script>
        <script type="text/javascript" src="../js/validation.min.js"></script>
        <script type="text/javascript" src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="../js/owl-recent-works.min.js"></script>
        <script type="text/javascript" src="../js/wow.min.js"></script>   

    </body>
</html>