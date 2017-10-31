/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Gladys M
 */
public class HcOdontologiaDTO {
    
    public int id_hcodontologia;
    public int id_cita;
    public int id_usuario;
    public String b_motivo;
    public String b_alergias;
    public String b_hemorragia;
    public String b_radioterapia;
    public String b_hipertension;
    public String b_diabetes;
    public String b_tratamiento_medico_actual;
    public String b_toma_medicamentos;
    public String b_embarazo;
    public String b_hiv;
    public String b_cirugias;
    public String b_exodoncia;
    public String b_hepatitis;
    public String b_patologia_respiratoria;
    public String b_convulsion;
    public String b_enfermedades_orales;
    public String b_enfermedades_gastricas;
    public String b_observacion_anamnesis;
    public String c_labios;
    public String c_lengua;
    public String c_carrillos;
    public String c_pisodeboca;
    public String c_paladar;
    public String c_frenillos;
    public String c_observacion_examenes;
    public String d_protesis;
    public String d_descripcion_protesis;
    public String d_higiene_oral;
    public String d_fr_cepillado;
    public String d_seda_dental;
    public String e_dolor_muscular;
    public String e_dolor_articular;
    public String e_ruido_articular;
    public String e_limit_movimiento;
    public String e_obser_atm;
    public String f_control_placa;
    public String g_odontograma;
    public String h_lectura_rx;
    public String i_diagnostico;
    private String k_operatoria;
    private String k_cirugia_oral;
    private String k_higiene_oral;
    private String k_endodoncia;
    private String k_md_oral;
    private String k_rehab_oral;
    private String k_periodoncia;
    private String k_ciru_maxi_facial;
    private String k_ortodoncia;
    

    public HcOdontologiaDTO() {
    }
    
    public HcOdontologiaDTO(int id_cita, int id_usuario, String b_motivo, String b_alergias, String b_hemorragia, String b_radioterapia, String b_hipertension, String b_diabetes, String b_tratamiento_medico_actual, String b_toma_medicamentos, String b_embarazo, String b_hiv, String b_cirugias, String b_exodoncia, String b_hepatitis, String b_patologia_respiratoria, String b_convulsion, String b_enfermedades_orales, String b_enfermedades_gastricas, String b_observacion_anamnesis, String c_labios, String c_lengua, String c_carrillos, String c_pisodeboca, String c_paladar, String c_frenillos, String c_observacion_examenes, String d_protesis, String d_descripcion_protesis, String d_higiene_oral, String d_fr_cepillado, String d_seda_dental, String e_dolor_muscular, String e_dolor_articular, String e_ruido_articular, String e_limit_movimiento, String e_obser_atm, String f_control_placa, String g_odontograma, String h_lectura_rx, String i_diagnostico, String k_operatoria, String k_cirugia_oral, String k_higiene_oral, String k_endodoncia, String k_md_oral, String k_rehab_oral, String k_periodoncia, String k_ciru_maxi_facial, String k_ortodoncia) {

        this.id_cita = id_cita;
        this.id_usuario = id_usuario;
        this.b_motivo = b_motivo;
        this.b_alergias = b_alergias;
        this.b_hemorragia = b_hemorragia;
        this.b_radioterapia = b_radioterapia;
        this.b_hipertension = b_hipertension;
        this.b_diabetes = b_diabetes;
        this.b_tratamiento_medico_actual = b_tratamiento_medico_actual;
        this.b_toma_medicamentos = b_toma_medicamentos;
        this.b_embarazo = b_embarazo;
        this.b_hiv = b_hiv;
        this.b_cirugias = b_cirugias;
        this.b_exodoncia = b_exodoncia;
        this.b_hepatitis = b_hepatitis;
        this.b_patologia_respiratoria = b_patologia_respiratoria;
        this.b_convulsion = b_convulsion;
        this.b_enfermedades_orales = b_enfermedades_orales;
        this.b_enfermedades_gastricas = b_enfermedades_gastricas;
        this.b_observacion_anamnesis = b_observacion_anamnesis;
        this.c_labios = c_labios;
        this.c_lengua = c_lengua;
        this.c_carrillos = c_carrillos;
        this.c_pisodeboca = c_pisodeboca;
        this.c_paladar = c_paladar;
        this.c_frenillos = c_frenillos;
        this.c_observacion_examenes = c_observacion_examenes;
        this.d_protesis = d_protesis;
        this.d_descripcion_protesis = d_descripcion_protesis;
        this.d_higiene_oral = d_higiene_oral;
        this.d_fr_cepillado = d_fr_cepillado;
        this.d_seda_dental = d_seda_dental;
        this.e_dolor_muscular = e_dolor_muscular;
        this.e_dolor_articular = e_dolor_articular;
        this.e_ruido_articular = e_ruido_articular;
        this.e_limit_movimiento = e_limit_movimiento;
        this.e_obser_atm = e_obser_atm;
        this.f_control_placa = f_control_placa;
        this.g_odontograma = g_odontograma;
        this.h_lectura_rx = h_lectura_rx;
        this.i_diagnostico = i_diagnostico;
        this.k_operatoria = k_operatoria;
        this.k_cirugia_oral = k_cirugia_oral;
        this.k_higiene_oral = k_higiene_oral;
        this.k_endodoncia = k_endodoncia;
        this.k_md_oral = k_md_oral;
        this.k_rehab_oral = k_rehab_oral;
        this.k_periodoncia = k_periodoncia;
        this.k_ciru_maxi_facial = k_ciru_maxi_facial;
        this.k_ortodoncia = k_ortodoncia;
    }

