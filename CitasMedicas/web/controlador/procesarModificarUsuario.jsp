<%-- 
    Document   : procesarModificarOtroUsuario
    Created on : 17-abr-2017, 22:30:08
    Author     : Gladys M
--%>

<%@page import="DTO.UsuarioDTO"%>
<%@page import="java.sql.Date"%>
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
            String identificacion_otro = request.getParameter("identificacion");
            String correo_otro = request.getParameter("correo");
            String fechanacimiento_otro = request.getParameter("fechanacimiento");
            java.sql.Date fecha = java.sql.Date.valueOf(fechanacimiento_otro);
            String genero_otro = request.getParameter("genero");
            String estadocivil_otro = request.getParameter("estadocivil");
            String direccion_otro = request.getParameter("direccion");
            String telefono_otro = request.getParameter("telefono");            

            FacadeUsuario fac = new FacadeUsuario();
            UsuarioDTO u = fac.consultarUsuarioPorId(identificacion_otro);
            int edad = fac.calcularEdad(fecha); 
            String tipo = u.getTipo_usuario();
            
            boolean rta = fac.modificarUsuario(identificacion_otro, correo_otro, fecha, genero_otro, estadocivil_otro, direccion_otro, telefono_otro, edad);                                                    

            if (rta == true) {

         if (tipo.equals("medico")){                    
                %>        
                    <script type="text/javascript">
                    alert('DATOS MODIFICADOS');
                    location.href = "../jsp/PrincipalMedico.jsp"
                    </script>
                <%                       
                }
                
                else if(tipo.equals("vicerrector")){
                %>        
                    <script type="text/javascript">
                    alert('DATOS MODIFICADOS');
                    location.href = "../jsp/PrincipalVicerrector.jsp";     
                    </script>
                <%                       
                }
                
                else if(tipo.equals("administrador")){
                %>        
                    <script type="text/javascript">
                    alert('DATOS MODIFICADOS');
                    location.href ="../jsp/PrincipalAdministrador.jsp";
                    </script>
                <%                       
                }
                else if(tipo.equals("estudiante") || tipo.equals("docente") || tipo.equals("servicios_generales") || tipo.equals("administrativo")){
                %>        
                    <script type="text/javascript">
                    alert('DATOS MODIFICADOS');
                    location.href ="../jsp/PrincipalUsuario.jsp"; 
                    </script>
                <%                       
                }
            } else {
        %>
        <script type="text/javascript">
            alert('Datos erroneos');
            location.href ="../index.jsp";
        </script>
        <%                                      
            }
        %>
    </body>
</html>
