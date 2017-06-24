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
        <script src="js/funciones.js" type="text/javascript"></script>
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="Shortcut icon">

        <!-- Web Fonts -->
        <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'> 
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="css/ie8.min.css">
        <link type="text/css" rel="stylesheet" href="css/blocks.min.css">
        <link type="text/css" rel="stylesheet" href="css/plugins.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.min.css">
        <link type="text/css" rel="stylesheet" href="css/app.min.css">
        <link type="text/css" rel="stylesheet" href="css/shop.plugins.min.css">
        <link type="text/css" rel="stylesheet" href="css/shop.blocks.min.css">
        <link type="text/css" rel="stylesheet" href="css/style-switcher.min.css">
        <link type="text/css" rel="stylesheet" href="css/shop.style.min.css">
        <link type="text/css" rel="stylesheet" href="css/header-v6.min.css">
        <link type="text/css" rel="stylesheet" href="css/header-v8.min.css">
        <link type="text/css" rel="stylesheet" href="css/header.min.css">
        <link type="text/css" rel="stylesheet" href="css/footer-v1.min.css">
        <link type="text/css" rel="stylesheet" href="css/animate.min.css">
        <link type="text/css" rel="stylesheet" href="css/line-icons.min.css">
        <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/owl.carousel.min.css">
        <link type="text/css" rel="stylesheet" href="css/horizontal-parallax.min.css">
        <link type="text/css" rel="stylesheet" href="css/layerslider.min.css">
        <link type="text/css" rel="stylesheet" href="css/ured.min.css">
        <link type="text/css" rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <link type="text/css" rel="stylesheet" href="css/sky-forms.min.css">
        <link type="text/css" rel="stylesheet" href="css/custom-sky-forms.min.css">
        <link type="text/css" rel="stylesheet" href="css/profile.min.css">
        <link type="text/css" rel="stylesheet" href="css/brand-buttons.min.css">
        <link type="text/css" rel="stylesheet" href="css/brand-buttons-inversed.min.css">
        <link type="text/css" rel="stylesheet" href="css/hover.min.css">
        <link type="text/css" rel="stylesheet" href="css/custom-hover-effects.min.css">
        <link type="text/css" rel="stylesheet" href="css/custom.min.css">
        <link type="text/css" rel="stylesheet" href="css/pgwslider.min.css">

    </head>

    <body class="header-fixed boxed-layout" style="position: relative; min-height: 100%; top: 0px;">
        <div class="wrapper">            
            <div id="menu-principal" class="header-v6 header-white-transparent header-sticky" style="position: relative;">
                <div id="barra-superior" class="header-v8">            
                    <div class="blog-topbar">
                        <div class="topbar-search-block">
                            <div class="container">
                                <form action="">
                                    <input type="text" class="form-control" placeholder="Buscar...">
                                    <div class="search-close"><i class="icon-close"></i></div>
                                </form>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <div class="topbar-toggler" style="font-size: 12px; color: #eee; letter-spacing: 1px; text-transform: uppercase;"><span class="fa fa-angle-down"></span> PERFILES</div>
                                    <ul class="topbar-list topbar-menu">                                        
                                        <li><a href="jsp/PrincipalVicerrector.jsp"><i class="fa fa-user"></i> Vicerrector</a></li>                                                                                
                                        <li><a href="jsp/PrincipalMedico.jsp"><i class="fa fa-user-secret"></i> Medico </a></li>
                                        <li><a href="jsp/PrincipalAdministrador.jsp"><i class="fa fa-briefcase"></i> Admin</a></li>                                                                                  
                                        <li><a href="jsp/PrincipalUsuario.jsp"><i class="fa fa-briefcase"></i> Usuario</a></li>                                         
                                        <button type="button" class="btn-default " data-toggle="modal" data-target="#myModalIngresar">Ingresar</button>
                                        <button type="button" class="btn-default" data-toggle="modal" data-target="#myModalRegistro">Registrarse</button>
                                    </ul>                                    
                                </div>                                                                                                   
                            </div>
                        </div>
                    </div>                    
                </div>

                <div class="header-v8 img-logo-superior" style="background-color: #aa1916;">                  
                    <div class="parallax-quote parallaxBg" style="padding: 30px 30px;">
                        <div class="parallax-quote-in" style="padding: 0px;">
                            <div class="row">
                                <div class="col-md-4 col-sm-4 col-xs-5">
                                    <a href="#"> <img id="logo-header" src="img/logo_ufps.png" alt="Logo UFPS"> </a>
                                </div>
                                <div class="col-md-2 col-ms-1 col-xs-2 pull-right">
                                    <a href="http://www.colombia.co/"><img class="header-banner" src="img/escudo_colombia.png" alt="Escudo de Colombia"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="menu-responsive">                   
                    <a class="logo logo-responsive" href="index.jsp"> <img src="img/horizontal_logo_pequeno.png" alt="Logo"> </a>  
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="fa fa-bars"></span>
                    </button>
                </div>

                <div class="row" style="background-color: #aa1916">
                    <h1 style="color: white" align="center">GESTIÓN DE CITAS MEDICAS </h1>
                </div>
            </div>

            <div class="modal inmodal" id="myModalIngresar" tabindex="-1" role="dialog"  aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content animated fadeIn">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>                            
                            <h1 class="modal-title" align="center">Iniciar Sesion</h1>                            
                        </div>
                        <div class="modal-body">
                            <form name="frml" method="post" action="controlador/procesarInicioSesion.jsp">
                                <div class="form-group"><label>Identificación </label> <input type="text" placeholder="Ingrese su identificación" class="form-control" id="usuario" name="usuario"></div>
                                <div class="form-group"><label>Contraseña</label> <input type="password" placeholder="Ingrese su contraseña" class="form-control" id="pw" name="pw"></div>
                                <div>
                                    <input type="button" class="btn btn-sm btn-success m-t-n-xs" onclick="ingresar()" value="Ingresar">&nbsp;&nbsp;&nbsp;                                                                                                                       
                                    <input type="button" class="btn btn-sm btn-link m-t-n-xs" onclick="contrasena()" value="Recuperar Contraseña">

                                </div>
                            </form>
                        </div>
                        <script type="text/javascript">
                            function ingresar() {                                                                

                                if (document.frml.usuario.value.length === 0) {
                                    alert("Por favor ingrese su Nº de Identificación");
                                    document.frml.usuario.focus();
                                    return 0;
                                }
                                if (document.frml.pw.value.length === 0) {
                                    alert("Por favor ingrese su contraseña");
                                    document.frml.pw.focus();
                                    return 0;
                                }
                                else{
                                    document.frml.submit();
                                }
                               
                            }    
                            
                            function contrasena() {                                                                

                                if (document.frml.usuario.value.length === 0) {
                                    alert("Por favor ingrese su Nº de Identificación");
                                    document.frml.usuario.focus();
                                    return 0;
                                }
                               
                                else{
                                     var id = document.getElementById("usuario").value;
                                    location.href = "controlador/procesarRecuperarContrasena.jsp?id="+id;
                                }
                               
                            }    
                        </script>                        
                    </div>
                </div>
            </div>           

            <div class="modal inmodal" id="myModalRegistro" tabindex="-1" role="dialog"  aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content animated fadeIn">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>                            
                            <h1 class="modal-title" align="center">REGISTRO DE USUARIO</h1>                            
                        </div>
                        <div class="modal-body">


                            <div class="panel-body">  
                                <form action="controlador/procesarRegistroUsuario2.jsp" method="post" name="form">

                                    <style>
                                        #estudiante{
                                            display: none;
                                        }                    
                                    </style>
                                    <div class="form-group">  
                                        <div class="col-sm-5">
                                            <label class="control-label">Tipo Identificación: </label>
                                            <div class="">
                                                <select id="tipoid" name="tipoid" required>
                                                    <option> </option>
                                                    <option value="T.I"> Tarjeta de Identidad </option>
                                                    <option value="C.C"> Cedula de Ciudadania </option>
                                                    <option value="C.E"> Cedula de Extranjeria </option>
                                                    <option value="P.P"> Pasaporte </option>                                
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-7">
                                            <label class="control-label">Número de documento:</label>
                                            <input type="number" class="form-control" id="identificacion" name="identificacion" required="">
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <label class="control-label">Tipo de Usuario:</label>
                                            <div class="">
                                                <select name="tipousuario" id="tipousuario" onchange="mostrarDatos()" required>
                                                    <option> </option>
                                                    <option value="estudiante"> Estudiante </option>
                                                    <option value="docente"> Docente </option>                                                                                          
                                                    <option value="administrativo"> Administrativo </option>                                
                                                    <option value="servicios_generales"> Servicios Generales </option>                                                                                              
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-7">
                                            <label class="control-label">Código: </label>
                                            <input type="number" class="form-control" id="codigo" name="codigo" required="">
                                        </div>

                                    </div>
                                    <script>
                                            function mostrarDatos() {

                                                var tipo = document.form.tipousuario;

                                                var selec = tipo.options[tipo.selectedIndex].value;

                                                if (selec == "estudiante") {
                                                    document.getElementById("estudiante").style.display = 'inline';
                                                } else {
                                                    document.getElementById("estudiante").style.display = 'none'
                                                }

                                            }
                                            

                                    </script>

                                    <div class="form-group" id="estudiante">
                                        <div class="col-sm-12">
                                            <label class="control-label">Programa: </label>
                                            <div class="">
                                                <select id="programa" name="programa">                                        
                                                    <option></option>
                                                    <option value="Administracion de Empresas">Administración de Empresas </option>
                                                    <option value="Arquitectura">Arquitectura</option>
                                                    <option value="Comercio Internacional">Comercio Internacional</option>
                                                    <option value="Comunicaion Social">Comunicación Social</option>
                                                    <option value="Contaduria ">Contaduria Pública</option>
                                                    <option value="Derecho">Derecho</option>
                                                    <option value="Enfermeria">Enfermeria</option>
                                                    <option value="ngenieria Agroindustrial">Ingeniería Agroindustrial</option>
                                                    <option value="Ingenieria Agronomica">Ingeniería Agronómica</option>
                                                    <option value="Ingenieria Ambiental">Ingeniería Ambiental</option>
                                                    <option value="Ingenieria Biotecnológica">Ingeniería Biotecnológica</option>
                                                    <option value="Ingenieria Civil">Ingeniería Civil</option>
                                                    <option value="Ingenieria de Minas">Ingeniería de Minas</option>
                                                    <option value="Ingenieria de Sistemas">Ingeniería de Sistemas</option>
                                                    <option value="Ingenieria Electromecanica">Ingeniería Electromecánica</option>
                                                    <option value="Ingenieria Electronica">Ingeniería Electrónica</option>
                                                    <option value="Ingenieria Industrial">Ingeniería Industrial</option>
                                                    <option value="Ingenieria Mecanica">Ingeniería Mecánica</option>
                                                    <option value="Ingenieria Pecuaria">Ingeniería Pecuaria</option>
                                                    <option value="Licenciatura en Matematicas">Licenciatura en Matemáticas</option>
                                                    <option value="Quimica Industrial">Quimica Industrial</option>
                                                    <option value="Seguridad y Salud en el Trabajo">Seguridad y Salud en el Trabajo</option>
                                                    <option value="Trabajo Social">Trabajo Social</option>                                        
                                                    <option value="Tecnologia Agroindustrial">Tecnología Agroindustrial</option>
                                                    <option value="Tecnologia en Gestion de Procesos de Manufactura">Tecnología en Gestión de Procesos de Manufactura</option>
                                                    <option value="Tecnologia en Gestion y Desarrollo de Productos Cerámicos">Tecnología en Gestión y Desarrollo de Productos Cerámicos</option>
                                                    <option value="Tecnologia en Obras Civiles">Tecnología en Obras Civiles</option>
                                                    <option value="Tecnologia en Procesos Industriales">Tecnología en Procesos Industriales</option>                                        
                                                    <option value="Tecnico Prof. en Fabricacion Industrial de Productos Ceramicos">Técnico Prof. en Fabricación Industrial de Productos Cerámicos</option>
                                                    <option value="Tecnico Prof. en Procesamiento de Alimentos">Técnico Prof. en Procesamiento de Alimentos</option>
                                                    <option value="Tecnico Prof. en Procesos de Manufactura de Calzado y Marroquineria">Técnico Prof. en Procesos de Manufactura de Calzado y Marroquineria</option>
                                                    <option value="Tecnico Prof. en Produccion de Ceramica Artesanal">Técnico Prof. en Producción de Cerámica Artesanal</option>
                                                </select>
                                            </div>        
                                        </div>
                                    </div>

                                    <div class="form-group">                              
                                        <div class="col-sm-6">
                                            <label class="control-label">Nombres y Apellidos:</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" required="">
                                        </div>
                                        <div class="col-sm-6">
                                            <label class="control-label">Correo Electrónico:</label>
                                            <input type="email" class="form-control" id="correo" name="correo" required="">
                                        </div>

                                    </div>

                                    <div class="form-group">  
                                        <div class="col-sm-5">
                                            <label class="control-label">Fecha de Nacimiento: </label>
                                            <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" required="">
                                        </div>                    
                                        <div class="col-sm-3">
                                            <label class="control-label">Género: </label>
                                            <div class="form-control" style="border: transparent">
                                                <select id="genero" name="genero">
                                                    <option></option>
                                                    <option value="F"> Femenino </option>
                                                    <option value="M"> Masculino </option>
                                                    <option value="O"> Otro </option>                                
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <label class="control-label">Estado civil: </label>
                                            <div class="form-control" style="border: transparent">
                                                <select name="estadocivil" id="estadocivil">
                                                    <option></option>
                                                    <option value="Soltero(a)"> Soltero(a) </option>
                                                    <option value="Casado(a)"> Casado(a) </option>
                                                    <option value="Union Libre"> Union Libre </option>                                
                                                    <option value="Viudo(a)"> Viudo(a) </option>                                
                                                </select>
                                            </div>
                                        </div>                                                        
                                    </div>

                                    <div class="form-group">   

                                        <div class="col-sm-6">
                                            <label class="control-label">Dirección: </label>
                                            <input type="text" class="form-control" id="direccion" name="direccion" required="">
                                        </div>
                                        <div class="col-sm-6">
                                            <label class="control-label">Teléfono: </label>
                                            <input type="text" class="form-control" id="telefono" name="telefono" required="">
                                        </div>  

                                        <div class="form-group">   

                                            <div class="col-sm-6">
                                                <label class="control-label">Contraseña: </label>
                                                <input type="password" class="form-control" id="contrasena" name="contrasena" required="">
                                            </div>

                                            <div class="col-sm-6">
                                                <label class="control-label">Repetir Contraseña: </label>
                                                <input type="password" class="form-control" id="contrasena2" name="contrasena1" required="">
                                            </div>
                                        </div>




                                    </div>

                                    <br> <br>
                                    <div class="clearfix">
                                        <div class="col-sm-12">
                                            <label class="control-label"> </label>
                                            <input class="btn btn-success btn-block" type="submit" value="REGISTRAR">

                                        </div>
                                        <br><br>


                                    </div>
                                </form>
                            </div>                

                        </div>                        
                    </div>
                </div>
            </div>
            <ul class="pgwSlider">

                <li><a href=""><img src="img/00734e46e47cd9dfcf70b99c4b91bc58.png"><span style="font-family: inherit; font-weight: bold;"><h1> MEDICINA GENERAL</h1></span></a>
                </li>
                <li><a href=""><img src="imagenes/10.png"><span style="font-family: inherit; font-weight: bold;"><h1>ODONTOLOGIA</h1></span></a>
                </li>
                <li><a href=""><img src="imagenes/11.png"><span style="font-family: inherit; font-weight: bold;"><h1>PSICOLOGIA</h1></span></a>
                </li>
                <li><a href=""><img src="imagenes/12.png"><span style="font-family: inherit; font-weight: bold;"><h1>PLANIFICACIONN FAMILIAR </h1></span></a>
                </li>





            </ul>




            <!-- EVENTOS ---------------------->
            <div style="background-color: #e8e8e8; ">
                <div class="container content-prin profile" style="background-color: #e8e8e8;" >
                    <div class="row margin-top-10" >
                        <div class="headline-center-v2 headline-center-v2-dark margin-bottom-10">
                            <h1 style="font-size: 30px;"><b>Eventos</b></h1>
                            <span class="bordered-icon"><i class="fa fa-calendar-o" aria-hidden="true"></i></span>
                        </div>
                        <div class="col-md-12" id="recargo">

                            <div class="row equal-height-columns margin-bottom-10">

                                <div class="container">
                                    <ul class="row block-grid-v2">
                                        <%
                                            FacadeEvento fe = new FacadeEvento();

                                            List<EventoDTO> ls = new ArrayList<EventoDTO>();

                                            ls = fe.obtenerEventosMes();

                                            for (EventoDTO e : ls) {
                                        %>
                                        <li class="col-md-3 col-sm-6 md-margin-bottom-30" style="padding-left: 14px;">

                                            <div class="easy-block-v1">
                                                <img src="img/11.jpg" alt="">
                                                <div class="easy-block-v1-badge rgba-red">
                                                    <%=e.getFechaEvento()%>                                    </div>
                                            </div>
                                            <div class="block-grid-v2-info rounded-bottom  bloques_eventos">
                                                <h5>
                                                    <b><a href="/ueventos/serologias-estudiantes-antiguos-para-el-primer-semestre-de-2016"><%=e.getNombreEvento()%></a></b>
                                                </h5>
                                                <p style="font-size: 14px;">
                                                    <b>Lugar: </b><%= e.getLugarEvento()%>                                       
                                                </p>
                                                <p>
                                                    <input style="font-size:15px; text-align:center" type="button" class="btn btn-sm btn-u-default" value="REGISTRAR" onclick="cargarForm('form.jsp?dsas=<%=e.getIdEvento()%>')"/>
                                                </p>
                                            </div>

                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                    <a href="index.jsp" class="btn-u btn-u-sm pull-right tooltips" data-toggle="tooltip" data-placement="left" data-original-title="Ingresar a Calendario de Eventos">Ver
                                        más <i class="fa fa-chevron-circle-right" aria-hidden="true"></i></a>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>

            <!-- FIN ICONOS REDES SOCIALES -->

            <!-- End Content Part -->
        </div>


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



        <script type="text/javascript" src="js/jquery.min.js"></script>

        <script type="text/javascript" src="js/jquery-migrate.min.js"></script>

        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/pgwslider.min.js"></script>

        <script type="text/javascript" src="js/back-to-top.min.js"></script>

        <script type="text/javascript" src="js/smoothScroll.min.js"></script>

        <script type="text/javascript" src="js/owl.carousel.min.js"></script>

        <script type="text/javascript" src="js/sequence.jquery-min.js"></script>

        <script type="text/javascript" src="js/greensock.js"></script>

        <script type="text/javascript" src="js/layerslider.transitions.js"></script>

        <script type="text/javascript" src="js/layerslider.kreaturamedia.jquery.js"></script>

        <script type="text/javascript" src="js/custom.min.js"></script>

        <script type="text/javascript" src="js/app.min.js"></script>

        <script type="text/javascript" src="js/owl-carousel.min.js"></script>

        <script type="text/javascript" src="js/datepicker.min.js"></script>

        <script type="text/javascript" src="js/validation.min.js"></script>

        <script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.js"></script>

        <script type="text/javascript" src="js/owl-recent-works.min.js"></script>

        <script type="text/javascript" src="js/wow.min.js"></script>     


    </body>
</html>
