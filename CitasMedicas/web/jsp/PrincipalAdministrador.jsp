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
        <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css">      
        <link type="text/css" rel="stylesheet" href="../css/ie8.min.css"> 
        <link type="text/css" rel="stylesheet" href="../css/blocks.min.css">        
        <link type="text/css" rel="stylesheet" href="../css/plugins.min.css">
        <link type="text/css" rel="stylesheet" href="../css/style.min.css">       
        <link type="text/css" rel="stylesheet" href="../css/app.min.css">              
        <link type="text/css" rel="stylesheet" href="../css/header-v6.min.css">  
        <link type="text/css" rel="stylesheet" href="../css/footer-v1.min.css">                                                                                                         
        <link type="text/css" rel="stylesheet" href="../css/ured.min.css">                                                                       
        <link type="text/css" rel="stylesheet" href="../css/custom.min.css">        
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
            </div>

            <div class="menu-responsive">                
                <a class="logo logo-responsive" href="../index.html">
                    <img src="../img/horizontal_logo_pequeno.png" alt="Logo">
                </a>                  
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bars"></span>
                </button>                
            </div>

            <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse" style="background-color: #aa1916">
                <div class="container" >
                    <h1 align="center" style="color: white"> GESTION DE CITAS MEDICAS U.F.P.S</h1>
                </div>
            </div>
        </div>

        <div class="row boxed-layout-space">
            <div class="col-md-3">
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

            <div class="col-md-9">
                <div>
                    <ul class="breadcrumb">
                        <li><i class="fa fa-home fa-lg"></i></li>
                        <li><a href="PrincipalAdministrador.jsp">Inicio</a></li>
                    </ul>
                </div>
                <div class="row" id="recargo">
                    <div class="col-md-12" style="background-color: #EEE">                       
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
                     
                    <div class="col-md-6" style="background-color: #EEE; border-color: black;">                                                
                        <div align="center">
                            <h1>Usuarios</h1>
                            <div class="col-md-6">
                                <div class="card">
                                    <h5 class="card-title"> Registrar Usuario </h5>    
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/>                                                                                                           
                                    <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarUsuario.jsp')"/>                                    
                                   
                                </div> 
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <h5 class="card-title"> Consultar Usuario </h5>
                                    <img src="../img/est.jpg" alt="" width="50" height="50"/>                                  
                                    <input type="button" class="btn btn-sm" value="Consulta" onclick="cargarForm('administrador/recargoAdmin_ListarUsuarios.jsp')"/>
                                </div>
                            </div>
                        </div>                                                                    
                    </div>
                                <div class="col-md-6" style="background-color: #EEE" >
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
                                    <input type="button" class="btn btn-sm" value="Consulta" onclick="cargarForm('administrador/recargoAdmin_ConsultarEventos.jsp?ideadmin=' +<%=idadmin%>)"/>
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


        <script src="../js/jquery-2.1.4.min.js"></script>
        <script src="../js/essential-plugins.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/pace.min.js"></script>
        <script src="../js/main.js"></script>        
        <script src="../js/funciones.js" type="text/javascript"></script>        


    </body>
</html>