    public HcOdontologiaDTO(int id_hcodontologia, int id_cita, int id_usuario, String b_motivo, String b_alergias, String b_hemorragia, String b_radioterapia, String b_hipertension, String b_diabetes, String b_tratamiento_medico_actual, String b_toma_medicamentos, String b_embarazo, String b_hiv, String b_cirugias, String b_exodoncia, String b_hepatitis, String b_patologia_respiratoria, String b_convulsion, String b_enfermedades_orales, String b_enfermedades_gastricas, String b_observacion_anamnesis, String c_labios, String c_lengua, String c_carrillos, String c_pisodeboca, String c_paladar, String c_frenillos, String c_observacion_examenes, String d_protesis, String d_descripcion_protesis, String d_higiene_oral, String d_fr_cepillado, String d_seda_dental, String e_dolor_muscular, String e_dolor_articular, String e_ruido_articular, String e_limit_movimiento, String e_obser_atm, String f_control_placa, String g_odontograma, String h_lectura_rx, String i_diagnostico, String k_operatoria, String k_cirugia_oral, String k_higiene_oral, String k_endodoncia, String k_md_oral, String k_rehab_oral, String k_periodoncia, String k_ciru_maxi_facial, String k_ortodoncia) {
        this.id_hcodontologia = id_hcodontologia;
        this.id_cita = id_cita;
        this.id_usuario = id_usuario;
        this.b_motivo = b_motivo;
        this.b_alergias = b_alergias;
        this.b_hemorragia = b_hemorragia;
        this.b_radioterapia = b_radioterapia;
        this.b_hipertension = b_hipertension;
        this.b_diabetes = b_diabetes;
        this.b_tratamiento_medico_actual = b_tratamiento_medico_actual;
        this.b_toma_medicamentos = b_toma_medicamentos;
        this.b_embarazo = b_embarazo;
        this.b_hiv = b_hiv;
        this.b_cirugias = b_cirugias;
        this.b_exodoncia = b_exodoncia;
        this.b_hepatitis = b_hepatitis;
        this.b_patologia_respiratoria = b_patologia_respiratoria;
        this.b_convulsion = b_convulsion;
        this.b_enfermedades_orales = b_enfermedades_orales;
        this.b_enfermedades_gastricas = b_enfermedades_gastricas;
        this.b_observacion_anamnesis = b_observacion_anamnesis;
        this.c_labios = c_labios;
        this.c_lengua = c_lengua;
        this.c_carrillos = c_carrillos;
        this.c_pisodeboca = c_pisodeboca;
        this.c_paladar = c_paladar;
        this.c_frenillos = c_frenillos;
        this.c_observacion_examenes = c_observacion_examenes;
        this.d_protesis = d_protesis;
        this.d_descripcion_protesis = d_descripcion_protesis;
        this.d_higiene_oral = d_higiene_oral;
        this.d_fr_cepillado = d_fr_cepillado;
        this.d_seda_dental = d_seda_dental;
        this.e_dolor_muscular = e_dolor_muscular;
        this.e_dolor_articular = e_dolor_articular;
        this.e_ruido_articular = e_ruido_articular;
        this.e_limit_movimiento = e_limit_movimiento;
        this.e_obser_atm = e_obser_atm;
        this.f_control_placa = f_control_placa;
        this.g_odontograma = g_odontograma;
        this.h_lectura_rx = h_lectura_rx;
        this.i_diagnostico = i_diagnostico;
        this.k_operatoria = k_operatoria;
        this.k_cirugia_oral = k_cirugia_oral;
        this.k_higiene_oral = k_higiene_oral;
        this.k_endodoncia = k_endodoncia;
        this.k_md_oral = k_md_oral;
        this.k_rehab_oral = k_rehab_oral;
        this.k_periodoncia = k_periodoncia;
        this.k_ciru_maxi_facial = k_ciru_maxi_facial;
        this.k_ortodoncia = k_ortodoncia;
    }

