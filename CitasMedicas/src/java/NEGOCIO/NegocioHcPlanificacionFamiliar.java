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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LEGADO
 * @version 1.0
 */
public class NegocioHcPlanificacionFamiliar {

    /**
     * Metodo que verifica el registro de la Historia Clinica de Planificacion
     * Familiar
     *
     * @see DAO.HcPlanificacionfamiliarDAO registrarHCplanifamiliar
     */
    public boolean registrarHCplanfamiliar(Hc_planificacionfamiliarDTO plan) throws SQLException {
        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcPlanificacionfamiliarDAO pf = new HcPlanificacionfamiliarDAO(co);

        try {
            rta = pf.registrarHCplanifamiliar(plan);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcPlanificacionFamiliar.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcPlanificacionFamiliar.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }

    /**
     * Metodo que verifica la lista de Historias Clinicas de Planificacion
     * familiar de un usuario
     *
     * @see DAO.HcPlanificacionfamiliarDAO consultarHcPlanificacion
     */
    public List<Hc_planificacionfamiliarDTO> consultarHcPlanificacion(int id_usuario) throws SQLException {

        List<Hc_planificacionfamiliarDTO> listaHisC = new ArrayList<Hc_planificacionfamiliarDTO>();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HcPlanificacionfamiliarDAO pla = new HcPlanificacionfamiliarDAO(co);

        try {

            listaHisC = pla.consultarHcPlanificacion(id_usuario);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcPlanificacionFamiliar.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcPlanificacionFamiliar.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listaHisC;
    }

}
