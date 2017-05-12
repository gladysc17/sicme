<%-- 
    Document   : procesarModificarCita
    Created on : 02-abr-2017, 19:21:56
    Author     : Gladys M
--%>

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
            int id_medico = Integer.parseInt(request.getParameter("idprof"));                        
            String fecha = request.getParameter("fecha");
            int horaMedico = Integer.parseInt(request.getParameter("horaMedico"));                                                                 
            
            FacadeCita facCita = new FacadeCita();
            boolean rta = facCita.modificarCita(id_cita, fecha, horaMedico, id_medico);
           

            if (rta == true) {
                FacadeHorario fac = new FacadeHorario();
                boolean rt2 = fac.cambiarEstadoHora(id_medico, fecha, horaMedico);               
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