    public int getId_hcodontologia() {
        return id_hcodontologia;
    }

    public void setId_hcodontologia(int id_hcodontologia) {
        this.id_hcodontologia = id_hcodontologia;
    }

    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getB_motivo() {
        return b_motivo;
    }

    public void setB_motivo(String b_motivo) {
        this.b_motivo = b_motivo;
    }

    public String getB_alergias() {
        return b_alergias;
    }

    public void setB_alergias(String b_alergias) {
        this.b_alergias = b_alergias;
    }

    public String getB_hemorragia() {
        return b_hemorragia;
    }

    public void setB_hemorragia(String b_hemorragia) {
        this.b_hemorragia = b_hemorragia;
    }

    public String getB_radioterapia() {
        return b_radioterapia;
    }

    public void setB_radioterapia(String b_radioterapia) {
        this.b_radioterapia = b_radioterapia;
    }

    public String getB_hipertension() {
        return b_hipertension;
    }

    public void setB_hipertension(String b_hipertension) {
        this.b_hipertension = b_hipertension;
    }

    public String getB_diabetes() {
        return b_diabetes;
    }

    public void setB_diabetes(String b_diabetes) {
        this.b_diabetes = b_diabetes;
    }

    public String getB_tratamiento_medico_actual() {
        return b_tratamiento_medico_actual;
    }

    public void setB_tratamiento_medico_actual(String b_tratamiento_medico_actual) {
        this.b_tratamiento_medico_actual = b_tratamiento_medico_actual;
    }

    public String getB_toma_medicamentos() {
        return b_toma_medicamentos;
    }

    public void setB_toma_medicamentos(String b_toma_medicamentos) {
        this.b_toma_medicamentos = b_toma_medicamentos;
    }

    public String getB_embarazo() {
        return b_embarazo;
    }

    public void setB_embarazo(String b_embarazo) {
        this.b_embarazo = b_embarazo;
    }

    public String getB_hiv() {
        return b_hiv;
    }

    public void setB_hiv(String b_hiv) {
        this.b_hiv = b_hiv;
    }

    public String getB_cirugias() {
        return b_cirugias;
    }

    public void setB_cirugias(String b_cirugias) {
        this.b_cirugias = b_cirugias;
    }

    public String getB_exodoncia() {
        return b_exodoncia;
    }

    public void setB_exodoncia(String b_exodoncia) {
        this.b_exodoncia = b_exodoncia;
    }

    public String getB_hepatitis() {
        return b_hepatitis;
    }

    public void setB_hepatitis(String b_hepatitis) {
        this.b_hepatitis = b_hepatitis;
    }

    public String getB_patologia_respiratoria() {
        return b_patologia_respiratoria;
    }

    public void setB_patologia_respiratoria(String b_patologia_respiratoria) {
        this.b_patologia_respiratoria = b_patologia_respiratoria;
    }

    public String getB_convulsion() {
        return b_convulsion;
    }

    public void setB_convulsion(String b_convulsion) {
        this.b_convulsion = b_convulsion;
    }

    public String getB_enfermedades_orales() {
        return b_enfermedades_orales;
    }

    public void setB_enfermedades_orales(String b_enfermedades_orales) {
        this.b_enfermedades_orales = b_enfermedades_orales;
    }

    public String getB_enfermedades_gastricas() {
        return b_enfermedades_gastricas;
    }

    public void setB_enfermedades_gastricas(String b_enfermedades_gastricas) {
        this.b_enfermedades_gastricas = b_enfermedades_gastricas;
    }

    public String getB_observacion_anamnesis() {
        return b_observacion_anamnesis;
    }

    public void setB_observacion_anamnesis(String b_observacion_anamnesis) {
        this.b_observacion_anamnesis = b_observacion_anamnesis;
    }

    public String getC_labios() {
        return c_labios;
    }

    public void setC_labios(String c_labios) {
        this.c_labios = c_labios;
    }

    public String getC_lengua() {
        return c_lengua;
    }

    public void setC_lengua(String c_lengua) {
        this.c_lengua = c_lengua;
    }

    public String getC_carrillos() {
        return c_carrillos;
    }

    public void setC_carrillos(String c_carrillos) {
        this.c_carrillos = c_carrillos;
    }

    public String getC_pisodeboca() {
        return c_pisodeboca;
    }

