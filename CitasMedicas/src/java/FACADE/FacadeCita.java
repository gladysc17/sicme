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

    public boolean registrarCita(CitaDTO cita) {
        return new NegocioCita().registrarCita(cita);
    }

    public ArrayList<CitaDTO> consultarCitasEst(int id_est) {
        return new NegocioCita().consultarCitasEst(id_est);
    }

    public ArrayList<CitaDTO> consultarCitasProfesional(int id_prof, String fecha) {
        return new NegocioCita().consultarCitasProfesiona(id_prof, fecha);
    }

    public ArrayList<CitaDTO> consultarCitasUsuario(String id_usuario) {
        return new NegocioCita().consultarCitasUsuario(id_usuario);
    }

    public ArrayList<CitaDTO> consultarCitasMedicoDia(String id_medico, String fecha) {
        return new NegocioCita().consultarCitasMedicoDia(id_medico, fecha);
    }

    public boolean modificarCita(int id_cita, String fecha, int hora_cita, String id_medico) throws SQLException {
        return new NegocioCita().modificarCita(id_cita, fecha, hora_cita, id_medico);
    }

    public CitaDTO consultarCitasId(int id_cita) {
        return new NegocioCita().consultarCitasId(id_cita);
    }

    public ArrayList<CitaDTO> consultarCitasRango(String id_medico, String fecha, String fechaF) {
        return new NegocioCita().consultarCitasRango(id_medico, fecha, fechaF);
    }

    public boolean actualizarEstadoAtendida(int id_cita) throws SQLException {
        return new NegocioCita().actualizarEstadoAtendida(id_cita);
    }

    public boolean actualizarEstadoNoAsistida(int id_cita) throws SQLException {
        return new NegocioCita().actualizarEstadoNoAsistida(id_cita);
    }

    public int cantidadCitas(String fechaI, String fechaF) throws SQLException {
        return new NegocioCita().cantidadCitas(fechaI, fechaF);
    }

    public int cantidadCitasAsistidas(String fechaI, String fechaF) throws SQLException {
        return new NegocioCita().cantidadCitasAsistidas(fechaI, fechaF);
    }

    public int cantidadCitasNoAsistidas(String fechaI, String fechaF) throws SQLException {
        return new NegocioCita().cantidadCitasNoAsistidas(fechaI, fechaF);
    }

    public int cantidadCitasEstudiante(String id_usuario, String fechaI, String fechaF) throws SQLException {
        return new NegocioCita().cantidadCitasEstudiante(id_usuario, fechaI, fechaF);
    }

    public int cantidadCitasPendientes(String fechaI, String fechaF) throws SQLException {
        return new NegocioCita().cantidadCitasPendientes(fechaI, fechaF);
    }

    public int cantidadCitasUsuario(String id_usuario) throws SQLException {
        return new NegocioCita().cantidadCitasUsuario(id_usuario);
    }

    public int cantidadCitasServicio(String servicio, String fechaI, String fechaF) throws SQLException {
        return new NegocioCita().cantidadCitasServicio(servicio, fechaI, fechaF);
    }
}
