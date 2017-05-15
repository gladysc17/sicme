<%-- 
    Document   : recargoAdmin_CrearCitaMedica3
    Created on : 22-mar-2017, 19:00:09
    Author     : Gladys M
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="FACADE.FacadeProfesional"%>
<%@page import="DTO.ProfesionalDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>      
                <%
                    String servicio = request.getParameter("servicio");
                    String tipo = request.getParameter("tipo");

                    FacadeMedico facMed = new FacadeMedico();
                    
                    ArrayList<MedicoDTO> listaMedicos = facMed.consultarMedicosPorServicio(servicio);

                    for (int i = 0; i < listaMedicos.size(); i++) {

                        String nombre = listaMedicos.get(i).getNombre();
                        int id = listaMedicos.get(i).getIdentificacion();


                %>    

                <option value="<%=id%>"><%=nombre%> </option>                                  

                <%
                    }

                %>           