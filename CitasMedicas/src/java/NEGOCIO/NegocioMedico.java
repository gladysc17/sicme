/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.MedicoDAO;
import DTO.MedicoDTO;
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
public class NegocioMedico {

    /**
     * Metodo que valida la sesion del médico
     *
     * @see DAO.MedicoDAO consultarMedicoPorId
     */
    public boolean validarSesionMedico(String id, String clave) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO med = new MedicoDAO(co);
        try {
            MedicoDTO medi = med.consultarMedicoPorId(id);

            if (medi == null) {
                return false;
            } else {
                if (medi.getContrasena().equals(clave)) {
                    return true;
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return resultado;
    }

    /**
     * Metodo que registra la informacion del médico
     *
     * @see DAO.MedicoDAO registrarMedico
     */
    public boolean registrarMedico(MedicoDTO med) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        MedicoDAO medi = new MedicoDAO(co);

        try {

            return resultado = medi.registrarMedico(med);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }

    /**
     * Metodo que consulta la informacion del médico por su identificacion
     *
     * @see DAO.MedicoDAO consultarMedicoPorId
     */
    public MedicoDTO consultarMedicoPorId(String id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO med = new MedicoDAO(co);

        try {
            return med.consultarMedicoPorId(id);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    /**
     * Metodo booleano que consulta la informacion del médico por su identificacion
     *
     * @see DAO.MedicoDAO consultarMedicoPorId
     */
    public boolean consultarMedicoPorIdBoolean(String id) {

        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO med = new MedicoDAO(co);

        try {
            MedicoDTO medico = med.consultarMedicoPorId(id);

            return medico != null;
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }

    /**
     * Metodo que consulta la informacion del médico por su identificacion o codigo
     *
     * @see DAO.MedicoDAO consultarMedicoPorIdCodigo
     */
    public MedicoDTO consultarMedicoPorIdCodigo(int id, int codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        MedicoDAO doc = new MedicoDAO(co);

        try {
            return doc.consultarMedicoPorIdCodigo(id, codigo);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    /**
     * Metodo que lista los médicos
     *
     * @see DAO.MedicoDAO consultarMedico
     */
    public List<MedicoDTO> listarMedicos() throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        List<MedicoDTO> prof = new ArrayList<MedicoDTO>();
        MedicoDAO doc = new MedicoDAO(co);

        try {
            prof = doc.consultarMedico();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            co.close();
        }
        return (prof);
    }

    /**
     * Metodo que lista los médicos por su servicio
     *
     * @see DAO.MedicoDAO consultarMedicoPorServicio
     */
    public ArrayList<MedicoDTO> consultarMedicoPorServicio(int servicio) throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        MedicoDAO med = new MedicoDAO(co);
        ArrayList<MedicoDTO> medicos = new ArrayList<MedicoDTO>();

        try {
            medicos = med.consultarMedicoPorServicio(servicio);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return medicos;

    }

    /**
     * Metodo que verifica el médico por su identificacion y clave
     *
     * @see DAO.MedicoDAO consultarMedicoPorId
     */    
    public boolean verificarMedico(String id, String clave) throws SQLException {

        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        MedicoDAO medico = new MedicoDAO(co);

        MedicoDTO md = medico.consultarMedicoPorId(id);

        if (md == null) {
            return false;
        } else {
            if (md.getContrasena().equals(clave)) {
                return true;
            }

        }

        return rta;
    }

    /**
     * Metodo que lista los médicos
     *
     * @see DAO.MedicoDAO listadoMedico
     */ 
    public ArrayList<String[]> listadoMedico() throws SQLException {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        ArrayList<String[]> lis = new ArrayList<>();
        try {
            MedicoDAO med = new MedicoDAO(co);
            lis = med.listadoMedico();
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return lis;
    }

    /**
     * Metodo que lista los servicios
     *
     * @see DAO.MedicoDAO consultaServicios
     */
    public List<String> consultaServicios() {
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        List<String> ls = new ArrayList<>();

        try {
            MedicoDAO med = new MedicoDAO(co);
            ls = med.consultaServicios();
        } catch (SQLException ex) {
            Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioMedico.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ls;
    }
}
