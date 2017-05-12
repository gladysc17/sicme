/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.HcMedicinaGeneralDAO;
import DTO.HcMedicinaGeneralDTO;
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
public class NegocioHcMedicinaGeneral {
    
     public boolean registrarHCMedicinaGeneral(HcMedicinaGeneralDTO hcmed) throws SQLException {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcMedicinaGeneralDAO med = new HcMedicinaGeneralDAO(co);

        try {

            rta = med.registrarHCMedicinaGeneral(hcmed);

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
        return rta;
    }
     
     public List<HcMedicinaGeneralDTO> consultarHCMedicinaGeneral(int id_usuario) throws SQLException {
        
        List<HcMedicinaGeneralDTO> listaHisC = new ArrayList<HcMedicinaGeneralDTO>();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcMedicinaGeneralDAO med = new HcMedicinaGeneralDAO(co);        
        
        try {

            listaHisC = med.consultarHcMedicinaGeneral(id_usuario);

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
     public HcMedicinaGeneralDTO consultarHCMedicinaGeneralCita(int id_usuario, int id_cita) throws SQLException {
                
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcMedicinaGeneralDAO med = new HcMedicinaGeneralDAO(co);        
        HcMedicinaGeneralDTO mg= new HcMedicinaGeneralDTO();        
        
        try {

            mg = med.consultarHcMedicinaGeneralCita(id_usuario, id_cita);

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
        return mg;
    }
}
