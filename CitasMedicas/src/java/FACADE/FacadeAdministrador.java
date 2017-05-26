/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.AdministradorDTO;
import NEGOCIO.NegocioAdministrador;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class FacadeAdministrador {
    
    public boolean verificarAdmin(String id, String clave) throws SQLException {
        return new NegocioAdministrador().verificarAdmin(id, clave);

    }
   public boolean registrarAdministrador(AdministradorDTO ad) throws SQLException {
        return new NegocioAdministrador().registrarAdministrador(ad);
    }
   
   public AdministradorDTO consultarAdminId(String id) throws SQLException {
        return new NegocioAdministrador().consultarAdminPorId(id);

    }
    
}
