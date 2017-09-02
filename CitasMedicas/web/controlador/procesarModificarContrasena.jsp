<%-- 
    Document   : procesarModificarContrasena
    Created on : 1/09/2017, 08:38:58 PM
    Author     : usuario
--%>

<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            String id = request.getParameter("id");
            String tipo = request.getParameter("tipo");
            String contra = request.getParameter("contrasena1");
            System.out.println("id "+id +"contra "+contra + "tipo " +tipo);
            FacadeUsuario fac = new FacadeUsuario();            
            
            boolean rta = fac.modificarContrasena(id, contra);

            if (rta == true) {
                
                if (tipo.equals("medico")){                    
                %>        
                    <script type="text/javascript">
                    alert('CONTRASEÑA MODIFICADA');
                    location.href = "../jsp/PrincipalMedico.jsp"
                    </script>
                <%                       
                }
                
                else if(tipo.equals("vicerrector")){
                %>        
                    <script type="text/javascript">
                    alert('CONTRASEÑA MODIFICADA');
                    location.href = "../jsp/PrincipalVicerrector.jsp";     
                    </script>
                <%                       
                }
                
                else if(tipo.equals("administrador")){
                %>        
                    <script type="text/javascript">
                    alert('CONTRASEÑA MODIFICADA');
                    location.href ="../jsp/PrincipalAdministrador.jsp";
                    </script>
                <%                       
                }
                else if(tipo.equals("estudiante") || tipo.equals("docente") || tipo.equals("servicios_generales")){
                %>        
                    <script type="text/javascript">
                    alert('CONTRASEÑA MODIFICADA');
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
