<%-- 
    Document   : procesarModificarVicerrecctor
    Created on : 20-mar-2017, 16:41:20
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeUsuario"%>
<%@page import="FACADE.FacadeVice"%>
<%@page import="DTO.VicerrectorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            VicerrectorDTO vice = (VicerrectorDTO) session.getAttribute("vicerrector");

            String id = vice.getIdentificacion_usuario();

            String correo_otro = request.getParameter("correo");
            String fechanacimiento_otro = request.getParameter("fechanacimiento");
            java.sql.Date fecha = java.sql.Date.valueOf(fechanacimiento_otro);
            String genero_otro = request.getParameter("genero");
            String estadocivil_otro = request.getParameter("estadocivil");
            String direccion_otro = request.getParameter("direccion");
            String telefono_otro = request.getParameter("telefono");

            FacadeUsuario fac = new FacadeUsuario();
            boolean rta = fac.modificarUsuario(id, correo_otro, fecha, genero_otro, estadocivil_otro, direccion_otro, telefono_otro);

            if (rta == true) {

        %>
        <script type="text/javascript">
            alert("DATOS MODIFICADOS");
            location.href = "../jsp/PrincipalVicerrector.jsp";
        </script>
        <%            } else {

        %>
        <script type="text/javascript">
            alert("NO ACTUALIZÓ DATOS");
            location.href = "../jsp/PrincipalVicerrector.jsp";
        </script>
        <%                }

        %>
    </body>
</html>