    public void setC_pisodeboca(String c_pisodeboca) {
        this.c_pisodeboca = c_pisodeboca;
    }

    public String getC_paladar() {
        return c_paladar;
    }

    public void setC_paladar(String c_paladar) {
        this.c_paladar = c_paladar;
    }

    public String getC_frenillos() {
        return c_frenillos;
    }

    public void setC_frenillos(String c_frenillos) {
        this.c_frenillos = c_frenillos;
    }

    public String getC_observacion_examenes() {
        return c_observacion_examenes;
    }

    public void setC_observacion_examenes(String c_observacion_examenes) {
        this.c_observacion_examenes = c_observacion_examenes;
    }

    public String getD_protesis() {
        return d_protesis;
    }

    public void setD_protesis(String d_protesis) {
        this.d_protesis = d_protesis;
    }

    public String getD_descripcion_protesis() {
        return d_descripcion_protesis;
    }

    public void setD_descripcion_protesis(String d_descripcion_protesis) {
        this.d_descripcion_protesis = d_descripcion_protesis;
    }

    public String getD_higiene_oral() {
        return d_higiene_oral;
    }

    public void setD_higiene_oral(String d_higiene_oral) {
        this.d_higiene_oral = d_higiene_oral;
    }

    public String getD_fr_cepillado() {
        return d_fr_cepillado;
    }

    public void setD_fr_cepillado(String d_fr_cepillado) {
        this.d_fr_cepillado = d_fr_cepillado;
    }

    public String getD_seda_dental() {
        return d_seda_dental;
    }

    public void setD_seda_dental(String d_seda_dental) {
        this.d_seda_dental = d_seda_dental;
    }

    public String getE_dolor_muscular() {
        return e_dolor_muscular;
    }

    public void setE_dolor_muscular(String e_dolor_muscular) {
        this.e_dolor_muscular = e_dolor_muscular;
    }

    public String getE_dolor_articular() {
        return e_dolor_articular;
    }

    public void setE_dolor_articular(String e_dolor_articular) {
        this.e_dolor_articular = e_dolor_articular;
    }

    public String getE_ruido_articular() {
        return e_ruido_articular;
    }

    public void setE_ruido_articular(String e_ruido_articular) {
        this.e_ruido_articular = e_ruido_articular;
    }

    public String getE_limit_movimiento() {
        return e_limit_movimiento;
    }

    public void setE_limit_movimiento(String e_limit_movimiento) {
        this.e_limit_movimiento = e_limit_movimiento;
    }

    public String getE_obser_atm() {
        return e_obser_atm;
    }

    public void setE_obser_atm(String e_obser_atm) {
        this.e_obser_atm = e_obser_atm;
    }

    public String getF_control_placa() {
        return f_control_placa;
    }

    public void setF_control_placa(String f_control_placa) {
        this.f_control_placa = f_control_placa;
    }

    public String getG_odontograma() {
        return g_odontograma;
    }

    public void setG_odontograma(String g_odontograma) {
        this.g_odontograma = g_odontograma;
    }

    public String getH_lectura_rx() {
        return h_lectura_rx;
    }

    public void setH_lectura_rx(String h_lectura_rx) {
        this.h_lectura_rx = h_lectura_rx;
    }

    public String getI_diagnostico() {
        return i_diagnostico;
    }

    public void setI_diagnostico(String i_diagnostico) {
        this.i_diagnostico = i_diagnostico;
    }
    
    

