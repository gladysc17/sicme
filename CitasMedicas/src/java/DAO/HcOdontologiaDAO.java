/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HcOdontologiaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class HcOdontologiaDAO {

    private Connection con;

    public HcOdontologiaDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarHcOdontologia(HcOdontologiaDTO od) throws SQLException {

        String sql = "INSERT into hc_odontologia ( id_cita, id_usuario, "
                + "b_motivo, b_alergias, b_hemorragia, b_radioterapia, b_hipertension, b_diabetes, b_tratamiento_medico_actual, "
                + "b_toma_medicamentos, b_embarazo, b_hiv, b_cirugias, b_exodoncia, b_hepatitis, b_patologia_respiratoria, "
                + "b_convulsion, b_enfermedades_orales, b_enfermedades_gastricas, b_observacion_anamnesis, "
                + "c_labios, c_lengua, c_carrillos, c_pisodeboca, c_paladar, c_frenillos, c_observacion_examenes, "
                + "d_protesis, d_descripcion_protesis, d_higiene_oral, d_fr_cepillado, d_seda_dental, "
                + "e_dolor_muscular, e_dolor_articular, e_ruido_articular, e_limit_movimiento, e_obser_atm, "
                + "f_control_placa, g_odontograma, h_lectura_rx, i_diagnostico, k_plan_tratamiento,) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, od.getId_cita());
        ps.setInt(2, od.getId_usuario());        
        ps.setString(3, od.getB_motivo());
        ps.setString(3, od.getB_alergias());
        ps.setString(3, od.getB_hemorragia());
        ps.setString(3, od.getB_radioterapia());
        ps.setString(3, od.getB_hipertension());
        ps.setString(3, od.getB_diabetes());
        ps.setString(3, od.getB_tratamiento_medico_actual());
        ps.setString(3, od.getB_toma_medicamentos());
        ps.setString(3, od.getB_embarazo());
        ps.setString(3, od.getB_hiv());
        ps.setString(3, od.getB_cirugias());
        ps.setString(3, od.getB_exodoncia());
        ps.setString(3, od.getB_hepatitis());
        ps.setString(3, od.getB_patologia_respiratoria());
        ps.setString(3, od.getB_convulsion());
        ps.setString(3, od.getB_enfermedades_orales());
        ps.setString(3, od.getB_enfermedades_gastricas());
        ps.setString(3, od.getB_observacion_anamnesis());
        ps.setString(3, od.getC_labios());
        ps.setString(3, od.getC_lengua());
        ps.setString(3, od.getC_carrillos());
        ps.setString(3, od.getC_pisodeboca());
        ps.setString(3, od.getC_paladar());
        ps.setString(3, od.getC_frenillos());
        ps.setString(3, od.getC_observacion_examenes());
        ps.setString(3, od.getD_protesis());
        ps.setString(3, od.getD_descripcion_protesis());
        ps.setString(3, od.getD_higiene_oral());
        ps.setString(3, od.getD_fr_cepillado());
        ps.setString(3, od.getD_seda_dental());
        ps.setString(3, od.getE_dolor_muscular());
        ps.setString(3, od.getE_dolor_articular());
        ps.setString(3, od.getE_ruido_articular());
        ps.setString(3, od.getE_limit_movimiento());
        ps.setString(3, od.getE_obser_atm());
        ps.setString(3, od.getF_control_placa());
        ps.setString(3, od.getG_odontograma());
        ps.setString(3, od.getH_lectura_rx());
        ps.setString(3, od.getI_diagnostico());
        ps.setString(3, od.getK_plan_tratamiento());
        
        int res = ps.executeUpdate();
        
        return res==1;

    }
    

}
