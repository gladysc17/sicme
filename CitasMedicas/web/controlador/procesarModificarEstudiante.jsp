<%-- 
    Document   : procesarModificarEstudiante
    Created on : 22-mar-2017, 19:21:42
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            int identificacion_est = Integer.parseInt(request.getParameter("identificacion")); 
            System.out.println("idennn "+identificacion_est);
            String correo_est = request.getParameter("correo");
            String fechanac_est = request.getParameter("fechanacimiento");
            String genero_est = request.getParameter("genero");
            String estadocivil_est = request.getParameter("estadocivil");
            String direccion_est = request.getParameter("direccion");
            String telefono_est = request.getParameter("telefono");
            
            FacadeEstudiante facEst = new FacadeEstudiante();
            boolean rta = facEst.modificarEstudiante(identificacion_est, correo_est, fechanac_est, genero_est, estadocivil_est, direccion_est, telefono_est);
           

            if (rta == true) {
                
        %>
        <script>
            alert("ESTUDIANTE MODIFICADO");
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
