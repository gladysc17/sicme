<%-- 
    Document   : recargoAdmin_ModificarServicioGeneral
    Created on : 18-abr-2017, 21:05:49
    Author     : Gladys M
--%>

<%@page import="DTO.ServicioGeneralDTO"%>
<%@page import="FACADE.FacadeServicioGeneral"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-2"></div>
        <div class="col-md-7 col-sm-7">            
            <div class="panel panel-default">
                <div class="panel-heading">                                        
                    <h4 align="center"> Datos Personales </h4>
                </div>
               
                <div class="panel-body">  
                     <form action="../controlador/procesarModificarServicioGeneral.jsp" method="post">
                        <%
                            int id = Integer.parseInt(request.getParameter("ident"));
                            System.out.println("ide sergener mod : "+id);
                            FacadeServicioGeneral fsg = new FacadeServicioGeneral();
                                    
                            ServicioGeneralDTO sg = fsg.consultarServicioGeneralPorId(id);
                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=sg.getTipodocumentoid()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=sg.getIdentificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=sg.getCodigo()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=sg.getNombre()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=sg.getCorreo()%>">
                            </div>
                        </div>
                        
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=sg.getFechanacimiento()%>">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Edad: </label>
                                <input type="number" class="form-control" id="edad" name="edad" value="<%=sg.getEdad()%>" readonly> 
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=sg.getGenero()%>">
                            </div>                                                        
                        </div>

                        <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=sg.getEstadocivil()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=sg.getDireccion()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=sg.getTelefono() %>" >
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
        <div class="col-md-3"></div>
    </body>
</html>
