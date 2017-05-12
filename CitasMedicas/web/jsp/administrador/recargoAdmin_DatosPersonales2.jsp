<%-- 
    Document   : recargoAdmin_DatosPersonales2
    Created on : 02-may-2017, 21:37:25
    Author     : Gladys M
--%>

<%@page import="DTO.AdministradorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <div class="col-md-1"></div>
    <div class="col-md-10 col-sm-12">
        <div class="panel panel-default">
            <div class="panel-heading" align="center">                                        
                <h3>Modificar Datos Personales </h3>                                 
                <p>Administrador Sistema de Informacion</p>                               
            </div>                    
            <div class="panel-body">  
                <form  name="form" action="../controlador/procesarModificarAdmin.jsp" method="post">
                    <%
                        AdministradorDTO adm = (AdministradorDTO) session.getAttribute("administrador");
                        if (adm == null) {

                            response.sendRedirect("../../index.jsp");
                            return;
                        }
                        int id = adm.getIdentificacion_administrador();
                        String nombre = adm.getNombre_administrador();
                        int codigo = adm.getCodigo_administrador();
                        String correo = adm.getCorreo_administrador();
                        String telefono = adm.getTelefono_administrador();
                        String contrasena = adm.getContrasena_administrador();
                        String fn = adm.getFechanacimiento_administrador();
                        String genero = adm.getGenero_administrador();
                        String estadoc = adm.getEstadocivil_administrador();
                        String direccion = adm.getDireccion_administrador();

                    %>
                    <div class="form-group">                              
                        <div class="col-sm-4">
                            <label class="control-label">IDENTIFICACION</label> <br>                                    
                            <input type="text" class="form-control" id="ide" name="ide" value="" placeholder="<%=id%>" readonly="">
                        </div>
                        <div class="col-sm-5">
                            <label class="control-label">NOMBRES Y APELLIDOS:</label> <br>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="<%=nombre%>" readonly="">
                        </div>
                        <div class="col-sm-3">
                            <label class="control-label">CODIGO: </label>
                            <input type="password" class="form-control" id="codigo" name="codigo" placeholder="<%=codigo%>" readonly="">
                        </div>
                    </div>

                    <div class="form-group">  

                        <div class="col-sm-4">
                            <label class="control-label">CORREO:</label>
                            <input type="email" class="form-control" id="correo" name="correo" value="<%=correo%>"  placeholder="<%=correo%>">
                        </div>  
                        <div class="col-sm-4">
                            <label class="control-label">TELEFONO:</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<%=telefono%>" placeholder="<%=telefono%>">
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label">DIRECCION: </label>
                            <input type="text" class="form-control" id="direccion" name="direccion" value="<%=direccion%>" placeholder="<%=direccion%>">
                        </div>
                    </div>

                    <div class="form-group">  

                        <div class="col-sm-4">
                            <label class="control-label">FECHA DE NACIMIENTO: </label>
                            <input type="date" class="form-control" id="fn" name="fn" value="<%=fn%>"  placeholder="<%=fn%>" >
                        </div>  
                        <div class="col-sm-4">
                            <label class="control-label">GENERO: </label>
                            <input type="text" class="form-control" id="genero" name="genero" value="<%=genero%>" placeholder="<%=genero%>">
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label">ESTADO CIVIL:  </label>
                            <input type="text" class="form-control" id="estadic" name="estadoc" value="<%=estadoc%>" placeholder="<%=estadoc%>">
                        </div>
                    </div>
                    <div class="form-group" >                              

                        <div class="col-sm-4" id="contraactual">
                            <label class="control-label">CONTRASEÑA ACTUAL </label>
                            <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                        </div>

                        <div class="col-sm-4" id="nuevacontra1">
                            <label class="control-label">NUEVA CONTRASEÑA </label>
                            <input type="password" class="form-control" id="contrasena" name="contrasena1" required>
                        </div>
                        <div class="col-sm-4" id="nuevacontra2">
                            <label class="control-label">REPETIR CONTRASEÑA </label>
                            <input type="password" class="form-control" id="servicio" name="contrasena2" required>
                        </div>
                    </div>                  

                    <div class="form-group">  
                        <div align="center" class="col-sm-4">
                            <br>
                            <button class="btn btn-success" type="submit">MODIFICAR DATOS</button>
                        </div>
                    </div>
                    <div name="recargo" id="recargar"> 

                    </div>
                </form>
            </div>                                    
        </div>
    </div>
    <div class="col-md-1"></div>


</body>
</html>
