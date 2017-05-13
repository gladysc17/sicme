<%-- 
    Document   : estudiante
    Created on : 13-ene-2017, 10:54:02
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeCita"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> D.S.A.S - Estudiante </title>

        <!-- Meta -->
        <meta charset="utf-8">        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">        
        
        <script src="../js/funciones.js" type="text/javascript"></script>
        
        <link href="../img/favicon.ico" rel="Shortcut icon">        
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

    <%
        EstudianteDTO est = (EstudianteDTO) session.getAttribute("estudiante");
        FacadeCita fac = new FacadeCita();
        if (est == null) {

            response.sendRedirect("../index.html");
            return;
        }
    %>

    <body class="header-fixed boxed-layout" style="position: relative; min-height: 100%; top: 0px;">
        <div class="wrapper">
            <!--=== Header v6 ===-->
            <div id="menu-principal" class="header-v6 header-white-transparent header-sticky" style="position: relative;">
                <div id="barra-superior" class="header-v8">
                    <!-- Topbar blog -->
                    <div class="blog-topbar">                        
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-7 col-xs-7">

                                    <div class="topbar-toggler" style="font-size: 20px; color: #eee; letter-spacing: 1px; text-transform: uppercase;"><span class="fa fa-angle-down"></span> PERFILES</div>
                                    <ul class="topbar-list topbar-menu">                                        
                                        <li><a href="../index.html" style="font-size: 15px"><i class="fa fa-user"></i> PRINCIPAL </a></li>                                                                                                                                                          
                                    </ul>
                                </div>
                                <div class="col-sm-5 col-xs-5 clearfix">
                                    <i class="fa pull-right"></i>
                                    <ul class="topbar-list topbar-log_reg pull-right visible-sm-block visible-md-block visible-lg-block">                                        
                                        <li class="cd-log_reg home">
                                            <a href="https://ww2.ufps.edu.co/"><i class="fa fa-reply"></i> Página UFPS</a>
                                        </li>
                                    </ul>
                                </div>
                            </div><!--/end row-->
                        </div><!--/end container-->
                    </div>
                    <!-- End Topbar blog -->

                </div>


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
                <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
                    <div class="container">
                        <h1 align="center" style="color: white"> SISTEMA DE INFORMACIÓN PARA LA GESTION DE CITAS MEDICAS</h1>
                    </div>
                </div><!--/navbar-collapse-->

                <!-- End Navbar -->
            </div>




            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="pull-left">BIENVENIDO</h1> <br>
                        <hr>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3 col-sm-3">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                Datos Personales
                            </div>

                            <div class="panel-body">
                                <form>  
                                    <div class="media">                                                   
                                        <div class="media-body">
                                            <h4 class="media-heading">Nombre: <%=est.getNombre()%> </h4>                                                        
                                            <h5>Identificación: <%=est.getIdentificacion()%></h5>
                                            <div id="cargar">
                                                <h5>Correo: <%=est.getCorreo()%></h5>                                            
                                                <h5>Telefono: <%=est.getTelefono()%></h5>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="panel-footer">

                                        <input class="btn btn-success btn-sm" type="button" value="Modificar" onclick="cargar_form('recargoModificarEstudiante.jsp?')"/>
                                        <a href="../controlador/procesarCierreSesion.jsp" class="btn btn-danger btn-sm">Cerrar Sesion</a>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-9 col-sm-9">
                        <div class="panel panel-dark">
                            <div class="panel-heading">
                                Citas Medicas
                            </div>
                            <div class="panel-body">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#homec" data-toggle="tab"> <h1> Mis Citas &nbsp;&nbsp; </h1> </a>
                                    </li>
                                    <li class=""><a href="#profilec" data-toggle="tab"> <h1> Crear Cita &nbsp;&nbsp;  </h1> </a>
                                    </li>                                                                       
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="homec">                                        
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <p> Lista de citas programadas </p>
                                            </div>

                                            <%

                                                ArrayList<CitaDTO> citas = fac.consultarCitasEst(est.getIdentificacion());

                                                for (int i = 0; i < citas.size(); i++) {

                                                    String servicio = citas.get(i).getServicio_cita();
                                                    String fecha = citas.get(i).getFecha_cita();
                                                    String hora = citas.get(i).getHora_cita();
                                                    String estado = citas.get(i).getEstado();


                                            %>                                                                                       
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Servicio</th>
                                                                <th>Fecha</th>
                                                                <th>Hora</th>
                                                                <th>Estado</th>
                                                                <th>Accion</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>1</td>
                                                                <td><%=servicio%></td>
                                                                <td><%=fecha%></td>
                                                                <td><%=hora%></td>
                                                                <td><%=estado%></td>
                                                                <td>---</td>
                                                            </tr>                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <%
                                                }
                                                if (citas.size() == 0) {
                                            %>
                                            <h2> No cuenta con citas programadas</h2>
                                            <%
                                                }
                                            %>
                                        </div>                                        
                                    </div>

                                    <div class="tab-pane fade" id="profilec">                                        

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <p>NOTA: Recuerde que para los servicios de Medicina General y Odontología debe cancelar la cuota moderadora $2.700</p>
                                            </div>
                                            <div class="panel-body">
                                                <form class="form-horizontal" action="">
                                                    <br/>
                                                    <p>1. Seleccione el servicio que desea obtener, para consultar el (los) profesional (es) disponibles</p>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-1 control-label">Servicio</label>
                                                        <div class="col-sm-4">
                                                            <select class="form-control" name="servicio" id="servicio" required="" >
                                                                <option value=""> </option>
                                                                <option value="Medicinageneral"> Medicina General </option>
                                                                <option value="Odontologia"> Odontología </option>
                                                                <option value="Psicologia"> Psicología</option>
                                                                <option value="Planificacion"> Planificacion Familiar</option>                  
                                                            </select>
                                                        </div>                                                        

                                                        <div class="col-sm-2">                                                            
                                                            <input type="button" class="btn btn-primary" value="CONSULTAR PROFESIONAL" onclick="cargarForm('recargoCrearCitaMedica.jsp?servicio=' + servicio.value)"/>
                                                            
                                                        </div>
                                                    </div>                                                    
                                                </form>
                                            </div>

                                            <div class="panel-body" id="recargo">
                                                
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>


            </div>


        </div>

        <!--=== Footer Version 1 ===-->
        <!-- organismos de control -->
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
                            <img src="../img/logoIngSistemas.jpg" alt=""/>
                        </div><!--/col-md-3-->
                        <!-- End Link List -->

                        <!-- Address -->
                        <div class="col-md-4 col-sm-4  map-img md-margin-bottom-40">
                            <div class="headline" style="border-bottom: #272727;"><h2>Contactos</h2></div>
                            <address class="md-margin-bottom-40">
                                Avenida Gran Colombia No. 12E-96 Barrio Colsag, <br>
                                San José de Cúcuta - Colombia <br>
                                Teléfono (057)(7) 5776655 <br>
                                Correo: <a href="mailto:oficinadeprensa@ufps.edu.co" class="">oficinadeprensa@ufps.edu.co</a>
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





        <!--=== End Footer Version 1 ===-->
        <script type="text/javascript" src="../js/jquery.min.js"></script>

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
