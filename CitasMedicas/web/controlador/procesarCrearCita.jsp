<%-- 
    Document   : procesarCrearCita
    Created on : 22-feb-2017, 22:12:19
    Author     : Gladys M
--%>

<%@page import="DTO.HorarioMedicoDTO"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            
            String servicio = request.getParameter("servicio"); 
            String recibo = request.getParameter("recibo");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");            
            
            int id_med = Integer.parseInt(request.getParameter("prof"));
            String id_usuario = request.getParameter("identf");
            String nombre_usuario = request.getParameter("nombre");             
            int idHora =  Integer.parseInt(request.getParameter("idHora"));
            
            FacadeMedico facMed = new FacadeMedico();
            MedicoDTO med = facMed.consultarMedicoPorId(id_med);
            String nombre_medico = med.getNombre();
            String tipou = request.getParameter("tipou");
                                                          
            String estado = "pendiente";

            System.out.println("idhora "+ idHora);

            FacadeCita fc = new FacadeCita();

            CitaDTO cita = new CitaDTO(servicio, recibo, fecha, hora, id_usuario, id_med, estado, nombre_usuario, nombre_medico, tipou);

            boolean rta = fc.registrarCita(cita);
            
            FacadeHorario fac = new FacadeHorario();
            FacadeHorarioMedico fm = new FacadeHorarioMedico();
            HorarioMedicoDTO hm = fm.consultarHorarioMedico(idHora);
            
            boolean rt2 = fac.cambiarEstadoHora(id_med, fecha, hm.getId_horario_horariomedico());
            
            if (rta == true && rt2 == true) {
                
                        
                        System.out.println("CREO LA CITA y cambio horario");
        %>
        <script>
            alert("CREO LA CITA");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("NO CREO LA CITA");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>

