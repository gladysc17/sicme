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
/**
 *
 * @author LEGADO
 */
public class Hc_planificacionfamiliarDAO {
    
    private Connection con;

    public Hc_planificacionfamiliarDAO(Connection con) {
        this.con = con;
    }
    
    public boolean registrarHCplanifamiliar(Hc_planificacionfamiliarDTO planif) throws SQLException{
        
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
        
        if(res==1)
            return true;
        
        return false;
        
    }
}
