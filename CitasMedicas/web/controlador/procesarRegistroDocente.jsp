<%-- 
    Document   : procesarRegistroDocente
    Created on : 22-mar-2017, 22:40:05
    Author     : Gladys M
--%>

<%@page import="DTO.DocenteDTO"%>
<%@page import="FACADE.FacadeDocente"%>
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
            FacadeDocente FacDoc = new FacadeDocente();

            int identificacion_doc = Integer.parseInt(request.getParameter("identificacion"));
            String tipodocumentoid_doc = request.getParameter("tipoid");
            int codigo_doc = Integer.parseInt(request.getParameter("codigo"));
            String nombre_doc = request.getParameter("nombre");
            String correo_doc = request.getParameter("correo");
            String fechanacimiento_doc = request.getParameter("fechanacimiento");
            String genero_doc = request.getParameter("genero");
            int edad_doc = Integer.parseInt(request.getParameter("edad"));            
            String estadocivil_doc = request.getParameter("estadocivil");
            String direccion_doc = request.getParameter("direccion");
            String telefono_doc = request.getParameter("telefono");

            DocenteDTO doc = new DocenteDTO(identificacion_doc, tipodocumentoid_doc, codigo_doc, nombre_doc, correo_doc, fechanacimiento_doc, genero_doc, edad_doc, estadocivil_doc, direccion_doc, telefono_doc);

            boolean registro = FacDoc.registrarDocente(doc);

            if (registro == true) {

        %>
        <script  type = "text/javascript">
            alert("REGISTRO EXITOSO ");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%        } else {

        %>
        <script  type = "text/javascript">
            alert("DATOS INCORRECTOS");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%                        }


        %>
    </body>
</html>
