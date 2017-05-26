<%-- 
    Document   : recargoAdmin_CrearCitaMedica3
    Created on : 22-mar-2017, 19:00:09
    Author     : Gladys M
--%>

<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="java.util.List"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>      

        <%
            String servicio = request.getParameter("servicio");            

            FacadeUsuario facUs = new FacadeUsuario();

            ArrayList<UsuarioDTO> listaMedicos = facUs.consultarMedicosPorServicio("medico", servicio);

            for (int i = 0; i < listaMedicos.size(); i++) {

                String nombremed = listaMedicos.get(i).getNombre();
                String idmed = listaMedicos.get(i).getIdentificacion();


        %>    

        <option value="<%=idmed%>"><%=nombremed%> </option>                                  

        <%
            }

        %> 
      