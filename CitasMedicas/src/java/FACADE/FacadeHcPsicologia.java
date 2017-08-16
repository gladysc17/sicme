/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.HcPsicologiaDTO;
import NEGOCIO.NegocioHcPsicologia;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeHcPsicologia {
    
    public boolean registrarHcPsicologia(HcPsicologiaDTO hcpsico) throws SQLException {
        return new NegocioHcPsicologia().registrarHcPsicologia(hcpsico);
    }
    
    public List<HcPsicologiaDTO> consultarHCPsicologia(int id_usuario) throws SQLException {
        return new NegocioHcPsicologia().consultarHCPsicologia(id_usuario);
    }
    public HcPsicologiaDTO consultarHCPsicologia(String id_usuario, int id_cita) throws SQLException {
        return new NegocioHcPsicologia().consultarHcPsicologia(id_usuario, id_cita);
    }
    
    public HcPsicologiaDTO consultarHCPsicologiaAbierta(String idUsuario) throws SQLException{
        return new NegocioHcPsicologia().consultarHcPsicologiaAbierta(idUsuario);
    }
}
