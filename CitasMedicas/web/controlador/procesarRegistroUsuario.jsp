<%-- 
    Document   : procesarRegistroOtrosUsuarios
    Created on : 22-mar-2017, 22:40:25
    Author     : Gladys M
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="DTO.AdministradorDTO"%>
<%@page import="FACADE.FacadeAdministrador"%>
<%@page import="DTO.VicerrectorDTO"%>
<%@page import="FACADE.FacadeVice"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <%
            FacadeUsuario fac = new FacadeUsuario();
            boolean registro = false;
            boolean registro2 = false;

            String identificacion = request.getParameter("identificacion");
            String tipo_identificacion = request.getParameter("tipoid");
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String fechanacimiento = request.getParameter("fechanacimiento");
            String genero = request.getParameter("genero");

            java.sql.Date fecha = java.sql.Date.valueOf(fechanacimiento);
            int edad = fac.calcularEdad(fecha);
            System.out.println("edadprocesar " + edad);
            String estadocivil = request.getParameter("estadocivil");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String tipousuario = request.getParameter("tipousuario");

            String programa = request.getParameter("programa");

            String servicio = request.getParameter("servicio");
            String contrasena1 = request.getParameter("contrasena");
            String contrasena2 = request.getParameter("passw");
            
            Calendar fecha2 = new GregorianCalendar();
            int año = fecha2.get(Calendar.YEAR);
            int mes = fecha2.get(Calendar.MONTH);
            int dia = fecha2.get(Calendar.DAY_OF_MONTH);
            
            String fecha3 =(año+"-"+mes+"-"+dia);
            System.out.println("fecha 3:" + fecha3);

            UsuarioDTO usuario = new UsuarioDTO(identificacion, tipo_identificacion, codigo, nombre, correo, fechanacimiento, edad, genero, estadocivil, direccion, telefono, tipousuario, fecha3);
            registro = fac.registrarUsuarios(usuario);

            if (tipousuario.equals("estudiante")) {
                FacadeEstudiante facEst = new FacadeEstudiante();
                EstudianteDTO est = new EstudianteDTO(identificacion, programa);
                registro = facEst.registrarEstudiante(est);

            } else if (tipousuario.equals("medico")) {
                FacadeMedico facMed = new FacadeMedico();              
                MedicoDTO med = new MedicoDTO(identificacion, servicio, contrasena2);                
                registro = facMed.registrarMedico(med);
                
            } else if (tipousuario.equals("vicerrector")) {
                FacadeVice facVice = new FacadeVice();              
                VicerrectorDTO vc = new VicerrectorDTO(identificacion, contrasena1);
                registro = facVice.registrarVice(vc);
                
            } else if (tipousuario.equals("administrador")) {
                FacadeAdministrador facAd = new FacadeAdministrador();               
                AdministradorDTO ad = new AdministradorDTO(identificacion, contrasena1);
                registro = facAd.registrarAdministrador(ad);
                
            }

            if (registro || registro2) {

        %>
        <script  type = "text/javascript">
            alert("REGISTRO EXITOSO ");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%        } else {

        %>
        <script  type = "text/javascript">
            alert("DATOS INCORRECTOS");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%                        }


        %>





    </body>
</html>
