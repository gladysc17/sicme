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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            #verrecibo{
                display: none;
            }                 
        </style>
        <div class="col-md-1"></div>
        <form action="../controlador/procesarCrearCita.jsp" method="post" name="form" novalidate>
            <div class="col-md-10">
                <div class="panel panel-default">

                    <br>
                    <h2 align="center">Nueva Cita Medica</h2>
                    <br>
                    <div class="panel-body"> 

                        <label for="" class="control-label"> Identificación: </label>
                        <input type="number" id="identf" name="identf" required> &nbsp;&nbsp;&nbsp;                            
                        <a href="#consultar" type="button" class="btn btn-danger" onclick="cargar_form('administrador/recargoAdmin_CrearCitaMedica2.jsp?identf=' + identf.value)"> CONSULTAR  </a>                    

                        <div   id="cargar"> 


                        </div> 

                    </div>


                    <div class="panel-body">            
                        <p>1. Seleccione el servicio que desea obtener, para consultar el(los) profesional(es) disponible(s)</p>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label">Servicio</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="servicio" id="servicio" onchange="ver()">                        
                                    <option>  </option>
                                    <option value="medicinageneral"> Medicina General </option>
                                    <option value="odontologia"> Odontología </option>
                                    <option value="psicologia"> Psicología</option>
                                    <option value="planificacion"> Planificacion Familiar</option>                  
                                </select>
                            </div>                                                        

                            <div class="col-sm-2">                                                                              
                                <input type="button" class="btn btn-primary" value="CONSULTAR" onclick="cargar('administrador/recargoAdmin_CrearCitaMedica3.jsp?servicio=' + servicio.value)"/>
                            </div>

                        </div>
                    </div>  
                    <div class="panel-body"> 

                        <p> 2. Seleccione el profesional y acontinuación se mostrará las horas disponibles </p>
                        <label for="inputEmail3" class="col-sm-1 control-label">Nombre</label>
                        <div class="col-sm-4 control-label">
                            <select class="form-control" name="prof" required id="recargar">

                                <option>  </option>                                

                            </select>
                        </div> 

                        <label for="inputEmail3" class="col-sm-1 control-label">Fecha</label>
                        <div class="col-sm-3 control-label">
                            <input type="date" name="fecha" id="fecha" class="form-control" required/> 
                        </div>       

                        <div class="col-sm-3">
                            <input type="button" class="btn btn-primary" value="HORAS DISP." onclick="cargarFormulario('administrador/recargoAdmin_CrearCitaMedica4.jsp?idmed=' + prof.value + '&fecha=' + fecha.value)"/>
                        </div>

                    </div>

                    <div  class="panel-body"> 
                        <p>3. Seleccione El horario </p>         

                        <label for="" class="col-sm-2 control-label">Horas:  </label>
                        <div class="col-sm-3">
                            <select class="form-control" name="hora" id="recar">
                                <option></option>
                            </select>
                        </div> 
                        <script>

                            function ver() {
                                var x = document.getElementById("servicio").value;

                                if (x == "odontologia") {
                                    document.getElementById("verrecibo").style.display = 'inline';

                                } else if (x == "medicinageneral") {
                                    document.getElementById("verrecibo").style.display = 'inline';
                                } else {
                                    document.getElementById("verrecibo").style.display = 'none';
                                }

                            }

                        </script>

                        <div id="verrecibo">
                            <label for="inputEmail3" class="col-sm-2 control-label"> Recibo </label>
                            <div class="col-sm-2">
                                <input type="datetime" class="form-control" name="recibo" id="recibo" required="">
                            </div>                  
                        </div>                       

                        <div class="col-sm-3">                            
                            <input type="button" value="CREAR CITA" class="btn btn-success" id="enviar" onclick="validaFormulario()"/>
                        </div>

                    </div>
                </div>
            </div>

            <script type="text/javascript">       
                function validaFormulario() {
       
                    if (document.form.identf.value.length == 0) {
                        alert("Tiene que escribir su id");
                        document.form.identf.focus();
                        return 0;
                    }
       
                    if (document.form.servicio.selectedIndex == 0) {
                        alert("Tiene que seleccionar un servicio");
                        document.form.servicio.focus();
                        return 0;
                    }
                    
                    if (document.form.prof.selectedIndex == 0) {
                        alert("Tiene que seleccionar un profesional");
                        document.form.prof.focus();
                        return 0;
                    }
                    
                    if (document.form.fecha.value.length == 0) {
                        alert("Tiene que seleccionar una fecha");
                        document.form.fecha.focus();
                        return 0;
                    }
                    
                    if (document.form.hora.value.length == 0) {
                        alert("Tiene que seleccionar una hora");
                        document.form.hora.focus();
                        return 0;
                    }
       
                    document.form.submit();
                }
            </script>   
        </form>

        <div class="col-md-1"></div>              
    </body>
</html>