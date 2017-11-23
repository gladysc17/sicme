<%-- 
    Document   : recargoAdmin_CrearCitaMedica4
    Created on : 22-mar-2017, 19:00:21
    Author     : Gladys M
--%>

<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Time"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String idmed = request.getParameter("idmed");
    
    String fecha = request.getParameter("fecha");
    System.out.println("fecha -> "+fecha);
    
    String fechaArray [] = fecha.split("-");
    int diaDelMesCita = Integer.parseInt(fechaArray[2]);
    //System.out.println("diaCita -> "+diaCita);
    Date fechaActual = Calendar.getInstance().getTime();
    int diaDelMesHoy = fechaActual.getDate();    
    LocalTime horaActual = LocalTime.parse((fechaActual.getMinutes() < 10 ? "0" : "")+fechaActual.getHours()+":"+(fechaActual.getMinutes() < 10 ? "0" : "")+fechaActual.getMinutes());
    System.out.println("diaHoy -> "+horaActual );
    FacadeHorario fachm = new FacadeHorario();
    
    List<HorarioDTO> horas = fachm.consultarHorasDisponibles(idmed, fecha);
    
    int idHora = 0;
    for (int i = 0; i < horas.size(); i++) {
        
        idHora = horas.get(i).getId_horario();
        LocalTime horaCita = LocalTime.parse(horas.get(i).getHora_inicio().toString());
        Time hora = horas.get(i).getHora_inicio();
        int c = horaActual.compareTo(horaCita);
        String disabled = c > 0 ? "disabled" : "";
        
        if (diaDelMesCita == diaDelMesHoy){
%>                    
            <option value="<%=hora%>-<%=idHora%>" <%=disabled%>><%=hora%> </option>                                                                                                                                             
<%
        }else {
%>
            <option value="<%=hora%>-<%=idHora%>"><%=hora%> </option>
<%
        }
    }
%>  
