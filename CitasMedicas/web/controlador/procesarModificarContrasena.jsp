<%-- 
    Document   : procesarModificarContrasena
    Created on : 1/09/2017, 08:38:58 PM
    Author     : usuario
--%>

<%@page import="util.Seguridad"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            String id = request.getParameter("id");
            String tipo = request.getParameter("tipo");
            String contra = request.getParameter("contrasena1");
            System.out.println("id "+id +"contra "+contra + "tipo " +tipo);
            Seguridad seg = new Seguridad();
            String psencri = seg.Encriptar(contra);
            FacadeUsuario fac = new FacadeUsuario();            
            
            boolean rta = fac.modificarContrasena(id, psencri);

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
                else if(tipo.equals("estudiante") || tipo.equals("docente") || tipo.equals("servicios_generales") || tipo.equals("administrativo")){
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
