/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.AdministradorDAO;
import DTO.AdministradorDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionPostgres;

/**
 *
 * @author Gladys M
 */
public class NegocioAdministrador {

    public boolean verificarAdmin(String id, String clave) throws SQLException {
        {

            boolean rta = false;

            ConexionPostgres con = new ConexionPostgres();
            Connection co = con.getconexion();

            AdministradorDAO admin = new AdministradorDAO(co);
            
            AdministradorDTO ad = admin.consultarAdminId(id);
            
            if (ad == null) {
                return false;
            } else {
                if (ad.getContrasena().equals(clave)) {
                    return true;
                }
                
            }

            return rta;
        }

    }

    public boolean registrarAdministrador(AdministradorDTO ad) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        AdministradorDAO admin = new AdministradorDAO(co);

        try {
            return resultado = admin.registrarAdministrador(ad);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioAdministrador.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioAdministrador.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }
    
     public AdministradorDTO consultarAdminPorId(String id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        AdministradorDAO med = new AdministradorDAO(co);

        try {
             return med.consultarAdminId(id);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioAdministrador.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioAdministrador.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

}
