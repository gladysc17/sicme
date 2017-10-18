<%-- 
    Document   : recargoAdmin_AdministrarServicios
    Created on : 18/10/2017, 10:58:29 AM
    Author     : LEGADO
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.ServicioDTO"%>
<%@page import="FACADE.FacadeServicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="ibox float-e-margins">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 align="center">Servicios Prestados</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                            <th>#</th>
                            <th>Servicio</th>
                            <th>Información</th>
                            <th>Acciones</th>
                            </thead>
                            <tbody>
                                <%
                                    FacadeServicio fs = new FacadeServicio();
                                    ServicioDTO ser = new ServicioDTO();
                                    int i = 1;
                                    List<ServicioDTO> lis = fs.consultarServicio();

                                    for (ServicioDTO x : lis) {
                                        //String id = Integer.toString(x.getId());
%>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=x.getNombre()%></td>
                                    <td><%=x.getInformacion()%></td>
                                    <td>
                                        <input type="submit" class="btn btn-info" value="Modificar" onclick="cargarForm('administrador/recargoAdmin_ModificarServicio.jsp?idServ=<%=x.getId()%>')" />
                                        <a href="../../controlador/procesarEliminarServicio.jsp?idSe=<%=x.getId() %>" class="btn btn-warning" >Eliminar</a>
                                    </td>
                                </tr>
                                <%
                                        i++;
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 align="center">Agregar nuevo servicio</h3>
                </div>
                <div class="panel-body">
                    <form action="../controlador/procesarCrearServicios.jsp" method="post">
                        <label>Nombre del servicio</label>
                        <input type="text" class="form-inline" id="nombre_servicio" name="nombre_servicio" required /> <br>
                        <label>Información</label>
                        <textarea class="form-control" name="informacion" id="informacion" rows="3" required></textarea> <br>
                        <input type="submit" class="btn btn-success" value="Añadir" />
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>

    </body>
</html>
