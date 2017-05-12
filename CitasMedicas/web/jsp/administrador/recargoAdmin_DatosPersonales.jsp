<%-- 
    Document   : recargoAdmin_DatosPersonales11
    Created on : 22-mar-2017, 19:00:40
    Author     : Gladys M
--%>

<%@page import="DTO.AdministradorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading" align="center">                                        
                    <h3>Datos Personales </h3>                                 
                    <p>Administrador Sistema de Informacion</p>                               
                </div>                    
                <div class="panel-body">  

                    <%
                        AdministradorDTO adm = (AdministradorDTO) session.getAttribute("administrador");
                        if (adm == null) {

                            response.sendRedirect("../../index.jsp");
                            return;
                        }
                        int id = adm.getIdentificacion_administrador();
                        String nombre = adm.getNombre_administrador();
                        String correo = adm.getCorreo_administrador();
                        String tel = adm.getTelefono_administrador();
                        String contra = adm.getContrasena_administrador();
                        int codigo = adm.getCodigo_administrador();
                        String fn = adm.getFechanacimiento_administrador();
                        String genero = adm.getGenero_administrador();
                        String estadoc = adm.getEstadocivil_administrador();
                        String direccion = adm.getDireccion_administrador();

                    %>
                    <div class="form-group">                              
                        <div class="col-sm-4">
                            <label class="control-label">IDENTIFICACION</label> <br>                                    
                            <input type="text" class="form-control" id="ide" name="ide" value="" placeholder="<%=id%>" readonly>
                        </div>
                        <div class="col-sm-5">
                            <label class="control-label">NOMBRES Y APELLIDOS:</label> <br>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="<%=nombre%>" readonly>
                        </div>
                        <div class="col-sm-3">
                            <label class="control-label">CODIGO: </label>
                            <input type="password" class="form-control" id="codigo" name="codigo" placeholder="<%=codigo%>" readonly>
                        </div>
                    </div>

                    <div class="form-group">  

                        <div class="col-sm-5">
                            <label class="control-label">CORREO:</label>
                            <input type="email" class="form-control" id="correo" name="correo" value="<%=correo%>"  placeholder="<%=correo%>" readonly>
                        </div>  
                        <div class="col-sm-3">
                            <label class="control-label">TELEFONO:</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<%=tel%>" placeholder="<%=tel%>" readonly>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label">DIRECCION: </label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<%=direccion%>" placeholder="<%=direccion%>" readonly>
                        </div>
                    </div>

                    <div class="form-group">  

                        <div class="col-sm-5">
                            <label class="control-label">FECHA NACIMIENTO: </label>
                            <input type="email" class="form-control" id="correo" name="correo" value="<%=fn%>"  placeholder="<%=fn%>" readonly>
                        </div>  
                        <div class="col-sm-3">
                            <label class="control-label">GENERO: </label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<%=genero%>" placeholder="<%=genero%>" readonly>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label">ESTADO CIVIL:  </label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<%=estadoc%>" placeholder="<%=estadoc%>" readonly>
                        </div>
                    </div>
                    <br><br>
                    <div class="form-group">  
                        <div align="center" class="col-sm-4">
                            <br>
                            <input class="btn btn-success" type="button" value="MODIFICAR DATOS" onclick="cargarForm('administrador/recargoAdmin_DatosPersonales2.jsp')"/>
                        </div>
                    </div>
                    <div name="recargo" id="recargo"> 

                    </div>
                    </form>
                </div>                                    
            </div>
        </div>
        <div class="col-md-1"></div>
    </body>

</html>
