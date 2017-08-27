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
<title>JSP Page</title>

<style>
    #verrecibo{
        display: none;
    }                 
</style>
<div class="ibox float-e-margins">
    <form action="../controlador/procesarCrearCita.jsp" method="post" name="form" id="form" novalidate>

        <div class="panel panel-default">           
            <%
                String identf = request.getParameter("identf");
                FacadeUsuario facUs = new FacadeUsuario();
                UsuarioDTO u = facUs.consultarUsuarioPorId(identf);

                if (u == null) {
            %>
            <h2>Usuario No encontrado <input type="button" class="btn btn-sm" value="REGISTRAR" onclick="cargarForm('administrador/recargoAdmin_RegistrarUsuario.jsp')"/> </h2>
            <%
            } else {
                String nombre = u.getNombre();
                String codigo = u.getCodigo();

            %>

            
            <h2 align="center">Nueva Cita Medica</h2>
            <br>
            <input type="hidden" name="identf" id="identf" value="<%=identf%>">
            <h3>Nombre: <%=nombre%></h3>
            <h3>Identificación <%=identf%></h3>
            <h3>Código <%=codigo%></h3>
            
            <div class="panel-body">            
                <p>1. Seleccione el servicio que desea obtener, para consultar el(los) profesional(es) disponible(s)</p>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-1 control-label">Servicio</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="servicio" id="servicio" alt="Servicio" onchange="ver()">                        
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
                    <input type="date" name="fecha" id="fecha" class="form-control" alt="Fecha" required/> 
                </div>       

                <div class="col-sm-3">
                    <input type="button" class="btn btn-primary" value="HORAS DISP." onclick="cargarFormulario('administrador/recargoAdmin_CrearCitaMedica4.jsp?idmed=' + prof.value + '&fecha=' + fecha.value)"/>
                </div>

            </div>

            <div  class="panel-body"> 
                <p>3. Seleccione El horario </p>         

                <label for="" class="col-sm-2 control-label">Horas:  </label>
                <div class="col-sm-3">
                    <select class="form-control" name="hora" id="recar" alt="Hora">
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
                        <input type="datetime" class="form-control" name="recibo" id="recibo">
                    </div>                  
                </div>                       

                <div class="col-sm-3">                            
                    <input type="button" value="CREAR CITA" class="btn btn-success" onclick="validaFormulario()"/>
                </div>

            </div>
        </div>
        <%                        }
        %>


    </form>
        

</div>              
<script>
            function validaFormulario(){
                
                
            var servicio = document.getElementById("servicio");
            var fecha = document.getElementById("fecha");
            var hora = document.getElementById("recar");
            var identf = document.getElementById("identf");
            var prof = document.getElementById("recargar");                                   
            
            if(!validateFieldNull(servicio)){
                return;
            }
            
            if(!validateFieldNull(fecha)){
                return;
            }
            
            if(!validateFieldNull(hora)){
                return;
            }
            
            if(!validateFieldNull(identf)){
                return;
            }
            
            if(!validateFieldNull(prof)){
                return;
            }
            else{                                    
                document.getElementById("form").submit();
            }
        }

        </script>