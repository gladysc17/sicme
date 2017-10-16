<%-- 
    Document   : procesarRegistroHistoriaPsicologia
    Created on : 11-abr-2017, 14:48:18
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeCita"%>
<%@page import="FACADE.FacadeCita"%>
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
            
            
            String historiafamiliar_hcpsico = request.getParameter("historiaf");
            String problematicaactual_hcpsico = request.getParameter("problematica");
            String diagnostico_hcpsico = request.getParameter("diagnostico");
            String procesopsicoterapeutico_hcpsico = request.getParameter("proceso");
            String seguimiento_hcpsico = request.getParameter("seguimiento");
            String sesion_hcpsico = request.getParameter("sesion");
            int id_cita = Integer.parseInt(request.getParameter("idecita"));
            
            String[] tipofamilia = request.getParameterValues("tipofamilia");
            String[] miembrosfamilia = request.getParameterValues("miembrosfamilia");
            String[] relacionesfamilia = request.getParameterValues("relacionesfamilia");
            String genograma = request.getParameter("genograma");
                                   
            
            String motivoconsulta_hcpsico = "";
            
            for (int i = 0; i < motivos.length; i++) {
                if(i != (motivos.length - 1)){
                    motivoconsulta_hcpsico = motivoconsulta_hcpsico + motivos[i] + ", ";
                }else{
                    motivoconsulta_hcpsico = motivoconsulta_hcpsico + motivos[i];
                }
                
            }            
            
            String tipo ="";
            
            for (int i = 0; i < tipofamilia.length; i++) {
                if(i != (tipofamilia.length - 1)){
                   tipo = tipo + tipofamilia[i] + ", ";
                }else{
                    tipo = tipo + tipofamilia[i];
                }
                
            }
            
            String miembros ="";
            
            for (int i = 0; i < miembrosfamilia.length; i++) {
                if(i != (miembrosfamilia.length - 1)){
                   miembros = miembros + miembrosfamilia[i] + ", ";
                }else{
                    miembros = miembros + miembrosfamilia[i];
                }
                
            }
            
            String relaciones ="";
            
            for (int i = 0; i < relacionesfamilia.length; i++) {
                if(i != (relacionesfamilia.length - 1)){
                   relaciones = relaciones + relacionesfamilia[i] + ", ";
                }else{
                    relaciones = relaciones + relacionesfamilia[i];
                }
                
            }
                    
            HcPsicologiaDTO psico = new HcPsicologiaDTO(idusuario_hcpsico, motivoconsulta_hcpsico, historiafamiliar_hcpsico, problematicaactual_hcpsico, diagnostico_hcpsico, procesopsicoterapeutico_hcpsico, seguimiento_hcpsico, sesion_hcpsico, id_cita, tipo, miembros, relaciones, genograma);
            
            FacadeHcPsicologia facPsico= new FacadeHcPsicologia();
            
            boolean registro = facPsico.registrarHcPsicologia(psico);
            FacadeCita facCita = new FacadeCita();            
            boolean actualizar = facCita.actualizarEstadoAtendida(id_cita);
            

            if (registro == true && actualizar == true) {

                System.out.println("REGISTRO HC MED y ACTUALIZO ESTADO");
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
