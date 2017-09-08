/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.ImagenDAO;
import DTO.ImagenDTO;
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
public class NegocioImagen {
    
    public boolean registrarImagen(ImagenDTO ima){
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        ImagenDAO imag = new ImagenDAO(co);
        
        try{
            rta = imag.registrarImagen(ima);
        } catch(SQLException ex){
            Logger.getLogger(NegocioImagen.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioImagen.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    public List<ImagenDTO> listarImagenes() {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        ImagenDAO imag = new ImagenDAO(co);
        List<ImagenDTO> lis = new ArrayList<>();
        
        try{
            lis = imag.listaImagenes();
        } catch(SQLException ex){
            Logger.getLogger(NegocioImagen.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioImagen.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return lis;
    }
    
    public boolean actualizarEstadoBanner(String estado, int id){
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        
        ImagenDAO imag = new ImagenDAO(co);
        boolean est = false;
        try{
            est = imag.actualizarEstadoBanner(estado, id);
        }catch(SQLException ex){
            Logger.getLogger(NegocioImagen.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioImagen.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return est;
    }
}
