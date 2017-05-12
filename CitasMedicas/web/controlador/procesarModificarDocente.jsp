<%-- 
    Document   : procesarModificarDocente
    Created on : 16-abr-2017, 14:50:19
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeDocente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int identificacion_doc = Integer.parseInt(request.getParameter("identificacion"));           
            String correo_doc = request.getParameter("correo");
            String fechanac_doc = request.getParameter("fechanacimiento");
            String genero_doc = request.getParameter("genero");
            String estadocivil_doc = request.getParameter("estadocivil");
            String direccion_doc = request.getParameter("direccion");
            String telefono_doc = request.getParameter("telefono");
            
            FacadeDocente facDoc = new FacadeDocente();
            boolean rta = facDoc.modificarDocente(identificacion_doc, correo_doc, fechanac_doc, genero_doc, estadocivil_doc, direccion_doc, telefono_doc);
           

            if (rta == true) {
                
        %>
        <script>
            alert("DOCENTE MODIFICADO");
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
