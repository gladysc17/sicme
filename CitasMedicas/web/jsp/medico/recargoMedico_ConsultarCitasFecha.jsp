<%-- 
    Document   : recargoMedico_ConsultarCitasFecha
    Created on : 28-mar-2017, 21:06:34
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">             
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 align="center">  Consultar Citas </h2>
        </div>              
        <div class="panel-body">

            <div class="form-group">
                <label for="" class="control-label"> Fecha </label>
                <input type="date" id="fecha" name="fecha" required > &nbsp;&nbsp;&nbsp;
                <label>&nbsp;&nbsp; hasta &nbsp;&nbsp;</label>
                <input type="date" id="fecha2" name="fecha2"/> &nbsp;&nbsp;&nbsp;
                <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('medico/recargoMedico_ConsultarCitasFecha2.jsp?fecha=' + fecha.value + '&fecha2=' + fecha2.value)"/>
            </div>                                                    

            <div class="panel-body" id="cargar">

            </div>
        </div>
    </div>
</div>                        
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>