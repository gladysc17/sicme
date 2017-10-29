/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.EventoDAO;
import DAO.RegistroeventoDAO;
import DTO.EventoDTO;
import DTO.RegistroeventoDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionPostgres;

/**
 *
 * @author LEGADO
 */
public class NegocioEvento {
    
    /**
     * Metodo que crea el evento
     *
     * @see DAO.EventoDAO registrarEvento
     */
    public boolean crearEvento(EventoDTO evento){
        
        boolean rta=false;
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        EventoDAO eve = new EventoDAO(co);
        
        try{
            rta = eve.registrarEvento(evento);
        } catch(SQLException e){
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, e);
        }finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    /**
     * Metodo que obtiene los eventos del mes
     *
     * @see DAO.EventoDAO diasMes, obtenerMes, obtenerAño, eventoPorMes
     */
    public List<EventoDTO> obtenerEventoMes(){
        
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        EventoDAO eve = new EventoDAO(co);
        
        try {
            double [] vec = new double[2];
            vec = eve.diasMes();
            double mesC, añoC = 0;
            mesC = eve.obtenerMes();
            añoC = eve.obtenerAño();
            int mes = (int)mesC;
            int año = (int)añoC;
            int diaI = (int)vec[0];
            int diaF = (int)vec[1];
            
            String fechaI = año+"-"+ mes+"-"+ diaI;
            String fechaF = año+"-"+ mes+"-"+ diaF;
            ls = eve.eventoPorMes(fechaI, fechaF, "activo");
        } catch(SQLException e){
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return ls;        
    }
   
    /**
     * Metodo que lista los eventos del medico o administrador
     *
     * @see DAO.EventoDAO listarEvento
     */
    public List<EventoDTO> listarMedicoAdm(String ident) {
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        EventoDAO e = new EventoDAO(co);
        
        try {
            ls = e.listarEvento(ident);
        } catch(SQLException ex){ 
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return ls;
    }
    
    /**
     * Metodo que modifica los eventos 
     *
     * @see DAO.EventoDAO modificarEvento
     */
    public boolean modificarEvento(int idEvento, String fecha, String hora, String lugar){
        
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        EventoDAO e = new EventoDAO(co);
        boolean rta = false;
        try{
            rta = e.modificarEvento(idEvento, fecha, hora, lugar);
        }catch(SQLException ev){
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ev);
        }finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    /**
     * Metodo que consulta los eventos por su identificador
     *
     * @see DAO.EventoDAO consultaPorId
     */
    public EventoDTO consultaPorId(String id){
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EventoDAO eve = new EventoDAO(co);
        EventoDTO ls = new EventoDTO();
        try{
            ls = eve.consultaPorId(Integer.parseInt(id));
        }catch(SQLException ev){
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ev);
        }finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ls;
    }
    
    /**
     * Metodo que registra la participación a eventos
     *
     * @see DAO.RegistroeventoDAO inscripcionEvento
     */
    public boolean registroEvento(RegistroeventoDTO re) {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        RegistroeventoDAO reg = new RegistroeventoDAO(co);
        
        boolean rta = false;
        
        try{
            rta = reg.inscripcionEvento(re);
        }catch(SQLException ev){
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ev);
        }finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    /**
     * Metodo que lista los eventos en un rango de fechas
     *
     * @see DAO.EventoDAO listarEventos
     */
    public List<EventoDTO> listarEventos(String fechaI, String fechaF) {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        EventoDAO e = new EventoDAO(co);
        
        try {
            ls = e.listarEventos(fechaI, fechaF);
        } catch(SQLException ex){ 
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return ls;
    }
    
    /**
     * Metodo que muestra la cantidad de asistentes a un evento
     *
     * @see DAO.RegistroeventoDAO cantidadPorEvento
     */
    public int cantidadPorEvento(int idEvent){
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        int cant = 0;
        RegistroeventoDAO reg = new RegistroeventoDAO(co);
        try{
            cant = reg.cantidadPorEvento(idEvent);
        }catch(SQLException ev){
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ev);
        }finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return cant;
    }
    
    /**
     * Metodo que lista los asistentes a un evento
     *
     * @see DAO.RegistroeventoDAO listaRegistrados
     */
    public List<RegistroeventoDTO> listarRegistrados(int id_evento) throws SQLException{
      
           
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<RegistroeventoDTO> Reev = new ArrayList<RegistroeventoDTO>();
        RegistroeventoDAO reg = new RegistroeventoDAO(co);
        
        try{
            Reev = reg.listaRegistrados(id_evento);
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            co.close();
        }        
        return (Reev);
    }
    
    /**
     * Metodo que lista los eventos
     *
     * @see DAO.EventoDAO consultarEventos
     */
     public List<EventoDTO> consultarEventos() {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        List<EventoDTO> ls = new ArrayList<EventoDTO>();
        EventoDAO e = new EventoDAO(co);
        
        try {
            ls = e.consultarEventos();
        } catch(SQLException ex){ 
            Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            if(co != null){
                try {
                    co.close();
                } catch (SQLException ex){
                    Logger.getLogger(NegocioEvento.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return ls;
    }
}
