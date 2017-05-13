<%-- 
    Document   : recargoAdmin_ModificarDocente
    Created on : 16-abr-2017, 14:27:28
    Author     : Gladys M
--%>

<%@page import="DTO.DocenteDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeDocente"%>
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
                    <h2 align="center">  DOCENTE </h2>
                </div>
                <div class="panel-body">  
                    <form action="../controlador/procesarModificarDocente.jsp" method="post">
                        <%
                            int id = Integer.parseInt(request.getParameter("ident"));
                            System.out.println("ide docente : "+id);
                            FacadeDocente fd = new FacadeDocente();
                                    
                            DocenteDTO doc = fd.consultarDocenteporId(id);
                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=doc.getTipodocumentoid()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=doc.getIdentificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=doc.getCodigo()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=doc.getNombre()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=doc.getCorreo()%>">
                            </div>
                        </div>
                        
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=doc.getFechanacimiento()%>">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Edad: </label>
                                <input type="number" class="form-control" id="edad" name="edad" value="<%=doc.getEdad()%>" readonly> 
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=doc.getGenero()%>">
                            </div>                                                        
                        </div>

                        <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=doc.getEstadocivil()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=doc.getDireccion()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=doc.getTelefono() %>" >
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
