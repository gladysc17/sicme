<%-- 
    Document   : InscripcionEvento
    Created on : 9/06/2017, 09:38:03 AM
    Author     : LEGADO
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.EventoDTO"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <body>
        <div class="wrapper">
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
            <div class="col-md-12" style="background-color: #e8e8e8; ">
                

                </body>
                </html>
