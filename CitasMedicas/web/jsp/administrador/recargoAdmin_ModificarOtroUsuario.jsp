<%-- 
    Document   : recargoAdmin_ModificarOtroUsuario
    Created on : 18-abr-2017, 21:05:08
    Author     : Gladys M
--%>

<%@page import="DTO.OtroUsuarioDTO"%>
<%@page import="FACADE.FacadeOtrosUsuarios"%>
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
                <div class="panel-heading">                                        
                    <h4 align="center"> Datos Personales </h4>
                </div>
               
                <div class="panel-body">  
                     <form action="../controlador/procesarModificarOtroUsuario.jsp" method="post">
                        <%
                            int id = Integer.parseInt(request.getParameter("ident"));
                            System.out.println("ide otrousuario mod : "+id);
                            FacadeOtrosUsuarios fotro = new FacadeOtrosUsuarios();
                                    
                            OtroUsuarioDTO otro = fotro.consultarOtroUsuarioPorId(id);
                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=otro.getTipodocumentoid_otro()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=otro.getIdentificacion_otro()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=otro.getCodigo_otro()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=otro.getNombre_otro()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=otro.getCorreo_otro()%>">
                            </div>
                        </div>
                        
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=otro.getFechanacimiento_otro()%>">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Edad: </label>
                                <input type="number" class="form-control" id="edad" name="edad" value="<%=otro.getEdad_otro()%>" readonly> 
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=otro.getGenero_otro()%>">
                            </div>                                                        
                        </div>

                        <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=otro.getEstadocivil_otro()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=otro.getDireccion_otro()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=otro.getTelefono_otro() %>" >
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
        <div class="col-md-2"></div>
    </body>
</html>
