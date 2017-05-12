<%-- 
    Document   : recargoAdmin_modificarCita
    Created on : 02-abr-2017, 17:30:25
    Author     : Gladys M
--%>

<%@page import="DTO.MedicoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="FACADE.FacadeCita"%>
<%@page import="DTO.CitaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>

        <div class="col-md-10 form-group">            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 align="center">  Modificar Cita Medica Usuario </h2>                    
                </div>

                <div class="panel-body">
                    <%
                        int idcita = Integer.parseInt(request.getParameter("id"));

                        CitaDTO cita = new CitaDTO();
                        FacadeCita facCita = new FacadeCita();

                        cita = facCita.consultarCitasId(idcita);
                    %>
                    <div class="form-group col-md-4"> 
                        <label class="control-label">Identificación: </label>
                        <input class="form-control " name="identf" id="identf" value="<%=cita.getId_usuario()%>" readonly> 
                    </div>                   

                    <div class="form-group col-md-4">
                        <label class="control-label">Nombre:</label>                                                                                  
                        <input class="form-control" name="nombre" id="nombre" value="<%=cita.getNombre_usuario()%>" readonly>                            
                    </div> 

                    <div class="form-group col-md-4">
                        <label class="control-label">Servicio: </label>
                        <input class="form-control" name="servicio" id="servicio" value="<%=cita.getServicio_cita()%>" readonly>
                    </div>       


                    <div class="form-group col-md-4">
                        <label class="control-label">Fecha: </label>
                        <input class="form-control" type="date" id="fecha" name="fecha" required>                                           
                    </div> 
                    <div class="form-group col-md-4">
                        <label class="control-label">Medico: </label>
                        <select class="form-control" name="prof" id="prof" required>
                            <%
                                String servicio = cita.getServicio_cita();

                                FacadeMedico facMed = new FacadeMedico();

                                ArrayList<MedicoDTO> listaMedicos = facMed.consultarMedicosPorServicio(servicio);

                                for (int i = 0; i < listaMedicos.size(); i++) {

                                    String nombre = listaMedicos.get(i).getNombre_med();
                                    int idmed = listaMedicos.get(i).getIdentificacion_med();


                            %>    
                            <option value="<%=idmed%>"><%=nombre%> </option>                                  
                            <%
                                }

                            %>
                        </select>
                    </div> 

                    <div class="form-group col-md-4">
                        <label class="control-label"> </label>
                        <button type="submit" class="btn btn-primary form-control" onclick="cargar_form('administrador/recargoAdmin_ModificarCita2.jsp?prof=' + prof.value + '&fecha=' + fecha.value + '&idcita=<%=idcita%>')">  Horas disponibles </button>
                    </div>

                    <div class="form-group col-md-12" id="cargar">

                    </div>   
                </div>

            </div>
        </div>                        
        <div class="col-md-1"></div> 



    </body>
</html>
