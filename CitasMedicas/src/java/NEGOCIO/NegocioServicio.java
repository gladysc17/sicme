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
