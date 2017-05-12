<%-- 
    Document   : procesarRegistroEstudiante
    Created on : 17-ene-2017, 17:00:50
    Author     : Gladys M
--%>

<%@page import="java.awt.Image"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
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
            FacadeEstudiante fac = new FacadeEstudiante();

            int identificacion_est = Integer.parseInt(request.getParameter("identificacion"));
            String tipodocumentoid_est = request.getParameter("tipoid");
            int codigo_est = Integer.parseInt(request.getParameter("codigo"));
            String nombre_est = request.getParameter("nombre");
            String correo_est = request.getParameter("correo");
            String fechanacimiento_est = request.getParameter("fechanacimiento");
            String genero_est = request.getParameter("genero");
            int edad_est = Integer.parseInt(request.getParameter("edad"));
            System.out.println("edad"+edad_est);
            String estadocivil_est = request.getParameter("estadocivil");
            String direccion_est = request.getParameter("direccion");
            String telefono_est = request.getParameter("telefono");
            String programa_est = request.getParameter("programa");            
            
            EstudianteDTO est = new EstudianteDTO(identificacion_est, tipodocumentoid_est, codigo_est, nombre_est, correo_est, fechanacimiento_est, genero_est, edad_est, estadocivil_est, direccion_est, telefono_est, programa_est);

            boolean registrar = fac.registrarEstudiante(est);

            if (registrar == true) {
              
        %>
        <script  type = "text/javascript">
            swal("registro exitoso");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {

        %>
        <script  type = "text/javascript">
            swal({
                title: "Error!",
                text: "La identificación o Código ya se encuentran registrado",
                type: "success",
                timer: 5000
            });
             location.href = "../jsp/PrincipalAdministrador.jsp";               
        </script>
        <%
            }
        %>

    </body>
</html>

