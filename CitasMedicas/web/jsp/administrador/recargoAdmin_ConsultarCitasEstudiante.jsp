<%-- 
    Document   : recargoAdmin_ConsultarCitasEstudiante
    Created on : 08-mar-2017, 21:04:06
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <p align="center"> Consultar Citas Estudiante </p>                
            </div>
            <div class="panel-body">
                <form class="form-horizontal">                                        
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label"> Identificación </label>
                        <div class="col-sm-4">
                            <input type="number" name="identificacion" id="identificacion" required=""> 
                        </div>                                                        

                        <div class="col-sm-4">                                                            
                            <input type="button" class="btn btn-primary" value="CONSULTAR" onclick="cargar_fr('recargoCitasEstudiante.jsp?identificacion=' + identificacion.value)"/>
                        </div>
                    </div>                                                    
                </form>
            </div>

            <div class="panel-body" id="cargar_fr">
                
            </div>

        </div>
    </body>
</html>
