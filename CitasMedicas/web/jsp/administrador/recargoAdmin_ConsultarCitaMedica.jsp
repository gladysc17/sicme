<%-- 
    Document   : recargoAdmin_ConsultarCitaMedica
    Created on : 27-mar-2017, 19:46:42
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>

        <div class="col-md-10 form-group">            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 align="center">  Consultar Cita Medica Usuario </h2>
                </div>

                <div class="panel-body">

                    <div class="form-group">
                        <label for="" class="control-label"> Identificación: </label>
                        <input type="number" id="identf" name="identf"> &nbsp;&nbsp;&nbsp;                       
                        <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('administrador/recargoAdmin_ConsultarCitaMedica2.jsp?identf=' + identf.value)"/>
                    </div>                                                    
                    <div class="panel-body" id="cargar">

                    </div>
                </div>
            </div>
        </div>                        
        <div class="col-md-1"></div> 
    </body>
</html>
