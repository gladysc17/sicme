/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.SesionDTO;
import NEGOCIO.NegocioSesion;
import java.util.List;

/**
 *
 * @author Mauricio U
 */
public class FacadeSesion {

    public FacadeSesion() {
    }
    
    public boolean registrarSesion(SesionDTO sesion){
        return new NegocioSesion().registrarSesion(sesion);
    }
    
    public List<SesionDTO> consultarSesionesPorHcPsicologia(int idHcPsicologia){
        return new NegocioSesion().consultarSesionesPorHcPsicologia(idHcPsicologia);
    }
    
}
