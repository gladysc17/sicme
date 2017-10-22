<%-- 
    Document   : recargoAdmin_ModificarServicio
    Created on : 18/10/2017, 11:00:03 AM
    Author     : LEGADO
--%>

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
        <%
        int idServ = Integer.parseInt(request.getParameter("idServ"));
        FacadeServicio fs = new FacadeServicio();
        ServicioDTO ser = fs.consultarServicioId(idServ);
        %>
        <div class="ibox float-e-margins">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>Modificar información</h3>
                </div>
                <div class="panel-body">
                    <form action="../controlador/procesarModificarServicio.jsp" method="post">
                        <input type="hidden" name="id" value="<%=idServ %>" /> 
                        <label>Nombre del Servicio: </label>
                        <input type="text" class="form-inline" name="nuevo_nombre" value="<%=ser.getNombre() %>" required /> <br>
                        <label>Información</label>
                        <textarea class="form-control" rows="3" name="nueva_info" required></textarea> <br>
                        <input type="submit" class="btn btn-info" value="Modificar" />
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
