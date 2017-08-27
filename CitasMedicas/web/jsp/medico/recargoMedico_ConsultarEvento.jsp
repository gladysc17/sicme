<%-- 
    Document   : recargoMedico_ConsultarEvento
    Created on : 2/04/2017, 11:22:00 PM
    Author     : LEGADO
--%>

<%@page import="DTO.EventoDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">    
    <%
        String idMedico = request.getParameter("iddMedico");        
    %>

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
                            List<EventoDTO> ls = fe.listadoEventosAdm("000"+idMedico);
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
                            <td> <input type="submit" class="btn btn-default" value="Modificar" onclick="cargarForm('medico/recargoMedico_ModificarEvento.jsp?idEvento=<%=e.getIdEvento()%>&fecha=<%=e.getFechaEvento()%>&lugar=<%=e.getLugarEvento()%>&nombre=<%=e.getNombreEvento()%>&hora=<%=e.getHoraEvento()%>')" /> </td>
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
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
