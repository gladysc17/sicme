<%-- 
    Document   : recargoMedico_CrearEvento
    Created on : 2/04/2017, 03:32:56 PM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int idMedico = Integer.parseInt(request.getParameter("idMedico"));
            FacadeHorarioMedico fc = new FacadeHorarioMedico();
            String fec = fc.fechaActual();
        %>
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="panel panel-grey">
                <div class="panel-heading"><h1 align="center" style="color: white">NUEVO EVENTO</h1></div>
                <div class="panel-body">
                    <form action="../controlador/procesarEventoMedico.jsp">
                        <div>
                            <label>Nombre:</label>
                            <input class="form-control" type="text" id="nombreEvento" name="nombreEvento" required /> <br>
                        </div>
                        <div>
                            <label>Fecha:&nbsp;</label>
                            <input class="form-page" type="date" id="fechaEvento"  name="fechaEvento" size="12" required step="1" min="<%=fec%>" /> <br><br>
                        </div>
                        <div>
                            <label>Hora:&nbsp;&nbsp; </label>
                            <input class="form-page" type="time" id="horaEvento" name="horaEvento" min="06:00" max="20:00" required size="12" /> <br>
                        </div>
                        <div>
                            <label>Lugar:&nbsp; </label>
                            <input class="form-control" type="text" id="lugarEvento" name="lugarEvento" required />
                        </div>
                        <div class="form-group">
                            <label>Descripción: </label>
                            <input class="form-control" type="text" id="descrEvento" name="descrEvento" required />
                        </div>
                        <div>
                            <label>Dirigido por: </label>
                            <input class="form-control" type="text" id="dirEvento" name="dirEvento" required /> <br>
                        </div>
                        <div>
                            <input type="hidden" value="<%= idMedico%>" name="identificion" />
                            <center><button class="btn btn-success"  >Crear Evento</button></center>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-2"></div>
    </body>
</html>
