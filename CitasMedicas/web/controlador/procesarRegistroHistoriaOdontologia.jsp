<%-- 
    Document   : procesarRegistroHistoriaOdontologia
    Created on : 27/08/2017, 02:21:14 PM
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeCita"%>
<%@page import="FACADE.FacadeHcOdontologia"%>
<%@page import="DTO.HcOdontologiaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id_cita= Integer.parseInt(request.getParameter(""));
            int id_usuario= Integer.parseInt(request.getParameter(""));
            String b_motivo = request.getParameter("motivo");
            String b_alergias = request.getParameter("alergia");
            String b_hemorragia = request.getParameter("hemorragia");
            String b_radioterapia = request.getParameter("radioterapia");
            String b_hipertension = request.getParameter("hipertension");
            String b_diabetes = request.getParameter("diabetes");
            String b_tratamiento_medico_actual = request.getParameter("trata_med_actual");
            String b_toma_medicamentos = request.getParameter("toma_medicam");
            String b_embarazo = request.getParameter("embarazo");
            String b_hiv = request.getParameter("hiv");
            String b_cirugias = request.getParameter("cirugia");
            String b_exodoncia = request.getParameter("exodoncia");
            String b_hepatitis = request.getParameter("hepatitis");
            String b_patologia_respiratoria = request.getParameter("pato_respi");
            String b_convulsion = request.getParameter("convulsion");
            String b_enfermedades_orales = request.getParameter("enfer_orales");
            String b_enfermedades_gastricas = request.getParameter("enfer_gastrica");
            String b_observacion_anamnesis = request.getParameter("obser_anamnesis");
            String c_labios = request.getParameter("labios");
            String c_lengua = request.getParameter("lengua");
            String c_carrillos = request.getParameter("carrillos");
            String c_pisodeboca = request.getParameter("piso_boca");
            String c_paladar = request.getParameter("paladar");
            String c_frenillos = request.getParameter("frenillos");
            String c_observacion_examenes = request.getParameter("obser_exam");
            String d_protesis = request.getParameter("presen_protesis");
            String d_descripcion_protesis = request.getParameter("descrip");
            String d_higiene_oral = request.getParameter("higiene");
            String d_fr_cepillado = request.getParameter("fr_cepill");
            String d_seda_dental = request.getParameter("seda_dental");
            String e_dolor_muscular = request.getParameter("dolor_muscular");
            String e_dolor_articular = request.getParameter("dolor_articular");
            String e_ruido_articular = request.getParameter("ruido_articular");
            String e_limit_movimiento = request.getParameter("limit_mov");
            String e_obser_atm = request.getParameter("obser_atm");
            String f_control_placa = request.getParameter("placa");
            String g_odontograma = request.getParameter("odontog");
            String h_lectura_rx = request.getParameter("lectura_rx");
            String i_diagnostico = request.getParameter("diagnostico");
            String k_plan_tratamiento = request.getParameter("plan_trata");
            
            
            HcOdontologiaDTO hc = new HcOdontologiaDTO(id_cita, id_usuario, b_motivo, b_alergias, b_hemorragia,
                    b_radioterapia, b_hipertension, b_diabetes, b_tratamiento_medico_actual, b_toma_medicamentos,
                    b_embarazo, b_hiv, b_cirugias, b_exodoncia, b_hepatitis, b_patologia_respiratoria, b_convulsion,
                    b_enfermedades_orales, b_enfermedades_gastricas, b_observacion_anamnesis, c_labios, c_lengua,
                    c_carrillos, c_pisodeboca, c_paladar, c_frenillos, c_observacion_examenes, d_protesis,
                    d_descripcion_protesis, d_higiene_oral, d_fr_cepillado, d_seda_dental, e_dolor_muscular,
                    e_dolor_articular, e_ruido_articular, e_limit_movimiento, e_obser_atm, f_control_placa,
                    g_odontograma, h_lectura_rx, i_diagnostico, k_plan_tratamiento);

            FacadeHcOdontologia facOdon = new FacadeHcOdontologia();

            boolean registro = facOdon.registrarHcOdontologia(hc);

            FacadeCita facCita = new FacadeCita();
            boolean actualizar = facCita.actualizarEstadoAtendida(id_cita);

            if (registro == true && actualizar == true) {

                System.out.println("REGISTRO HC ODONTOLOGIA y ACTUALIZO ESTADO");
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
