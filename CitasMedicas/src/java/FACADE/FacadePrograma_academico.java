/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.Programa_academicoDTO;
import NEGOCIO.NegocioPrograma_academico;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadePrograma_academico {
    
    public FacadePrograma_academico() {
    }
    
    public boolean registrarPrograma_academico(Programa_academicoDTO programa){
        return new NegocioPrograma_academico().registrarPrograma(programa);
    }
    
    public Programa_academicoDTO consultarPrograma_academicoId( int id){
        return new NegocioPrograma_academico().consultarProgramaId(id);
    }
    
    public List<Programa_academicoDTO> consultarPrograma_academico(){
        return new NegocioPrograma_academico().consultarProgramas();
    }
}
