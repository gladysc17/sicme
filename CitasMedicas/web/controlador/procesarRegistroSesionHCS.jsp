<%-- 
    Document   : procesarRegistroSesionHCS
    Created on : ago 26, 2017, 5:45:27 p.m.
    Author     : Mauricio U
--%>

<%@page import="DTO.SesionDTO"%>
<%@page import="FACADE.FacadeSesion"%>
<%@page import="FACADE.FacadeCita"%>
<%@page import="FACADE.FacadeHcPsicologia"%>
<%@page import="DTO.HcPsicologiaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%

            FacadeSesion facadeSesion = new FacadeSesion();

            SesionDTO sesionDTO = new SesionDTO();
            
            String idUsuario = request.getParameter("idUsuarioSesion");
            int idHcPsicologia = Integer.parseInt(request.getParameter("idHcPsicologiaSesion"));
            int idCita = Integer.parseInt(request.getParameter("idCitaSesion"));
            String fechaSesion = request.getParameter("fechaSesion");
            String horaSesion = request.getParameter("horaSesion");
            int numSesion = Integer.parseInt(request.getParameter("numSesion"));
            String diagnostico = request.getParameter("diagnosticoSesion");
            String sesionAdicional = request.getParameter("sesionAdicionalSesion");
            
            sesionDTO.setIdCita(idCita);
            sesionDTO.setIdHcPsicologia(idHcPsicologia);
            sesionDTO.setIdUsuario(idUsuario);
            sesionDTO.setDiagnostico(diagnostico);
            sesionDTO.setFecha(fechaSesion);
            sesionDTO.setHora(horaSesion);
            sesionDTO.setNumSesion(numSesion);
            
            boolean registro = facadeSesion.registrarSesion(sesionDTO);
            
            FacadeHcPsicologia facadeHcPsicologia = new FacadeHcPsicologia();            
            FacadeCita facCita = new FacadeCita();            
            
            boolean actualizar = false;
            boolean actualizarSesionAdic = false;
            
            if(registro){
                actualizar = facCita.actualizarEstadoAtendida(idCita);
                actualizarSesionAdic = facadeHcPsicologia.actualizarEstadoSesionAdicional(idHcPsicologia, sesionAdicional);
            }            

            if (registro && actualizar && actualizarSesionAdic) {

                System.out.println("REGISTRO SESIÓN BIEN");
        %>
        <script>
            alert("REGISTRO EXITOSO");
            location.href = "../jsp/PrincipalMedico.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("ERROR");
            location.href = "../jsp/PrincipalMedico.jsp";
        </script>
        <%
            }
        %>

    </body>
</html>
