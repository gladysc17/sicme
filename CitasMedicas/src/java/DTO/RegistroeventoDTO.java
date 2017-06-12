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
public class RegistroeventoDTO {
    
    private int id_registroEvento;
    private String codigo;
    private String nombre;
    private String identificacion;
    private String correo;
    private String programa;
    private int idEvento;

    public RegistroeventoDTO() {
    }

    public RegistroeventoDTO(int id_registroEvento, String codigo, String nombre, String identificacion, String correo, String programa, int idEvento) {
        this.id_registroEvento = id_registroEvento;
        this.codigo = codigo;
        this.nombre = nombre;
        this.identificacion = identificacion;
        this.correo = correo;
        this.programa = programa;
        this.idEvento = idEvento;
    }

    public RegistroeventoDTO(String codigo, String nombre, String identificacion, String correo, String programa, int idEvento) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.identificacion = identificacion;
        this.correo = correo;
        this.programa = programa;
        this.idEvento = idEvento;
    }

    public int getId_registroEvento() {
        return id_registroEvento;
    }

    public void setId_registroEvento(int id_registroEvento) {
        this.id_registroEvento = id_registroEvento;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    
}