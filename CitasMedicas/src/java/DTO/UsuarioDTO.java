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
public class UsuarioDTO {
    
    private String identificacion;
    private String tipo_identificacion;
    private String codigo;
    private String nombre;
    private String correo;
    private String fecha_nacimiento;
    private int edad;
    private String genero;    
    private String estado_civil;
    private String direccion;
    private String telefono;     
    private String tipo_usuario;
    private String fecharegistro;
    private String contrasena;

    public UsuarioDTO() {
    }

    public UsuarioDTO(String identificacion, String tipo_identificacion, String codigo, String nombre, String correo, String fecha_nacimiento, int edad, String genero, String estado_civil, String direccion, String telefono, String tipo_usuario, String fecharegistro, String contrasena) {
        this.identificacion = identificacion;
        this.tipo_identificacion = tipo_identificacion;
        this.codigo = codigo;
        this.nombre = nombre;
        this.correo = correo;
        this.fecha_nacimiento = fecha_nacimiento;
        this.edad = edad;
        this.genero = genero;
        this.estado_civil = estado_civil;
        this.direccion = direccion;
        this.telefono = telefono;
        this.tipo_usuario = tipo_usuario;
        this.fecharegistro= fecharegistro;
        this.contrasena = contrasena;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getTipo_identificacion() {
        return tipo_identificacion;
    }

    public void setTipo_identificacion(String tipo_identificacion) {
        this.tipo_identificacion = tipo_identificacion;
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

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEstado_civil() {
        return estado_civil;
    }

    public void setEstado_civil(String estado_civil) {
        this.estado_civil = estado_civil;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public String getFecharegistro() {
        return fecharegistro;
    }

    public void setFecharegistro(String fecharegistro) {
        this.fecharegistro = fecharegistro;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    @Override
    public String toString() {
        return "UsuarioDTO{" + "identificacion=" + identificacion + ", tipo_identificacion=" + tipo_identificacion + ", codigo=" + codigo + ", nombre=" + nombre + ", correo=" + correo + ", fecha_nacimiento=" + fecha_nacimiento + ", edad=" + edad + ", genero=" + genero + ", estado_civil=" + estado_civil + ", direccion=" + direccion + ", telefono=" + telefono + ", tipo_usuario=" + tipo_usuario + ", fecharegistro=" + fecharegistro + ", contrasena=" + contrasena + '}';
    }

    
    
    
    
}
