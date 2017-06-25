<%-- 
    Document   : recargoVice_InformeCitas2
    Created on : 5/06/2017, 03:01:27 PM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>      
        <div class="ibox float-e-margins">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 align="center">INFORME</h3>
                </div>
                <div class="panel-body">
                    <%
                        String consulta = request.getParameter("consulta").toString();
                        System.out.println("consulta" +consulta);
                        String fechaIC = request.getParameter("fechaIC");
                        String fechaIC2 = request.getParameter("fechaIC2");
                        FacadeCita fc = new FacadeCita();
                        FacadeEstudiante fe = new FacadeEstudiante();
                        FacadeMedico  fm = new FacadeMedico();

                        if (consulta.isEmpty() || fechaIC.isEmpty() || fechaIC2.isEmpty() || consulta == null || fechaIC == null || fechaIC2 == null) {
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
                        if (consulta.equalsIgnoreCase("realizadas")) {
                    %>
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cantidad de Citas</th>
                                    <th>Cantidad de Atendidas</th>
                                    <th>Cantidad de No Asistidas</th>
                                    <th>Cantidad de Pendientes</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int cantCitas = fc.cantidadCitas(fechaIC, fechaIC2);
                                    int cantCitasAsist = fc.cantidadCitasAsistidas(fechaIC, fechaIC2);
                                    int cantCitasNoAsist = fc.cantidadCitasNoAsistidas(fechaIC, fechaIC2);
                                    int cantCitasPend = fc.cantidadCitasPendientes(fechaIC, fechaIC2);
                                %>
                                <tr>
                                    <td>1</td>
                                    <td><%=cantCitas%></td>
                                    <td><%=cantCitasAsist%></td>
                                    <td><%=cantCitasNoAsist%></td>
                                    <td><%=cantCitasPend%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <%
                    } else {
                        if (consulta.equalsIgnoreCase("programa")) {
                    %>
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Programa Academico</th>
                                    <th>Cantidad de Citas</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<String> lis1 = new ArrayList<>();
                                    int cantPrograma = 0;
                                    lis1 = fe.consultarProgramaAcademico();
                                    for (int i = 0; i < lis1.size(); i++) {
                                        String prog = lis1.get(i);
                                        List<EstudianteDTO> les = new ArrayList<>();
                                        les = fe.consultarEstudiantePrograma(prog);
                                        for (EstudianteDTO e : les) {
                                            int cantCitas = fc.cantidadCitasEstudiante(e.getIdentificacion_usuario(), fechaIC, fechaIC2);
                                            if (cantCitas > 0) {
                                                cantPrograma++;
                                            }
                                        }
                                %>
                                <tr>
                                    <td><%=i + 1%></td>
                                    <td><%=prog%></td>
                                    <td><%=cantPrograma%></td>
                                </tr>
                                <%
                                        cantPrograma = 0;
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                    <%              } else {
                                        if (consulta.equalsIgnoreCase("servicio")){
                    %>
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Servicio</th>
                                    <th>Cantidad Citas</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                            List<String> ls = new ArrayList<>();
                                            ls = fm.consultaServicios();
                                            for(int i=0; i<ls.size(); i++){
                                                String dat = ls.get(i);
                                                int cant = fc.cantidadCitasServicio(dat,fechaIC, fechaIC2);
                                %>
                                <tr>
                                    <td><%=i+1 %></td>
                                    <td><%=dat %></td>
                                    <td><%=cant %></td>
                                </tr>
                                <%
                                            }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <%
                                        }
                                    }
                                }
                            }
                        }
                    %>
                                                    
                </div>
                    <form action="/CitasMedicas/citas" target="_blank" method="post">
                        <input type="hidden" value="<%=consulta%>" name="consulta" id="consulta">
                        <input type="hidden" value="<%=fechaIC%>" name="fechaIC" id="fechaIC">
                        <input type="hidden" value="<%=fechaIC2%>"  name="fechaIC2" id="fechaIC2">
                        <button type="submit" class="btn btn-success">IMPRIMIR </button>                                               
                    </form>
            </div>
                
                
        </div>

<script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
