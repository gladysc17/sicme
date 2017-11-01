<%-- 
    Document   : recargoVice_DatosPersonales
    Created on : 20-mar-2017, 16:07:41
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="col-md-2"></div>
        <div class="col-md-8 col-sm-8">  
            <div class="panel panel-default">
                <div class="panel-heading" align="center">                                        
                    <h3>Datos Personales </h3>                                 
                    <p>Vicerrector de Bienestar Universitario</p>                               
                </div>                    
                <div class="panel-body">  
                    <form action="../controlador/procesarModificarUsuario.jsp" method="post">
                        <%
                            UsuarioDTO vice = (UsuarioDTO) session.getAttribute("vicerrector");
                            if (vice == null) {

                                response.sendRedirect("../../index.jsp");
                                return;
                            }

                            String id = vice.getIdentificacion();
                            FacadeUsuario fac = new FacadeUsuario();
                            UsuarioDTO u = fac.consultarUsuarioPorId(id);
                            String tipo = u.getTipo_usuario();


                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=u.getTipo_identificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=u.getIdentificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=u.getCodigo()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=u.getNombre()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label"> Tipo Usuario: </label>
                                <input type="text" class="form-control" id="tipo" name="tipo" value="<%=u.getTipo_usuario()%>" readonly>
                            </div>

                        </div>

                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=u.getFecha_nacimiento()%>">
                            </div>

                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=u.getGenero()%>">
                            </div>   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=u.getEstado_civil()%>" >
                            </div>
                        </div>

                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=u.getCorreo()%>">
                            </div>

                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=u.getDireccion()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=u.getTelefono()%>" >
                            </div>                            
                        </div>
                                     
                        <div class="clearfix">
                            <div class="col-sm-6">
                                <label class="control-label"> </label>                               
                                <input class="btn btn-success btn-block" type="submit" value="MODIRIFCAR">
                            </div> 
                             <div class="col-sm-6">
                                <label class="control-label"> </label>                                
                                <input type="button" class="btn btn-block btn-link" onclick="cargarForm('usuario/recargoUsuario_ModificarContrasena.jsp?id=<%=id%>&tipo=<%=tipo%>')" value="Modificar Contraseña">
                            </div>
                        </div>
                    </form>
                </div>                                    
            </div>
        </div>
    </body>
</html>
