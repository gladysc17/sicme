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


        <%
            String idprof = request.getParameter("prof");
            String servicio = request.getParameter("servicio");
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
    

