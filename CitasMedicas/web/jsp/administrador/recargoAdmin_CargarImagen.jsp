<%-- 
    Document   : recargoAdmin_CargarImagen
    Created on : 1/09/2017, 10:43:09 PM
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
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h4>Nota:</h4>
            <p>
                Para una buena visibilidad de la imagen en la página principal, se recomienda subir la imagen
                con una dimensión de 1900x550 pixeles.
            </p>
            <div class="row">
                <h2>Añadir nuevas imagen</h2>
                <form action="../controlador/subir.jsp" enctype="MULTIPART/FORM-DATA" method="post">
                    <input type="file" name="file" /><br/>
                    <input type="submit" value="Cargar" />
                </form>
            </div>
            <div class="row">
                <h2>Imagenes</h2>
                <%
                FacadeImagen fi = new FacadeImagen();
                List<ImagenDTO> ima = new ArrayList<ImagenDTO>();
                ima = fi.listarImagenes();
                
                for(ImagenDTO x: ima){
                %>
                <div class="col-md-4 panel">
                    <img src="../imagenes/banner/<%=x.getNombre() %>" height="250" width="250" alt="<%=x.getNombre() %>" />
                </div>
                <%
                }
                %>
            </div>
        </div>
        <div class="col-md-1"></div>
    </body>
</html>
