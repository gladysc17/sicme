<%-- 
    Document   : procesarRecuperarContraseña
    Created on : 1/06/2017, 11:26:07 PM
    Author     : GLADYS
--%>


<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String id = request.getParameter("id");
            System.out.println("iddd" + id);

            FacadeUsuario fac = new FacadeUsuario();
            UsuarioDTO ms = fac.consultarUsuarioPorId(id);

            if (ms == null) {
        %>
        <script>
            alert('USUARIO NO EXISTE');
            location.href = '../index.jsp';
        </script>
        <%
        } else {

            boolean rta = fac.recueperarContrasena(id);

            if (rta) {
        %>
        <script>
            alert('SE HA ENVIADO EL CORREO CON EXITO');
            location.href = '../index.jsp';
        </script>
        <%
        } else {
        %>
        <script>
            alert('NO SE HA ENVIADO EL CORREO');
            location.href = '../index.jsp';
        </script>
        <%
                }
            }
        %>
    </body>
</html>
