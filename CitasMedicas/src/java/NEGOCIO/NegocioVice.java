/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.VicerrectorDAO;
import DTO.VicerrectorDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionPostgres;

/**
 *
 * @author Gladys M
 */
public class NegocioVice {
    
    public boolean registrarAdministrador(VicerrectorDTO vc) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        VicerrectorDAO admin = new VicerrectorDAO(co);

        try {                        
            return resultado = admin.registrarAdministrador(vc);
           
        } catch (SQLException ex) {
            Logger.getLogger(NegocioVice.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioVice.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }   

    public boolean verificarVice(String id, String clave) throws SQLException {
       boolean rta = false;

            ConexionPostgres con = new ConexionPostgres();
            Connection co = con.getconexion();

            VicerrectorDAO vice = new VicerrectorDAO(co);
            
            VicerrectorDTO vc = vice.consultarViceId(id);
            
            if (vc == null) {
                return false;
            } else {
                if (vc.getContrasena().equals(clave)) {
                    return true;
                }
                
            }

            return rta;
        }   

    public VicerrectorDTO consultarViceId(String id) {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        VicerrectorDAO med = new VicerrectorDAO(co);

        try {
             return med.consultarViceId(id);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioVice.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioVice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
 
}
