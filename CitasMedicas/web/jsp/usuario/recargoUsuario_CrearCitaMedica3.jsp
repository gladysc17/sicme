<%-- 
    Document   : recargoAdmin_CrearCitaMedica3
    Created on : 22-mar-2017, 19:00:09
    Author     : Gladys M
--%>

<%@page import="DTO.UsuarioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<option>--seleccione--</option>
<%
            String servicio = request.getParameter("servicio");            
            
            int s = Integer.parseInt(servicio);            
            FacadeUsuario facUs = new FacadeUsuario();

            ArrayList<UsuarioDTO> listaMedicos = facUs.consultarMedicosPorServicio("medico", s);

            for (int i = 0; i < listaMedicos.size(); i++) {

                String nombremed = listaMedicos.get(i).getNombre();
                String idmed = listaMedicos.get(i).getIdentificacion();
        %>    
        
        <option value="<%=idmed%>"><%=nombremed%> </option>                                  

        <%
            }

        %> 
