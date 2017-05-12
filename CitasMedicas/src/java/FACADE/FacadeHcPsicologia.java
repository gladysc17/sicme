/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.HcPsicologiaDTO;
import NEGOCIO.NegocioHcPsicologia;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class FacadeHcPsicologia {
    
    public boolean registrarHcPsicologia(HcPsicologiaDTO hcpsico) throws SQLException {
        return new NegocioHcPsicologia().registrarHcPsicologia(hcpsico);
    }
    
}
