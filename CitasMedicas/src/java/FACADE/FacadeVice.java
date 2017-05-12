/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.VicerrectorDTO;
import NEGOCIO.NegocioVice;

/**
 *
 * @author Gladys M
 */
public class FacadeVice {
    
     public  VicerrectorDTO consultarViceporId(int id){
        return new NegocioVice().consultarAdminPorId(id);
    }
     public boolean modificarVice(int id_vice, String correo_vice, String telefono_vice, String contrasena_vice){
        return new NegocioVice().modificarVicerrector(id_vice, correo_vice, telefono_vice, contrasena_vice);
    }
    
}
