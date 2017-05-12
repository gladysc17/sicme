<%-- 
    Document   : procesarEvento
    Created on : 16/02/2017, 03:44:38 PM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeEvento"%>
<%@page import="DTO.EventoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../css/toastr.css" rel="stylesheet" type="text/css" />
        <script src = "../js/sweetalert.min.js" type = "text/javascript" ></script>
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
            toastr.success("Registro exitoso");
        </script>
        <%
            response.sendRedirect("../jsp/PrincipalAdministrador.jsp");
        } 
        %> 
           
            
            <script src="../js/toastr.js"></script>
    </body>
</html>
