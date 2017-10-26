/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.EstudianteDTO;
import NEGOCIO.NegocioEstudiante;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeEstudiante {
    
    /**
     * 
     * @param est
     * @return
     * @throws SQLException 
     */
    
    public boolean registrarEstudiante(EstudianteDTO est) throws SQLException {
        return new NegocioEstudiante().registrarEstudiante(est);
    }
    
//    public EstudianteDTO consultarEstudianteporId(int id){
//        return new NegocioEstudiante().consultarEstudianteId(id);
//    }
//    
//    public List<EstudianteDTO> consultarEstudiantes() throws SQLException{
//        return new NegocioEstudiante().listarEstudiantes();
//    }
//    
//     public boolean modificarEstudiante(int  identificacion_est, String correo_est, String fechanac_est, String genero_est, String estadocivil_est, String direccion_est, String telefono_est) throws SQLException{
//        return new NegocioEstudiante().modificarEstudiante(identificacion_est, correo_est, fechanac_est, genero_est, estadocivil_est, direccion_est, telefono_est);
//    }
    
    public List<String> consultarProgramaAcademico() throws SQLException {
        return new NegocioEstudiante().consultarProgramaAcademico();
    }
    
    public List<EstudianteDTO> consultarEstudiantePrograma(int programa) throws SQLException {
        return new NegocioEstudiante().consultarEstudiantePrograma(programa);
    }
    
    public int cantCitasAsistidas(String fechaI, String fechaF, String id_usuario) throws SQLException {
        return new NegocioEstudiante().cantidadCitasAsistidas(fechaI, fechaF, id_usuario);
    }

    public int cantCitasNoAsistidas(String fechaI, String fechaF, String id_usuario) throws SQLException {
        return new NegocioEstudiante().cantidadCitasNoAsistidas(fechaI, fechaF, id_usuario);
    }
    public int cantCitasPendientes(String fechaI, String fechaF, String id_usuario) throws SQLException {
        return new NegocioEstudiante().cantidadCitasPendientes(fechaI, fechaF, id_usuario);
    }
    public EstudianteDTO consultarEstudiantes(String id) throws SQLException{
      return new NegocioEstudiante().listarEstudiante(id);
    }
}
