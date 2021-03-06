<%-- 
    Document   : procesarModificarCita
    Created on : 02-abr-2017, 19:21:56
    Author     : Gladys M
--%>

<%@page import="DTO.HorarioDTO"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.CitaDTO"%>
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
            int id_cita = Integer.parseInt(request.getParameter("idcita"));
            String id_medico = request.getParameter("prof");                        
            String fecha = request.getParameter("fecha");
            
            System.out.println("id_cita "+id_cita +" cid_medico "+id_medico+ "fecha "+fecha);
            
            int horaMedico = Integer.parseInt(request.getParameter("horaMedico"));                                                                 
            
            FacadeCita facCita = new FacadeCita();
            FacadeHorario fh = new FacadeHorario();
            CitaDTO cit = facCita.consultarCitasId(id_cita);
            System.out.println("cita "+ cit.getId_cita());
            HorarioDTO h = fh.consultarHora(cit.getHora_cita());
            System.out.println("cita "+ h.getId_horario());
            boolean e = fh.cambiarEstadoHora(id_medico, fecha, h.getId_horario(), "disponible");
            boolean rta = facCita.modificarCita(id_cita, fecha, horaMedico, id_medico);
           
            if (rta == true) {
                FacadeHorario fac = new FacadeHorario();
                boolean rt2 = fac.cambiarEstadoHora(id_medico, fecha, horaMedico,"ocupado");               
                System.out.println("MODIFICO LA CITA "+rta +" cambio horario "+rt2);
        %>
        <script>
            alert("CITA MODIFICADA");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("NO SE MODIFICO LA CITA");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>
