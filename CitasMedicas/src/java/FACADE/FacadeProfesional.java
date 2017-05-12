/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.ProfesionalDTO;
import NEGOCIO.NegocioProfesional;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeProfesional {
    
    public boolean registrarProfesional (ProfesionalDTO prof){
        return new NegocioProfesional().registrarProfesional(prof);
    }
    
    public ProfesionalDTO consultarProfesionalPorId(int id){
        return new NegocioProfesional().consultarProefionalPorId(id);
    }
    
    public List<ProfesionalDTO> listarProfesionales () throws SQLException{
        return new NegocioProfesional().listarProfesionales();
    }
        
    public boolean modificarProfesional(int identificacion_prof, String correo_prof, String fechanacimiento_prof, String genero_prof, String estadocivil_prof, String direccion_prof, String telefono_prof) throws SQLException{
        return new NegocioProfesional().modificarProfesional(identificacion_prof, correo_prof, fechanacimiento_prof, genero_prof, estadocivil_prof, direccion_prof, telefono_prof);
    }
    
    
}
