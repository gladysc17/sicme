<%-- 
    Document   : recargoAdmin_CrearCitaMedica1
    Created on : 22-mar-2017, 18:59:50
    Author     : Gladys M
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="java.sql.Time"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="NEGOCIO.NegocioMedico"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="../../js/funciones.js" type="text/javascript"></script>
<div class="ibox float-e-margins">
    <style>
        #verrecibo{
            display: none;
        }                 
    </style>
    <div class="ibox float-e-margins">
        <form action="../controlador/procesarCrearCita.jsp" method="post" name="form" novalidate>

            <div class="panel panel-default">

                <br>
                <h2 align="center">Nueva Cita Medica</h2>
                <br>
                <div class="panel-body"> 

                    <label for="" class="control-label"> Identificación: </label>
                    <input type="number" id="identf" name="identf" required alt="Identificación">                                            
                    <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="validarForm()"/>
                    <div   id="cargar"> 


                    </div> 

                </div>

            </div>


        </form>
    </div>
    <script>
        function validarForm() {
            var identificacionElm = document.getElementById("identf");

            if (!validateFieldNull(identificacionElm)) {
                return;
            }
            cargar_form('administrador/recargoAdmin_CrearCitaMedica1.jsp?identf=' + identificacionElm.value);

        }
    </script>

</div>     
