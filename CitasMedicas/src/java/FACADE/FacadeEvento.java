/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.EventoDTO;
import DTO.RegistroeventoDTO;
import NEGOCIO.NegocioEvento;
import java.util.List;

/**
 *
 * @author LEGADO
 */
public class FacadeEvento {
    
    public boolean crearEvento(EventoDTO evento){
        return new NegocioEvento().crearEvento(evento);
    }
    
    public List<EventoDTO> obtenerEventosMes(){
        return new NegocioEvento().obtenerEventoMes();
    }
    
    public List<EventoDTO> listadoEventosAdm(int ident){
        return new NegocioEvento().listarMedicoAdm(ident);
    }
    
    public boolean modificarEvento (int idEvento, String fecha, String hora, String lugar) {
        return new NegocioEvento().modificarEvento(idEvento, fecha, hora, lugar);
    }
    
    public EventoDTO consultarPorId(String id){
        return new NegocioEvento().consultaPorId(id);
    }
    
    public boolean registroEvento(RegistroeventoDTO re) {
        return new NegocioEvento().registroEvento(re);
    }
    
    public List<EventoDTO> listar(String fechaI, String fechaF) {
        return new NegocioEvento().listarEventos(fechaI, fechaF);
    }
    
    public int cantidadEvento(int idevento){
        return new NegocioEvento().cantidadPorEvento(idevento);
    }
}
