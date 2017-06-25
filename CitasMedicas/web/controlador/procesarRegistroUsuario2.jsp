<%-- 
    Document   : procesarRegistroOtrosUsuarios
    Created on : 22-mar-2017, 22:40:25
    Author     : Gladys M
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
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

            java.sql.Date fechaNac = java.sql.Date.valueOf(fechanacimiento);
            int edad = fac.calcularEdad(fechaNac);

            String estadocivil = request.getParameter("estadocivil");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String tipousuario = request.getParameter("tipousuario");

            String programa = request.getParameter("programa").toString();

            String servicio = request.getParameter("servicio");
            String contrasena = request.getParameter("contrasena");

            Calendar fechaGeneral = new GregorianCalendar();
            int año = fechaGeneral.get(Calendar.YEAR);
            int mes = fechaGeneral.get(Calendar.MONTH);
            int dia = fechaGeneral.get(Calendar.DAY_OF_MONTH);

            String fecha = (año + "-" + mes + "-" + dia);

            UsuarioDTO usuario = new UsuarioDTO(identificacion, tipo_identificacion, codigo, nombre, correo, fechanacimiento, edad, genero, estadocivil, direccion, telefono, tipousuario, fecha, contrasena);
            registro = fac.registrarUsuarios(usuario);

            if (tipousuario.equals("estudiante")) {
                FacadeEstudiante facEst = new FacadeEstudiante();
                EstudianteDTO est = new EstudianteDTO(identificacion, programa);
                registro2 = facEst.registrarEstudiante(est);

            }

            if (registro || registro2) {

        %>
        <script  type = "text/javascript">
            alert("REGISTRO EXITOSO ");
        </script>
        <%  
            UsuarioDTO u = fac.consultarUsuarioPorId(identificacion);
            session.setAttribute("usuario", u);
            response.sendRedirect("../jsp/PrincipalUsuario.jsp");

        } else {

        %>
        <script  type = "text/javascript">
            alert("DATOS INCORRECTOS");
            location.href = "../index.jsp";
        </script>
        <%                        }


        %>

    </body>
</html>