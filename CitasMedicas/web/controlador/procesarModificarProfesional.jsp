<%-- 
    Document   : procesarModificarProfesional
    Created on : 17-abr-2017, 22:30:27
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeProfesional"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int identificacion_prof = Integer.parseInt(request.getParameter("identificacion"));             
            String correo_prof = request.getParameter("correo");
            String fechanacimiento_prof = request.getParameter("fechanacimiento");
            String genero_prof = request.getParameter("genero");
            String estadocivil_prof = request.getParameter("estadocivil");
            String direccion_prof = request.getParameter("direccion");
            String telefono_prof = request.getParameter("telefono");
            
            FacadeProfesional facProf = new FacadeProfesional();
            boolean rta = facProf.modificarProfesional(identificacion_prof, correo_prof, fechanacimiento_prof, genero_prof, estadocivil_prof, direccion_prof, telefono_prof);
           

            if (rta == true) {
                
        %>
        <script>
            alert(" MODIFICADO");
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
