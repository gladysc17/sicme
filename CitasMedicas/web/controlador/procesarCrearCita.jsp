<%-- 
    Document   : procesarCrearCita
    Created on : 22-feb-2017, 22:12:19
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="DTO.ProfesionalDTO"%>
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
            int id_usuario = Integer.parseInt(request.getParameter("identf"));
            String nombre_usuario = request.getParameter("nombre");             
            int idHora =  Integer.parseInt(request.getParameter("idHora"));
            
            FacadeMedico facMed = new FacadeMedico();
            MedicoDTO med = facMed.consultarMedicoPorId(id_med);
            String nombre_medico = med.getNombre();
            String tipo = request.getParameter("tipo");
                                                          
            String estado = "pendiente";

            System.out.println("idhora "+ idHora);

            FacadeCita fc = new FacadeCita();

            CitaDTO cita = new CitaDTO(servicio, recibo, fecha, hora, id_usuario, id_med, estado, nombre_usuario, nombre_medico, tipo);

            boolean rta = fc.registrarCita(cita);

            if (rta == true) {
                FacadeHorario fac = new FacadeHorario();
                        boolean rt2 = fac.cambiarEstadoHora(id_med, fecha, idHora);
                System.out.println("CREO LA CITA");
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
