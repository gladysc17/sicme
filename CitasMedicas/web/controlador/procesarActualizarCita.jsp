<%-- 
    Document   : procesarActualizarCita
    Created on : 03-jun-2017, 17:57:17
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeCita"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int idcita = Integer.parseInt(request.getParameter("idcita"));
    FacadeCita facCita = new FacadeCita();            
    boolean actualizar = facCita.actualizarEstadoNoAsistida(idcita);
            

            if (actualizar == true) {

                System.out.println("Actualizó inasistencia");
        %>
        <script>
            alert("REGISTRO EXITOSO");
            location.href = "../jsp/PrincipalMedico.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("ERROR");
            location.href = "../jsp/PrincipalMedico.jsp";
        </script>
        <%
            }
        %>

