<%-- 
    Document   : recargoAdmin_ConsultarEventos
    Created on : 30/03/2017, 09:38:35 PM
    Author     : LEGADO
--%>

<%@page import="DTO.EventoDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int idadmin = Integer.parseInt(request.getParameter("ideadmin"));
        %>
        <div class="col-md-1"></div> 
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 align="center">Listado de Eventos</h4>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Fecha</th>
                                    <th>Hora</th>
                                    <th>Lugar</th>
                                    <th>Descripción</th>
                                    <th>Dirigido por</th>
                                    <th>Modificar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeEvento fe = new FacadeEvento();
                                    List<EventoDTO> ls = fe.listadoEventosAdm(idadmin);
                                    int i = 1;
                                    for (EventoDTO e : ls) {
                                %>
                                <tr role="row" class="odd">
                                    <td><%=i%></td>
                                    <td><%=e.getNombreEvento()%></td>
                                    <td><%=e.getFechaEvento()%></td>
                                    <td><%=e.getHoraEvento()%></td>
                                    <td><%=e.getLugarEvento()%></td>
                                    <td><%=e.getDescrEvento()%></td>
                                    <td><%=e.getDirector()%></td>
                                    <td> <input type="submit" class="btn btn-default" value="Modificar" onclick="cargarForm('administrador/recargoAdmin_ModificarEvento.jsp?idEvento='+<%=e.getIdEvento()%>)" /> </td>
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
        </div>
        <div class="col-md-1"></div>
        <script src="../js/jquery-2.1.4.min.js"></script>
        <script src="../js/essential-plugins.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/pace.min.js"></script>
        <script src="../js/main.js"></script>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
    </body>
</html>
