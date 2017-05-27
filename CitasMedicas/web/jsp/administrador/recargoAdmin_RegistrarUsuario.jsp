<%-- 
    Document   : recargoAdmin_RegistrarUsuario
    Created on : 15-may-2017, 21:02:09
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-md-1"></div>
<div class="col-md-9 form-group">            
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 align="center">  REGISTRO USUARIO </h2>
        </div>
        <div class="panel-body">  
            <form action="../controlador/procesarRegistroUsuario.jsp" method="post" name="form">

                <style>
                    #estudiante{
                        display: none;
                    }
                    #medico{
                        display: none;
                    }
                    #admin_vice{
                        display: none;
                    }
                </style>
                <div class="form-group">  
                    <div class="col-sm-4">
                        <label class="control-label">Tipo Identificación: </label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select id="tipoid" name="tipoid">
                                <option value="T.I"> Tarjeta de Identidad </option>
                                <option value="C.C"> C. de Ciudadania </option>
                                <option value="C.E"> C. de Extranjeria </option>
                                <option value="P.P"> Pasaporte </option>                                
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Número de documento</label>
                        <input type="number" class="form-control" id="identificacion" name="identificacion" required="">
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Código</label>
                        <input type="number" class="form-control" id="codigo" name="codigo" required="">
                    </div>                            
                </div>

                <div class="form-group">                              
                    <div class="col-sm-6">
                        <label class="control-label">Nombres y Apellidos:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required="">
                    </div>
                    <div class="col-sm-6">
                        <label class="control-label">Correo Electrónico:</label>
                        <input type="email" class="form-control" id="correo" name="correo" required="">
                    </div>

                </div>

                <div class="form-group">  
                    <div class="col-sm-4">
                        <label class="control-label">Fecha de Nacimiento: </label>
                        <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" required="">
                    </div>                    
                    <div class="col-sm-4">
                        <label class="control-label">Género: </label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select id="genero" name="genero">
                                <option value="F"> Femenino </option>
                                <option value="M"> Masculino </option>
                                <option value="O"> Otro </option>                                
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Estado civil: </label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select name="estadocivil" id="estadocivil">
                                <option value="Soltero(a)"> Soltero(a) </option>
                                <option value="Casado(a)"> Casado(a) </option>
                                <option value="Union Libre"> Union Libre </option>                                
                                <option value="Viudo(a)"> Viudo(a) </option>                                
                            </select>
                        </div>
                    </div>                                                        
                </div>

                <div class="form-group">   

                    <div class="col-sm-4">
                        <label class="control-label">Dirección: </label>
                        <input type="text" class="form-control" id="direccion" name="direccion" required="">
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Teléfono: </label>
                        <input type="text" class="form-control" id="telefono" name="telefono" required="">
                    </div>  
                    <div class="col-sm-4">
                        <label class="control-label">Tipo de Usuario</label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select name="tipousuario" id="tipousuario" onchange="mostrarDatos()">
                                <option> </option>
                                <option value="estudiante"> Estudiante </option>
                                <option value="docente"> Docente </option>                                                          
                                <option value="medico"> Medico </option>
                                <option value="profesional"> Profesional </option>                                
                                <option value="Servicios Generales"> Servicios Generales </option>                                
                                <option value="Otro Usuario"> Otro Usuario </option> 
                                <option value="administrador"> Administrador </option>
                                <option value="vicerrector"> Vicerrector </option>
                                
                            </select>
                        </div>
                    </div>

                    <script>
                        function mostrarDatos() {

                            var tipo = document.form.tipousuario;

                            var selec = tipo.options[tipo.selectedIndex].value;

                            if (selec == "estudiante") {
                                document.getElementById("estudiante").style.display = 'inline';
                                document.getElementById("medico").style.display = 'none'
                                document.getElementById("admin_vice").style.display = 'none';
                            }
                            else if (selec == "medico") {
                                document.getElementById("medico").style.display = 'inline';
                                document.getElementById("estudiante").style.display = 'none'
                                document.getElementById("admin_vice").style.display = 'none';
                            }
                            else if (selec == "administrador" || selec == "vicerrector") {
                                document.getElementById("admin_vice").style.display = 'inline';
                                document.getElementById("estudiante").style.display = 'none'
                                document.getElementById("medico").style.display = 'none'
                            }
                            else{
                                document.getElementById("estudiante").style.display = 'none'
                                document.getElementById("medico").style.display = 'none'
                                document.getElementById("admin_vice").style.display = 'none';
                                
                            }

                        }

                    </script>

                    <div class="form-group" id="estudiante">
                        <div class="col-sm-12">
                            <label class="control-label">Programa </label>
                            <div class="form-control"style="border-box: box-sizing;">
                                <select id="programa" name="programa">                                        
                                    <option value="Administracion de Empresas">Administración de Empresas </option>
                                    <option value="Arquitectura">Arquitectura</option>
                                    <option value="Comercio Internacional">Comercio Internacional</option>
                                    <option value="Comunicaion Social">Comunicación Social</option>
                                    <option value="Contaduria ">Contaduria Pública</option>
                                    <option>Derecho</option>
                                    <option>Enfermeria</option>
                                    <option>Ingenieria Agroindustrial</option>
                                    <option>Ingenieria Agronómica</option>
                                    <option>Ingenieria Ambiental</option>
                                    <option>Ingenieria Biotecnológica</option>
                                    <option>Ingenieria Civil</option>
                                    <option>Ingenieria de Minas</option>
                                    <option>Ingenieria de Sistemas</option>
                                    <option>Ingenieria Electromecánica</option>
                                    <option>Ingenieria Electrónica</option>
                                    <option>Ingenieria Industrial</option>
                                    <option>Ingenieria Mecánica</option>
                                    <option>Ingenieria Pecuaria</option>
                                    <option>Licenciatura en Matemáticas</option>
                                    <option>Quimica Industrial</option>
                                    <option>Seguridad y Salud en el Trabajo</option>
                                    <option>Trabajo Social</option>                                        
                                    <option>Tecnologia Agroindustrial</option>
                                    <option>Tecnologia en Gestión de Procesos de Manufactura</option>
                                    <option>Tecnologia en Gestión y Desarrollo de Productos Cerámicos</option>
                                    <option>Tecnologia en Obras Civiles</option>
                                    <option>Tecnologia en Procesos Industriales</option>                                        
                                    <option>Técnico Profesional en Fabricación Industrial de Productos Cerámicos</option>
                                    <option>Técnico Profesional en Procesamiento de Alimentos</option>
                                    <option>Técnico Profesional en Procesos de Manufactura de Calzado y Marroquineria</option>
                                    <option>Técnico Profesional en Producción de Cerámica Artesanal</option>
                                </select>
                            </div>        
                        </div>
                    </div>
                    
                    <div class="form-group" id="admin_vice">
                        <div class="col-sm-6">                            
                            <label class="control-label">Contraseña: </label>
                            <input type="text" class="form-control" id="contrasena" name="contrasena">
                        </div>
                    </div>
                    <div class="form-group" id="medico">
                        <div class="col-sm-6">
                            <label class="control-label">Servicio: </label>
                            <div class="form-control"style="border-box: box-sizing;">
                                <select id="servicio" name="servicio">
                                    <option value="medicinageneral"> Medicina General </option>
                                    <option value="psicologia"> Psicologia </option>
                                    <option value="odontologia"> Odontologia </option>
                                    <option value="planificacionfamiliar"> Planificacion Familiar </option>                                
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label class="control-label">Contraseña: </label>
                            <input type="text" class="form-control" id="contrasena" name="contrasena">
                        </div>
                    </div>
                </div>

                <br> <br>
                <div class="clearfix">
                    <div class="col-sm-12">
                        <label class="control-label"> </label>
                        <input class="btn btn-success btn-block" type="submit" value="REGISTRAR">

                    </div>
                    <br><br>


                </div>
            </form>
        </div>                
    </div>

</div>
<div class="col-md-2"></div>
