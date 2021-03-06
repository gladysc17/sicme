<%-- 
    Document   : procesarInicioSesion
    Created on : 17-ene-2017, 18:18:15
    Author     : Gladys M
--%>



<%@page import="util.Seguridad"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.MedicoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            FacadeUsuario fac = new FacadeUsuario();
            String id = request.getParameter("usuario");
            String contrasena = request.getParameter("pw");
            Seguridad seg = new Seguridad();
            String psencri = seg.Encriptar(contrasena);

            UsuarioDTO us = fac.consultarUsuarioPorId(id);

            if (us != null) {
                
                String clave = us.getContrasena();
                System.out.println("claveee -> "+clave);
                if (clave.equals(psencri)){
                    
                    String tipo = us.getTipo_usuario();
                    
                    if(tipo.equals("administrador")){
                        UsuarioDTO u = fac.consultarUsuarioPorId(id);
                        session.setAttribute("administrador", u);
                        response.sendRedirect("../jsp/PrincipalAdministrador.jsp");
                    }
                    else if(tipo.equals("medico")){
                        UsuarioDTO u = fac.consultarUsuarioPorId(id);
                        session.setAttribute("medico", u);
                        response.sendRedirect("../jsp/PrincipalMedico.jsp");
                    }
                    else if(tipo.equals("vicerrector")){
                        UsuarioDTO u = fac.consultarUsuarioPorId(id);
                        session.setAttribute("vicerrector", u);
                        response.sendRedirect("../jsp/PrincipalVicerrector.jsp");
                    }
                    else if(tipo.equals("estudiante") || tipo.equals("docente") || tipo.equals("administrativo") || tipo.equals("servicios_generales")){
                        UsuarioDTO u = fac.consultarUsuarioPorId(id);
                        session.setAttribute("usuario", u);
                        response.sendRedirect("../jsp/PrincipalUsuario.jsp");
                    }
                    else{
                       %>
                       <script>
            alert("DATOS INCORRECTOS");            
            location.href = "../index.jsp";
        </script>
        <%
                    }
                }
                else{
                   %>
        <script>
            alert("USUARIO Y CONTRASEÑA NO COINCIDEN");
            location.href = "../index.jsp";
        </script>
        <%
                }
            } 
            else {
                %>
        <script>
            alert("USUARIO NO EXISTE");
            location.href = "../index.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>

