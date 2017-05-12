<%-- 
    Document   : procesarRegistroProfesional
    Created on : 01-feb-2017, 11:23:39
    Author     : Gladys M
--%>

<%@page import="DTO.ProfesionalDTO"%>
<%@page import="FACADE.FacadeProfesional"%>
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
            FacadeProfesional fac = new FacadeProfesional();

            int identificacion_prof = Integer.parseInt(request.getParameter("identificacion"));
            String tipodocumentoid_prof = request.getParameter("tipoid");
            int codigo_prof = Integer.parseInt(request.getParameter("codigo"));
            String nombre_prof = request.getParameter("nombre");
            String correo_prof = request.getParameter("correo");
            String fechanacimiento_prof = request.getParameter("fechanacimiento");
            String genero_prof = request.getParameter("genero");
            int edad_prof = Integer.parseInt(request.getParameter("edad"));            
            String estadocivil_prof = request.getParameter("estadocivil");
            String direccion_prof = request.getParameter("direccion");
            String telefono_prof = request.getParameter("telefono");           

            ProfesionalDTO prof = new ProfesionalDTO(identificacion_prof, tipodocumentoid_prof, codigo_prof, nombre_prof, correo_prof, fechanacimiento_prof, genero_prof, edad_prof, estadocivil_prof, direccion_prof, telefono_prof);

            boolean registro = fac.registrarProfesional(prof);

            if (registro == true) {

                %>
        <script  type = "text/javascript">
            alert("REGISTRO EXITOSO ");
            location.href = "../jsp/PrincipalAdministrador.jsp#profesional";
        </script>
        <%  

            } else {

        %>
        <script  type = "text/javascript">
            alert("DATOS INCORRECTOS");
            location.href = "../jsp/PrincipalAdministrador.jsp#profesional";
        </script>
        <%                        }


        %>





    </body>
</html>
