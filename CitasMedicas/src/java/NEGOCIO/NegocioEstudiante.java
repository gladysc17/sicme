/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.EstudianteDAO;
import DTO.EstudianteDTO;
import java.io.FileNotFoundException;
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
 * @version 1.0
 */
public class NegocioEstudiante {

    /**
     *
     * @param est
     * @return
     */
    public boolean registrarEstudiante(EstudianteDTO est) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        EstudianteDAO estudiante = new EstudianteDAO(co);

        try {                        
            return resultado = estudiante.registrarEstudiante(est);
           
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
        return resultado;

    }
    
    public List<String> consultarProgramaAcademico() {
        List<String> list = new ArrayList<>();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO est = new EstudianteDAO(co);
        
        try {
            list = est.consultarProgramaAcademico();
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
        return list;
    }

    public List<EstudianteDTO> consultarEstudiantePrograma(String programa){
        List<EstudianteDTO> list = new ArrayList<>();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO est = new EstudianteDAO(co);
        
        try {
            list = est.consultarEstudiantePrograma(programa);
        }catch (SQLException ex) {
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
        return list;
    }
}
