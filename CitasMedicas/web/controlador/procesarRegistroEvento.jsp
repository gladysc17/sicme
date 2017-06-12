<%-- 
    Document   : procesarRegistroEvento
    Created on : 12/06/2017, 10:29:42 AM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeEvento"%>
<%@page import="DTO.RegistroeventoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            String nombre = request.getParameter("nombre").toString();
            String codigo = request.getParameter("codigo").toString();
            String identificacion = request.getParameter("identificacion").toString();
            String correo = request.getParameter("correo").toString();
            String programa = request.getParameter("programa").toString();
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            
            RegistroeventoDTO re = new RegistroeventoDTO(codigo, nombre, identificacion, correo, programa, idEvento);
            
            FacadeEvento fe = new FacadeEvento();
            
            boolean rta = fe.registroEvento(re);
            
            if(rta){
        %>
        <script type="text/javascript">
            alert('Registro exitoso');
        </script>
        <%       
                response.sendRedirect("../index.jsp");
            } else {
        %>
        <script type="text/javascript">
            alert('Datos erroneos');
        </script>
        <%                       
                response.sendRedirect("../index.jsp");
            }
            
        %>
    </body>
</html>
