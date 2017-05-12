<%-- 
    Document   : procesarInicioSesion
    Created on : 17-ene-2017, 18:18:15
    Author     : Gladys M
--%>


<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="DTO.VicerrectorDTO"%>
<%@page import="FACADE.FacadeVice"%>
<%@page import="DTO.ProfesionalDTO"%>
<%@page import="FACADE.FacadeProfesional"%>
<%@page import="DTO.AdministradorDTO"%>
<%@page import="FACADE.FacadeAdministrador"%>
<%@page import="FACADE.Facade"%>
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
            Facade fac = new Facade();
            FacadeVice facVic = new  FacadeVice();
            FacadeAdministrador facAdm = new FacadeAdministrador();
            FacadeMedico facMed = new FacadeMedico();
            
            String rol = request.getParameter("rol");
            int identificacion = Integer.parseInt(request.getParameter("usuario"));
            String contrasena = request.getParameter("pw");
            
            boolean rta = fac.validarSesion(rol, identificacion, contrasena);
            
            if (!rta) {

        %>
        <script type="text/javascript">
            swal({title: "Error!",
                text: "Datos incorectos!",
                type: "error",
                confirmButtonText: "Inicio",
                timer: 5000
            });            
            location.href = '../index.jsp';
        </script>
        <%            } else {
                
                if (rol.equals("Vicerrector")) {                    
                    VicerrectorDTO vice = facVic.consultarViceporId(identificacion);
                    session.setAttribute("vicerrector", vice);
                    response.sendRedirect("../jsp/PrincipalVicerrector.jsp");
                    
                }
                
                if (rol.equals("Admin")) {
                    AdministradorDTO admin = facAdm.consultarAdminporId(identificacion);
                    session.setAttribute("administrador", admin);
                    response.sendRedirect("../jsp/PrincipalAdministrador.jsp");
                }
                
                if (rol.equals("Medico")) {
                    MedicoDTO med = facMed.consultarMedicoPorId(identificacion);
                    session.setAttribute("medico", med);
                    response.sendRedirect("../jsp/PrincipalMedico.jsp");
                }
                
            }
        %>
    </body>
</html>
