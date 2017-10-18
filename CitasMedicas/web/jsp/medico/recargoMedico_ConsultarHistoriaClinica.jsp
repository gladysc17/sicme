<%-- 
    Document   : recargoAdmin_ConsultarHistoriaClinica
    Created on : 30-abr-2017, 21:50:19
    Author     : Gladys M
--%>

<%@page import="DTO.ServicioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeServicio"%>
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
               
                    
                    <input type="button" class="btn btn-danger" value="CONSULTAR HISTORIA CLINICA" onclick="validarForm()"/>
                </div> 
                <div class="panel-body" id="cargar">

                </div>                      
            </form>
        </div>
        <script>
            function validarForm(){
                var identificacionElm = document.getElementById("identf");                
                
                if(!validateFieldNull(identificacionElm)){
                    return;
                }               
                
                cargar_form('medico/recargoMedico_ConsultarHistoriaClinica2.jsp?identf=' + identificacionElm.value);
            }
        </script>

    </div>
</div>                        
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>