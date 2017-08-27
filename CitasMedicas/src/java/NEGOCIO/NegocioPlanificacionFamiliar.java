/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DTO.Hc_planificacionfamiliarDTO;
import DAO.HcPlanificacionfamiliarDAO;
import util.ConexionPostgres;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author LEGADO
 */
public class NegocioPlanificacionFamiliar {
    
    public boolean registrarHCplanfamiliar(Hc_planificacionfamiliarDTO plan) throws SQLException {
        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        HcPlanificacionfamiliarDAO pf = new HcPlanificacionfamiliarDAO(co);
        
        try{
            rta = pf.registrarHCplanifamiliar(plan);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioPlanificacionFamiliar.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioPlanificacionFamiliar.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
}
