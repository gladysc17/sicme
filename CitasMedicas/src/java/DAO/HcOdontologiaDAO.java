/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HcOdontologiaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
        ps.setString(4, od.getB_alergias());
        ps.setString(5, od.getB_hemorragia());
        ps.setString(6, od.getB_radioterapia());
        ps.setString(7, od.getB_hipertension());
        ps.setString(8, od.getB_diabetes());
        ps.setString(9, od.getB_tratamiento_medico_actual());
        ps.setString(10, od.getB_toma_medicamentos());
        ps.setString(11, od.getB_embarazo());
        ps.setString(12, od.getB_hiv());
        ps.setString(13, od.getB_cirugias());
        ps.setString(14, od.getB_exodoncia());
        ps.setString(15, od.getB_hepatitis());
        ps.setString(16, od.getB_patologia_respiratoria());
        ps.setString(17, od.getB_convulsion());
        ps.setString(18, od.getB_enfermedades_orales());
        ps.setString(19, od.getB_enfermedades_gastricas());
        ps.setString(20, od.getB_observacion_anamnesis());
        ps.setString(21, od.getC_labios());
        ps.setString(22, od.getC_lengua());
        ps.setString(23, od.getC_carrillos());
        ps.setString(24, od.getC_pisodeboca());
        ps.setString(25, od.getC_paladar());
        ps.setString(26, od.getC_frenillos());
        ps.setString(27, od.getC_observacion_examenes());
        ps.setString(28, od.getD_protesis());
        ps.setString(29, od.getD_descripcion_protesis());
        ps.setString(30, od.getD_higiene_oral());
        ps.setString(31, od.getD_fr_cepillado());
        ps.setString(32, od.getD_seda_dental());
        ps.setString(33, od.getE_dolor_muscular());
        ps.setString(34, od.getE_dolor_articular());
        ps.setString(35, od.getE_ruido_articular());
        ps.setString(36, od.getE_limit_movimiento());
        ps.setString(37, od.getE_obser_atm());
        ps.setString(38, od.getF_control_placa());
        ps.setString(39, od.getG_odontograma());
        ps.setString(40, od.getH_lectura_rx());
        ps.setString(41, od.getI_diagnostico());
        ps.setString(42, od.getK_plan_tratamiento());

        int res = ps.executeUpdate();

        return res == 1;

    }

    public List<HcOdontologiaDTO> consultarHcOdontologia(int id_usuario) throws SQLException {

        List<HcOdontologiaDTO> listaHisC = new ArrayList<HcOdontologiaDTO>();

        String sql = "SELECT * FROM hc_odontologia WHERE id_usuario = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_usuario);

        ResultSet rs = ps.executeQuery();

        HcOdontologiaDTO hcOd = null;

        while (rs.next()) {
            hcOd = new HcOdontologiaDTO();

            hcOd.setId_cita(rs.getInt("id_cita"));
            hcOd.setId_usuario(rs.getInt("id_usuario"));
            hcOd.setB_motivo(rs.getString("b_motivo"));
            hcOd.setB_motivo(rs.getString("b_alergias"));
            hcOd.setB_motivo(rs.getString("b_hemorragia"));
            hcOd.setB_motivo(rs.getString("b_radioterapia"));
            hcOd.setB_motivo(rs.getString("b_hipertension"));
            hcOd.setB_motivo(rs.getString("b_diabetes"));
            hcOd.setB_motivo(rs.getString("b_tratamiento_medico_actual"));
            hcOd.setB_motivo(rs.getString("b_toma_medicamentos"));
            hcOd.setB_motivo(rs.getString("b_embarazo"));
            hcOd.setB_motivo(rs.getString("b_hiv"));
            hcOd.setB_motivo(rs.getString("b_cirugias"));
            hcOd.setB_motivo(rs.getString("b_exodoncia"));
            hcOd.setB_motivo(rs.getString("b_hepatitis"));
            hcOd.setB_motivo(rs.getString("b_patologia_respiratoria"));
            hcOd.setB_motivo(rs.getString("b_convulsion"));
            hcOd.setB_motivo(rs.getString("b_enfermedades_orales"));
            hcOd.setB_motivo(rs.getString("b_enfermedades_gastricas"));
            hcOd.setB_motivo(rs.getString("b_observacion_anamnesis"));
            hcOd.setB_motivo(rs.getString("c_labios"));
            hcOd.setB_motivo(rs.getString("c_lengua"));
            hcOd.setB_motivo(rs.getString("c_carrillos"));
            hcOd.setB_motivo(rs.getString("c_pisodeboca"));
            hcOd.setB_motivo(rs.getString("c_paladar"));
            hcOd.setB_motivo(rs.getString("c_frenillos"));
            hcOd.setB_motivo(rs.getString("c_observacion_examenes"));
            hcOd.setB_motivo(rs.getString("d_protesis"));
            hcOd.setB_motivo(rs.getString("d_descripcion_protesis"));
            hcOd.setB_motivo(rs.getString("d_higiene_oral"));
            hcOd.setB_motivo(rs.getString("d_fr_cepillado"));
            hcOd.setB_motivo(rs.getString("d_seda_dental"));
            hcOd.setB_motivo(rs.getString("e_dolor_muscular"));
            hcOd.setB_motivo(rs.getString("e_dolor_articular"));
            hcOd.setB_motivo(rs.getString("e_ruido_articular"));
            hcOd.setB_motivo(rs.getString("e_limit_movimiento"));
            hcOd.setB_motivo(rs.getString("e_obser_atm"));
            hcOd.setB_motivo(rs.getString("f_control_placa"));
            hcOd.setB_motivo(rs.getString("g_odontograma"));
            hcOd.setB_motivo(rs.getString("h_lectura_rx"));
            hcOd.setB_motivo(rs.getString("i_diagnostico"));
            hcOd.setB_motivo(rs.getString("k_plan_tratamiento"));
            
            listaHisC.add(hcOd);
        }

        return listaHisC;

        }

    }
