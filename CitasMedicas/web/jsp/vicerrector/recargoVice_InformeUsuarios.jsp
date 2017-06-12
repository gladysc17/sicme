<%-- 
    Document   : recargoVice_InformeUsuarios
    Created on : 30-mar-2017, 20:54:40
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeCita"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">
    <div class="panel panel-default ">
        <div class="panel-heading">
            <h1 align="center"> Usuarios </h1>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <form name="form" method="post" action="/CitasMedicas/usuarios">
                    <label for="" class="control-label">Tipo de Usuario:</label>
                    <select name="consulta" id="consulta" required>
                        <option></option>
                        <option value="todos">Todos</option>
                        <option value="estudiante">Estudiantes</option>
                        <option value="docente">Docentes</option>
                        <option value="profesional">Profesionales</option>
                        <option value="medico">Medicos</option>
                        <option value="serviciosgenerales">Servicios Generales</option>
                        <option value="otros">Otros</option>

                    </select> &nbsp;&nbsp;&nbsp;
                    <label> desde </label>
                    <input type="date" id="fechaIC" name="fechaIC" required > &nbsp;&nbsp;&nbsp;
                    <label> hasta</label>
                    <input type="date" id="fechaIC2" name="fechaIC2" required> &nbsp;&nbsp;&nbsp;

                    <input type="button" class="btn btn-danger" value="CONSULTAR" onchange="validar()" onclick="cargar_form('vicerrector/recargoVice_InformeUsuarios2.jsp?consulta=' + consulta.value + '&fechaIC=' + fechaIC.value + '&fechaIC2=' + fechaIC2.value)"/>
                </form>                              
            </div>
        </div>

        <div class="panel-body" id="cargar">
            
        </div>                                        

    </div>
</div>

<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
