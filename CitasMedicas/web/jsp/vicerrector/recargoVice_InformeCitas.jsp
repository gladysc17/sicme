<%-- 
    Document   : recargoVice_CitasMedicas
    Created on : 20-mar-2017, 18:56:46
    Author     : Gladys M
--%>

<%@page import="DTO.CitaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 align="center"> Citas </h1>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="" class="control-label">Tipo de Consulta</label>
                        <select name="consulta" id="consulta">
                            <option></option>
                            <option value="realizadas">Citas realizadas</option>
                            <option value="programa">Citas por programa</option>
                            <option value="servicio">Citas por servicio</option>
                        </select>
                        <input type="date" id="fechaIC" name="fechaIC" required > &nbsp;&nbsp;&nbsp;
                        <label>&nbsp;&nbsp; hasta &nbsp;&nbsp;</label>
                        <input type="date" id="fechaIC2" name="fechaIC2"/> &nbsp;&nbsp;&nbsp;
                        <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('vicerrector/recargoVice_InformeCitas2.jsp?consulta='+consulta.value+'&fechaIC='+fechaIC.value+'&fechaIC2='+fechaIC2.value)"/>

                        <div class="panel-body" id="cargar">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </body>
</html>
