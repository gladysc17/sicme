<%-- 
    Document   : procesarModificarEvento
    Created on : 1/04/2017, 10:18:39 PM
    Author     : LEGADO
--%>

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
        int idEvento = Integer.parseInt(request.getParameter("idEvento"));
        String fecha = request.getParameter("nueFechaEvento");
        String horaE = request.getParameter("nueHoraEvento");
        String lugar = request.getParameter("nuelugarEvento");
        System.out.println("hora "+horaE);
        if(horaE.length() < 8){
            horaE = horaE+":00";
        }        
        FacadeEvento fe = new FacadeEvento();
        
        boolean rta = fe.modificarEvento(idEvento, fecha, horaE, lugar);
        if(rta){
        %>
        <script type="text/javascript">
            alert("DATOS MODIFICADOS");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
            System.out.println(rta+"");
        }
        %>
    </body>
</html>
