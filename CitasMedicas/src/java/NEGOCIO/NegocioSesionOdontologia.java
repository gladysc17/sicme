/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.SesionOdontologiaDAO;
import DTO.SesionOdontologiaDTO;
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
public class NegocioSesionOdontologia {
    
    public NegocioSesionOdontologia() {
    }
    
    public boolean registrarSesionOdontologia(SesionOdontologiaDTO sesionOdontologia){
        
        boolean rta = false;
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        SesionOdontologiaDAO sesionOdontologiaDAO = new SesionOdontologiaDAO(co);
        
        try {

            rta = sesionOdontologiaDAO.registrarSesionOdontologia(sesionOdontologia);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioSesionOdontologia.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioSesionOdontologia.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    public List<SesionOdontologiaDTO> consultarSesionesPorHcOdontologia(int idHcOdontologia){
               
        List<SesionOdontologiaDTO> listaSesiones = new ArrayList();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        SesionOdontologiaDAO sesionOdontologiaDAO = new SesionOdontologiaDAO(co);

        try {

            listaSesiones = sesionOdontologiaDAO.consultarSesionesPorHcOdontologia(idHcOdontologia);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioHcPsicologia.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHcOdontologia.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listaSesiones;
    }
    
}
