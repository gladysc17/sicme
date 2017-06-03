<%-- 
    Document   : recargoAdmin_CrearCitaMedica4
    Created on : 22-mar-2017, 19:00:21
    Author     : Gladys M
--%>

<%@page import="java.sql.Time"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String idmed = request.getParameter("idmed");
    System.out.println("idmed de 4 "+idmed);
    String fecha = request.getParameter("fecha");

    FacadeHorario fachm = new FacadeHorario();

    List<HorarioDTO> horas = fachm.consultarHorasDisponibles(idmed, fecha);
    
    int idHora = 0;
    for (int i = 0; i < horas.size(); i++) {
        
        idHora = horas.get(i).getId_horario();

        Time hora = horas.get(i).getHora_inicio();

%>                    
<option value="<%=hora%>-<%=idHora%>"><%=hora%> </option>                                                                                                                                             
<%
    }
%>  
