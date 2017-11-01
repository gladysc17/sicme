/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.CitaDAO;
import DAO.ServicioDAO;
import DTO.CitaDTO;
import DTO.ServicioDTO;
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
public class NegocioServicio {
    
    /**
     * Metodo que registra un servicio
     *
     * @see DAO.ServicioDAO registrarServicio
     */
    public boolean registrarServicio(ServicioDTO ser) {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

       ServicioDAO sr = new ServicioDAO(co);

        try {

            rta = sr.registrarServicio(ser);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    /**
     * Metodo que consulta un servicio por su identificación
     *
     * @see DAO.ServicioDAO consultarServicio
     */
    public ServicioDTO consultarServicioId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ServicioDAO sr = new ServicioDAO(co);
        ServicioDTO ser = new ServicioDTO();
        
        try {
            
            ser = sr.consultarServicio(id);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ser;
    }
    
    /**
     * Metodo que consulta un servicio por su identificación
     *
     * @see DAO.ServicioDAO consultarServicio
     */
    public List<ServicioDTO> consultarServicios() {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ServicioDAO sr = new ServicioDAO(co);

        List<ServicioDTO> servicios = new ArrayList<ServicioDTO>();
        try {

            servicios = sr.consultarServicios();

        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return servicios;
    }
    
    /**
     * Metodo que actualiza datos del servicio
     *
     * @see DAO.ServicioDAO actualizarServicio
     */
    public boolean actualizarServicio(int id, String ser, String info) {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ServicioDAO sr = new ServicioDAO(co);
        boolean rta = false;
        try{
            rta = sr.actualizarServicio(id, ser, info);
        }catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    /**
     * Metodo que elimina el servicio
     *
     * @see DAO.ServicioDAO eliminarServicio
     */
    public boolean eliminarServicio(int id) {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ServicioDAO sr = new ServicioDAO(co);
        boolean rta = false;
        try{
            rta = sr.eliminarServicio(id);
        }catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    /**
     * Metodo que calcula la cantidad de citas asistidas por servicio
     *
     * @see DAO.ServicioDAO cantidadCitasAsistidas
     */
    public int cantidadCitasAsistidas(String fechaI, String fechaF, String servicio) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ServicioDAO cit = new ServicioDAO(co);
        
        try {
            cant = cit.cantidadCitasAsistidas(fechaI, fechaF, servicio);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return cant;
    }
    
    /**
     * Metodo que calcula la cantidad de citas no asistidas por servicio
     *
     * @see DAO.ServicioDAO cantidadCitasNoAsistidas
     */
    public int cantidadCitasNoAsistidas(String fechaI, String fechaF, String servicio) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ServicioDAO cit = new ServicioDAO(co);
        
        try {
            cant = cit.cantidadCitasNoAsistidas(fechaI, fechaF, servicio);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return cant;
    }
    
    /**
     * Metodo que consulta el servicio por el nombre
     *
     * @see DAO.ServicioDAO consultarServicio
     */
    public ServicioDTO consultarServicio(String nombre) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ServicioDAO sr = new ServicioDAO(co);
        ServicioDTO ser = new ServicioDTO();
        
        try {
            
            ser = sr.consultarServicio(nombre);


        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ser;

    }
    
    /**
     * Metodo que calcula la cantidad de citas pendientes por servicio
     *
     * @see DAO.ServicioDAO cantidadCitasPendientes
     */
    public int cantidadCitasPendientes(String fechaI, String fechaF, String servicio) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        ServicioDAO cit = new ServicioDAO(co);
        
        try {
            cant = cit.cantidadCitasPendientes(fechaI, fechaF, servicio);
        
        } catch (SQLException ex) {
            Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioServicio.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return cant;

    
}
}
