/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.Hc_planificacionfamiliarDTO;
import NEGOCIO.NegocioPlanificacionFamiliar;
import java.sql.SQLException;
/**
 *
 * @author LEGADO
 */
public class FacadePlanificacionFamiliar {
    
    public boolean registrarHCplanfamil(Hc_planificacionfamiliarDTO plan) throws SQLException {
        return new NegocioPlanificacionFamiliar().registrarHCplanfamiliar(plan);
    }
}
