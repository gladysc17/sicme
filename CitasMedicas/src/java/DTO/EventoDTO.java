/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author LEGADO
 */
public class EventoDTO {
    
    private int idEvento;
    private String nombreEvento;
    private String fechaEvento;
    private String horaEvento;
    private String lugarEvento;
    private String descrEvento;
    private String director;
    private int creado;
    private String estado;
    
    public EventoDTO() {
    }

    public EventoDTO(int idEvento, String nombreEvento, String fechaEvento, String horaEvento, String lugarEvento, String descrEvento, String director, int creado, String estado) {
        this.idEvento = idEvento;
        this.nombreEvento = nombreEvento;
        this.fechaEvento = fechaEvento;
        this.horaEvento = horaEvento;
        this.lugarEvento = lugarEvento;
        this.descrEvento = descrEvento;
        this.director = director;
        this.creado = creado;
        this.estado = estado;
    }

    public EventoDTO(String nombreEvento, String fechaEvento, String horaEvento, String lugarEvento, String descrEvento, String director, int creado, String estado) {
        this.nombreEvento = nombreEvento;
        this.fechaEvento = fechaEvento;
        this.horaEvento = horaEvento;
        this.lugarEvento = lugarEvento;
        this.descrEvento = descrEvento;
        this.director = director;
        this.creado = creado;
        this.estado = estado;
    }
    
    

    public int getCreado() {
        return creado;
    }

    public void setCreado(int creado) {
        this.creado = creado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public String getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(String fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public String getHoraEvento() {
        return horaEvento;
    }

    public void setHoraEvento(String horaEvento) {
        this.horaEvento = horaEvento;
    }

    public String getLugarEvento() {
        return lugarEvento;
    }

    public void setLugarEvento(String lugarEvento) {
        this.lugarEvento = lugarEvento;
    }

    public String getDescrEvento() {
        return descrEvento;
    }

    public void setDescrEvento(String descrEvento) {
        this.descrEvento = descrEvento;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
    
    
}
