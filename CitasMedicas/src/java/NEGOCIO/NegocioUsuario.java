/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.UsuarioDAO;
import DTO.UsuarioDTO;
import java.sql.Connection;
import java.sql.Date;
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
public class NegocioUsuario {
    
    public boolean registrarUsuario(UsuarioDTO usuario) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO otr = new UsuarioDAO(co);

        try {
            UsuarioDTO otroU = otr.consultarUsuarioPorIdCodigo(usuario.getIdentificacion(), usuario.getCodigo());
            if (otroU == null) {
                return resultado = otr.registrarUsuario(usuario);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }
     public UsuarioDTO consultarUsuarioId(String id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
         UsuarioDAO ou = new UsuarioDAO(co);

        try {
             return ou.consultarUsuarioPorId(id);
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
     
      public boolean consultarOtroUsuarioIdBoolean(String id) {

         boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
         UsuarioDAO ou = new UsuarioDAO(co);

        try {
             UsuarioDTO otro = ou.consultarUsuarioPorId(id);
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
     
    public UsuarioDTO consultarUsuarioIdCodigo (String id, String codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        UsuarioDAO ou = new UsuarioDAO(co);

        try {
             return ou.consultarUsuarioPorIdCodigo(id, codigo);
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
    
     
     public List<UsuarioDTO> listarOtrosUsuarios() throws SQLException{
      
           
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<UsuarioDTO> otros = new ArrayList<UsuarioDTO>();
        UsuarioDAO otro = new UsuarioDAO(co);
        
        try{
            otros = otro.consultarUsuarios();
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            co.close();
        }        
        return (otros);
    }
    
    public boolean modificarUsuario(String identificacion, String correo, Date fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException{

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO est = new UsuarioDAO(co);

        try {
            
            rta = est.modificarUsuario(identificacion, correo, fechanacimiento, genero, estadocivil, direccion, telefono);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }
    
    public int calcularEdad (Date fecha) {
        
        int edad = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        UsuarioDAO ou = new UsuarioDAO(co);

        try {
             edad = ou.calcularedad(fecha);
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
        return edad;
    }
}
