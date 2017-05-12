<%-- 
    Document   : procesarModificarAdmin
    Created on : 09-mar-2017, 23:05:55
    Author     : Gladys M
--%>

<%@page import="DTO.AdministradorDTO"%>
<%@page import="FACADE.FacadeAdministrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        <%

            AdministradorDTO admin = (AdministradorDTO) session.getAttribute("administrador");
         
            int id = admin.getIdentificacion_administrador();

            String correo = request.getParameter("correo");
            String tel = request.getParameter("telefono");
            String contrasena = request.getParameter("contrasena");
            String direccion = request.getParameter("direccion");
            String fn = request.getParameter("fn");
            String genero = request.getParameter("genero");
            String estadoc = request.getParameter("estadoc");
                        

            FacadeAdministrador facAdm = new FacadeAdministrador();
                        
            boolean modificar = facAdm.modificarAdmin(id, correo, tel, contrasena, direccion, fn, genero, estadoc);
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
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
                }
            }

        %>
    </body>
</html>
