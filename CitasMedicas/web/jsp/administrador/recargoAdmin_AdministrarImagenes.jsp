<%-- 
    Document   : prueba
    Created on : 11/09/2017, 03:22:40 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <h4>Nota:</h4>
            <p>
                Recuerde que debe dejar activa 4 imagenes
            </p>

            <table class="table table-responsive table-hover table-bordered dataTable" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                <thead>
                    <tr>
                        <th>Imagen</th>
                        <th>Estado</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        FacadeImagen fi = new FacadeImagen();
                        List<ImagenDTO> lis = new ArrayList<ImagenDTO>();
                        lis = fi.listarImagenes();

                        for (ImagenDTO x : lis) {
                            int id_cita = x.getId();
                    %>
                    <tr>
                        <td>
                            <img src="../imagenes/banner/<%=x.getNombre()%>" height="150" width="150" alt="<%=x.getNombre()%>" />
                            
                        </td>
                        <td>
                            <%=x.getEstado()%>
                        </td>
                        <td>
                            <a href="../controlador/procesarModificarImagen.jsp?id_imagen=<%=id_cita+",1" %>" class="btn btn-primary" >Habilitar</a>
                            <a href="../controlador/procesarModificarImagen.jsp?id_imagen=<%=id_cita+",2" %>" class="btn btn-primary" >Inhabilitar</a>
                            <a href="../controlador/procesarModificarImagen.jsp?id_imagen=<%=id_cita+",3" %>" class="btn btn-primary" >Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="col-md-1"></div>
        <div class="row">
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
            </div>
            <div class="col-md-1"></div>
        </div>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
    </body>
</html>
