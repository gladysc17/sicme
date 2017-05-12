<%-- 
    Document   : recargoAdmin_ModificarCita2
    Created on : 02-abr-2017, 19:56:08
    Author     : Gladys M
--%>

<%@page import="DTO.HorarioDTO"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
            <div class="form-group col-md-4">
                <label  class="control-label"> Horas disponibles: </label>
                <select class="form-control" name="horaMedico" id="horaMedico" required="" >
                    <%
                        int idprof = Integer.parseInt(request.getParameter("prof"));
                        String fecha = request.getParameter("fecha");
                        int idcita = Integer.parseInt(request.getParameter("idcita"));

                        FacadeHorario fachm = new FacadeHorario();

                        List<HorarioDTO> horas = fachm.consultarHorasDisponibles(idprof, fecha);

                        int idHoraMedico = 0;
                        for (int i = 0; i < horas.size(); i++) {

                            idHoraMedico = horas.get(i).getId_horario();

                            Time hora = horas.get(i).getHora_inicio();

                            System.out.println("idhora " + idHoraMedico);

                    %>                    
                    <option value="<%=idHoraMedico%>"><%=hora%> </option>                                                                                                                                             
                    <%
                        }
                    %>
                </select>
            </div>
                
             <div class="form-group col-md-4">
                <label  class="control-label"> Recibo </label>
                <input class="form-control" type="text" id="recibo" name="recibo" required>  
            </div>
            <div class="form-group col-md-4">
                <label  class="control-label"> </label>
                <button type="submit" class="btn btn-primary form-control" onclick="procesar('../controlador/procesarModificarCita.jsp?horaMedico=' + horaMedico.value + '&idprof=<%=idprof%>&fecha=<%=fecha%>&idcita=<%=idcita%>')">  Modificar Cita </button>
            </div>
        
    </body>
</html>
