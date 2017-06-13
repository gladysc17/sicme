<%-- 
    Document   : recargoMedico_DatosPersonales
    Created on : 28-mar-2017, 21:17:17
    Author     : Gladys M
--%>

<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body>
        <div class="col-md-1"></div>
        <div class="col-md-10 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading" align="center">                                        
                    <h3>Datos Personales </h3>                                                                                  
                </div>                    
                <div class="panel-body">  
                    <form action="../controlador/procesarModificarUsuario.jsp" method="post">
                        <%
                            MedicoDTO med = (MedicoDTO) session.getAttribute("medico");
                            if (med == null) {

                                response.sendRedirect("../../index.jsp");
                                return;
                            }            
                            
                            String id = med.getIdentificacion();
                            FacadeUsuario facmed = new FacadeUsuario();
                            UsuarioDTO md = facmed.consultarUsuarioPorId(id);
                            

                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=md.getTipo_identificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=med.getIdentificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=md.getCodigo()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=md.getNombre()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=md.getCorreo()%>">
                            </div>
                        </div>
                        
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=md.getFecha_nacimiento()%>">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Edad: </label>
                                <input type="number" class="form-control" id="edad" name="edad" value="<%=md.getEdad()%>" readonly> 
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=md.getGenero()%>">
                            </div>                                                        
                        </div>

                        <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=md.getEstado_civil()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=md.getDireccion()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=md.getTelefono() %>" >
                            </div>                           
                        </div>
                            <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Contraseña Actual: </label>
                                <input type="password" class="form-control" id="contra" name="contra" value="<%=med.getContrasena()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Nueva contraseña: </label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena1" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Repetir Contraseña: </label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena2" >
                            </div>                            
                        </div>

                        <br> <br>
                        <div class="clearfix">
                            <div class="col-sm-8">
                                <label class="control-label"> </label>
                                <input class="btn btn-success btn-block" type="submit" value="MODIFICAR">

                            </div>
                            <br><br>
                        </div>

                    </form>
                </div>                                    
            </div>
        </div>
        <div class="col-md-1"></div>
    </body>
</html>
