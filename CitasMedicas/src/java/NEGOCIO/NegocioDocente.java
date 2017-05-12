/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.DocenteDAO;
import DTO.DocenteDTO;
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
public class NegocioDocente {
    
    public boolean registrarDocente(DocenteDTO doc) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        DocenteDAO docente = new DocenteDAO(co);

        try {
            DocenteDTO doce = docente.consultarDocentePorIdCodigo(doc.getIdentificacion_doc(), doc.getCodigo_doc());
            
            if (doce == null) {
                return resultado = docente.registrarDocente(doc);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioDocente.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioDocente.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }
    
     public DocenteDTO consultarDocentePorId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        DocenteDAO doc = new DocenteDAO(co);

        try {
             return doc.consultarDocentePorId(id);
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
     
     public boolean consultarDocentePorIdBoolean(int id) {
         
        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        DocenteDAO doc = new DocenteDAO(co);

        try {
            DocenteDTO docente = doc.consultarDocentePorId(id);
            return docente != null;
            
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
     
     
    public DocenteDTO consultarDocentePorIdCodigo (int id, int codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        DocenteDAO doc = new DocenteDAO(co);

        try {
             return doc.consultarDocentePorIdCodigo(id, codigo);
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
    
     
     public List<DocenteDTO> listarDocentes() throws SQLException{
      
           
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<DocenteDTO> prof = new ArrayList<DocenteDTO>();
        DocenteDAO doc = new DocenteDAO(co);
        
        try{
            prof = doc.consultarDocentes();
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            co.close();
        }        
        return (prof);
    }
     
      public boolean modificarDocente(int  identificacion_doc, String correo_doc, String fechanac_doc, String genero_doc, String estadocivil_doc, String direccion_doc, String telefono_doc) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        DocenteDAO docente = new DocenteDAO(co);

        try {
            
            rta = docente.modificarDocente(identificacion_doc, correo_doc, fechanac_doc, genero_doc, estadocivil_doc, direccion_doc, telefono_doc);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioDocente.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioDocente.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }

    
}
