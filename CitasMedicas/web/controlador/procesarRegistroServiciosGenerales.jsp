<%-- 
    Document   : procesarRegistroServiciosGenerales
    Created on : 22-mar-2017, 22:40:43
    Author     : Gladys M
--%>

<%@page import="DTO.ServicioGeneralDTO"%>
<%@page import="FACADE.FacadeServicioGeneral"%>
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
            FacadeServicioGeneral fac = new FacadeServicioGeneral();

            int identificacion_sg = Integer.parseInt(request.getParameter("identificacion"));
            String tipodocumentoid_sg = request.getParameter("tipoid");
            int codigo_sg = Integer.parseInt(request.getParameter("codigo"));
            String nombre_sg = request.getParameter("nombre");
            String correo_sg = request.getParameter("correo");
            String fechanacimiento_sg = request.getParameter("fechanacimiento");
            String genero_sg = request.getParameter("genero");
            int edad_sg = Integer.parseInt(request.getParameter("edad"));            
            String estadocivil_sg = request.getParameter("estadocivil");
            String direccion_sg = request.getParameter("direccion");
            String telefono_sg = request.getParameter("telefono");          

            ServicioGeneralDTO sg = new ServicioGeneralDTO(identificacion_sg, tipodocumentoid_sg, codigo_sg, nombre_sg, correo_sg, fechanacimiento_sg, genero_sg, edad_sg, estadocivil_sg, direccion_sg, telefono_sg);

            boolean registro = fac.registrarServicioGeneral(sg);

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
