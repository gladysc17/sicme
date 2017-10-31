<%-- 
    Document   : procesarRegistroHistoriaOdontologia
    Created on : 27/08/2017, 02:21:14 PM
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeSesionOdontologia"%>
<%@page import="DTO.SesionOdontologiaDTO"%>
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
            String primeraVez = request.getParameter("primeraVez");
            
            if(primeraVez.equals("SI")){
            
                int id_cita= Integer.parseInt(request.getParameter("idCita"));
                int id_usuario= Integer.parseInt(request.getParameter("identificacionU"));
                String tipoCita = request.getParameter("tipo");
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
                String f_control_placa = request.getParameter("controlPlaca");
                String g_odontograma = request.getParameter("odontog");
                String h_lectura_rx = request.getParameter("lectura_rx");
                String i_diagnostico = request.getParameter("diagnostico");
                String k_operatoria = request.getParameter("operatoria");
                String k_cirugia_oral = request.getParameter("cirugia_oral");
                String k_higiene_oral = request.getParameter("higiene_oral");
                String k_endodoncia = request.getParameter("endodoncia");
                String k_md_oral = request.getParameter("md_oral");
                String k_rehab_oral = request.getParameter("rehab_oral");
                String k_periodoncia = request.getParameter("periodoncia");
                String k_ciru_maxi_facial = request.getParameter("ciru_maxi_facial");
                String k_ortodoncia = request.getParameter("ortodoncia");
                                
                HcOdontologiaDTO hc = new HcOdontologiaDTO(id_cita, id_usuario, b_motivo, b_alergias, b_hemorragia,
                        b_radioterapia, b_hipertension, b_diabetes, b_tratamiento_medico_actual, b_toma_medicamentos,
                        b_embarazo, b_hiv, b_cirugias, b_exodoncia, b_hepatitis, b_patologia_respiratoria, b_convulsion,
                        b_enfermedades_orales, b_enfermedades_gastricas, b_observacion_anamnesis, c_labios, c_lengua,
                        c_carrillos, c_pisodeboca, c_paladar, c_frenillos, c_observacion_examenes, d_protesis,
                        d_descripcion_protesis, d_higiene_oral, d_fr_cepillado, d_seda_dental, e_dolor_muscular,
                        e_dolor_articular, e_ruido_articular, e_limit_movimiento, e_obser_atm, f_control_placa,
                        g_odontograma, h_lectura_rx, i_diagnostico, k_operatoria, k_cirugia_oral, k_higiene_oral, 
                        k_endodoncia, k_md_oral, k_rehab_oral, k_periodoncia, k_ciru_maxi_facial, k_ortodoncia);

                System.out.println("control pla -> "+f_control_placa);
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
            } else {
                //Haga esto
                String motivo = request.getParameter("motivo");
                String diagnostico = request.getParameter("diagnostico");
                String controlPlaca = request.getParameter("controlPlaca");
                String odontograma = request.getParameter("odontog"); //Por ahora se comenta
                int idCita = Integer.parseInt(request.getParameter("idCita"));
                int idHcOdontologia = Integer.parseInt(request.getParameter("id_hc_odontologia"));

                SesionOdontologiaDTO sesionOdontologia = new SesionOdontologiaDTO(idCita, idHcOdontologia, diagnostico,
                            motivo, controlPlaca, odontograma);

                boolean registro = new FacadeSesionOdontologia().registrarSesionOdontologia(sesionOdontologia);

                FacadeCita facCita = new FacadeCita();
                boolean actualizar = facCita.actualizarEstadoAtendida(idCita);

                boolean actualizarPlacaOdontograma = new FacadeHcOdontologia().actualizarControlPlacaOdontograma(idHcOdontologia, controlPlaca, odontograma);

                if (registro == true && actualizar == true && actualizarPlacaOdontograma) {

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

            }
        %>
    </body>
</html>
