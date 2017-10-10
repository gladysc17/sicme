<%-- 
    Document   : recargoVice_InformeEvento2
    Created on : 12/06/2017, 11:32:30 AM
    Author     : LEGADO
--%>

<%@page import="DTO.EventoDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 align="center">Informe</h4>
        </div>
        <div class="panel-body">
            <%
                String fechaIC = request.getParameter("fechaIC");
                String fechaIC2 = request.getParameter("fechaIC2");

                FacadeEvento fe = new FacadeEvento();
                List<EventoDTO> ls = fe.listar(fechaIC, fechaIC2);

                if (fechaIC.isEmpty() || fechaIC2.isEmpty() || fechaIC == null || fechaIC2 == null) {
            %>
            <script type="text/javascript">
                alert('Hace falta datos para poder mostrar la información deseada');
            </script>
            <%
            } else {
                SimpleDateFormat ff = new SimpleDateFormat("yyyy-MM-dd");
                Date fechaI = ff.parse(fechaIC);
                Date fechaF = ff.parse(fechaIC2);

                if (fechaF.before(fechaI)) {
            %>
            <script type="text/javascript">
                alert('Fechas no coinciden');
            </script>
            <%
            } else {
            %>
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre Evento</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Lugar</th>
                            <th>Director</th>
                            <th>Cant. de Registrados</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (EventoDTO e : ls) {
                                int cant = fe.cantidadEvento(e.getIdEvento());
                                int pos = 1;
                        %>
                        <tr>
                            <td><%=pos%></td>
                            <td><%=e.getNombreEvento()%></td>
                            <td><%=e.getFechaEvento()%></td>
                            <td><%=e.getHoraEvento()%></td>
                            <td><%=e.getLugarEvento()%></td>
                            <td><%=e.getDirector()%></td>
                            <td><%=cant%></td>
                        </tr>
                        <%
                                pos++;
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <%
                    }

                }
            %>
        </div>
        <form action="/CitasMedicas/eventos" target="_blank" method="post">
            <input type="hidden" value="<%=fechaIC%>" name="fechaIC" id="fechaIC">
            <input type="hidden" value="<%=fechaIC2%>"  name="fechaIC2" id="fechaIC2">            
            <button type="submit" class="btn btn-success">IMPRIMIR </button>                                               
        </form>
    </div>
</div>
       <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
