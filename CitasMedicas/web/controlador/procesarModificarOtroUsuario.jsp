<%-- 
    Document   : procesarModificarOtroUsuario
    Created on : 17-abr-2017, 22:30:08
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeOtrosUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int identificacion_otro = Integer.parseInt(request.getParameter("identificacion"));             
            String correo_otro = request.getParameter("correo");
            String fechanacimiento_otro = request.getParameter("fechanacimiento");
            String genero_otro = request.getParameter("genero");
            String estadocivil_otro = request.getParameter("estadocivil");
            String direccion_otro = request.getParameter("direccion");
            String telefono_otro = request.getParameter("telefono");
            
            FacadeOtrosUsuarios facOtro = new FacadeOtrosUsuarios();
            boolean rta = facOtro.modificarOtroUsuario(identificacion_otro, correo_otro, fechanacimiento_otro, genero_otro, estadocivil_otro, direccion_otro, telefono_otro);
           

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
