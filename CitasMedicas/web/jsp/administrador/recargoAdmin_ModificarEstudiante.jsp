<%-- 
    Document   : recargoAdmin_ModificarEstudiante
    Created on : 22-mar-2017, 19:19:33
    Author     : Gladys M
--%>

<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
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
                    <h2 align="center">  ESTUDIANTE </h2>
                </div>
                <div class="panel-body">  
                    <form action="../controlador/procesarModificarEstudiante.jsp" method="post">
                        <%
                            int identf = Integer.parseInt(request.getParameter("identf"));
                            System.out.println("ide docente : "+identf);
                            FacadeEstudiante fe = new FacadeEstudiante();
                                    
                            EstudianteDTO est = fe.consultarEstudianteporId(identf);
                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=est.getTipodocumentoid()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=est.getIdentificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=est.getCodigo()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=est.getNombre()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=est.getCorreo()%>">
                            </div>
                        </div>
                        
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=est.getFechanacimiento()%>">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Edad: </label>
                                <input type="number" class="form-control" id="edad" name="edad" value="<%=est.getEdad()%>" readonly> 
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=est.getGenero()%>">
                            </div>                                                        
                        </div>

                        <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=est.getEstadocivil()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=est.getDireccion()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=est.getTelefono() %>" >
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
