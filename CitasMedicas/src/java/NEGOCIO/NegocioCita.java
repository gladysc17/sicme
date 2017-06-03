/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.CitaDAO;
import DAO.HorarioDAO;
import DAO.HorarioMedicoDAO;
import DTO.CitaDTO;
import DTO.HorarioDTO;
import DTO.HorarioMedicoDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionPostgres;

/**
 *
 * @author Gladys M
 */
public class NegocioCita {

    public boolean registrarCita(CitaDTO cita) {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cit = new CitaDAO(co);

        try {

            rta = cit.registrarCita(cita);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }

    public ArrayList<CitaDTO> consultarCitasEst(int id_est) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();
        try {

            citas = cita.consultarCitasEst(id_est);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return citas;
    }

    public ArrayList<CitaDTO> consultarCitasProfesiona(int id_prof, String fecha) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();
        try {

            citas = cita.consultarCitasProfesional(id_prof, fecha);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return citas;
    }

    public ArrayList<CitaDTO> consultarCitasUsuario(String id_usuario) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();
        try {

            citas = cita.consultarCitasUsuario(id_usuario);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return citas;
    }

    public ArrayList<CitaDTO> consultarCitasMedicoDia(String id_medico, String fecha_cita) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();
        try {

            citas = cita.consultarCitasMedicoDia(id_medico, fecha_cita);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return citas;
    }

    public boolean modificarCita(int id_cita, String fecha, int hora_cita, String id_medico) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        try {
            HorarioMedicoDAO hmd = new HorarioMedicoDAO(co);
            HorarioMedicoDTO hm = hmd.consultarHorarioMedico(hora_cita);
            
            HorarioDAO hd = new HorarioDAO(co);
            HorarioDTO ho = hd.consultarHorarioId(hm.getId_horario_horariomedico());
            
            
            rta = cita.modificarCita(id_cita, fecha, ho.getHora_inicio(), id_medico);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }
    
    public CitaDTO consultarCitasId(int id_cita) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);
        CitaDTO citas = new CitaDTO();
        
        try {
            
            citas = cita.consultarCitasId(id_cita);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return citas;
    }
    
    public ArrayList<CitaDTO> consultarCitasRango(String id_medico, String fecha, String fechaF) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        ArrayList<CitaDTO> citas = new ArrayList<CitaDTO>();
        try {

            citas = cita.consultarCitasPorRango(id_medico, fecha, fechaF);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return citas;
    }
}
