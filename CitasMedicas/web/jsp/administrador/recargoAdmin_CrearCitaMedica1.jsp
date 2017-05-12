<%-- 
    Document   : recargoAdmin_CrearCitaMedica1
    Created on : 22-mar-2017, 18:59:50
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
                    <h2 align="center">  Consultar Usuario(a) </h2>
                </div>
                <form  method="post" action="../controlador/procesarCrearCita.jsp" name="forml">
                    <div class="panel-body">

                        <div class="form-group">
                            <label for="" class="control-label"> Identificación: </label>
                            <input type="number" id="identf" name="identf"> &nbsp;&nbsp;&nbsp;
                            <label for="" class="control-label"> Tipo Usuario </label>
                            <select id="tipo" name="tipo" required="">
                                <option value="estudiante"> Estudiante </option>
                                <option value="docente"> Docente </option>
                                <option value="medico"> Medico </option>
                                <option value="profesional"> Profesional </option>
                                <option value="serviciogeneral"> Servicio General </option>
                                <option value="otro"> Otro </option>
                            </select>
                            &nbsp;&nbsp;&nbsp;
                            <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('administrador/recargoAdmin_CrearCitaMedica2.jsp?identf=' + identf.value + '&tipo=' + tipo.value)"/>
                        </div>                                                    
                        <div class="panel-body" id="cargar">
                                        
                        </div>
                    </div>
                </form>
            </div>
        </div>                        
        <div class="col-md-1"></div>              
    </body>
</html>