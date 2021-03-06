/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.HorarioDAO;
import DTO.HorarioDTO;
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
public class NegocioHorario {

    /**
     * Metodo que lista las horas disponibles
     *
     * @see DAO.HorarioDAO consultarHorasDisponibles
     */
    public List<HorarioDTO> consultarHorasDisponibles(String id_medico, String fecha) throws Exception {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        List<HorarioDTO> horasDisp = new ArrayList<HorarioDTO>();
        HorarioDAO h = new HorarioDAO(co);

        try {
            horasDisp = h.consultarHorasDisponibles(id_medico, fecha);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            co.close();
        }

        return (horasDisp);
    }

    /**
     * Metodo que lista las horas 
     *
     * @see DAO.HorarioDAO listadoHoras
     */
    public List<HorarioDTO> listadoHoras() {

        List<HorarioDTO> ho = new ArrayList<HorarioDTO>();

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HorarioDAO h = new HorarioDAO(co);

        try {
            ho = h.listadoHoras();
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ho;
    }

    /**
     * Metodo que cambia el estado de la hora
     *
     * @see DAO.HorarioDAO cambiarEstadoHora
     */
    public boolean cambiarEstadoHora(String id_medico_horariomedico, String fecha, int id_horario_horariomedico, String estado) {

        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HorarioDAO h = new HorarioDAO(co);

        try {
            rta = h.cambiarEstadoHora(id_medico_horariomedico, fecha, id_horario_horariomedico, estado);

        } catch (SQLException e) {
            Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }

    /**
     * Metodo que consulta las horas del medico de acuerdo al id
     *
     * @see DAO.HorarioDAO consultarHorarioId
     */
    public HorarioDTO listadoHorasMedico(int id) {

        HorarioDTO ho = new HorarioDTO();

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HorarioDAO h = new HorarioDAO(co);

        try {
            ho = h.consultarHorarioId(id);
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ho;
    }

    /**
     * Metodo que consulta las horas del medico de acuerdo a la fecha
     *
     * @see DAO.HorarioDAO consultaHora
     */
    public HorarioDTO consultaHora(String fecha) {
        HorarioDTO ho = new HorarioDTO();

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HorarioDAO h = new HorarioDAO(co);

        try {
            ho = h.consultaHora(fecha);
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ho;
    }

}
