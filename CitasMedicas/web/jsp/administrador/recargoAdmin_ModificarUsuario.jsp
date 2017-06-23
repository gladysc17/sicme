<%-- 
    Document   : recargoAdmin_ModificarOtroUsuario
    Created on : 18-abr-2017, 21:05:08
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <div class="ibox float-e-margins">          

            <style>
                #admin{
                    display: none
                }                   
            </style>
            <div class="panel panel-default">
                <div class="panel-heading">                                        
                    <h4 align="center"> Datos Personales </h4>
                </div>

                <div class="panel-body">  
                    <form action="../controlador/procesarModificarUsuario.jsp" method="post" name="form">
                        <%
                            String id = request.getParameter("ident");
                            System.out.println("id ad " + id);

                            FacadeUsuario fotro = new FacadeUsuario();

                            UsuarioDTO otro = fotro.consultarUsuarioPorId(id);                            
                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=otro.getTipo_identificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=otro.getIdentificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=otro.getCodigo()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=otro.getNombre()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label"> Tipo Usuario: </label>
                                <input type="text" class="form-control" id="tipo" name="tipo" value="<%=otro.getTipo_usuario()%>" readonly>
                            </div>

                        </div>

                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=otro.getFecha_nacimiento()%>">
                            </div>

                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=otro.getGenero()%>">
                            </div>   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=otro.getEstado_civil()%>" >
                            </div>
                        </div>

                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=otro.getCorreo()%>">
                            </div>

                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=otro.getDireccion()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=otro.getTelefono()%>" >
                            </div>                            
                        </div>

                        <div class="form-group">
                            <div class="col-sm-4">                            
                                <label class="control-label">Contraseña Actual: </label>
                                <input type="password" class="form-control" id="contra" name="contra"  value="<%=otro.getContrasena()%>">
                            </div>
                            <div class="col-sm-4"> 
                                <label class="control-label">Nueva Contraseña: </label>
                                <input type="password" class="form-control" id="contrasena1" name="contrasena">
                            </div>
                            <div class="col-sm-4">     
                                <label class="control-label">Repetir Contraseña: </label>
                                <input type="password" class="form-control" id="contrasena2" name="contrasena">
                            </div>
                        </div>

                        <div class="clearfix">
                            <div class="col-sm-8">
                                <label class="control-label"> </label>                               
                                <input class="btn btn-success btn-block" type="submit" value="MODIRIFCAR">
                            </div>                                                     

                        </div>

                        <br> <br>                        


                    </form>                   

                </div>                                    
            </div>
        </div>
      