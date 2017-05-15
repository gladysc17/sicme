/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.HcPsicologiaDAO;
import DTO.HcPsicologiaDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionPostgres;

/**
 *
 * @author Gladys M
 */
public class NegocioHcPsicologia {
    
    public boolean registrarHcPsicologia(HcPsicologiaDTO hcpsico) throws SQLException {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcPsicologiaDAO ps = new HcPsicologiaDAO(co);

        try {

            rta = ps.registrarHcPsicologia(hcpsico);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcPsicologia.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcPsicologia.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    public List<HcPsicologiaDTO> consultarHCPsicologia(int id_usuario) throws SQLException {
        
        List<HcPsicologiaDTO> listaHisC = new ArrayList<HcPsicologiaDTO>();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcPsicologiaDAO psico = new HcPsicologiaDAO(co);        
        
        try {

            listaHisC = psico.consultarHcPsicologia(id_usuario);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcMedicinaGeneral.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcMedicinaGeneral.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listaHisC;
    }
    
}
