<%-- 
    Document   : recargoAdmin_RegistrarEstudiante
    Created on : 06-mar-2017, 22:33:32
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
        <div class="col-md-2"></div>
        <div class="col-md-8 form-group">            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 align="center">  REGISTRO ESTUDIANTE </h2>
                </div>
                <div class="panel-body">  
                    <form action="../controlador/procesarRegistroEstudiante.jsp" method="post">
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input type="text" class="form-control" id="tipoid" name="tipoid" required="">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
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
                                <label class="control-label">Edad: </label>
                                <input type="number" class="form-control" id="edad" name="edad" required=""> 
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" required="">
                            </div>                                                        
                        </div>

                        <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" required="">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" required="">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" required="">
                            </div>                            
                        </div>
                        
                        <div class="form-group">                              
                            
                            <div class="col-sm-12">
                                <label class="control-label">PROGRAMA:</label>
                                <div class="form-control"style="border-box: box-sizing;">
                                    <select id="programa" name="programa">                                        
                                        <option value="Administracion de Empresas">Administración de Empresas </option>
                                        <option value="Arquitectura">Arquitectura</option>
                                        <option value="Comercio Internacional">Comercio Internacional</option>
                                        <option value="Comunicaion Social">Comunicación Social</option>
                                        <option value="Contaduria ">Contaduría Pública</option>
                                        <option>Derecho</option>
                                        <option>Enfermería</option>
                                        <option>Ingeniería Agroindustrial</option>
                                        <option>Ingeniería Agronómica</option>
                                        <option>Ingeniería Ambiental</option>
                                        <option>Ingeniería Biotecnológica</option>
                                        <option>Ingeniería Civil</option>
                                        <option>Ingeniería de Minas</option>
                                        <option>Ingeniería de Sistemas</option>
                                        <option>Ingeniería Electromecánica</option>
                                        <option>Ingeniería Electrónica</option>
                                        <option>Ingeniería Industrial</option>
                                        <option>Ingeniería Mecánica</option>
                                        <option>Ingeniería Pecuaria</option>
                                        <option>Licenciatura en Matemáticas</option>
                                        <option>Química Industrial</option>
                                        <option>Seguridad y Salud en el Trabajo</option>
                                        <option>Trabajo Social</option>                                        
                                        <option>Tecnología Agroindustrial</option>
                                        <option>Tecnología en Gestión de Procesos de Manufactura</option>
                                        <option>Tecnología en Gestión y Desarrollo de Productos Cerámicos</option>
                                        <option>Tecnología en Obras Civiles</option>
                                        <option>Tecnología en Procesos Industriales</option>                                        
                                        <option>Técnico Profesional en Fabricación Industrial de Productos Cerámicos</option>
                                        <option>Técnico Profesional en Procesamiento de Alimentos</option>
                                        <option>Técnico Profesional en Procesos de Manufactura de Calzado y Marroquinería</option>
                                        <option>Técnico Profesional en Producción de Cerámica Artesanal</option>
                                    </select>
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
    </body>
</html>
