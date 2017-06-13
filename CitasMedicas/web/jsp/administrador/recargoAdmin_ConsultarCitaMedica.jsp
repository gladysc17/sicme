<%-- 
    Document   : recargoAdmin_ConsultarCitaMedica
    Created on : 27-mar-2017, 19:46:42
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">                   
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 align="center">  Consultar Cita Medica Usuario </h2>
        </div>

        <div class="panel-body">

            <div class="form-group">
                <label for="" class="control-label"> Identificación: </label>
                <input type="number" id="identf" name="identf" required=""> &nbsp;&nbsp;&nbsp;                       
                <input type="button" class="btn btn-primary" value="CONSULTAR" onclick="cargar_form('administrador/recargoAdmin_ConsultarCitaMedica2.jsp?identf=' + identf.value)"/>
            </div>                                                    
            <div class="panel-body" id="cargar">

            </div>
        </div>
    </div>
</div>                        
