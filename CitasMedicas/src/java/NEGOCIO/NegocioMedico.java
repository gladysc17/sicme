/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.MedicoDAO;
import DTO.MedicoDTO;
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
public class NegocioMedico {
    
    
    public boolean validarSesionMedico(int id, String clave) {
         
        boolean resultado = false;
         
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO med = new MedicoDAO(co);
        try {
            MedicoDTO medi = med.consultarMedicoPorId(id);

            if (medi == null) {
                return false;
            } else {
                if (medi.getContrasena_med().equals(clave)) {
                    return true;
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return resultado;
    }
    
    public boolean registrarMedico(MedicoDTO med) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        MedicoDAO medi = new MedicoDAO(co);

        try {
            MedicoDTO medico = medi.consultarMedicoPorIdCodigo(med.getIdentificacion_med(), med.getCodigo_med());
            if (medico == null) {
                return resultado = medi.registrarMedico(med);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }
    
     public MedicoDTO consultarMedicoPorId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO med = new MedicoDAO(co);

        try {
             return med.consultarMedicoPorId(id);
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
     
       public boolean consultarMedicoPorIdBoolean(int id) {
           
           boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO med = new MedicoDAO(co);

        try {
             MedicoDTO medico = med.consultarMedicoPorId(id);
             
               return medico != null;
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
     
    public MedicoDTO consultarMedicoPorIdCodigo (int id, int codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO doc = new MedicoDAO(co);

        try {
             return doc.consultarMedicoPorIdCodigo(id, codigo);
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
    
     
     public List<MedicoDTO> listarMedicos() throws SQLException{
      
           
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<MedicoDTO> prof = new ArrayList<MedicoDTO>();
        MedicoDAO doc = new MedicoDAO(co);
        
        try{
            prof = doc.consultarMedico();
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            co.close();
        }        
        return (prof);
    }
     
      public ArrayList<MedicoDTO> consultarMedicoPorServicio(String servicio) throws SQLException{
      
      ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        MedicoDAO med = new MedicoDAO(co);
        ArrayList<MedicoDTO> medicos = new ArrayList<MedicoDTO>();
        
        try {
            medicos = med.consultarMedicoPorServicio(servicio);

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
        return medicos;
      
  }
      
    public boolean modificarMedico(int identificacion_med, String correo_med, String fechanacimiento_med, String genero_med, String estadocivil_med, String direccion_med, String telefono_med, String contrasena_med) throws SQLException{

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        MedicoDAO med = new MedicoDAO(co);

        try {
            
            rta = med.modificarMedico(identificacion_med, correo_med, fechanacimiento_med, genero_med, estadocivil_med, direccion_med, telefono_med, contrasena_med);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }
}
