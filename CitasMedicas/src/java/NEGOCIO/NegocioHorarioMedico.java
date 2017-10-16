/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.HorarioMedicoDAO;
import DTO.HorarioMedicoDTO;
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
public class NegocioHorarioMedico {

    public boolean registrarHorario(HorarioMedicoDTO hm) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HorarioMedicoDAO aux = new HorarioMedicoDAO(co);
        boolean rta = false;
        try {
            rta = aux.registrarHorarioMedico(hm);
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, e);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }

    public HorarioMedicoDTO consultarHorarioMedico(int id_horariomedico) throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        HorarioMedicoDAO aux = new HorarioMedicoDAO(co);
        HorarioMedicoDTO a = null;

        try {
            a = aux.consultarHorarioMedico(id_horariomedico);
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, e);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return a;
    }

    public List<HorarioMedicoDTO> listarHoraMedico(String idMedico) {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        HorarioMedicoDAO aux = new HorarioMedicoDAO(co);
        List<HorarioMedicoDTO> lis = new ArrayList<HorarioMedicoDTO>();
        try {
            lis = aux.listarHorasMedico(idMedico);
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, e);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return lis;
    }

    public boolean eliminarHora(int id) {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        HorarioMedicoDAO aux = new HorarioMedicoDAO(co);
        boolean rta = false;
        try{
            rta = aux.eliminarHora(id);
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, e);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }
    
    public String fechaActual() {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        HorarioMedicoDAO aux = new HorarioMedicoDAO(co);
        String fe="";
        try{
            fe = aux.fechaActual();
        } catch (SQLException e) {
            Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, e);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioHorarioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return fe;
    }
}
