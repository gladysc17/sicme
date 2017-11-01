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

    public EstudianteDTO consultarEstudiantes(String id) throws SQLException {
        return new NegocioEstudiante().listarEstudiante(id);
    }
}
