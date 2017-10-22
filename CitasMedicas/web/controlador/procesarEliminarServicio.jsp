<%-- 
    Document   : procesarEliminarServicio
    Created on : 18/10/2017, 10:44:48 AM
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
            int idSe = Integer.parseInt(request.getParameter("idSe"));

            FacadeServicio fs = new FacadeServicio();
            boolean rta = fs.eliminarServicio(idSe);
            if (rta) {
        %>
        <script>
            alert("Servicio eliminado");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Servicio no eliminado");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>

    </body>
</html>
