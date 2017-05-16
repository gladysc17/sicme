<%-- 
    Document   : procesarRegistroOtrosUsuarios
    Created on : 22-mar-2017, 22:40:25
    Author     : Gladys M
--%>

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

            String identificacion = request.getParameter("identificacion");
            String tipo_identificacion = request.getParameter("tipoid");
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String fechanacimiento = request.getParameter("fechanacimiento");            
            String genero = request.getParameter("genero");
            
           
            int edad = fac.calcularEdad(fechanacimiento);
            System.out.println("edadprocesar "+edad);
            String estadocivil = request.getParameter("estadocivil");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String tipousuario = request.getParameter("tipousuario");

            String programa = request.getParameter("programa");

            String servicio = request.getParameter("servicio");
            String contrasena = request.getParameter("contrasena");

            UsuarioDTO usuario = new UsuarioDTO(identificacion, tipo_identificacion, codigo, nombre, correo, fechanacimiento, edad, genero, estadocivil, direccion, telefono, tipousuario);
            boolean registro = fac.registrarUsuarios(usuario);

            if (tipousuario.equals("estudiante")) {
                FacadeEstudiante facEst = new FacadeEstudiante();
                EstudianteDTO est = new EstudianteDTO(identificacion, programa);
                boolean reg = facEst.registrarEstudiante(est);
            } else if (tipousuario.equals("medico")) {
                FacadeMedico facMed = new FacadeMedico();
                int id = Integer.parseInt(identificacion);
                int cod = Integer.parseInt(codigo);
                MedicoDTO med = new MedicoDTO(id, tipo_identificacion, cod, nombre, correo, fechanacimiento, genero, edad, estadocivil, direccion, telefono, contrasena, servicio);
                boolean reg = facMed.registrarMedico(med);
            }

            if (registro == true) {

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
