<%-- 
    Document   : procesarEventoMedico
    Created on : 2/04/2017, 07:58:04 PM
    Author     : LEGADO
--%>

<%@page import="DTO.EventoDTO"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            FacadeEvento fac = new FacadeEvento();

            String nombreEvento = request.getParameter("nombreEvento");
            String fechaEvento = request.getParameter("fechaEvento");
            String horaEvento = request.getParameter("horaEvento");
            String lugarEvento = request.getParameter("lugarEvento");
            String descrEvento = request.getParameter("descrEvento");
            String dirEvento = request.getParameter("dirEvento");
            int identificacion = Integer.parseInt(request.getParameter("identificion"));

            String hora = horaEvento+":00";
            EventoDTO eve = new EventoDTO(nombreEvento, fechaEvento, hora, lugarEvento, descrEvento, dirEvento, identificacion, "activo");

            boolean rta = fac.crearEvento(eve);

            if (rta) {
        %>
        <script type="text/javascript">
            alert("REGISTRO EXITOSO");
            location.href = "../jsp/PrincipalMedico.jsp";
        </script>
        <%

        } 
        %> 
    </body>
</html>
