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
            EstudianteDTO estud = estudiante.consultarEstudiantePorIdCodigo(est.getIdentificacion(), est.getCodigo());
            if (estud == null) {
                return resultado = estudiante.registrarEstudiante(est);
            } else {
                return false;
            }
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

    public EstudianteDTO consultarEstudianteId(int id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO est = new EstudianteDAO(co);

        try {
            return est.consultarEstudiantePorId(id);
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

    public boolean consultarEstudianteIdBoolean(int id) {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO est = new EstudianteDAO(co);

        try {
            EstudianteDTO estudiante = est.consultarEstudiantePorId(id);

            return estudiante != null;

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

    public EstudianteDTO consultarEstudianteIdCodigo(int id, int codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO est = new EstudianteDAO(co);

        try {
            return est.consultarEstudiantePorIdCodigo(id, codigo);
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

    public List<EstudianteDTO> listarEstudiantes() throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        List<EstudianteDTO> prof = new ArrayList<EstudianteDTO>();
        EstudianteDAO p = new EstudianteDAO(co);

        try {
            prof = p.consultarEstudiantes();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            co.close();
        }
        return (prof);
    }
    
    public boolean modificarEstudiante(int identificacion, String correo, String fechanac, String genero, String estadocivil, String direccion, String telefono) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        EstudianteDAO est = new EstudianteDAO(co);

        try {
            
            rta = est.modificarEstudiante(identificacion, correo, fechanac, genero, estadocivil, direccion, telefono);

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
