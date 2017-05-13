/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.ProfesionalDAO;
import DTO.ProfesionalDTO;
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
public class NegocioProfesional {

    public boolean registrarProfesional(ProfesionalDTO prof) {

        boolean res = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ProfesionalDAO profesional = new ProfesionalDAO(co);

        try {
            ProfesionalDTO profs = profesional.consultarProfesionalPorIdCodigo(prof.getIdentificacion(), prof.getCodigo());

            if (profs == null) {
                return res = profesional.registrarProfesional(prof);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return res;
    }
    
    public ProfesionalDTO consultarProefionalPorId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ProfesionalDAO pro = new ProfesionalDAO(co);

        try {
             return pro.consultarProfesionalPorId(id);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
     public boolean consultarProfesionalPorIdBoolean(int id) {
         
         boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ProfesionalDAO pro = new ProfesionalDAO(co);

        try {
            ProfesionalDTO profesional = pro.consultarProfesionalPorId(id);
            
             return profesional != null;
        } catch (SQLException ex) {
            Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
     
     /**
     * Metodo que se encarga de traer los datos que hay en la tabla Profesional de la base de datos
     * @return Listado con todo los datos que hay en la tabla profesionalde la base de datos
     */
    
  public List<ProfesionalDTO> listarProfesionales () throws SQLException{
      
           
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<ProfesionalDTO> prof = new ArrayList<ProfesionalDTO>();
        ProfesionalDAO p = new ProfesionalDAO(co);
        
        try{
            prof = p.listarProfesionales();
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            co.close();
        }        
        return (prof);
    }
  
  public ProfesionalDTO consultarProfesionalPorIdCodigo (int id, int codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ProfesionalDAO doc = new ProfesionalDAO(co);

        try {
             return doc.consultarProfesionalPorIdCodigo(id, codigo);
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
  
    public boolean modificarProfesional(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException{

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ProfesionalDAO prof = new ProfesionalDAO(co);

        try {
            
            rta = prof.modificarProfesional(identificacion, correo, fechanacimiento, genero, estadocivil, direccion, telefono);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioProfesional.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }
}
