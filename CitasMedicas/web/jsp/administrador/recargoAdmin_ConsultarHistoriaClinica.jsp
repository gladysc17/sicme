<%-- 
    Document   : recargoAdmin_ConsultarHistoriaClinica
    Created on : 30-abr-2017, 21:50:19
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">          
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 align="center">  Consultar Historia Clinica </h2>
        </div>

        <div class="panel-body">
            <form  action="/CitasMedicas/historia" method="post" target="_blank">
                <div class="form-group">
                    <label for="" class="control-label"> Identificación: </label>
                    <input type="number" id="identf" name="identf" required alt="Identificación">                                                

                    <label for="" class="control-label"> Tipo Historia </label>
                    <select name="servicio" id="servicio" required alt="Tipo de historia">
                        <option value="medicinageneral"> Medicina General </option>
                        <option value="odontologia"> Odontologia </option>
                        <option value="psicologia"> Psicologia </option>
                        <option value="planificacion"> Planificacion Familiar </option>                                                                                      
                    </select>

                    <input type="button" class="btn btn-danger" value="CONSULTAR HISTORIA CLINICA" onclick="validarForm()"/>
                </div> 
                <div class="panel-body" id="cargar">

                </div>                      
            </form>
        </div>
        
        <script>
            function validarForm(){
                var identificacionElm = document.getElementById("identf");
                var servicioElm = document.getElementById("servicio");
                
                if(!validateFieldNull(identificacionElm)){
                    return;
                }
                if(!validateFieldNull(servicioElm)){
                    return;
                }
                
                cargar_form('administrador/recargoAdmin_ConsultarHistoriaClinica2.jsp?identf=' + identificacionElm.value + '&servicio=' + servicioElm.value);
            }
        </script>

    </div>
</div>                        
