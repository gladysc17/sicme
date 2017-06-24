<%-- 
    Document   : recargoVice_InformeMedicos
    Created on : 20-mar-2017, 18:53:33
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins"> 
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1 align="center"> Eventos </h1>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label>&nbsp;&nbsp; Desde: &nbsp;&nbsp;</label>
                <input type="date" id="fechaIC" name="fechaIC" required > &nbsp;&nbsp;&nbsp;
                <label>&nbsp;&nbsp; hasta: &nbsp;&nbsp;</label>
                <input type="date" id="fechaIC2" name="fechaIC2"/> &nbsp;&nbsp;&nbsp;
                <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('vicerrector/recargoVice_InformeEvento2.jsp?fechaIC=' + fechaIC.value + '&fechaIC2=' + fechaIC2.value)"/>

                <div class="panel-body" id="cargar">

                </div>
            </div>
        </div>
    </div>
</div>       