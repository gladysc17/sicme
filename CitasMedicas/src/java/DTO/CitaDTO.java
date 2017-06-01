/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Gladys M
 */
public class CitaDTO {

    private int id_cita;
    private String servicio_cita;
    private String num_recibo_cita;
    private String fecha_cita;
    private String hora_cita;
    private String id_usuario;
    private String id_medico;
    private String estado;
    private String nombre_usuario;
    private String nombre_medico;
    private String tipousuario_cita;

    public CitaDTO() {
    }

    public CitaDTO(String servicio_cita, String num_recibo_cita, String fecha_cita, String hora_cita, String id_usuario, String id_medico, String estado, String nombre_usuario, String nombre_medico, String tipousuario_cita) {
        this.servicio_cita = servicio_cita;
        this.num_recibo_cita = num_recibo_cita;
        this.fecha_cita = fecha_cita;
        this.hora_cita = hora_cita;
        this.id_usuario = id_usuario;
        this.id_medico = id_medico;
        this.estado = estado;
        this.nombre_usuario = nombre_usuario;
        this.nombre_medico = nombre_medico;
        this.tipousuario_cita = tipousuario_cita;
    }

    public CitaDTO(int id_cita, String servicio_cita, String num_recibo_cita, String fecha_cita, String hora_cita, String id_usuario, String id_medico, String estado, String nombre_usuario, String nombre_medico, String tipousuario_cita) {
        this.id_cita = id_cita;
        this.servicio_cita = servicio_cita;
        this.num_recibo_cita = num_recibo_cita;
        this.fecha_cita = fecha_cita;
        this.hora_cita = hora_cita;
        this.id_usuario = id_usuario;
        this.id_medico = id_medico;
        this.estado = estado;
        this.nombre_usuario = nombre_usuario;
        this.nombre_medico = nombre_medico;
        this.tipousuario_cita = tipousuario_cita;
    }
        
    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public String getServicio_cita() {
        return servicio_cita;
    }

    public void setServicio_cita(String servicio_cita) {
        this.servicio_cita = servicio_cita;
    }

    public String getNum_recibo_cita() {
        return num_recibo_cita;
    }

    public void setNum_recibo_cita(String num_recibo_cita) {
        this.num_recibo_cita = num_recibo_cita;
    }

    public String getFecha_cita() {
        return fecha_cita;
    }

    public void setFecha_cita(String fecha_cita) {
        this.fecha_cita = fecha_cita;
    }

    public String getHora_cita() {
        return hora_cita;
    }

    public void setHora_cita(String hora_cita) {
        this.hora_cita = hora_cita;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getNombre_medico() {
        return nombre_medico;
    }

    public void setNombre_medico(String nombre_medico) {
        this.nombre_medico = nombre_medico;
    }    

    public String getId_medico() {
        return id_medico;
    }

    public void setId_medico(String id_medico) {
        this.id_medico = id_medico;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTipousuario_cita() {
        return tipousuario_cita;
    }

    public void setTipousuario_cita(String tipousuario_cita) {
        this.tipousuario_cita = tipousuario_cita;
    }
    
    
    @Override
    public String toString() {
        return "CitaDTO{" + "id_cita=" + id_cita + ", servicio_cita=" + servicio_cita + ", num_recibo_cita=" + num_recibo_cita + ", fecha_cita=" + fecha_cita + ", hora_cita=" + hora_cita + ", id_usuario=" + id_usuario + ", id_medico=" + id_medico + ", estado=" + estado + ", nombre_usuario=" + nombre_usuario + ", nombre_medico=" + nombre_medico + '}';
    }

    
    
}
