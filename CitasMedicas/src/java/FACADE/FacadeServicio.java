/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.ServicioDTO;
import NEGOCIO.NegocioServicio;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeServicio {
    
    
    public FacadeServicio() {
    }
    
    public boolean registrarServicio(ServicioDTO servicio){
        return new NegocioServicio().registrarServicio(servicio);
    }
    
    public ServicioDTO consultarServicioId( int id){
        return new NegocioServicio().consultarServicioId(id);
    }
    
    public List<ServicioDTO> consultarServicio(){
        return new NegocioServicio().consultarServicios();
    }
    
    public boolean actualizarServicio(int id, String serv, String infor){
        return new NegocioServicio().actualizarServicio(id, serv, infor);
    }
    
    public boolean eliminarServicio(int id){
        return new NegocioServicio().eliminarServicio(id);
    }

    public ServicioDTO consultarServicio(String nombre){
        return new NegocioServicio().consultarServicio(nombre);
    }
}
