<%-- 
    Document   : prueba
    Created on : 11/09/2017, 03:56:34 PM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeImagen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String id_imagen = request.getParameter("id_imagen");
        
        String []pos = id_imagen.split(",");
        
        int id = Integer.parseInt(pos[0]);
        int tipo = Integer.parseInt(pos[1]);
        
        FacadeImagen fi = new FacadeImagen();
        
        if(tipo == 1){
            boolean r = fi.actualizarEstadoBanner("Activo", id);
            if(r){
        %>
        <script>
            alert("Imagen activada para el banner de la página principal");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        }
        if (tipo == 2){
            boolean r = fi.actualizarEstadoBanner("Inactivo", id);
            if(r){
        %>
        <script>
            alert("Imagen desactivada para el banner de la página principal");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        }
        if(tipo == 3){
            boolean r = fi.eliminarImagen(id);
            if(r){
        %>
        <script>
            alert("Imagen eliminada para el banner de la página principal");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        }
        %>
    </body>
</html>
