<%-- 
    Document   : procesarModificarImagenes
    Created on : 7/09/2017, 02:00:49 PM
    Author     : LEGADO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DTO.ImagenDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeImagen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String[] imagen = request.getParameterValues("imagen");

            FacadeImagen fi = new FacadeImagen();
            List<ImagenDTO> lis = new ArrayList<ImagenDTO>();
            lis = fi.listarImagenes();
            int i=0;
            boolean rt = false, rt2 = false;
            for (ImagenDTO x : lis) {
                if(i>=imagen.length){
                    break;
                }
                int ide = Integer.parseInt(imagen[i]);
                if (ide == x.getId()) {
                    rt = fi.actualizarEstadoBanner("activo", x.getId());
                    i++;
                } else {
                    rt2 = fi.actualizarEstadoBanner("inactivo", x.getId());
                }
                
                
            }
            if (rt) {
        %>
        <script>
            alert("Banner actualizado");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Banner no se actualizo correctamente");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>
