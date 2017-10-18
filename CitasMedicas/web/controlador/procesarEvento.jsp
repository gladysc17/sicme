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
            String identificacion = request.getParameter("identificacion");

            String hora = horaEvento+":00";
            EventoDTO eve = new EventoDTO(nombreEvento, fechaEvento, hora, lugarEvento, descrEvento, dirEvento, identificacion, "activo");

            boolean rta = fac.crearEvento(eve);

            if (rta) {
        %>
        <script>
            alert(" REGISTRO EXITOSO");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
           
        } else {
        %>
        <script>
            alert("ERROR, NO SE REGISTRÓ EL EVENTO");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>
                                   
    </body>
</html>
