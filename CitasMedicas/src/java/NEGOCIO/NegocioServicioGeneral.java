/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.ServicioGeneralDAO;
import DTO.ServicioGeneralDTO;
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
public class NegocioServicioGeneral {
    
    public boolean registrarServicioGeneral(ServicioGeneralDTO ser) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ServicioGeneralDAO serv = new ServicioGeneralDAO(co);

        try {
            ServicioGeneralDTO servi = serv.consultarServicioGeneralPorIdCodigo(ser.getIdentificacion(), ser.getCodigo());
            if (servi == null) {
                return resultado = serv.registrarServicioGeneral(ser);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicioGeneral.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicioGeneral.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }
     public ServicioGeneralDTO consultarServicioGeneralId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ServicioGeneralDAO ser = new ServicioGeneralDAO(co);

        try {
             return ser.consultarServicioGeneralPorId(id);
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
     
      public boolean consultarServicioGeneralIdBoolean(int id) {
          
          boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ServicioGeneralDAO ser = new ServicioGeneralDAO(co);

        try {
            ServicioGeneralDTO servicio = ser.consultarServicioGeneralPorId(id);
            
            return servicio != null;
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
     
    public ServicioGeneralDTO consultarServicioGeneralIdCodigo (int id, int codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ServicioGeneralDAO ser = new ServicioGeneralDAO(co);

        try {
             return ser.consultarServicioGeneralPorIdCodigo(id, codigo);
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
    
     
     public List<ServicioGeneralDTO> listarServicioGeneral() throws SQLException{
      
           
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<ServicioGeneralDTO> ser = new ArrayList<ServicioGeneralDTO>();
        ServicioGeneralDAO sr = new ServicioGeneralDAO(co);
        
        try{
            ser = sr.consultarServicioGeneral();
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            co.close();
        }        
        return (ser);
    }
     
    public boolean modificarServicioGeneral(int identificacion, String correo, String fechanacimiento, String genero, String estadocivil, String direccion, String telefono) throws SQLException{

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ServicioGeneralDAO sg = new ServicioGeneralDAO(co);

        try {
            
            rta = sg.modificarServicioGeneral(identificacion, correo, fechanacimiento, genero, estadocivil, direccion, telefono);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioEstudiante.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }
}
