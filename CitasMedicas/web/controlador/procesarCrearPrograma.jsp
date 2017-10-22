<%-- 
    Document   : procesarCrearPrograma
    Created on : 18/10/2017, 10:16:29 AM
    Author     : LEGADO
--%>

<%@page import="DTO.Programa_academicoDTO"%>
<%@page import="FACADE.FacadePrograma_academico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    String nombre_programa = request.getParameter("nombre_programa").toString();
    String codigo_programa = request.getParameter("codigo_programa").toString();

    FacadePrograma_academico fpa = new FacadePrograma_academico();
    Programa_academicoDTO programa = new Programa_academicoDTO(nombre_programa, codigo_programa);

    boolean rta = fpa.registrarPrograma_academico(programa);

    if (rta) {
%>
<script>
    alert("Programa académico registrado");
    location.href = "../jsp/PrincipalAdministrador.jsp";
</script>
<%
    } else {
%>
<script>
    alert("Programa académico no registrado");
    location.href = "../jsp/PrincipalAdministrador.jsp";
</script>
<%        
    }
%>

    </body>
</html>
