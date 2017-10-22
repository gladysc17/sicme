<%-- 
    Document   : procesarCrearServicios
    Created on : 18/10/2017, 10:26:47 AM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeServicio"%>
<%@page import="DTO.ServicioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    String nombre_servicio = request.getParameter("nombre_servicio");
    String informacion = request.getParameter("informacion");

    ServicioDTO ser = new ServicioDTO(nombre_servicio, informacion);

    FacadeServicio fs = new FacadeServicio();

    boolean rta = fs.registrarServicio(ser);

    if (rta) {
%>
<script>
    alert("Servicio registrado");
    location.href = "../jsp/PrincipalAdministrador.jsp";
</script>
<%
} else {
%>
<script>
    alert("Servicio no registrado");
    location.href = "../jsp/PrincipalAdministrador.jsp";
</script>
<%
    }
%>

    </body>
</html>
