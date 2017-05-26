/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.EventoDAO;
import DTO.EventoDTO;
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
    
    public List<EventoDTO> listarMedicoAdm(int ident) {
        
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
}