    @Override
    public String toString() {
        return "HcOdontologiaDTO{" + "id_hcodontologia=" + id_hcodontologia + ", id_cita=" + id_cita + ", id_usuario=" + id_usuario + ", b_motivo=" + b_motivo + ", b_alergias=" + b_alergias + ", b_hemorragia=" + b_hemorragia + ", b_radioterapia=" + b_radioterapia + ", b_hipertension=" + b_hipertension + ", b_diabetes=" + b_diabetes + ", b_tratamiento_medico_actual=" + b_tratamiento_medico_actual + ", b_toma_medicamentos=" + b_toma_medicamentos + ", b_embarazo=" + b_embarazo + ", b_hiv=" + b_hiv + ", b_cirugias=" + b_cirugias + ", b_exodoncia=" + b_exodoncia + ", b_hepatitis=" + b_hepatitis + ", b_patologia_respiratoria=" + b_patologia_respiratoria + ", b_convulsion=" + b_convulsion + ", b_enfermedades_orales=" + b_enfermedades_orales + ", b_enfermedades_gastricas=" + b_enfermedades_gastricas + ", b_observacion_anamnesis=" + b_observacion_anamnesis + ", c_labios=" + c_labios + ", c_lengua=" + c_lengua + ", c_carrillos=" + c_carrillos + ", c_pisodeboca=" + c_pisodeboca + ", c_paladar=" + c_paladar + ", c_frenillos=" + c_frenillos + ", c_observacion_examenes=" + c_observacion_examenes + ", d_protesis=" + d_protesis + ", d_descripcion_protesis=" + d_descripcion_protesis + ", d_higiene_oral=" + d_higiene_oral + ", d_fr_cepillado=" + d_fr_cepillado + ", d_seda_dental=" + d_seda_dental + ", e_dolor_muscular=" + e_dolor_muscular + ", e_dolor_articular=" + e_dolor_articular + ", e_ruido_articular=" + e_ruido_articular + ", e_limit_movimiento=" + e_limit_movimiento + ", e_obser_atm=" + e_obser_atm + ", f_control_placa=" + f_control_placa + ", g_odontograma=" + g_odontograma + ", h_lectura_rx=" + h_lectura_rx + ", i_diagnostico=" + i_diagnostico + ", k_operatoria=" + getK_operatoria() + ", k_cirugia_oral=" + getK_cirugia_oral() + ", k_higiene_oral=" + getK_higiene_oral() + ", k_endodoncia=" + getK_endodoncia() + ", k_md_oral=" + getK_md_oral() + ", k_rehab_oral=" + getK_rehab_oral() + ", k_periodoncia=" + getK_periodoncia() + ", k_ciru_maxi_facial=" + getK_ciru_maxi_facial() + ", k_ortodoncia=" + getK_ortodoncia() + '}';
    }

    /**
     * @return the k_operatoria
     */
    public String getK_operatoria() {
        return k_operatoria;
    }

    /**
     * @param k_operatoria the k_operatoria to set
     */
    public void setK_operatoria(String k_operatoria) {
        this.k_operatoria = k_operatoria;
    }

    /**
     * @return the k_cirugia_oral
     */
    public String getK_cirugia_oral() {
        return k_cirugia_oral;
    }

    /**
     * @param k_cirugia_oral the k_cirugia_oral to set
     */
    public void setK_cirugia_oral(String k_cirugia_oral) {
        this.k_cirugia_oral = k_cirugia_oral;
    }

    /**
     * @return the k_higiene_oral
     */
    public String getK_higiene_oral() {
        return k_higiene_oral;
    }

    /**
     * @param k_higiene_oral the k_higiene_oral to set
     */
    public void setK_higiene_oral(String k_higiene_oral) {
        this.k_higiene_oral = k_higiene_oral;
    }

    /**
     * @return the k_endodoncia
     */
    public String getK_endodoncia() {
        return k_endodoncia;
    }

    /**
     * @param k_endodoncia the k_endodoncia to set
     */
    public void setK_endodoncia(String k_endodoncia) {
        this.k_endodoncia = k_endodoncia;
    }

    /**
     * @return the k_md_oral
     */
    public String getK_md_oral() {
        return k_md_oral;
    }

    /**
     * @param k_md_oral the k_md_oral to set
     */
    public void setK_md_oral(String k_md_oral) {
        this.k_md_oral = k_md_oral;
    }

    /**
     * @return the k_rehab_oral
     */
    public String getK_rehab_oral() {
        return k_rehab_oral;
    }

    /**
     * @param k_rehab_oral the k_rehab_oral to set
     */
    public void setK_rehab_oral(String k_rehab_oral) {
        this.k_rehab_oral = k_rehab_oral;
    }

    /**
     * @return the k_periodoncia
     */
    public String getK_periodoncia() {
        return k_periodoncia;
    }

    /**
     * @param k_periodoncia the k_periodoncia to set
     */
    public void setK_periodoncia(String k_periodoncia) {
        this.k_periodoncia = k_periodoncia;
    }

    /**
     * @return the k_ciru_maxi_facial
     */
    public String getK_ciru_maxi_facial() {
        return k_ciru_maxi_facial;
    }

    /**
     * @param k_ciru_maxi_facial the k_ciru_maxi_facial to set
     */
    public void setK_ciru_maxi_facial(String k_ciru_maxi_facial) {
        this.k_ciru_maxi_facial = k_ciru_maxi_facial;
    }

    /**
     * @return the k_ortodoncia
     */
    public String getK_ortodoncia() {
        return k_ortodoncia;
    }

    /**
     * @param k_ortodoncia the k_ortodoncia to set
     */
    public void setK_ortodoncia(String k_ortodoncia) {
        this.k_ortodoncia = k_ortodoncia;
    }    
    
}
