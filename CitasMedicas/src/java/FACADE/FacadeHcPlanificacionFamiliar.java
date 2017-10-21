/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.Hc_planificacionfamiliarDTO;
import NEGOCIO.NegocioHcOdontologia;
import NEGOCIO.NegocioHcPlanificacionFamiliar;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author LEGADO
 */
public class FacadeHcPlanificacionFamiliar {
    
    public boolean registrarHCplanfamil(Hc_planificacionfamiliarDTO plan) throws SQLException {
        return new NegocioHcPlanificacionFamiliar().registrarHCplanfamiliar(plan);
    }
    
    public List<Hc_planificacionfamiliarDTO> consultarHcPlanificacion(int id_usuario) throws SQLException {
        return new NegocioHcPlanificacionFamiliar().consultarHcPlanificacion(id_usuario);
    }
}
