/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.VicerrectorDTO;
import NEGOCIO.NegocioVice;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class FacadeVice {
    
     public boolean verificarVice(String id, String clave) throws SQLException {
        return new NegocioVice().verificarVice(id, clave);

    }
    
    public boolean registrarVice(VicerrectorDTO vc) throws SQLException {
        return new NegocioVice().registrarAdministrador(vc);
    }
     public VicerrectorDTO consultarViceId(String id) throws SQLException {
        return new NegocioVice().consultarViceId(id);

    }
    
}
