/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import DTO.Hc_planificacionfamiliarDTO;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class HcPlanificacionfamiliarDAO {

    private Connection con;

    public HcPlanificacionfamiliarDAO(Connection con) {
        this.con = con;
    }

    public boolean registrarHCplanifamiliar(Hc_planificacionfamiliarDTO planif) throws SQLException {

        String sql = "insert into hc_planificacionfamiliar (tipo_vinculacion, aseguradora, nombre_responsable,"
                + "parentesco, direccion_responsable, telefono_responsable, motivo, enfermedad_actual, menarca,"
                + "ciclos, menopausia, estados, fecha_ultima_menst, fecha_ultimo_parto, ccv, resultado_ccv,"
                + "planificacion, metodo, id_cita, revision_sistemas, antecedentes, idusuario_hcmed)"
                + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, planif.getTipo_vinculacion());
        ps.setString(2, planif.getAseguradora());
        ps.setString(3, planif.getNombre_responsable());
        ps.setString(4, planif.getParentesco());
        ps.setString(5, planif.getDireccion_responsable());
        ps.setString(6, planif.getTelefono_responsable());
        ps.setString(7, planif.getMotivo());
        ps.setString(8, planif.getEnfermedad_actual());
        ps.setString(9, planif.getMenarca());
        ps.setString(10, planif.getCiclos());
        ps.setString(11, planif.getMenopausia());
        ps.setString(12, planif.getEstados());
        ps.setDate(13, Date.valueOf(planif.getFecha_ultima_menst()));
        ps.setDate(14, Date.valueOf(planif.getFecha_ultimo_parto()));
        ps.setDate(15, Date.valueOf(planif.getCcv()));
        ps.setString(16, planif.getResultado_ccv());
        ps.setString(17, planif.getPlanificacion());
        ps.setString(18, planif.getMetodo());
        ps.setInt(19, planif.getId_cita());
        ps.setString(20, planif.getRevision_sistemas());
        ps.setString(21, planif.getAntecedentes());
        ps.setInt(22, planif.getIdusuario_hcmed());

        int res = ps.executeUpdate();

        if (res == 1) {
            return true;
        }

        return false;

    }

    public List<Hc_planificacionfamiliarDTO> consultarHcPlanificacion(int id_usuario) throws SQLException {

        List<Hc_planificacionfamiliarDTO> listaHisC = new ArrayList<Hc_planificacionfamiliarDTO>();

        String sql = "SELECT * FROM hc_planificacionfamiliar WHERE idusuario_hcmed = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_usuario);

        ResultSet rs = ps.executeQuery();

        Hc_planificacionfamiliarDTO hcPl = null;

        while (rs.next()) {

            hcPl = new Hc_planificacionfamiliarDTO();

            hcPl.setTipo_vinculacion(rs.getString("tipo_vinculacion"));
            hcPl.setAseguradora(rs.getString("aseguradora"));
            hcPl.setNombre_responsable(rs.getString("nombre_responsable"));
            hcPl.setParentesco(rs.getString("parentesco"));
            hcPl.setDireccion_responsable(rs.getString("direccion_responsable"));
            hcPl.setTelefono_responsable(rs.getString("telefono_responsable"));
            hcPl.setMotivo(rs.getString("motivo"));
            hcPl.setEnfermedad_actual(rs.getString("enfermedad_actual"));
            hcPl.setMenarca(rs.getString("menarca"));
            hcPl.setCiclos(rs.getString("ciclos"));
            hcPl.setMenopausia(rs.getString("menopausia"));
            hcPl.setEstados(rs.getString("estados"));
            hcPl.setFecha_ultima_menst(rs.getString("fecha_ultima_menst"));
            hcPl.setFecha_ultimo_parto(rs.getString("fecha_ultimo_parto"));
            hcPl.setCcv(rs.getString("ccv"));
            hcPl.setResultado_ccv(rs.getString("resultado_ccv"));
            hcPl.setPlanificacion(rs.getString("planificacion"));
            hcPl.setMetodo(rs.getString("metodo"));
            hcPl.setId_cita(rs.getInt("id_cita"));
            hcPl.setRevision_sistemas(rs.getString("revision_sistemas"));
            hcPl.setAntecedentes(rs.getString("antecedentes"));
            hcPl.setIdusuario_hcmed(rs.getInt("idusuario_hcmed"));

            listaHisC.add(hcPl);
        }

        return listaHisC;

    }
}
