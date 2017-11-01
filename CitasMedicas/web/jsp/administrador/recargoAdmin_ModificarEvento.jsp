<%-- 
    Document   : recargoAdmin_ModificarEvento
    Created on : 1/04/2017, 11:57:24 AM
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
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            String lugar = request.getParameter("lugar");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String nombre = request.getParameter("nombre");
            FacadeHorarioMedico fc = new FacadeHorarioMedico();
            String fec = fc.fechaActual();
        %>
        <div class="col-md-2"></div>

        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 align="center">MODIFICAR EVENTO</h3>
                </div>
                <div class="panel-body">
                    <form action="../controlador/procesarModificarEvento.jsp" method="post">
                        <input type="hidden" name="idEvento" value="<%=idEvento%>" />
                        <div>
                            <label>Nombre: "<%=nombre%>"</label>

                        </div>

                        <div>
                            <label>Fecha: &nbsp;</label>
                            <input class="form-page" type="date" name="nueFechaEvento" size="12" required value="<%=fecha%>" /> <br> <br>
                        </div>
                        <div>
                            <label>Hora: &nbsp;&nbsp;</label>
                            <input class="form-page" type="time" name="nueHoraEvento" min="06:00" max="20:00" required size="12" value="<%=hora%>" /> <br><br>
                        </div>
                        <div>
                            <label>Lugar: &nbsp;</label>
                            <input class="form-control" type="text" name="nuelugarEvento" required value="<%=lugar%>" /> <br><br>
                        </div>
                        <div>
                            <center><input type="submit" class="btn btn-success" value="Modificar"/> </center>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-2"></div>
    </body>
</html>
