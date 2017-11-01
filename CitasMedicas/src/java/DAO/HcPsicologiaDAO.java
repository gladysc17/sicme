/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HcPsicologiaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 * @version 1.0
 */
public class HcPsicologiaDAO {

    private Connection con;

    public HcPsicologiaDAO(Connection con) {
        this.con = con;
    }

    /**
     * Metodo que registra una Historia clinica de Psicologia en la Base de
     * Datos
     *
     * @param hcpsico, Objeto de tipo HcPsicologiaDTO
     * @return boolean con valor verdadero si hubo registro exitoso, falso si
     * existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarHcPsicologia(HcPsicologiaDTO hcpsico) throws SQLException {

        String sql = "INSERT INTO hc_psicologia (idusuario_hcpsico, motivoconsulta_hcpsico, "
                + "historiafamiliar_hcpsico, problematicaactual_hcpsico, diagnostico_hcpsico, "
                + "procesopsicoterapeutico_hcpsico, seguimiento_hcpsico, sesion, idcita_hcpsico,"
                + "tipofamilia, miembrosfamilia, relacionesfamilia, genograma) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, hcpsico.getIdusuario_hcpsico());
        ps.setString(2, hcpsico.getMotivoconsulta_hcpsico());
        ps.setString(3, hcpsico.getHistoriafamiliar_hcpsico());
        ps.setString(4, hcpsico.getProblematicaactual_hcpsico());
        ps.setString(5, hcpsico.getDiagnostico_hcpsico());
        ps.setString(6, hcpsico.getProcesopsicoterapeutico_hcpsico());
        ps.setString(7, hcpsico.getSeguimiento_hcpsico());
        ps.setString(8, hcpsico.getSesion_hcpsico());
        ps.setInt(9, hcpsico.getIdcita_hcpsico());
        ps.setString(10, hcpsico.getTipofamilia());
        ps.setString(11, hcpsico.getMiembrosfamilia());
        ps.setString(12, hcpsico.getRelacionesfamilia());
        ps.setString(13, hcpsico.getGenograma());

        int resultado = ps.executeUpdate();

        if (resultado == 1) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * Método que consulta en la base de datos, todas las Historias clinicas de
     * Psicologia de un Usuario
     *
     * @param id_usuario, Identificación del usuario
     * @return list, lista de Objetos tipo HcPsicologiaDTO, con los datos de las
     * historias clinicas del ususario, si no exite retorna la lista vacia.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     *
     *
     */
    public List<HcPsicologiaDTO> consultarHcPsicologia(int id_usuario) throws SQLException {

        List<HcPsicologiaDTO> listaHisC = new ArrayList<HcPsicologiaDTO>();

        String sql = "SELECT * FROM hc_psicologia WHERE idusuario_hcpsico = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_usuario);

        ResultSet rs = ps.executeQuery();

        HcPsicologiaDTO hcps = null;

        while (rs.next()) {

            hcps = new HcPsicologiaDTO();

            hcps.setIdusuario_hcpsico(rs.getInt("idusuario_hcpsico"));
            hcps.setMotivoconsulta_hcpsico(rs.getString("motivoconsulta_hcpsico"));
            hcps.setHistoriafamiliar_hcpsico(rs.getString("historiafamiliar_hcpsico"));
            hcps.setProblematicaactual_hcpsico(rs.getString("problematicaactual_hcpsico"));
            hcps.setDiagnostico_hcpsico(rs.getString("diagnostico_hcpsico"));
            hcps.setProcesopsicoterapeutico_hcpsico(rs.getString("procesopsicoterapeutico_hcpsico"));
            hcps.setSeguimiento_hcpsico(rs.getString("seguimiento_hcpsico"));
            hcps.setSesion_hcpsico(rs.getString("sesion"));
            hcps.setIdcita_hcpsico(rs.getInt("idcita_hcpsico"));
            hcps.setTipofamilia(rs.getString("tipofamilia"));
            hcps.setTipofamilia(rs.getString("miembrosfamilia"));
            hcps.setTipofamilia(rs.getString("relacionesfamilia"));
            hcps.setGenograma(rs.getString("genograma"));
            hcps.setId_hcpsicologia(rs.getInt("id_hcpsicologia"));

            listaHisC.add(hcps);
        }
        return listaHisC;
    }

