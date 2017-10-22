<%-- 
    Document   : recargoAdmin_CrearCitaMedica1
    Created on : 22-mar-2017, 18:59:50
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="DTO.ServicioDTO"%>
<%@page import="FACADE.FacadeServicio"%>
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
        <form action="../controlador/procesarCrearCitaUsuario.jsp" method="post" name="form" novalidate>
            <div class="col-md-10">
                <div class="panel panel-default">

                    <br>
                    <h2 align="center">Nueva Cita Medica</h2>
                                                                   

                        <%
                            UsuarioDTO usuario = (UsuarioDTO) session.getAttribute("usuario");
                            if (usuario == null) {

                                response.sendRedirect("../index.jsp");
                                return;
                            }

                            String identf = usuario.getIdentificacion();


                        %>
                        <input type="hidden" id="identf" name="identf" value="<%=identf%>">                            

                    


                    <div class="panel-body">            
                        <p>1. Seleccione el servicio que desea obtener, para consultar el(los) profesional(es) disponible(s)</p>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-1 control-label">Servicio</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="servicio" id="servicio" alt="Servicio" onchange="ver()">                        
                                    <option>--seleccione--</option>
                            <%
                                FacadeServicio facSer = new FacadeServicio();
                                List<ServicioDTO> ser = facSer.consultarServicio();
                                for (int i= 0; i<ser.size(); i++){
                                    String  serv = ser.get(i).getNombre();
                                    int ids = ser.get(i).getId();
                                
                            %>
                            <option value="<%=ids%>"> <%=serv%> </option>
                             
                            <%
                            }
                            %>
                        </select>
                            </div>                                                        

                            <div class="col-sm-2">                                                                              
                                <input type="button" class="btn btn-primary" value="CONSULTAR" onclick="cargar('usuario/recargoUsuario_CrearCitaMedica3.jsp?servicio=' + servicio.value)"/>
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
                            <%
                        FacadeHorarioMedico fc = new FacadeHorarioMedico();
                        String fec = fc.fechaActual();
                    %>
                    <input type="date" id="fecha" name="fecha" class="form-control" alt="Fecha" required step="1" min="<%=fec%>">
                        </div>       

                        <div class="col-sm-3">
                            <input type="button" class="btn btn-primary" value="HORAS DISP." onclick="cargarFormulario('usuario/recargoUsuario_CrearCitaMedica4.jsp?idmed=' + prof.value + '&fecha=' + fecha.value)"/>
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