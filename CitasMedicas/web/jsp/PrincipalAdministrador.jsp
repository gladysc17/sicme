<%-- 
    Document   : administrador
    Created on : 13-ene-2017, 11:37:12
    Author     : Gladys M
--%>

<%@page import="DTO.AdministradorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrador</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../js/funciones.js" type="text/javascript"></script>
        <meta name="description" content="">
        <meta name="author" content="">        
        <link href="../img/favicon.ico" rel="Shortcut icon">        
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'> 
        <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css">      
        <!--<link type="text/css" rel="stylesheet" href="../css/ie8.min.css">  -->
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
        AdministradorDTO admin = (AdministradorDTO) session.getAttribute("administrador");
        if (admin == null) {

            response.sendRedirect("../index.jsp");
            return;
        }

        String nombre = admin.getNombre_administrador();
        int idadmin = admin.getIdentificacion_administrador();

    %>
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
            <div class="col-md-2">
                <div class="sidebar" style="background-color: gray; position: relative">
                    <div class="sidebar">
                        <div class="user-panel">
                            <div align="center"><img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image"></div>
                            <div align="center">
                                <p style="color: white"><%=nombre%></p>
                                <p style="color: white" class="designation">Administrador(a)</p>
                            </div>                        
                        </div>                                                                                               
                        <div align="center">
                            <input class="btn btn-sm btn-link" type="button" value="Datos Personales" onclick="cargarForm('administrador/recargoAdmin_DatosPersonales.jsp')"/>
                            <a class="btn btn-sm btn-default btn-link" href="../controlador/procesarCierreSesion.jsp"> Cerrar Sesion </a> 
                            <a class="btn btn-sm btn-default btn-link" href="../index.jsp"> PRINCIPAL </a> 
                        </div> 
                       
                    </div>
                </div>
            </div>

            <div class="col-md-10">
                <div>
                    <ul class="breadcrumb">
                        <li><i class="fa fa-home fa-lg"></i></li>
                        <li><a href="PrincipalAdministrador.jsp">Inicio</a></li>
                    </ul>
                </div>
                <div class="row" id="recargo">
                    <div class="col-md-7" style="background-color: #EEE">                       
                        <div align="center">
                            <h1>Citas Medicas</h1>
                            <div class="col-md-4">
                                <div class="card">
                                    <h5 class="card-title"> Nueva Cita </h5>
                                    <img src="../img/cita.jpg" alt="" width="50" height="50"/>
                                    <input type="button" class="btn btn-sm" value="Crear" onclick="cargarForm('administrador/recargoAdmin_CrearCitaMedica1.jsp')"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">                                     
                                        <h5 class="card-title"> Consultar Cita </h5>    
                                        <img src="../img/cita.jpg" alt="" width="50" height="50"/>
                                        <input type="button" class="btn btn-sm" value="Consultar" onclick="cargarForm('administrador/recargoAdmin_ConsultarCitaMedica.jsp')"/>
                                </div>
                            </div>
                            <div class="col-md-4">                                
                                <div class="card">
                                    <h5 class="card-title">  Historia Clinica </h5>
                                    <img src="../img/cita.jpg" alt="" width="50" height="50"/>
                                    <input type="button" class="btn btn-sm" value="H.C"   onclick="cargarForm('administrador/recargoAdmin_ConsultarHistoriaClinica.jsp')"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5" style="background-color: #EEE" >
                        <div align="center">
                            <h1>Eventos</h1>
                            <div class="col-md-6">
                                <div class="card">
                                    <h5 class="card-title"> Nuevo Evento </h5>
                                    <img src="../img/even.jpg" alt="" width="50" height="50"/>                                  
                                    <input type="button" class="btn btn-sm" value="Crear" onclick="cargarForm('administrador/recargoAdmin_CrearEvento.jsp?idenadmin=' +<%=idadmin%>)"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <h5 class="card-title"> Consultar Evento </h5>
                                    <img src="../img/even.jpg" alt="" width="50" height="50"/>                                   
                                    <input type="button" class="btn btn-sm" value="Consulta" onclick="cargarForm('administrador/recargoAdmin_ConsultarEventos.jsp?ideadmin='+<%=idadmin %>)"/>
                                </div>
                            </div>
                        </div>                                                                     
                    </div> <br><br>
                    <div class="col-md-12" style="background-color: #EEE; border-color: black;">                                                
                        <div align="center">
                            <h1>Usuarios</h1>
                            <div class="col-md-2">
                                <div style="background-color: #ffffff">
                                    <h5> Estudiantes </h5>    
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/>  <br>                                                                                                           
                                    <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarEstudiante.jsp')"/>                                    
                                    <input type="button" class="btn btn-sm" value="Lista" onclick="cargarForm('administrador/recargoAdmin_ListarEstudiantes.jsp')"/><br><br>
                                </div> <br>
                            </div>
                            <div class="col-md-2">
                                <div style="background-color: #ffffff">
                                    <h5 class="card-title">Docentes</h5>    
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/><br> 
                                    <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarDocente.jsp')"/>
                                    <input type="button" class="btn btn-sm" value="Lista" onclick="cargarForm('administrador/recargoAdmin_ListarDocente.jsp')"/><br><br>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div style="background-color: #ffffff">

                                    <h5 class="card-title"> Medicos </h5>      
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/><br> 
                                    <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarMedico.jsp')"/>
                                    <input type="button" class="btn btn-sm" value="Lista" onclick="cargarForm('administrador/recargoAdmin_ListarMedico.jsp')"/><br><br>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div style="background-color: #ffffff">
                                    <h5 class="card-title">Servicios generales</h5>    
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/><br> 
                                    <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarServicioGeneral.jsp')"/>
                                    <input type="button" class="btn btn-sm" value="Lista" onclick="cargarForm('administrador/recargoAdmin_ListarServiciosGenerales.jsp')"/><br><br>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div style="background-color: #ffffff">
                                    <h5 class="card-title">Profesional</h5>      
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/><br>
                                    <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarProfesional.jsp')"/>                                        
                                    <input type="button" class="btn btn-sm" value="Lista" onclick="cargarForm('administrador/recargoAdmin_ListarProfessionales.jsp')"/><br><br>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div style="background-color: #ffffff">
                                    <h5 class="card-title">Otros</h5>     
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/><br> 
                                    <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarOtroUsuario.jsp')"/>
                                    <input type="button" class="btn btn-sm" value="Lista" onclick="cargarForm('administrador/recargoAdmin_ListarOtrosUsuarios.jsp')"/><br><br>
                                </div><br>
                            </div><br>
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
    

        <script src="../js/jquery-2.1.4.min.js"></script>
        <script src="../js/essential-plugins.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/pace.min.js"></script>
        <script src="../js/main.js"></script>        
        <script src="../js/funciones.js" type="text/javascript"></script>        
       

    </body>
</html>
