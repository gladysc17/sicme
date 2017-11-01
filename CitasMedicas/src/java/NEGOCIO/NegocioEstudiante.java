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
     * Metodo que verifica el registro de un Estudiante
     *
     * @see DAO.EstudianteDAO registrarEstudiante
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

    /**
     * Metodo que verifica la consulta de un estudiante por programa
     *
     * @see DAO.EstudianteDAO consultarEstudiantePrograma
     */
    public List<EstudianteDTO> consultarEstudiantePrograma(int programa) {
        List<EstudianteDTO> list = new ArrayList<>();
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO est = new EstudianteDAO(co);

        try {
            list = est.consultarEstudiantePrograma(programa);
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

    /**
     * Metodo que verifica cantidad de citas asistidas de un usuario
     *
     * @see DAO.EstudianteDAO cantidadCitasAsistidas
     */
    public int cantidadCitasAsistidas(String fechaI, String fechaF, String id_usuario) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO cit = new EstudianteDAO(co);

        try {
            cant = cit.cantidadCitasAsistidas(fechaI, fechaF, id_usuario);
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
        return cant;
    }

    /**
     * Metodo que verifica cantidad de citas No asistidas de un usuario
     *
     * @see DAO.EstudianteDAO cantidadCitasNoAsistidas
     */
    public int cantidadCitasNoAsistidas(String fechaI, String fechaF, String id_usuario) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO cit = new EstudianteDAO(co);

        try {
            cant = cit.cantidadCitasNoAsistidas(fechaI, fechaF, id_usuario);
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
        return cant;
    }

    /**
     * Metodo que verifica cantidad de citas Pendientes de un usuario
     *
     * @see DAO.EstudianteDAO cantidadCitasPendientes
     */
    public int cantidadCitasPendientes(String fechaI, String fechaF, String id_usuario) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        EstudianteDAO cit = new EstudianteDAO(co);

        try {
            cant = cit.cantidadCitasPendientes(fechaI, fechaF, id_usuario);
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
        return cant;
    }

    /**
     * Metodo que verifica la lista de Estudiantes registrados
     *
     * @see DAO.EstudianteDAO consultarEstudiante
     */
    public EstudianteDTO listarEstudiante(String id) throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        EstudianteDTO otros = new EstudianteDTO();
        EstudianteDAO otro = new EstudianteDAO(co);

        try {
            otros = otro.consultarEstudiante(id);
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
        return (otros);
    }
}
