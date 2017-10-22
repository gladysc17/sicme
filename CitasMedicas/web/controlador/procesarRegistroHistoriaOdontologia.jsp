<%-- 
    Document   : procesarRegistroHistoriaOdontologia
    Created on : 27/08/2017, 02:21:14 PM
    Author     : LEGADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String labios = request.getParameter("labios");
            System.out.println("labios -> "+labios);
            String placa = request.getParameter("controlPlaca");
            System.out.println("placa -> "+placa);
            //System.out.println("pos 0 ubi 0" + placa[0].ubicaciones[0].valor);
        %>
        <script>alert("HOLAAAA");</script>
    </body>
</html>
