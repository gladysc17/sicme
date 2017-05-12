/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.OtroUsuarioDAO;
import DTO.OtroUsuarioDTO;
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
public class NegocioOtroUsuario {
    
    public boolean registrarOtroUsuario(OtroUsuarioDTO otro) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        OtroUsuarioDAO otr = new OtroUsuarioDAO(co);

        try {
            OtroUsuarioDTO otroU = otr.consultarOtroPorIdCodigo(otro.getIdentificacion_otro(), otro.getCodigo_otro());
            if (otroU == null) {
                return resultado = otr.registrarOtroUsuario(otro);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioOtroUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioOtroUsuario.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }
     public OtroUsuarioDTO consultarOtroUsuarioId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
         OtroUsuarioDAO ou = new OtroUsuarioDAO(co);

        try {
             return ou.consultarOtroUsuarioPorId(id);
        } catch (SQLException ex) {
            Logger.getLogger(Negocio.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Negocio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
     
      public boolean consultarOtroUsuarioIdBoolean(int id) {

         boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
         OtroUsuarioDAO ou = new OtroUsuarioDAO(co);

        try {
             OtroUsuarioDTO otro = ou.consultarOtroUsuarioPorId(id);
             return otro != null;
             
        } catch (SQLException ex) {
            Logger.getLogger(Negocio.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Negocio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
     
    public OtroUsuarioDTO consultarOtroUsuarioIdCodigo (int id, int codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        OtroUsuarioDAO ou = new OtroUsuarioDAO(co);

        try {
             return ou.consultarOtroPorIdCodigo(id, codigo);
        } catch (SQLException ex) {
            Logger.getLogger(Negocio.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Negocio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
     
     public List<OtroUsuarioDTO> listarOtrosUsuarios() throws SQLException{
      
           
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<OtroUsuarioDTO> otros = new ArrayList<OtroUsuarioDTO>();
        OtroUsuarioDAO otro = new OtroUsuarioDAO(co);
        
        try{
            otros = otro.consultarOtrosUsuarios();
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            co.close();
        }        
        return (otros);
    }
    
    public boolean modificarOtroUsuario(int identificacion_otro, String correo_otro, String fechanacimiento_otro, String genero_otro, String estadocivil_otro, String direccion_otro, String telefono_otro) throws SQLException{

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        OtroUsuarioDAO est = new OtroUsuarioDAO(co);

        try {
            
            rta = est.modificarOtroUsuario(identificacion_otro, correo_otro, fechanacimiento_otro, genero_otro, estadocivil_otro, direccion_otro, telefono_otro);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioOtroUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioOtroUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }
}
