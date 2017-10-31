/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.HcOdontologiaDAO;
import DTO.HcOdontologiaDTO;
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
public class NegocioHcOdontologia {
    
    public boolean registrarHcOdontologia(HcOdontologiaDTO hcod) throws SQLException {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcOdontologiaDAO od = new HcOdontologiaDAO(co);

        try {

            rta = od.registrarHcOdontologia(hcod);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcOdontologia.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcOdontologia.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
     
     public List<HcOdontologiaDTO> consultarHcOdontologia(int id_usuario) throws SQLException {
        
        List<HcOdontologiaDTO> listaHisC = new ArrayList<HcOdontologiaDTO>();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcOdontologiaDAO od = new HcOdontologiaDAO(co);        
        
        try {

            listaHisC = od.consultarHcOdontologia(id_usuario);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcOdontologia.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcOdontologia.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listaHisC;
    }
     
    public boolean actualizarControlPlacaOdontograma(int id_hcodontologia, String controlPlaca, String odontograma) throws SQLException {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcOdontologiaDAO od = new HcOdontologiaDAO(co);

        try {

            rta = od.actualizarControlPlacaOdontograma(id_hcodontologia, controlPlaca, odontograma);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcOdontologia.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcOdontologia.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    } 
    
}
