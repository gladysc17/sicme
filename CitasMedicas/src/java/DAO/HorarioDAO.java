/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HorarioDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import util.ConexionPostgres;

/**
 *
 * @author Gladys M
 */
public class HorarioDAO {

    private Connection con;

    public HorarioDAO(Connection con) {
        this.con = con;
    }

    /**
     * metodo que permite obtener las horas disponibles del profesional de la salud
     * @param id_medico Identificador del profesional de la salud en la base de datos
     * @param fecha Fecha a comparar
     * @return Listado de las horas del profesional de la salud que tiene disponible para la fecha en cuestion.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.  
     */
    public List<HorarioDTO> consultarHorasDisponibles(String id_medico, String fecha) throws SQLException {

        List<HorarioDTO> lista = new ArrayList<HorarioDTO>();

        String cons = "SELECT id_horario, hora_inicio FROM horariomedico hm, horario h WHERE hm.id_horario = h.id "
                + "AND id_medico = ? AND fecha = ? AND estado = 'disponible' ORDER BY hora_inicio";

        PreparedStatement ps = con.prepareStatement(cons);

        ps.setString(1, id_medico);
        ps.setDate(2, Date.valueOf(fecha));

        ResultSet rs = ps.executeQuery();

        HorarioDTO ho = null;
        while (rs.next()) {
            ho = new HorarioDTO();
            ho.setId_horario(rs.getInt("id_horario"));
            ho.setHora_inicio(rs.getTime("hora_inicio"));

            lista.add(ho);
        }
        return lista;
    }

    /**
     * Metodo que obtiene todas las horas del horario que puede atender.
     * @return listado de las horas ordenadas por su identificador primario.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public List<HorarioDTO> listadoHoras() throws SQLException {

        List<HorarioDTO> ls = new ArrayList<HorarioDTO>();

        String sql = "select * from horario order by id";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            HorarioDTO ho = new HorarioDTO();
            ho.setId_horario(rs.getInt(1));
            ho.setHora_inicio(rs.getTime(2));
            ho.setHora_final(rs.getTime(3));
            ls.add(ho);
        }
        ps.close();
        rs.close();
        rs = null;
        ps = null;

        return ls;
    }

    /**
     * método que permite cambiar el estado de la hora.
     * @param id_medico_horariomedico Identificador del profesional de la salud
     * @param fecha Fecha en la que se desea cambiar el estado
     * @param id_horario_horariomedico Identificador del horario
     * @param estado Estado que cambiara en la base de datos.
     * @return Valor booleano que confirma el cambio del estado
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean cambiarEstadoHora(String id_medico_horariomedico, String fecha, int id_horario_horariomedico, String estado) throws SQLException {

        String sql = "UPDATE horariomedico SET estado = ? "
                + "WHERE id_medico = ? AND fecha = ? AND id_horario = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, estado);
        ps.setString(2, id_medico_horariomedico);
        ps.setDate(3, Date.valueOf(fecha));
        ps.setInt(4, id_horario_horariomedico);

        int rta = ps.executeUpdate();

        if (rta > 0) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * metodo que permite consultar las horas disponibles del profesional de la salud segun el servicio
     * @param id_medico Identificador del profesional de la salud
     * @param fecha Fecha que se desea consultar
     * @param hora Hora de la fecha que se desea consultar
     * @return Listado de las horas disponibles del profesional de la salud.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public List<HorarioDTO> consultarHorasPorServicio(int id_medico, String fecha, String hora) throws SQLException {

        List<HorarioDTO> lista = new ArrayList<HorarioDTO>();

        String cons = "SELECT id_horario, hora_inicio FROM horariomedico, horario WHERE id_horario_horariomedico = id_horario "
                + "AND id_medico_horariomedico = ? AND fecha = ? AND estado_horariomedico = 'disponible' ORDER BY hora_inicio";

        PreparedStatement ps = con.prepareStatement(cons);

        ps.setInt(1, id_medico);
        ps.setDate(2, Date.valueOf(fecha));
        ps.setString(3, hora);

        ResultSet rs = ps.executeQuery();

        HorarioDTO ho = null;
        while (rs.next()) {
            ho = new HorarioDTO();
            ho.setId_horario(rs.getInt("id_horario"));
            ho.setHora_inicio(rs.getTime("hora_inicio"));

            lista.add(ho);
        }
        return lista;
    }

    /**
     * metodo que obtiene un hora de acuerdo al identificador
     * @param id_horario Identificador en la base de datos
     * @return Objeto de tipo HorarioDTO con la información registrada
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public HorarioDTO consultarHorarioId(int id_horario) throws SQLException {

        String sql = "SELECT * FROM horario WHERE id = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_horario);

        ResultSet rs = ps.executeQuery();

        HorarioDTO horario = null;

        if (rs.next()) {

            horario = new HorarioDTO();

            horario.setId_horario(rs.getInt("id"));
            horario.setHora_inicio(rs.getTime("hora_inicio"));
            horario.setHora_final(rs.getTime("hora_final"));
        }

        return horario;
    }

    /**
     * metodo que obtiene una hora de acuerdo a una hora.
     * @param fecha hora de la que se desea consultar
     * @return Objeto de tipo HorarioDTO con la informacion registrada
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public HorarioDTO consultaHora(String fecha) throws SQLException {

        String sql = "select * from horario where hora_inicio = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setTime(1, Time.valueOf(fecha));
        ResultSet rs = ps.executeQuery();

        HorarioDTO horario = null;

        if (rs.next()) {
            horario = new HorarioDTO();
            horario.setId_horario(rs.getInt("id"));
            horario.setHora_inicio(rs.getTime("hora_inicio"));
            horario.setHora_final(rs.getTime("hora_final"));
        }
        return horario;
    }
}
