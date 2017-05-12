/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HcPsicologiaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class HcPsicologiaDAO {

    private Connection con;

    public HcPsicologiaDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarHcPsicologia(HcPsicologiaDTO hcpsico) throws SQLException {

        String sql = "INSERT INTO hc_psicologia (idusuario_hcpsico, motivoconsulta_hcpsico, genograma_hcpsico, "
                + "historiafamiliar_hcpsico, problematicaactual_hcpsico, diagnostico_hcpsico, "
                + "procesopsicoterapeutico_hcpsico, seguimiento_hcpsico, idcita_hcpsico) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, hcpsico.getIdusuario_hcpsico());
        ps.setString(2, hcpsico.getMotivoconsulta_hcpsico());
        ps.setString(3, hcpsico.getGenograma_hcpsico());
        ps.setString(4, hcpsico.getHistoriafamiliar_hcpsico());
        ps.setString(5, hcpsico.getProblematicaactual_hcpsico());
        ps.setString(6, hcpsico.getDiagnostico_hcpsico());
        ps.setString(7, hcpsico.getProcesopsicoterapeutico_hcpsico());
        ps.setString(8, hcpsico.getSeguimiento_hcpsico());
        ps.setInt(9, hcpsico.getIdcita_hcpsico());

        int resultado = ps.executeUpdate();

        if (resultado == 1) {
            return true;
        } else {
            return false;
        }

    }
}
