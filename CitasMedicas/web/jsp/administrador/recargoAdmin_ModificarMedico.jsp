<%-- 
    Document   : recargoAdmin_ModificarMedico
    Created on : 18-abr-2017, 21:04:19
    Author     : Gladys M
--%>

<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
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
                     <form action="../controlador/procesarModificarMedicoMed.jsp" method="post">
                        <%
                            int id = Integer.parseInt(request.getParameter("ident"));
                            System.out.println("ide medico mod : "+id);
                            FacadeMedico fm = new FacadeMedico();
                                    
                            MedicoDTO med = fm.consultarMedicoPorId(id);
                        %>
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Tipo Identificación: </label>
                                <input class="form-control" id="tipoid" name="tipoid" value="<%=med.getTipodocumentoid()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Identificación</label>
                                <input type="number" class="form-control" id="identificacion" name="identificacion" value="<%=med.getIdentificacion()%>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Código</label>
                                <input type="number" class="form-control" id="codigo" name="codigo" value="<%=med.getCodigo()%>" readonly>
                            </div>                            
                        </div>

                        <div class="form-group">                              
                            <div class="col-sm-6">
                                <label class="control-label">Nombres y Apellidos:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=med.getNombre()%>" readonly>
                            </div>
                            <div class="col-sm-6">
                                <label class="control-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="correo" value="<%=med.getCorreo()%>">
                            </div>
                        </div>
                        
                        <div class="form-group">  
                            <div class="col-sm-4">
                                <label class="control-label">Fecha de Nacimiento: </label>
                                <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" value="<%=med.getFechanacimiento()%>">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Edad: </label>
                                <input type="number" class="form-control" id="edad" name="edad" value="<%=med.getEdad()%>" readonly> 
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Género: </label>
                                <input type="text" class="form-control" id="genero" name="genero" value="<%=med.getGenero()%>">
                            </div>                                                        
                        </div>

                        <div class="form-group">   
                            <div class="col-sm-4">
                                <label class="control-label">Estado civil: </label>
                                <input type="text" class="form-control" id="estadocivil" name="estadocivil" value="<%=med.getEstadocivil()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Dirección: </label>
                                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=med.getDireccion()%>" >
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Teléfono: </label>
                                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=med.getTelefono() %>" >
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
