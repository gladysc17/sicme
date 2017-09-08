<%-- 
    Document   : recargoAdmin_AdministrarImagen
    Created on : 6/09/2017, 06:27:41 PM
    Author     : LEGADO
--%>

<%@page import="DTO.ImagenDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeImagen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h3>Imagenes</h3>
            <p>Selecciona cuatro imagenes </p>
            <%
                FacadeImagen fi = new FacadeImagen();
                List<ImagenDTO> lis = new ArrayList<ImagenDTO>();
                lis = fi.listarImagenes();

                for (ImagenDTO x : lis) {
            %>
            <form action="../controlador/procesarModificarImagenes.jsp" method="post">
                <div class="col-md-4 panel">
                    <img src="../imagenes/banner/<%=x.getNombre()%>" height="250" width="250" />
                    <input type="checkbox" name="imagen" value="<%=x.getId()%>" />
                </div>
            
            <%
                }
            %>
            <input type="submit" class="btn btn-success" value="Aceptar" />
            </form>
        </div>
        <div class="col-md-1"></div>
    </body>
</html>
