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

    /**
     * Metodo que registra la cita medica
     *
     * @see DAO.CitaDAO registrarCita
     */
    public boolean registrarCita(CitaDTO cita) {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cit = new CitaDAO(co);

        try {

            rta = cit.registrarCita(cita);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioCita.class.getName()).log(Level.SEVERE, null, ex);
            return false;
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

    /**
     * Metodo que lista las citas medicas del estudiante
     *
     * @see DAO.CitaDAO consultarCitasEst
     */
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

    /**
     * Metodo que lista las citas medicas del profesional de la salud
     *
     * @see DAO.CitaDAO consultarCitasProfesional
     */
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

    /**
     * Metodo que lista las citas medicas del usuario
     *
     * @see DAO.CitaDAO consultarCitasUsuario
     */
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

    /**
     * Metodo que lista las citas medicas del día del profesional de la salud
     *
     * @see DAO.CitaDAO consultarCitasMedicoDia
     */
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

    /**
     * Metodo que modifica los datos de la cita
     *
     * @see DAO.CitaDAO, HorarioMedicoDTO, HorarioDAO consultarHorarioMedico, consultarHorarioId, modificarCita
     */
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
    
    /**
     * Metodo que consulta los datos de la cita por su id
     *
     * @see DAO.CitaDAO consultarCitasId
     */
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
    
    /**
     * Metodo que lista los datos de la cita en un rango de fechas
     *
     * @see DAO.CitaDAO consultarCitasPorRango
     */
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
    
    /**
     * Metodo que actualizar el estado de la cita a atendida
     *
     * @see DAO.CitaDAO actualizarEstadoAtendida
     */
    public boolean actualizarEstadoAtendida(int id_cita) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        try {          
                     
            
            rta = cita.actualizarEstadoAtendida(id_cita);

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
    
    /**
     * Metodo que actualizar el estado de la cita a no atendida
     *
     * @see DAO.CitaDAO actualizarEstadoNoAtendida
     */
    public boolean actualizarEstadoNoAsistida(int id_cita) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        CitaDAO cita = new CitaDAO(co);

        try {          
                     
            
            rta = cita.actualizarEstadoNoAsistida(id_cita);

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
    
    /**
     * Metodo que obtiene la cantidad de citas en un rango de fechas
     *
     * @see DAO.CitaDAO cantidadCitas
     */
    public int cantidadCitas(String fechaI, String fechaF) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitas(fechaI, fechaF);
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
        
        return cant;
    }
    
    /**
     * Metodo que obtiene la cantidad de citas asistidas en un rango de fechas
     *
     * @see DAO.CitaDAO cantidadCitasAsistidas
     */
    public int cantidadCitasAsistidas(String fechaI, String fechaF) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitasAsistidas(fechaI, fechaF);
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
        return cant;
    }
    
    /**
     * Metodo que obtiene la cantidad de citas no asistidas en un rango de fechas
     *
     * @see DAO.CitaDAO cantidadCitasNoAsistidas
     */
    public int cantidadCitasNoAsistidas(String fechaI, String fechaF) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitasNoAsistidas(fechaI, fechaF);
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
        return cant;
    }
    
    /**
     * Metodo que obtiene la cantidad de citas asistidas en un rango de fechas por un estudiante
     *
     * @see DAO.CitaDAO cantidadCitasEstudiante
     */
    public int cantidadCitasEstudiante(String id_usuario, String fechaI, String fechaF){
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitasEstudiante(id_usuario, fechaI, fechaF);
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
        return cant;
    }
    
    /**
     * Metodo que obtiene la cantidad de citas pendientes en un rango de fechas 
     *
     * @see DAO.CitaDAO cantidadCitasPendientes
     */
    public int cantidadCitasPendientes(String fechaI, String fechaF) {
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitasPendientes(fechaI, fechaF);
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
        return cant;
    }
    
    /**
     * Metodo que obtiene la cantidad de citas de acuerdo a un usuario
     *
     * @see DAO.CitaDAO cantidadCitasUsuario
     */
    public int cantidadCitasUsuario(String id_usuario){
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitasUsuario(id_usuario);
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
        return cant;
    }
    
    /**
     * Metodo que obtiene la cantidad de citas por servicio
     *
     * @see DAO.CitaDAO cantidadCitasServicio
     */
    public int cantidadCitasServicio(String servicio, String fechaI, String fechaF){
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitasServicio(servicio, fechaI, fechaF);
        }catch (SQLException ex) {
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
        return cant;
    }   
    
    /**
     * Metodo que obtiene la cantidad de citas por servicio con programa academico
     *
     * @see DAO.CitaDAO cantidadCitasPro_Ser
     */
    public int cantidadCitasProSer(String servicio, String fechaI, String fechaF, int pro){
        int cant = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        CitaDAO cit = new CitaDAO(co);
        
        try {
            cant = cit.cantidadCitasPro_Ser(servicio, fechaI, fechaF, pro);
        }catch (SQLException ex) {
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
        return cant;
    }   
}
