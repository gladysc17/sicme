<%-- 
    Document   : procesarModificarOtroUsuario
    Created on : 17-abr-2017, 22:30:08
    Author     : Gladys M
--%>

<%@page import="java.sql.Date"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String identificacion_otro = request.getParameter("identificacion");
            String correo_otro = request.getParameter("correo");
            String fechanacimiento_otro = request.getParameter("fechanacimiento");
            java.sql.Date fecha = java.sql.Date.valueOf(fechanacimiento_otro);
            String genero_otro = request.getParameter("genero");
            String estadocivil_otro = request.getParameter("estadocivil");
            String direccion_otro = request.getParameter("direccion");
            String telefono_otro = request.getParameter("telefono");

            FacadeUsuario fac = new FacadeUsuario();
            boolean rta = fac.modificarUsuario(identificacion_otro, correo_otro, fecha, genero_otro, estadocivil_otro, direccion_otro, telefono_otro);

            String tipo = request.getParameter("tipo");
            
            boolean rta1 = false;
            
            if (tipo.equals("administrador")) {
                String contrasena = request.getParameter("contrasena");
                rta1 = fac.modificarAdmin(identificacion_otro, contrasena);

            } else if (tipo.equals("medico")) {
                String contrasena = request.getParameter("contrasena");
                rta1 = fac.modificarMedico(identificacion_otro, contrasena);

            } else if (tipo.equals("vicerrector")) {
                String contrasena = request.getParameter("contrasena");
                rta1 = fac.modificarVice(identificacion_otro, contrasena);
            }

            if (rta == true) {

        %>
        <script>
            alert(" MODIFICADO");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%        } else {
        %>
        <script>
            alert("ERROR, NO SE MODIFICO");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>
