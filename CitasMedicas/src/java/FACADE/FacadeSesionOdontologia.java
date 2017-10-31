/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.SesionOdontologiaDTO;
import NEGOCIO.NegocioSesionOdontologia;
import java.util.List;

/**
 *
 * @author Mauricio U
 */
public class FacadeSesionOdontologia {
    
    public FacadeSesionOdontologia() {
    }
    
    public boolean registrarSesionOdontologia(SesionOdontologiaDTO sesion){
        return new NegocioSesionOdontologia().registrarSesionOdontologia(sesion);
    }
    
    public List<SesionOdontologiaDTO> consultarSesionesPorHcOdontologia(int idHcOdontologia){
        return new NegocioSesionOdontologia().consultarSesionesPorHcOdontologia(idHcOdontologia);
    }
    
}