    /**
     * Método que consulta en la base de datos una Historia clinica de
     * Psicologia de un Usuario
     *
     * @param id_usuario: Identificación del usuario
     * @param id_cita: Identificación de la cita
     * @return Objeto tipo HcPsicologiaDTO, con los datos de las historias
     * clinicas del ususario, si no exite retorna la lista vacia.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     *
     *
     */
    public HcPsicologiaDTO consultarHcPsicologia(String id_usuario, int id_cita) throws SQLException {

        String sql = "SELECT * FROM hc_psicologia WHERE idusuario_hcpsico = ? AND idcita_hcpsico = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(id_usuario));
        ps.setInt(2, id_cita);

        ResultSet rs = ps.executeQuery();

        HcPsicologiaDTO hcps = null;

        while (rs.next()) {

            hcps = new HcPsicologiaDTO();

            hcps.setIdusuario_hcpsico(rs.getInt("idusuario_hcpsico"));
            hcps.setMotivoconsulta_hcpsico(rs.getString("motivoconsulta_hcpsico"));
            hcps.setHistoriafamiliar_hcpsico(rs.getString("historiafamiliar_hcpsico"));
            hcps.setProblematicaactual_hcpsico(rs.getString("problematicaactual_hcpsico"));
            hcps.setDiagnostico_hcpsico(rs.getString("diagnostico_hcpsico"));
            hcps.setProcesopsicoterapeutico_hcpsico(rs.getString("procesopsicoterapeutico_hcpsico"));
            hcps.setSeguimiento_hcpsico(rs.getString("seguimiento_hcpsico"));
            hcps.setSesion_hcpsico(rs.getString("sesion"));
            hcps.setIdcita_hcpsico(rs.getInt("idcita_hcpsico"));
            hcps.setTipofamilia(rs.getString("tipofamilia"));
            hcps.setTipofamilia(rs.getString("miembrosfamilia"));
            hcps.setTipofamilia(rs.getString("relacionesfamilia"));
            hcps.setGenograma(rs.getString("genograma"));

        }
        return hcps;
    }

    /**
     * Método que consulta en la base de datos, Historia clinica de Psicologia
     * de un Usuario que tenga proximas sesiones
     *
     * @param idUsuario: Identificación del usuario
     * @return Objeto tipo HcPsicologiaDTO, con los datos de la historia clinica
     * del ususario, si no exite retorna la lista vacia.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     *
     */
    public HcPsicologiaDTO consultarHcPsicologiaAbierta(String idUsuario) throws SQLException {

        String sql = "SELECT * FROM hc_psicologia WHERE idusuario_hcpsico = ? AND sesion = 'si'";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(idUsuario));

        ResultSet rs = ps.executeQuery();

        HcPsicologiaDTO hcps = null;

        while (rs.next()) {

            hcps = new HcPsicologiaDTO();

            hcps.setId_hcpsicologia(rs.getInt("id_hcpsicologia"));
            hcps.setIdusuario_hcpsico(rs.getInt("idusuario_hcpsico"));
            hcps.setMotivoconsulta_hcpsico(rs.getString("motivoconsulta_hcpsico"));
            hcps.setHistoriafamiliar_hcpsico(rs.getString("historiafamiliar_hcpsico"));
            hcps.setProblematicaactual_hcpsico(rs.getString("problematicaactual_hcpsico"));
            hcps.setDiagnostico_hcpsico(rs.getString("diagnostico_hcpsico"));
            hcps.setProcesopsicoterapeutico_hcpsico(rs.getString("procesopsicoterapeutico_hcpsico"));
            hcps.setSeguimiento_hcpsico(rs.getString("seguimiento_hcpsico"));
            hcps.setSesion_hcpsico(rs.getString("sesion"));
            hcps.setIdcita_hcpsico(rs.getInt("idcita_hcpsico"));
            hcps.setTipofamilia(rs.getString("tipofamilia"));
            hcps.setTipofamilia(rs.getString("miembrosfamilia"));
            hcps.setTipofamilia(rs.getString("relacionesfamilia"));
            hcps.setGenograma(rs.getString("genograma"));

        }
        return hcps;
    }

    /**
     * Método que actualia en la base de datos, Historia clinica de Psicologia
     * de un Usuario que tenga proximas sesiones
     *
     * @param idHcPsicologia: Identificación de la historia clinica
     * @param sesionAdicional: variable para indicas "si" o "no" existen
     * proximas sesiones de la historia clinica
     * @return boolean con valor verdadero si hubo registro exitoso, falso si
     * existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     *
     */
    public boolean actualizarEstadoSesionAdicional(int idHcPsicologia, String sesionAdicional) throws SQLException {

        String sql = "UPDATE hc_psicologia SET sesion = ? WHERE id_hcpsicologia = ? ";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, sesionAdicional);
        ps.setInt(2, idHcPsicologia);

        int resultado = ps.executeUpdate();

        if (resultado == 1) {
            return true;
        } else {
            return false;
        }
    }

}
