<%-- 
    Document   : index
    Created on : 4/03/2017, 09:01:09 PM
    Author     : LEGADO
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="FACADE.FacadeEvento" %>
<%@page import="DTO.EventoDTO" %>

<!DOCTYPE html>
<html>
    <head>
        <title>D.S.A.S - UFPS</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/header.min.css" rel="stylesheet" type="text/css"/>        
        <link href="css/app.min.css" rel="stylesheet" type="text/css"/>        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/header-v6.min.css" rel="stylesheet" type="text/css"/>        
        <link href="css/custom.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer-v1.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pgwslider.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/ured.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>                 

    </head>

    <body class="header-fixed boxed-layout" style="position: relative; min-height: 100%; top: 0px;">
        <div class="wrapper">
            <!--=== Header v6 ===-->
            <div id="menu-principal" class="header-v6 header-white-transparent header-sticky" style="position: relative;">
                <div id="barra-superior" class="header-v8">
                    <!-- Topbar blog -->
                    <div class="blog-topbar">                        
                        <div class="container">                           
                            <div class="col-sm-12 col-xs-12">
                                <div class="topbar-toggler" style="font-size: 12px; color: #eee; letter-spacing: 1px; text-transform: uppercase;"><span class="fa fa-angle-down"></span> Ingresar </div>
                                <form method="post" name="form">
                                    <ul class="topbar-list topbar-menu">                                        
                                        <li><a href="jsp/PrincipalVicerrector.jsp"><i class="fa fa-user"></i> Vicerrector</a></li>                                                                                
                                        <li><a href="jsp/PrincipalMedico.jsp"><i class="fa fa-user-secret"></i> Medico </a></li>
                                        <li><a href="jsp/PrincipalAdministrador.jsp"><i class="fa fa-briefcase"></i> Admin</a></li>                                            
                                        <li> usuario <input type="text" id="usuario" name="usuario" required> </li>
                                        <li> contraseña <input type="password" id="pw" name="pw" required>  </li> 
                                        <li><input type="button" class="btn-link" Value="INGRESAR" onclick="ingresar()"> </li>
                                        <li>  <input type="button" class="btn-link" Value="RECUPERAR CONTRASEÑA" onClick="contrase()"> </li>
                                    </ul>                                        

                                </form>
                                <script type="text/javascript">
                                    function ingresar() {
                                        if (document.form.usuario.value.length == 0) {
                                            alert("INGRESE SU IDENTIFICACION");
                                            document.form.usuario.focus();
                                            return 0;
                                        } else if (document.form.pw.value.length == 0) {
                                            alert("INGRESE SU CONTRASEÑA");
                                            document.form.pw.focus();
                                            return 0;
                                        } else {
                                            document.form.action = 'controlador/procesarInicioSesion.jsp';
                                            document.form.submit()
                                        }
                                    }

                                    function contrase() {
                                        if (document.form.usuario.value.length == 0) {
                                            alert("INGRESE SU IDENTIFICACION");
                                            document.form.usuario.focus();
                                            return 0;
                                        } else {
                                            document.form.action = 'controlador/procesarRecuperarContrasena.jsp';
                                            document.form.submit();
                                        }
                                    }
                                </script>
                            </div>                                                          
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
                                             src="imagenes/logo_ufps.png" alt="Logo UFPS">
                                    </a>
                                </div>
                                <div class="col-md-2 col-ms-1 col-xs-2 pull-right">
                                    <a href="http://www.colombia.co/"><img class="header-banner"   src="imagenes/escudo_colombia.png"  alt="Escudo de Colombia"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--=== End Parallax Quote ===-->
                </div><!--/end header-v8-->


                <div class="menu-responsive">
                    <!-- Logo -->
                    <a class="logo logo-responsive" href="index.jsp">
                        <img src="imagenes/horizontal_logo_pequeno.png" alt="Logo">
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
                        <h1 align="center" style="color: white"> GESTION DE CITAS MEDICAS U.F.P.S</h1>
                    </div>
                </div><!--/navbar-collapse-->

                <!-- End Navbar -->
            </div>

            <ul class="pgwSlider">

                <li><a href=""><img src="imagenes/28e89a8d6a0ec5d1905e596ca2a28898.png"><span style="font-family: inherit; font-weight: bold;"> Medicina General: </span></a>
                </li>
                <li><a href=""><img src="imagenes/00734e46e47cd9dfcf70b99c4b91bc58.png"><span style="font-family: inherit; font-weight: bold;">Odontología: </span></a>
                </li>
                <li><a href=""><img src="imagenes/6d6fe00fd4cb104a238e5020b3317596.png"><span style="font-family: inherit; font-weight: bold;">Psicología: </span></a>
                </li>
                <li><a href=""><img src="imagenes/2246d36031da923ba74a3ff8a6daef86.png"><span style="font-family: inherit; font-weight: bold;">Planificación familiar: </span></a>
                </li>

            </ul>

            <!-- SERVICIOS -->
            <div style="background-color: #e8e8e8; ">
                <div class="container content-prin profile">
                    <div class="row margin-top-10">
                        <div class="headline-center-v2 headline-center-v2-dark margin-bottom-10">
                            <h1 style="font-size: 30px;"><b>EVENTOS</b></h1>
                            <span class="bordered-icon"><i class="fa fa-eyedropper" aria-hidden="true"></i></span>
                        </div>
                        <div class="col-md-12">
                            <div class="row equal-height-columns margin-bottom-10">

                                <div class="container">
                                    <ul class="row block-grid-v1">
                                        <%
                                            FacadeEvento fe = new FacadeEvento();

                                            List<EventoDTO> ls = new ArrayList<EventoDTO>();

                                            ls = fe.obtenerEventosMes();

                                            for (EventoDTO e : ls) {
                                        %>
                                        <li class="col-md-3 col-sm-6 md-margin-bottom-30" style="padding-left: 14px;">

                                            <div class="block-grid-v1 background-trasparent-black">
                                                <h3 style="color: white">
                                                    <%= e.getNombreEvento()%>
                                                </h3>
                                                <p class="text-left" style="font-size: 10px; color: white">
                                                    <b>Dirigido por:</b>
                                                    <%= e.getDirector()%>
                                                </p>
                                            </div>
                                            <div class="block-grid-v2-info rounded-bottom  bloques_eventos">                                                                                               

                                                <p class="text-left" style="font-size: 12px;"> 
                                                    <b>Lugar:</b>
                                                    <%= e.getLugarEvento()%>
                                                </p>
                                                <p class="text-left" style="font-size: 10px;">
                                                    <b>Fecha:</b>
                                                    <%= e.getFechaEvento()%> &nbsp;
                                                    <b>Hora:</b>
                                                    <%= e.getHoraEvento()%> 
                                                </p>
                                                <p class="text-left" style="font-size: 10px;">
                                                    <b>Descripción:</b>
                                                    <%= e.getDescrEvento()%>
                                                </p>

                                                <button> <a href="inscripcionEvento.html" ></a> Inscribirme</button> 
                                            </div>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>
            </div>
            <!-- FIN SERVICIOS -->                        
            <!-- Modal inscripción -->



        </div><!--/wrapper-->
        <!--=== Footer Version 1 ===-->
        <!-- organismos de control -->
        <div class="wrapper">


            <div class="footer-v1 off-container">
                <div class="footer">
                    <div class="container">
                        <div class="row">
                            <!-- About -->
                            <div class="col-md-4 col-sm-4 md-margin-bottom-40">
                                <div class="footer-main">
                                    <a href="index.jsp"><img id="logo-footer" class="img-responsive" src="imagenes/logoufpsvertical.png" alt="Logo Pie de Página"></a>
                                </div>
                            </div><!--/col-md-3-->
                            <!-- End About -->


                            <!-- Link List -->
                            <div class="col-md-4 col-sm-4  md-margin-bottom-40">                            
                                <img src="imagenes/logo_ingsistemas_vertical_invertido.png" alt="" width="150" height="180"/>
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

        </div>
                


    </body>
</html>
