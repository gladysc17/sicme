/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.CitaDAO;
import DAO.Programa_academicoDAO;
import DAO.ServicioDAO;
import DTO.CitaDTO;
import DTO.Programa_academicoDTO;
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
 * @author usuario
 */
public class NegocioPrograma_academico {
    
    public boolean registrarPrograma(Programa_academicoDTO pro) {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        Programa_academicoDAO pa = new Programa_academicoDAO(co);

        try {

            rta = pa.registrarPrograma(pro);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioPrograma_academico.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioPrograma_academico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    public Programa_academicoDTO consultarProgramaId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        Programa_academicoDAO pr = new Programa_academicoDAO(co);
        Programa_academicoDTO prog = new Programa_academicoDTO();
        
        try {
            
            prog = pr.consultarPrograma(id);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioPrograma_academico.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioPrograma_academico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return prog;
    }
    
    public List<Programa_academicoDTO> consultarProgramas() {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        Programa_academicoDAO pr = new Programa_academicoDAO(co);

        List<Programa_academicoDTO> programas = new ArrayList<Programa_academicoDTO>();
        try {

            programas = pr.consultarProgramas();

        } catch (SQLException ex) {
            Logger.getLogger(NegocioPrograma_academico.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioPrograma_academico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return programas;
    }
}
