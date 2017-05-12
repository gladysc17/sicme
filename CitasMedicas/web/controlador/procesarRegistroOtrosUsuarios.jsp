<%-- 
    Document   : procesarRegistroOtrosUsuarios
    Created on : 22-mar-2017, 22:40:25
    Author     : Gladys M
--%>

<%@page import="DTO.OtroUsuarioDTO"%>
<%@page import="FACADE.FacadeOtrosUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="../js/sweetalert.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            FacadeOtrosUsuarios fac = new FacadeOtrosUsuarios();

            int identificacion_otro = Integer.parseInt(request.getParameter("identificacion"));
            String tipodocumentoid_otro = request.getParameter("tipoid");
            int codigo_otro= Integer.parseInt(request.getParameter("codigo"));
            String nombre_otro = request.getParameter("nombre");
            String correo_otro = request.getParameter("correo");
            String fechanacimiento_otro = request.getParameter("fechanacimiento");
            String genero_otro = request.getParameter("genero");
            int edad_otro = Integer.parseInt(request.getParameter("edad"));            
            String estadocivil_otro = request.getParameter("estadocivil");
            String direccion_otro = request.getParameter("direccion");
            String telefono_otro = request.getParameter("telefono"); 
            String rol_otro = request.getParameter("rol"); 

            OtroUsuarioDTO otros = new OtroUsuarioDTO(identificacion_otro, tipodocumentoid_otro, codigo_otro, nombre_otro, correo_otro, fechanacimiento_otro, genero_otro, edad_otro, estadocivil_otro, direccion_otro, telefono_otro, rol_otro);

            boolean registro = fac.registrarOtrosUsuarios(otros);

            if (registro == true) {

                %>
        <script  type = "text/javascript">
            alert("REGISTRO EXITOSO ");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%  

            } else {

        %>
        <script  type = "text/javascript">
            alert("DATOS INCORRECTOS");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%                        }


        %>





    </body>
</html>
