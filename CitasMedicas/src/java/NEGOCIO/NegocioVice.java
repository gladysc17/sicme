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
    
    public VicerrectorDTO consultarAdminPorId(int id){
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        VicerrectorDAO vic = new VicerrectorDAO(co);

        try {
            
            return vic.consultarViceporId(id);
             
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
    
    public boolean validarSesionVice(int id, String clave){
        
          boolean resultado = false;
         
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        VicerrectorDAO adm = new VicerrectorDAO(co);
        try {
            VicerrectorDTO vice = adm.consultarViceporId(id);

            if (vice == null) {
                return false; 
                
            } else {
                if (vice.getContrasena_vice().equals(clave)) {
                    return true; 
                }
                
            }
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
    public boolean modificarVicerrector( int identificacion_vice, String correo_vice, String telefono_vice, String contrasena_vice){
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        VicerrectorDAO vic = new VicerrectorDAO(co);

        try {
            
            return vic.modificarVicerrector(identificacion_vice, correo_vice, telefono_vice, contrasena_vice);
             
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
        return false;       
    }
}
