/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.ServicioDTO;
import NEGOCIO.NegocioServicio;
import java.sql.SQLException;
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
    
    public int cantCitasAsistidas(String fechaI, String fechaF, String servicio) throws SQLException {
        return new NegocioServicio().cantidadCitasAsistidas(fechaI, fechaF, servicio);
    }

    public int cantCitasNoAsistidas(String fechaI, String fechaF, String servicio) throws SQLException {
        return new NegocioServicio().cantidadCitasNoAsistidas(fechaI, fechaF, servicio);
    }
    public int cantCitasPendientes(String fechaI, String fechaF, String servicio) throws SQLException {
        return new NegocioServicio().cantidadCitasPendientes(fechaI, fechaF, servicio);
    }

}
