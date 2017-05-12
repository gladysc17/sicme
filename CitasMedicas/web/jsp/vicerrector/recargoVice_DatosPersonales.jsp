<%-- 
    Document   : recargoVice_DatosPersonales
    Created on : 20-mar-2017, 16:07:41
    Author     : Gladys M
--%>

<%@page import="DTO.VicerrectorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="col-md-9 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading" align="center">                                        
                    <h3>Datos Personales </h3>                                 
                    <p>Vicerrector de Bienestar Universitario</p>                               
                </div>                    
                <div class="panel-body">  
                    <form action="../controlador/procesarModificarVicerrector.jsp" method="post">
                        <%
                            VicerrectorDTO vice = (VicerrectorDTO) session.getAttribute("vicerrector");
                            if (vice == null) {

                                response.sendRedirect("../../index.jsp");
                                return;
                            }
                            int id = vice.getIdentificacion_vice();
                            String nombre = vice.getNombre_vice();
                            int codigo = vice.getCodigo_vice();
                            String correo = vice.getCorreo_vice();
                            String telefono = vice.getTelefono_vice();
                            String contrasena = vice.getContrasena_vice();

                        %>
                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">IDENTIFICACION</label> <br>                                    
                                <input type="text" class="form-control" id="ide" name="ide" value="" placeholder="<%=id%>" readonly="">
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">NOMBRES Y APELLIDOS:</label> <br>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="<%=nombre%>" readonly="">
                            </div>
                        </div>

                        <div class="form-group">  
                            <div class="col-sm-6">
                                <label class="control-label">CODIGO: </label>
                                <input type="password" class="form-control" id="codigo" name="codigo" placeholder="<%=codigo%>" readonly="">
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">CORREO:</label>
                                <input class="form-control" id="correo" name="correo" value=""  placeholder="<%=correo%>" required="">
                            </div>                                
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">TELEFONO:</label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="" placeholder="<%=telefono%>" required="">
                            </div>

                            <div class="col-sm-6">
                                <label class="control-label">CONTRASEÑA ACTUAL </label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="<%=contrasena%>">
                            </div>
                        </div>                                        

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">NUEVA CONTRASEÑA </label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena1" required="">
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">REPETIR CONTRASEÑA </label>
                                <input type="password" class="form-control" id="servicio" name="contrasena2" required="">
                            </div>
                        </div>

                        <br> <br>
                        <div class="clearfix">
                            <div class="col-sm-12">
                                <label class="control-label"> </label>
                                <button class="btn btn-success btn-block" type="submit" > MODIFICAR DATOS </button>
                            </div>
                            <br><br>
                        </div>
                    </form>
                </div>                                    
            </div>
        </div>
    </body>
</html>
