<%-- 
    Document   : recargoAdmin_ConsultarHistoriaClinica
    Created on : 30-abr-2017, 21:50:19
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
                    <h2 align="center">  Consultar Historia Clinica </h2>
                </div>

                <div class="panel-body">
                    <form  action="/app/historia" method="post" target="_blank">
                        <div class="form-group">
                            <label for="" class="control-label"> Identificación: </label>
                            <input type="number" id="identf" name="identf" required>                                                
                        </div>
                         
                        <div class="form-group">
                            <label for="" class="control-label"> Tipo Historia </label>
                            <select name="servicio" id="servicio" required>
                                <option value="medicinageneral"> Medicina General </option>
                                <option value="odontologia"> Odontologia </option>
                                <option value="psicologia"> Psicologia </option>
                                <option value="planificacion"> Planificacion Familiar </option>                                                                                      
                            </select>

                            <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('medico/recargoMedico_ConsultarHistoriaClinica2.jsp?identf=' + identf.value + '&servicio=' + servicio.value)"/>
                        </div> 
                        <div class="panel-body" id="cargar">

                        </div>                      
                    </form>
                </div>

            </div>
        </div>                        
        <div class="col-md-1"></div> 
    </body>

</html>