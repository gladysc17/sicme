<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.UsuarioDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrador</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <script src="../js/funciones.js" type="text/javascript"></script>
        <link href="../css/header.min.css" rel="stylesheet" type="text/css"/>        
        <link href="../css/app.min.css" rel="stylesheet" type="text/css"/>        
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <link href="../css/header-v6.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/header-v8.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/custom.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/footer-v1.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/pgwslider.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/ured.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>                 
    </head>

    <body>
        <%

            UsuarioDTO admin = (UsuarioDTO) session.getAttribute("administrador");
            if (admin == null) {

                response.sendRedirect("../index.jsp");
                return;
            }

            String id = admin.getIdentificacion();                    
            FacadeUsuario fac = new FacadeUsuario();
            UsuarioDTO usuario = fac.consultarUsuarioPorId(id);
            String nombre = usuario.getNombre();

        %>
        <div id="menu-principal" class="header-v6 header-white-transparent header-sticky" style="position: relative;">            

            <div class="header-v8 img-logo-superior" style="background-color: #aa1916;">                
                <div class="parallax-quote parallaxBg" style="padding: 30px 30px;">

                    <div class="parallax-quote-in" style="padding: 0px;">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-5">
                                <a href="../index.jsp">
                                    <img id="logo-header" src="../imagenes/logo_ufps.png" alt="Logo UFPS">
                                </a>
                            </div>
                            <div class="col-md-2 col-ms-1 col-xs-2 pull-right">
                                <a href="http://www.colombia.co/"><img class="header-banner"   src="../imagenes/escudo_colombia.png"  alt="Escudo de Colombia"></a>
                            </div>
                        </div>
                    </div>
                </div>                
            </div>

            <div class="menu-responsive">                
                <a class="logo logo-responsive" href="../index.jsp">
                    <img src="../imagenes/horizontal_logo_pequeno.png" alt="Logo">
                </a>                  
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bars"></span>
                </button>                
            </div>

            <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse" style="background-color: #aa1916">
                <div class="container" >
                    <h1 align="center" style="color: white; font: bold;"> GESTION DE CITAS MEDICAS </h1>
                </div>                

            </div>

        </div>
        <nav class="navbar-default navbar-static-side hidden-xs" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> <span>
                                <div align="center"><img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image"></div>
                            </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=nombre%></strong>
                                    </span> <span class="text-muted text-xs block">Administrador <b class="caret"></b></span> </span> </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><input style="font-size: 20px;" type="button" class="btn btn-sm btn-link" value="Perfil" onclick="cargarForm('administrador/recargoAdmin_ModificarUsuario.jsp?ident=' + <%=id%>)"/></li>
                                <li class="divider"></li>
                                <li><a href="../controlador/procesarCierreSesion.jsp"><h3>Cerrar Sesion</h3></a></li>
                                <li><a href="../index.jsp"><h3>Inicio</h3></a></li>
                            </ul>
                        </div>                           
                    </li>
                </ul>
                <hr>                   
            </div>
        </nav>

        <div id="wrapper">
            <div id="page-wrapper" class="gray-bg">
                <div class="row wrapper border-bottom white-bg page-heading" id="rows">
                    <div class="col-lg-10">
                        <br>                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <a href="PrincipalAdministrador.jsp"><strong><i class="fa fa-home"></i>  - Principal</strong></a>
                            </li>

                        </ol>
                    </div>
                    <div class="col-lg-2">
                        <ul class="nav navbar-top-links navbar-right hidden-lg hidden-md">                           

                            <li>
                                <a href="../controlador/procesarCierreSesion.jsp">
                                    <i class="fa fa-sign-out"></i> Salir
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>                


                <div class="wrapper wrapper-content" id="recargo">
                    <div class="row animated fadeInRight">
                        <div class="col-md-7">
                            <div class="ibox float-e-margins bg-warning">
                                <div class="ibox-title">
                                    <h3 align="center"> USUARIOS</h3>
                                </div>
                                <div>                                    
                                    <div class="ibox-content">

                                        <div class="user-button" align="center">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <i class="fa fa-user-circle-o fa-5x" aria-hidden="true"></i> <br><br>
                                                    <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="REGISTRAR" onclick="cargarForm('administrador/recargoAdmin_RegistrarUsuario.jsp')"/>
                                                </div>
                                                <div class="col-md-4">
                                                    <i class="fa fa-list-alt fa-5x" aria-hidden="true"></i> <br><br>
                                                    <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="CONSULTAR" onclick="cargarForm('administrador/recargoAdmin_ListarUsuarios.jsp')"/>
                                                </div>
                                                <div class="col-md-4">
                                                    <i class="fa fa-clock-o fa-5x" aria-hidden="true"></i> <br><br>
                                                    <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="HORARIO MEDICO" onclick="cargarForm('administrador/recargoAdmin_ListarMedicos.jsp')"/>
                                                </div>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h3 align="center"> HISTORIA CLINICA</h3>
                                </div>

                                <div class="ibox-content">

                                    <div class="user-button">
                                        <div class="row">
                                            <div class="col-md-12" align="center">
                                                <i class="fa fa-file-pdf-o   fa-5x" aria-hidden="true"></i> <br><br>
                                                <input style="font-size:20px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="CONSULTAR" onclick="cargarForm('administrador/recargoAdmin_ConsultarHistoriaClinica.jsp')"/>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="ibox float-e-margins" >
                                <div class="ibox-title" >
                                    <h3 align="center"> CITAS MEDICAS</h3>
                                </div>
                                <div>
                                    <div class="ibox-content" align="center">                                        
                                        <div class="user-button">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <i class="fa fa-address-book-o fa-5x" aria-hidden="true"></i> <br><br>
                                                    <input style="font-size:20px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="NUEVA CITA" onclick="cargarForm('administrador/recargoAdmin_CrearCitaMedica.jsp')"/>
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="fa fa-id-card-o fa-5x" aria-hidden="true"></i> <br><br>
                                                    <input style="font-size:20px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="CONSULTAR CITA" onclick="cargarForm('administrador/recargoAdmin_ConsultarCitaMedica.jsp')"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h3 align="center"> EVENTOS</h3>
                                </div>
                                <div>
                                    <div class="ibox-content">

                                        <div class="user-button" align="center">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <i class="fa fa-calendar-plus-o fa-5x" aria-hidden="true"></i> <br><br>
                                                    <input style="font-size:18px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="NUEVO EVENTO" onclick="cargarForm('administrador/recargoAdmin_CrearEvento.jsp?idenadmin=' +<%=id%>)"/>
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="fa fa-calendar fa-5x" aria-hidden="true"></i> <br><br>
                                                    <input style="font-size:18px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="CONSULTAR EVENTO" onclick="cargarForm('administrador/recargoAdmin_ConsultarEventos.jsp?ideadmin=' +<%=id%>)"/>
                                                </div>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h1>INFORMES</h1>                                                
                        <div class="col-md-3">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title" >
                                    <h3 align="center"> CITAS MEDICAS</h3>
                                </div>
                                <div>                                    
                                    <div class="ibox-content">
                                        <div class="user-button" align="center">
                                            <div class="row">                                                
                                                <i class="fa fa-file-text fa-5x" aria-hidden="true"></i> <br><br>
                                                <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="Consultar" onclick="cargarForm('vicerrector/recargoVice_InformeCitas.jsp')"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                                

                        <div class="col-md-3">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h3 align="center"> USUARIOS</h3>
                                </div>
                                <div>                                    
                                    <div class="ibox-content">

                                        <div class="user-button" align="center">
                                            <div class="row">                                                
                                                <i class="fa fa-users fa-5x" aria-hidden="true"></i> <br><br>
                                                <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="Consultar" onclick="cargarForm('vicerrector/recargoVice_InformeUsuarios.jsp')"/>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h3 align="center"> EVENTOS</h3>
                                </div>

                                <div class="ibox-content">

                                    <div class="user-button" align="center">
                                        <div class="row">                                            
                                            <i class="fa fa-clipboard fa-5x" aria-hidden="true"></i> <br><br>
                                            <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="Consultar" onclick="cargarForm('vicerrector/recargoVice_InformeEvento.jsp')"/>                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-md-3">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h3 align="center"> ADMINISTRAR IMAGENES </h3>
                                </div>
                                <div class="ibox-content">
                                    <div class="usser-button" align="center">
                                        <div class="row">
                                            <i class="fa fa-image fa-5x" aria-hidden="true"></i> <br><br>
                                            <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="Administrar" onclick="cargarForm('administrador/recargoAdmin_AdministrarImagenes.jsp')" />
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
</div>



<div class="footer-v1 off-container">
    <div class="footer">
        <div class="container">
            <div class="row">
                <!-- About -->
                <div class="col-md-4 col-sm-4 md-margin-bottom-40">
                    <div class="footer-main">
                        <a href="index.jsp"><img id="logo-footer" class="img-responsive" src="../imagenes/logoufpsvertical.png" alt="Logo Pie de Página"></a>
                    </div>
                </div><!--/col-md-3-->
                <!-- End About -->


                <!-- Link List -->
                <div class="col-md-4 col-sm-4  md-margin-bottom-40">                            
                    <img src="../imagenes/logo_ingsistemas_vertical_invertido.png" alt="" width="150" height="180"/>
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


<!-- Mainly scripts -->
<script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>        
<script src="../js/essential-plugins.js" type="text/javascript"></script>       
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/main.js" type="text/javascript"></script>
<script src="../js/pace.min.js" type="text/javascript"></script>
<script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
</body>    
</html>
