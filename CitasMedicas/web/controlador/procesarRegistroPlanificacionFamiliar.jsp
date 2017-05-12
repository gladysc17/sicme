<%-- 
    Document   : procesarRegistroPlanificacionFamiliar
    Created on : 16/04/2017, 03:10:12 PM
    Author     : LEGADO
--%>

<%@page import="DTO.Hc_planificacionfamiliarDTO"%>
<%@page import="FACADE.FacadePlanificacionFamiliar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String tipo_vinculacion = request.getParameter("tipo_vinculacion").toString();
            String aseguradora = request.getParameter("aseguradora").toString();
            String nombre_resp = request.getParameter("nombre_resp").toString();
            String parentesco = request.getParameter("parentesco").toString();
            String telefono_resp = request.getParameter("telefono_resp").toString();
            String direccion_resp = request.getParameter("direccion_resp").toString();
            String motivo = request.getParameter("motivo").toString();
            String enfermedad = request.getParameter("enfermedad").toString();
            String[] revSis = request.getParameterValues("revision_sistemas");
            String revision = request.getParameter("revision").toString();
            String ant_pato = request.getParameter("ant_pato").toString();
            String ant_quiru = request.getParameter("ant_quiru").toString();
            String ant_hosp = request.getParameter("ant_hosp").toString();
            String ant_toxic = request.getParameter("ant_toxic").toString();
            String ant_farm = request.getParameter("ant_farm").toString();
            String ant_fami = request.getParameter("ant_fami").toString();
            String menarca = request.getParameter("menarca").toString();
            String ciclo = request.getParameter("ciclo").toString();
            String menopausia = request.getParameter("menopausia").toString();
            String estG = request.getParameter("estG").toString();
            String estF = request.getParameter("estF").toString();
            String estC = request.getParameter("estC").toString();
            String estA = request.getParameter("estA").toString();
            String estV = request.getParameter("estV").toString();
            String estM = request.getParameter("estM").toString();
            String ult_menst = request.getParameter("ult_menst").toString();
            String ult_parto = request.getParameter("ult_parto").toString();
            String ccv = request.getParameter("ccv").toString();
            String resulccv = request.getParameter("resulccv").toString();
            String planif = request.getParameter("planif").toString();
            String metodo = request.getParameter("metodo").toString();

            int idusuario_hcmed = Integer.parseInt(request.getParameter("ide"));
            int id_cita = Integer.parseInt(request.getParameter("idecita"));

            String estados = estG + "-" + estF + "-" + estC + "-" + estA + "-" + estV + "-" + estM;

            String revision_sistemas = "";
            for (int i = 0; i < revSis.length; i++) {
                if (revSis[i].equalsIgnoreCase("Otro")) {
                    revision_sistemas += revision;
                    break;
                }
                revision_sistemas += revSis[i].toString();
            }

            String antecedentes = ant_pato + "-" + ant_quiru + "-" + ant_hosp + "-" + ant_toxic + "-" + ant_farm + "-" + ant_fami;

            FacadePlanificacionFamiliar fpf = new FacadePlanificacionFamiliar();

            Hc_planificacionfamiliarDTO plan = new Hc_planificacionfamiliarDTO(tipo_vinculacion, aseguradora, nombre_resp, parentesco, direccion_resp, telefono_resp, motivo, enfermedad, menarca, ciclo, menopausia, estados, ult_menst, ult_parto, ccv, resulccv, planif, metodo, id_cita, revision_sistemas, antecedentes, idusuario_hcmed);

            boolean rta = fpf.registrarHCplanfamil(plan);

            if (rta) {
        %>
        <script>
            alert("REGISTRO EXITOSO");
            location.href = "../jsp/PrincipalMedico.jsp";
        </script>
        <%
            } else{
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
