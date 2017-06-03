<%-- 
    Document   : recargoMedico_ConsultarCitasFecha
    Created on : 28-mar-2017, 21:06:34
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>

        <div class="col-md-10 form-group">            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 align="center">  Consultar Citas </h2>
                </div>              
                <div class="panel-body">
                    <form>
                        <div class="form-group">
                            <label for="" class="control-label"> Fecha </label>
                            <input type="date" id="fecha" name="fecha" required > &nbsp;&nbsp;&nbsp;
                            <label>&nbsp;&nbsp; hasta &nbsp;&nbsp;</label>
                            <input type="date" id="fecha2" name="fecha2"/> &nbsp;&nbsp;&nbsp;
                            <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('medico/recargoMedico_ConsultarCitasFecha2.jsp?fecha=' + fecha.value + '&fecha2=' + fecha2.value)"/>
                        </div>                                                    
                    </form>
                    <div class="panel-body" id="cargar">

                    </div>
                </div>
            </div>
        </div>                        
        <div class="col-md-1"></div>              
    </body>
</html>
