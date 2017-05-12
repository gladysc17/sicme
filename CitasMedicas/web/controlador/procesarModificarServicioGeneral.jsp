<%-- 
    Document   : procesarModificarServicioGeneral
    Created on : 17-abr-2017, 22:30:39
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeServicioGeneral"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int identificacion_sg = Integer.parseInt(request.getParameter("identificacion"));             
            String correo_sg = request.getParameter("correo");
            String fechanacimiento_sg = request.getParameter("fechanacimiento");
            String genero_sg = request.getParameter("genero");
            String estadocivil_sg = request.getParameter("estadocivil");
            String direccion_sg = request.getParameter("direccion");
            String telefono_sg = request.getParameter("telefono");
            
            FacadeServicioGeneral facSer = new FacadeServicioGeneral();
            boolean rta = facSer.modificarServicioGeneral(identificacion_sg, correo_sg, fechanacimiento_sg, genero_sg, estadocivil_sg, direccion_sg, telefono_sg);
          

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
