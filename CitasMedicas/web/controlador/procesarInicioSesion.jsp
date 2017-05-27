<%-- 
    Document   : procesarInicioSesion
    Created on : 17-ene-2017, 18:18:15
    Author     : Gladys M
--%>


<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="DTO.VicerrectorDTO"%>
<%@page import="FACADE.FacadeVice"%>
<%@page import="DTO.AdministradorDTO"%>
<%@page import="FACADE.FacadeAdministrador"%>
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
            FacadeUsuario fac = new FacadeUsuario();
            String id = request.getParameter("usuario");
            String contrasena = request.getParameter("pw");

            UsuarioDTO us = fac.consultarUsuarioPorId(id);

            if (us != null) {

                String tipo = us.getTipo_usuario();
                System.out.println("TIPO " + tipo);
                System.out.println("id " + id);
                if (tipo.equals("administrador")) {

                    FacadeAdministrador facAd = new FacadeAdministrador();
                    boolean rta = facAd.verificarAdmin(id, contrasena);

                    System.out.println("RTA " + rta);

                    if (rta == true) {
                        AdministradorDTO admin = facAd.consultarAdminId(id);
                        session.setAttribute("administrador", admin);
                        response.sendRedirect("../jsp/PrincipalAdministrador.jsp");
                    } else {
        %>
        <script type="text/javascript">
            alert("CONTRASEÑA INCORRRECTA");
            location.href = '../index.jsp';
        </script>
        <%
            }

        } else if (tipo.equals("vicerrector")) {
            FacadeVice facVc = new FacadeVice();
            boolean rta = facVc.verificarVice(id, contrasena);

            if (rta == true) {
                VicerrectorDTO vice = facVc.consultarViceId(id);
                session.setAttribute("vicerrector", vice);
                response.sendRedirect("../jsp/PrincipalVicerrector.jsp");
            } else {
        %>
        <script type="text/javascript">
            alert("CONTRASEÑA INCORRRECTA");
            location.href = '../index.jsp';
        </script>
        <%
                    }

                }

         else if (tipo.equals("medico")) {
            FacadeMedico facMd = new FacadeMedico();
            boolean rta = facMd.verificarMedico(id, contrasena);

            if (rta == true) {
                MedicoDTO vice = facMd.consultarMedicoPorId(id);
                session.setAttribute("medico", vice);
                response.sendRedirect("../jsp/PrincipalMedico.jsp");
            } else {
        %>
        <script type="text/javascript">
            alert("CONTRASEÑA INCORRRECTA");
            location.href = '../index.jsp';
        </script>
        <%
                    }

                }

}else{
%>
        <script type="text/javascript">
            alert("USUARIO NO EXISTE");
            location.href = '../index.jsp';
        </script>
        <%

}
        %>

    </body>
</html>
