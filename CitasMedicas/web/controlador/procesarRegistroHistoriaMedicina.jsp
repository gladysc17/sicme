<%-- 
    Document   : procesarRegistroHistoriaMedicina
    Created on : 04-abr-2017, 22:40:04
    Author     : Gladys M
--%>

<%@page import="DTO.HcMedicinaGeneralDTO"%>
<%@page import="FACADE.FacadeHcMedicinaGeneral"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            int idusuario_hcmed = Integer.parseInt(request.getParameter("ide"));
            System.out.println("idUsuario  " + idusuario_hcmed);
            String motivoconsulta_hcmed = request.getParameter("motivo");
            String enfermedadgeneral_hcmed = request.getParameter("enfermedad");
            String revisionporsistemas_hcmed = request.getParameter("revision");
            String antpatologicos_hcmed = request.getParameter("patologicos");
            String antquirurgicos_hcmed = request.getParameter("quirurgicos");
            String anttraumaticos_hcmed = request.getParameter("traumaticos");
            String anttoxicoAlergicos_hcmed = request.getParameter("toxico");
            String antfarmacologicos_hcmed = request.getParameter("farmacologicos");
            String antvenereos_hcmed = request.getParameter("venereos");
            String antfamiliares_hcmed = request.getParameter("familiares");
            String antginecologicos_hcmed = request.getParameter("ginecologicos");
            String antotros_hcmed = request.getParameter("otro");
            int frecardiaca_hcmed = Integer.parseInt(request.getParameter("frecCardiaca"));
            int frerespiratoria_hcmed = Integer.parseInt(request.getParameter("frecResp"));
            int tensionarterial_hcmed = Integer.parseInt(request.getParameter("tension"));
            int temperatura_hcmed = Integer.parseInt(request.getParameter("temperatura"));
            int peso_hcmed = Integer.parseInt(request.getParameter("peso"));
            int talla_hcmed = Integer.parseInt(request.getParameter("talla"));
            String efestadogeneral_hcmed = request.getParameter("eg");
            String efcabezacuello_hcmed = request.getParameter("cabcuello");
            String efcardiopulmonar_hcmed = request.getParameter("cardiop");
            String efabdomen_hcmed = request.getParameter("abdomen");
            String efgenitourinario_hcmed = request.getParameter("genito");
            String efextremidades_hcmed = request.getParameter("extre");
            String efpielfuneras_hcmed = request.getParameter("piel");
            String efsistemanervioso_hcmed = request.getParameter("sistemanerv");
            String diagnostico1_hcmed = request.getParameter("diag1");
            String tipodiagnostico1_hcmed = request.getParameter("tdiag1");
            String diagnostico2_hcmed = request.getParameter("diag2");
            String tipodiagnostico2_hcmed = request.getParameter("tdiag2");
            String diagnostico3_hcmed = request.getParameter("diag3");
            String tipodiagnostico3_hcmed = request.getParameter("tdiag3");
            String tratamiento_hcmed = request.getParameter("tratamiento");
            String recomendaciones_hcmed = request.getParameter("recomendaciones");
            int idcita_hcmed = Integer.parseInt(request.getParameter("idecita"));

            HcMedicinaGeneralDTO med = new HcMedicinaGeneralDTO(idusuario_hcmed, idcita_hcmed, motivoconsulta_hcmed,
                    enfermedadgeneral_hcmed, revisionporsistemas_hcmed, antpatologicos_hcmed, antquirurgicos_hcmed,
                    anttraumaticos_hcmed, anttoxicoAlergicos_hcmed, antfarmacologicos_hcmed, antvenereos_hcmed,
                    antfamiliares_hcmed, antginecologicos_hcmed, antotros_hcmed, frecardiaca_hcmed, frerespiratoria_hcmed,
                    tensionarterial_hcmed, temperatura_hcmed, peso_hcmed, talla_hcmed, efestadogeneral_hcmed, 
                    efcabezacuello_hcmed, efcardiopulmonar_hcmed, efabdomen_hcmed, efgenitourinario_hcmed, 
                    efextremidades_hcmed, efpielfuneras_hcmed, efsistemanervioso_hcmed, diagnostico1_hcmed, 
                    tipodiagnostico1_hcmed, diagnostico2_hcmed, tipodiagnostico2_hcmed, diagnostico3_hcmed, 
                    tipodiagnostico3_hcmed, tratamiento_hcmed, recomendaciones_hcmed);

            FacadeHcMedicinaGeneral facMedGen = new FacadeHcMedicinaGeneral();

            boolean registro = facMedGen.registrarHCMedicinaGeneral(med);

            if (registro
                    == true) {

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
