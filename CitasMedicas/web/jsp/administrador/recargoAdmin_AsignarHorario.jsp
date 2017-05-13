<%-- 
    Document   : asignar_horario
    Created on : 21/03/2017, 09:51:50 PM
    Author     : LEGADO
--%>

<%@page import="DTO.HorarioDTO"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <h1 align="center"> ASIGNACION DE HORARIO </h1>
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <form action="../controlador/procesarAsignarHorario.jsp">
                        <div>
                            <label> Medico:  </label>
                        </div>
                        <div>
                            <%
                                int medico = Integer.parseInt(request.getParameter("medico").toString());
                                System.out.println(medico);
                                FacadeMedico fm = new FacadeMedico();

                                MedicoDTO med = fm.consultarMedicoPorId(medico);
                            %>
                            <label> <%=med.getNombre()%> </label>
                            <input type="hidden" value="<%=medico%>" name="idMedico" />
                        </div>
                        <div>
                            <label> Fecha: </label>
                        </div>
                        <div>
                            <input type="date" class="inline-group" name="fecha" size="12" />
                        </div>
                        <div>
                            <div>
                                <label> Hora </label>
                            </div>

                            <div style="float: left" >
                                <%
                                    FacadeHorario fh = new FacadeHorario();
                                    List<HorarioDTO> ho = fh.consultarHoras();
                                    int con = 0;
                                    for (int i = 0; i < 9; i++) {
                                        HorarioDTO h = ho.get(i);
                                        con++;
                                %>

                                <input type="checkbox" name="hora" value="<%=h.getId_horario()%>"/> <%=h.getHora_inicio() + " - " + h.getHora_final()%> &nbsp;&nbsp; <br> 
                                <%
                                    }
                                %>
                            </div>
                            <div style="float: left">
                                <%
                                    for (int i = con; i < 18; i++) {
                                        HorarioDTO h = ho.get(i);
                                        con++;
                                %>

                                <input type="checkbox" name="hora" value="<%=h.getId_horario()%>"/> <%=h.getHora_inicio() + " - " + h.getHora_final()%> &nbsp;&nbsp; <br>
                                <%
                                    }
                                %>
                            </div>
                            <div style="float: left">
                                <%
                                    for (int i = con; i < 27; i++) {
                                        HorarioDTO h = ho.get(i);
                                        con++;
                                %>

                                <input type="checkbox" name="hora" value="<%=h.getId_horario()%>"/> <%=h.getHora_inicio() + " - " + h.getHora_final()%> &nbsp;&nbsp; <br>
                                <%
                                    }
                                %>
                            </div>
                            <div style="float: left">
                                <%
                                    for (int i = con; i < 36; i++) {
                                        HorarioDTO h = ho.get(i);
                                        con++;
                                %>

                                <input type="checkbox" name="hora" value="<%=h.getId_horario()%>"/> <%=h.getHora_inicio() + " - " + h.getHora_final()%> &nbsp;&nbsp; <br>
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-sm-12">
                                <input type="submit" class="success" value="Registrar"/>
                            </div>
                    </form>

                </div>
            </div>
    </body>
</html>
