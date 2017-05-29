<%-- 
    Document   : asignar_horario
    Created on : 21/03/2017, 09:51:50 PM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="FACADE.FacadeHorario"%>
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
                                String id = request.getParameter("ident");
                            System.out.println("id ad " + id);
                                FacadeUsuario fm = new FacadeUsuario();

                                UsuarioDTO usu = fm.consultarUsuarioPorId(id);
                            %>
                            <label> <%=usu.getNombre()%> </label>
                            <input type="hidden" value="<%=id%>" name="idMedico" />
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
