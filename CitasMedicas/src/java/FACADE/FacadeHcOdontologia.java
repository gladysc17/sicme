/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.HcOdontologiaDTO;
import NEGOCIO.NegocioHcOdontologia;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeHcOdontologia {
    
    public boolean registrarHcOdontologia(HcOdontologiaDTO hcod) throws SQLException {
        return new NegocioHcOdontologia().registrarHcOdontologia(hcod);
    }
    public List<HcOdontologiaDTO> consultarHcOdontologia(int id_usuario) throws SQLException {
        return new NegocioHcOdontologia().consultarHcOdontologia(id_usuario);
    }
    
}
