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
<div class="ibox float-e-margins"> 
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 align="center"> INFORME CITAS </h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <form action="/CitasMedicas/citas" target="_blank" method="post">
                    <label for="" class="control-label">Tipo de Consulta</label>
                    <select name="consulta" id="consulta">
                        <option></option>
                        <option value="servicio">Citas por servicio</option>
                        <option value="pro_ser">Citas Programa/Servicio</option>
                        <option value="programa">Citas por programa</option>                        
                    </select>
                    <label>&nbsp;&nbsp; desde &nbsp;&nbsp;</label>
                    <input type="date" id="fechaIC" name="fechaIC" required > &nbsp;&nbsp;&nbsp;
                    <label>&nbsp;&nbsp; hasta &nbsp;&nbsp;</label>
                    <input type="date" id="fechaIC2" name="fechaIC2"/> &nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('vicerrector/recargoVice_InformeCitas2.jsp?consulta=' + consulta.value + '&fechaIC=' + fechaIC.value + '&fechaIC2=' + fechaIC2.value)"/>
                </form>
                <div class="panel-body" id="cargar">

                </div>
            </div>
        </div>
    </div>
</div>
