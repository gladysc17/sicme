/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;


import DTO.ServicioGeneralDTO;
import NEGOCIO.NegocioMedico;
import NEGOCIO.NegocioServicioGeneral;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class FacadeServicioGeneral {
    
    public boolean registrarServicioGeneral(ServicioGeneralDTO sg) throws SQLException {
        return new NegocioServicioGeneral().registrarServicioGeneral(sg);
    }
    
    public ServicioGeneralDTO consultarServicioGeneralPorId(int id){
        return new NegocioServicioGeneral().consultarServicioGeneralId(id);
    }
    
    public List<ServicioGeneralDTO> consultarServicioGeneral() throws SQLException{
        return new NegocioServicioGeneral().listarServicioGeneral();
    }
    public boolean modificarServicioGeneral(int identificacion_sg, String correo_sg, String fechanacimiento_sg, String genero_sg, String estadocivil_sg, String direccion_sg, String telefono_sg) throws SQLException{
         return new NegocioServicioGeneral().modificarServicioGeneral(identificacion_sg, correo_sg, fechanacimiento_sg, genero_sg, estadocivil_sg, direccion_sg, telefono_sg);
    }
}
