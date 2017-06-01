<%-- 
    Document   : procesarRegistroHistoriaPsicologia
    Created on : 11-abr-2017, 14:48:18
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeHcPsicologia"%>
<%@page import="DTO.HcPsicologiaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            int idusuario_hcpsico = Integer.parseInt(request.getParameter("ide"));
            String[] motivos = request.getParameterValues("motivo");
            
            String genograma_hcpsico = request.getParameter("genograma");
            String historiafamiliar_hcpsico = request.getParameter("historiaf");
            String problematicaactual_hcpsico = request.getParameter("problematica");
            String diagnostico_hcpsico = request.getParameter("diagnostico");
            String procesopsicoterapeutico_hcpsico = request.getParameter("proceso");
            String seguimiento_hcpsico = request.getParameter("seguimiento");
            String sesion_hcpsico = request.getParameter("sesion");
            int id_cita = Integer.parseInt(request.getParameter("idecita"));
                                   
            
            String motivoconsulta_hcpsico = "";
            
            for (int i = 0; i < motivos.length; i++) {                
                motivoconsulta_hcpsico = motivoconsulta_hcpsico + motivos[i] + ", ";                                    
            }            
                    
        HcPsicologiaDTO psico = new HcPsicologiaDTO(idusuario_hcpsico, motivoconsulta_hcpsico, genograma_hcpsico, historiafamiliar_hcpsico, problematicaactual_hcpsico, diagnostico_hcpsico, procesopsicoterapeutico_hcpsico, seguimiento_hcpsico, sesion_hcpsico, id_cita);
            
            FacadeHcPsicologia facPsico= new FacadeHcPsicologia();
            
            boolean registro = facPsico.registrarHcPsicologia(psico);
            
            if (registro == true) {
                
                System.out.println("REGISTRO HC MED");
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
