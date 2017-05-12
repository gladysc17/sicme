<%-- 
    Document   : procesarRegistroMedico
    Created on : 22-mar-2017, 22:39:47
    Author     : Gladys M
--%>

<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
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
            FacadeMedico FacMed = new FacadeMedico();

            int identificacion_med = Integer.parseInt(request.getParameter("identificacion"));
            String tipodocumentoid_med = request.getParameter("tipoid");
            int codigo_med = Integer.parseInt(request.getParameter("codigo"));
            String nombre_med = request.getParameter("nombre");
            String correo_med = request.getParameter("correo");
            String fechanacimiento_med = request.getParameter("fechanacimiento");
            String genero_med = request.getParameter("genero");
            int edad_med = Integer.parseInt(request.getParameter("edad"));            
            String estadocivil_med = request.getParameter("estadocivil");
            String direccion_med = request.getParameter("direccion");
            String telefono_med = request.getParameter("telefono"); 
            String servicio_med = request.getParameter("servicio"); 
            String contrasena_med = request.getParameter("contrasena"); 

            MedicoDTO med = new MedicoDTO(identificacion_med, tipodocumentoid_med, codigo_med, nombre_med, correo_med, fechanacimiento_med, genero_med, edad_med, estadocivil_med, direccion_med, telefono_med, contrasena_med, servicio_med);

            boolean registro = FacMed.registrarMedico(med);

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
