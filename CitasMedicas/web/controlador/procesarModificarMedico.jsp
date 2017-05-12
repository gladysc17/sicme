<%-- 
    Document   : procesarModificarMedico
    Created on : 17-abr-2017, 22:27:55
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            int identificacion_med = Integer.parseInt(request.getParameter("identificacion"));             
            String correo_med = request.getParameter("correo");
            String fechanacimiento_med = request.getParameter("fechanacimiento");
            String genero_med = request.getParameter("genero");
            String estadocivil_med = request.getParameter("estadocivil");
            String direccion_med = request.getParameter("direccion");
            String telefono_med = request.getParameter("telefono");
            String contrasena_med = request.getParameter("contrasena");
            
            FacadeMedico facMed = new FacadeMedico();
            boolean rta = facMed.modificarMedico(identificacion_med, correo_med, fechanacimiento_med, genero_med, estadocivil_med, direccion_med, telefono_med, contrasena_med);
           

            if (rta == true) {
                
        %>
        <script>
            alert("MODIFICADO");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("ERROR, NO SE MODIFICO");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>
