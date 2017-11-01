<%-- 
    Document   : recargoVice_InformeCitas2
    Created on : 5/06/2017, 03:01:27 PM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadePrograma_academico"%>
<%@page import="DTO.Programa_academicoDTO"%>
<%@page import="DTO.ServicioDTO"%>
<%@page import="com.sun.xml.internal.org.jvnet.fastinfoset.FastInfosetParser"%>
<%@page import="FACADE.FacadeServicio"%>
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
                System.out.println("consulta" + consulta);
                String fechaIC = request.getParameter("fechaIC");
                String fechaIC2 = request.getParameter("fechaIC2");
                FacadeCita fc = new FacadeCita();
                FacadeEstudiante fe = new FacadeEstudiante();
                FacadeMedico fm = new FacadeMedico();

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
                if (consulta.equalsIgnoreCase("pro_ser")) {
            %>
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Programa Academico</th>
                            <th>Medicina General</th>
                            <th>Odontología</th>
                            <th>Psicología</th>
                            <th>Planificación Familiar</th>
                            <th>Total</th>
                    </thead>
                    <tbody>
                        <%
                            FacadePrograma_academico facPro = new FacadePrograma_academico();
                            List<Programa_academicoDTO> listaProg = facPro.consultarPrograma_academico();
                            
                            for (int i = 0; i < listaProg.size(); i++) {
                                int cant = 0;
                                int idProg = listaProg.get(i).getId();
                                String prog = listaProg.get(i).getNombre_programa();
                                int total = 0;
                        %>
                        <tr>
                            <td>1</td>
                            <td><%=prog%></td>                            


                            <%
                                FacadeServicio facSer = new FacadeServicio();
                                List<ServicioDTO> ls = facSer.consultarServicio();
                                for (int j = 0; j < ls.size(); j++) {
                                    String serv = ls.get(j).getNombre();

                                     cant = fc.cantidadCitasProSer(serv, fechaIC, fechaIC2, idProg);

                            %>

                            <td><%=cant%></td>

                            <%
                                total = total+cant;

                                }
                                
                            %>
                            <td><%=total%></td>
                        </tr>

                        <%
                            }

                        %>
                    </tbody>
                </table>
            </div>
            <%            } else {
                if (consulta.equalsIgnoreCase("programa")) {
            %>
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Programa Academico</th>
                            <th>Citas Asistidas </th>
                            <th>Citas No Asistidas </th>
                            <th>Citas Pendientes </th>
                            <th>Cantidad de Citas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            FacadePrograma_academico facPro = new FacadePrograma_academico();
                            List<Programa_academicoDTO> listaProg = facPro.consultarPrograma_academico();

                            int cantAsistidas = 0;
                            int cantNoAsistidas = 0;
                            int cantPendientes = 0;
                            int cantPrograma = 0;
                            int cantEst = 0;

                            for (int i = 0; i < listaProg.size(); i++) {
                                int idProg = listaProg.get(i).getId();
                                String prog = listaProg.get(i).getNombre_programa();
                                System.out.println("progra " + prog);

                                List<EstudianteDTO> listaEst = fe.consultarEstudiantePrograma(idProg);
                                for (int j = 0; j < listaEst.size(); j++) {
                                    String ideUsuario = listaEst.get(j).getIdentificacion_usuario();

                                    cantEst = fc.cantidadCitasEstudiante(ideUsuario, fechaIC, fechaIC2);

                                    int cantCitasAsist = fe.cantCitasAsistidas(fechaIC, fechaIC2, ideUsuario);
                                    int cantCitasNoAsist = fe.cantCitasNoAsistidas(fechaIC, fechaIC2, ideUsuario);
                                    int cantCitasPend = fe.cantCitasPendientes(fechaIC, fechaIC2, ideUsuario);
                                    cantPrograma = +cantEst;
                                    cantAsistidas = +cantCitasAsist;
                                    cantNoAsistidas = +cantCitasNoAsist;
                                    cantPendientes = +cantCitasPend;

                                    System.out.println("prog " + prog + " cant " + cantPrograma);

                                }%>
                        <tr>
                            <th><%=i + 1%></th>
                            <th><%=prog%></th>
                            <th><%=cantAsistidas%></th>
                            <th><%=cantNoAsistidas%></th>
                            <th><%=cantPendientes%></th>
                            <th><%=cantPrograma%></th>
                        </tr>

                        <%

                            }

                        %>
                    </tbody>
                </table>
            </div>

            <%              } else {
                if (consulta.equalsIgnoreCase("servicio")) {
            %>
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Servicio</th>
                            <th>Citas Asistidas</th>
                            <th>Citas No Asistidas</th>
                            <th>Pendientes</th>
                            <th>Cantidad Citas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            FacadeServicio facSer = new FacadeServicio();
                            List<ServicioDTO> ls = facSer.consultarServicio();
                            for (int i = 0; i < ls.size(); i++) {
                                String dat = ls.get(i).getNombre();

                                int cant = fc.cantidadCitasServicio(dat, fechaIC, fechaIC2);
                                int cantCitasAsist = facSer.cantCitasAsistidas(fechaIC, fechaIC2, dat);
                                int cantCitasNoAsist = facSer.cantCitasNoAsistidas(fechaIC, fechaIC2, dat);
                                int cantCitasPend = facSer.cantCitasPendientes(fechaIC, fechaIC2, dat);
                        %>
                        <tr>
                            <td><%=i + 1%></td>
                            <td><%=dat%></td>
                            <td><%=cantCitasAsist%></td>
                            <td><%=cantCitasNoAsist%></td>
                            <td><%=cantCitasPend%></td>
                            <td><%=cant%></td>
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
