/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.EventoDTO;
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
}
