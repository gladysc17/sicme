<%-- 
    Document   : procesarModificarVicerrecctor
    Created on : 20-mar-2017, 16:41:20
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeVice"%>
<%@page import="DTO.VicerrectorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            VicerrectorDTO vice = (VicerrectorDTO) session.getAttribute("vicerrector");
         
            int id_vice = vice.getIdentificacion_vice();

            String correo_vice = request.getParameter("correo");
            String telefono_vice = request.getParameter("telefono");
            String contrasena_vice = request.getParameter("contrasena1");

            System.out.println("corr " + correo_vice + " te " + telefono_vice + "id" + id_vice);

            FacadeVice facVic = new FacadeVice();
                        
            boolean modificar = facVic.modificarVice(id_vice, correo_vice, telefono_vice, contrasena_vice);

            if (modificar == true) {

        %>
        <script type="text/javascript">
            alert("DATOS MODIFICADOS");
            location.href = "procesarCierreSesion.jsp";
        </script>
        <%            } else {
            if (modificar == true) {
        %>
        <script type="text/javascript">
            alert("NO ACTUALIZÓ DATOS");
            location.href = "procesarCierreSesion.jsp";
        </script>
        <%
                }
            }

        %>
    </body>
</html>
