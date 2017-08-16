/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.SesionDAO;
import DTO.SesionDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionPostgres;

/**
 *
 * @author Mauricio U
 */
public class NegocioSesion {

    public NegocioSesion() {
    }
    
    public boolean registrarSesion(SesionDTO sesion){
        
        boolean rta = false;
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        SesionDAO sesionDAO = new SesionDAO(co);
        
        try {

            rta = sesionDAO.registrarSesion(sesion);

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
    
    public List<SesionDTO> consultarSesionesPorHcPsicologia(int idHcPsicologia){
               
        List<SesionDTO> listaSesiones = new ArrayList();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        SesionDAO sesionDAO = new SesionDAO(co);

        try {

            listaSesiones = sesionDAO.consultarSesionesPorHcPsicologia(idHcPsicologia);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcPsicologia.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcMedicinaGeneral.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listaSesiones;
    }
    
}
