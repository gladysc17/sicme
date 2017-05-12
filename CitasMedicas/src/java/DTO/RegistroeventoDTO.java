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
    private int codigo;
    private String nombre;
    private int identificacion;
    private String correo;
    private String programa;
    private int idEvento;

    public RegistroeventoDTO() {
    }

    public RegistroeventoDTO(int id_registroEvento, int codigo, String nombre, int identificacion, String correo, String programa, int idEvento) {
        this.id_registroEvento = id_registroEvento;
        this.codigo = codigo;
        this.nombre = nombre;
        this.identificacion = identificacion;
        this.correo = correo;
        this.programa = programa;
        this.idEvento = idEvento;
    }

    public RegistroeventoDTO(int codigo, String nombre, int identificacion, String correo, String programa, int idEvento) {
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

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(int identificacion) {
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
