<%-- 
    Document   : procesarModificarServicio
    Created on : 18/10/2017, 10:50:26 AM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeServicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            FacadeServicio fs = new FacadeServicio();
            String nuevo_nom = request.getParameter("nuevo_nombre");
            String nueva_info = request.getParameter("nueva_info");
            int id = Integer.parseInt(request.getParameter("id"));

            boolean rta = fs.actualizarServicio(id, nuevo_nom, nueva_info);

            if (rta) {
        %>
        <script>
            alert("Servicio modificado");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Servicio no modificado");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>

    </body>
</html>
