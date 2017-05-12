/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.AdministradorDTO;
import NEGOCIO.NegocioAdministrador;

/**
 *
 * @author Gladys M
 */
public class FacadeAdministrador {
    
    
    public AdministradorDTO consultarAdminporId(int id){
        return new NegocioAdministrador().consultarAdminPorId(id);
    }
    
    public boolean modificarAdmin(int identificacion_administrador, String correo_administrador, String telefono_administrador, String contrasena_administrador, String direccion_administrador,
                                  String fechanacimiento_administrador, String genero_administrador, String estadocivil_administrador){
        return new NegocioAdministrador().modificarAdmin(identificacion_administrador, correo_administrador, telefono_administrador, contrasena_administrador, direccion_administrador, fechanacimiento_administrador, genero_administrador, estadocivil_administrador);
    }
    
    
}
