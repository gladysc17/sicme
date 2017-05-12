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
    
    
    public AdministradorDTO consultarAdminPorId(int id){
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        AdministradorDAO adm = new AdministradorDAO(co);

        try {
            
            return adm.consultarAdminporId(id);
             
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
    
    public boolean validarSesionAdmin(int id, String clave){
        
          boolean resultado = false;
         
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        AdministradorDAO adm = new AdministradorDAO(co);
        try {
            AdministradorDTO admin = adm.consultarAdminporId(id);

            if (admin == null) {
                return false; 
                
            } else {
                if (admin.getContrasena_administrador().equals(clave)) {
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
    
    public boolean modificarAdmin( int identificacion_administrador, String correo_administrador, String telefono_administrador, String contrasena_administrador, String direccion_administrador,
                                  String fechanacimiento_administrador, String genero_administrador, String estadocivil_administrador){
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        AdministradorDAO adm = new AdministradorDAO(co);

        try {
            
            return adm.modificarAdmin(identificacion_administrador, correo_administrador, telefono_administrador, contrasena_administrador, direccion_administrador, fechanacimiento_administrador, genero_administrador, estadocivil_administrador);
             
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
