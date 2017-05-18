/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import DTO.CitaDTO;
import NEGOCIO.NegocioCita;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author Gladys M
 */
public class FacadeCita {
    
     public boolean registrarCita (CitaDTO cita){
        return new NegocioCita().registrarCita(cita);
    }
     
     public ArrayList<CitaDTO> consultarCitasEst (int id_est){
         return new NegocioCita().consultarCitasEst(id_est);
     }
     
      public ArrayList<CitaDTO> consultarCitasProfesional (int id_prof, String fecha){
         return new NegocioCita().consultarCitasProfesiona(id_prof, fecha);
     }
       public ArrayList<CitaDTO> consultarCitasUsuario (String id_usuario){
         return new NegocioCita().consultarCitasUsuario(id_usuario);
     }
        public ArrayList<CitaDTO> consultarCitasMedicoDia (int id_medico, String fecha){
         return new NegocioCita().consultarCitasMedicoDia(id_medico, fecha);
     }

     public boolean modificarCita(int id_cita, String fecha, int hora_cita, int id_medico) throws SQLException {
        return new NegocioCita().modificarCita(id_cita, fecha, hora_cita, id_medico);
    }
     
      public CitaDTO consultarCitasId (int id_cita){
         return new NegocioCita().consultarCitasId(id_cita);
     }
}
